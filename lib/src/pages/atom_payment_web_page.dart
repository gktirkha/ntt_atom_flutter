import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../functions/a_e_s_helper.dart';
import '../functions/atom_pay_helper.dart';
import '../functions/close_confirmation_dialog.dart';
import '../model/atom_constants.dart';
import '../model/atom_payment_options.dart';
import '../sdk/atom_s_d_k.dart';
import '../web_pages/web_pages.dart';

/// A web page widget for handling Atom payments within an In-App WebView.
class AtomPaymentWebPage extends StatelessWidget {
  /// Constructor for [AtomPaymentWebPage].
  AtomPaymentWebPage({super.key, required this.payDetails});

  /// Notifier to track whether the page can be popped.
  final ValueNotifier<bool> canPop = ValueNotifier<bool>(false);

  /// List of supported payment app schemes.
  final paymentsApp = ['tez', 'phonepe', 'paytmmp', 'upi'];

  /// Payment details passed to the web page.
  final String payDetails;

  /// WebView controller to manage the In-App WebView.
  late final InAppWebViewController _webViewController;

  /// Completer for managing the WebView controller instance.
  final Completer<InAppWebViewController> _inAppViewCompleter =
      Completer<InAppWebViewController>();

  /// Payment options for Atom SDK.
  final AtomPaymentOptions options = AtomSDK.options;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: canPop,
      builder:
          (context, value, child) => PopScope(
            canPop: value,
            child: child!,
            onPopInvokedWithResult: (didPop, result) async {
              await _webViewController.canGoBack().then((value) {
                if (value) {
                  _webViewController.goBack();
                  return;
                } else {
                  if (context.mounted) {
                    showCloseConfirmationDialog(context, canPop);
                  }
                }
              });
            },
          ),
      child: Scaffold(
        body: SafeArea(
          child: InAppWebView(
            onWebViewCreated: onWebViewCreated,
            onLoadStop: onLoadStop,
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              final uri = navigationAction.request.url;

              if (uri == null) {
                return NavigationActionPolicy.ALLOW;
              }

              if (paymentsApp.contains(uri.scheme)) {
                try {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Unable To Start ${getAppName(uri.scheme)} Transaction, Please Try other Payment Method',
                        ),
                      ),
                    );
                  }
                }
                return NavigationActionPolicy.CANCEL;
              }
              return NavigationActionPolicy.ALLOW;
            },
          ),
        ),
      ),
    );
  }

  /// Callback when the WebView is created.
  void onWebViewCreated(controller) {
    if (_inAppViewCompleter.isCompleted) {
      return;
    }
    _inAppViewCompleter.future.whenComplete(() {
      _webViewController = controller;
      _loadHtmlPage();
    });
    _inAppViewCompleter.complete(controller);
  }

  /// Loads the appropriate HTML page based on the payment mode.
  Future<void> _loadHtmlPage() async {
    final htmlFile = switch (options.mode) {
      AtomPaymentMode.uat => WebPages.uat,
      AtomPaymentMode.live => WebPages.prod,
    };

    _webViewController.loadUrl(
      urlRequest: URLRequest(
        url: WebUri.uri(
          Uri.dataFromString(
            htmlFile,
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8'),
          ),
        ),
      ),
    );
  }

  /// Callback when page load stops.
  void onLoadStop(controller, WebUri? url) async {
    if (url == null) return;
    await controller.evaluateJavascript(
      source: """
            var meta = document.createElement('meta');
            meta.name = 'viewport';
            meta.content = 'width=device-width, initial-scale=1.0';
            document.getElementsByTagName('head')[0].appendChild(meta);
            """,
    );
    final urlStr = url.toString();
    if (urlStr.contains('AIPAYLocalFile')) {
      await _webViewController.evaluateJavascript(
        source: "openPay('$payDetails')",
      );
    }

    if (urlStr.contains(options.returnUrl)) {
      if (options.returnUrl.contains(AtomConstants.defaultUrl)) {
        _getHtmlContent().then((response) {
          final values = _parseResponse(response);
          _decryptTransaction(values);
        });
      } else {
        _webViewController
            .evaluateJavascript(
              source: '''
              (function() {
                try {
                  let content = JSON.stringify(JSON.parse(document.body.innerText)).toString();
                  return content;
                } catch (e) {
                  let content = document.documentElement.outerHTML.toString();
                  return content;
                }
              })();
              ''',
            )
            .then((response) {
              AtomSDK.close(
                data: {
                  'message':
                      'Payment Processed, Unable to parse response as custom return url was used, WebHook Response in data field',
                  'data': response,
                },
                transactionStatus: AtomTransactionStatus.unknown,
              );
            });
      }
    }
  }

  /// Retrieves HTML content from the WebView.
  Future<String> _getHtmlContent() async {
    return await _webViewController.evaluateJavascript(
      source: "document.getElementsByTagName('h5')[0].innerHTML",
    );
  }

  /// Parses the response string into a map.
  Map<int, String> _parseResponse(String response) {
    final split = response.trim().split('|');
    return {for (int i = 0; i < split.length; i++) i: split[i]};
  }

  /// Decrypts the transaction response.
  Future<void> _decryptTransaction(Map<int, String> values) async {
    if (values[1] == null) throw Exception();

    final splitTwo = values[1]!.split('=');
    if (splitTwo.length < 2) throw Exception();

    try {
      final String result = await AESHelper.getAtomDecryption(
        encryptedText: splitTwo[1].toString(),
        key: options.responseDecryptionKey,
      );
      final Map<String, dynamic> jsonInput = jsonDecode(result);

      await _validateTransaction(jsonInput);
    } catch (e) {
      AtomSDK.close(
        transactionStatus: AtomTransactionStatus.decryptionFailed,
        data: {'message': 'Decryption Error'},
      );
    }
  }

  /// Validates the decrypted transaction data.
  Future<void> _validateTransaction(Map<String, dynamic> jsonInput) async {
    bool isSignatureValid = validateSignature(
      jsonInput,
      options.responseHashKey,
    );

    if (!isSignatureValid) {
      AtomSDK.close(
        transactionStatus: AtomTransactionStatus.signatureNotMatched,
        data: {'message': 'Invalid Signature'},
      );
      return;
    } else {
      final statusCode =
          jsonInput['payInstrument']['responseDetails']['statusCode'];
      if (statusCode == 'OTS0000' || statusCode == 'OTS0551') {
        AtomSDK.close(
          transactionStatus: AtomTransactionStatus.success,
          data: jsonInput,
        );
      } else {
        AtomSDK.close(
          transactionStatus: AtomTransactionStatus.failed,
          data: jsonInput,
        );
      }
    }
  }

  /// Returns the app name for a given UPI scheme.
  String getAppName(String scheme) {
    return switch (scheme) {
      'tez' => 'Google Pay',
      'phonepe' => 'PhonePe',
      'paytmmp' => 'Paytm',
      _ => 'UPI',
    };
  }
}
