import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../ntt_atom_flutter.dart';
import '../../constants/atom_constants.dart';
import '../../constants/atom_pg_status_codes.dart';
import '../../constants/atom_web_pages.dart';
import '../../helpers/a_e_s_helper.dart';
import '../../helpers/html_helper.dart';
import '../../helpers/signature_helper.dart';

class AtomWebViewPage extends StatefulWidget {
  const AtomWebViewPage({
    super.key,
    required this.payDetails,
    required this.options,
    this.forwardUrl,
  });

  final String payDetails;
  final AtomPaymentOptions options;
  final String? forwardUrl;

  @override
  State<AtomWebViewPage> createState() => _AtomWebViewPageState();
}

class _AtomWebViewPageState extends State<AtomWebViewPage> {
  late final String initFile = AtomWebPages.page(
    widget.options.mode,
    widget.payDetails,
  );

  late final String returnUrl =
      (jsonDecode(widget.payDetails) as Map<String, dynamic>)['returnUrl']
          as String;

  late final WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(.unrestricted)
    ..setNavigationDelegate(NavigationDelegate(onPageFinished: _onPageFinished))
    ..addJavaScriptChannel(
      AtomConstants.errorChannelName,
      onMessageReceived: _onJsError,
    )
    ..loadHtmlString(initFile)
    ..setOnConsoleMessage((message) {
      log(message.message, name: AtomConstants.logName);
    })
    ..setNavigationDelegate(
      .new(
        onPageFinished: (url) async {
          await webViewController.runJavaScript('''
          var meta = document.createElement('meta');
                      meta.name = 'viewport';
                      meta.content = 'width=device-width, initial-scale=1.0';
                      document.getElementsByTagName('head')[0].appendChild(meta);
          ''');
          await _resolveForwarding(
            url,
            widget.options.returnUrlConfig!,
            widget.forwardUrl,
          );
        },
      ),
    );

  @override
  void initState() {
    super.initState();
    assert(
      widget.options.returnUrlConfig != null,
      'AtomPaymentOptions.returnUrlConfig must not be null.',
    );
  }

  void _onJsError(JavaScriptMessage message) {
    log('openPay threw: ${message.message}', name: AtomConstants.logName);
    AtomSDK.close(
      transactionStatus: .failed,
      data: {'message': message.message},
    );
  }

  Future<void> _onPageFinished(String url) async {
    if (!url.startsWith(returnUrl)) return;

    final result = await webViewController.runJavaScriptReturningResult(
      'document.documentElement.outerHTML',
    );
    final html = result is String ? jsonDecode(result) as String : '$result';
    log(html, name: AtomConstants.logName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: webViewController)),
    );
  }

  Future<void> _resolveForwarding(
    String url,
    AtomReturnUrlConfig returnUrlConfig,
    String? forwardUrl,
  ) async {
    final returnUrl = returnUrlConfig.returnUrl;
    if (!_areUrlsMatching(url, returnUrl)) return;
    switch (returnUrlConfig.mode) {
      case .sendToServer:
        AtomSDK.close(transactionStatus: .unknown, data: {});
        break;

      case .forwardUnencrypted:
        final encryptedText =
            await HtmlHelper.extractContentFromDefaultPGCallBack(
              webViewController,
            );
        if (forwardUrl != null && encryptedText != null) {
          await _forwardTxn(encryptedText.toString(), forwardUrl);
        }
        final decryptedTxn = await _extractTransaction(encryptedText);
        _validateAndCloseSDK(decryptedTxn);
        break;

      case .forwardEncrypted:
        final encryptedText =
            await HtmlHelper.extractContentFromDefaultPGCallBack(
              webViewController,
            );
        final decryptedTxn = await _extractTransaction(encryptedText);
        if (forwardUrl != null && decryptedTxn != null) {
          await _forwardTxn(jsonEncode(decryptedTxn), forwardUrl);
        }
        _validateAndCloseSDK(decryptedTxn);
        break;
    }
  }

  bool _areUrlsMatching(String l1, String l2) {
    return l1.contains(l2) || l2.contains(l1);
  }

  Future<Map<String, dynamic>?> _extractTransaction(
    String? encryptedText,
  ) async {
    if (encryptedText == null) {
      return null;
    }

    try {
      final decrypted = await AESHelper.decrypt(
        encryptedText: encryptedText,
        key: widget.options.responseDecryptionKey,
      );

      return jsonDecode(decrypted);
    } catch (e) {
      return null;
    }
  }

  Future<void> _forwardTxn(String content, String forwardUrl) async {
    final Dio dio = .new();
    try {
      await dio.post(
        forwardUrl,
        data: content,
        options: .new(contentType: Headers.textPlainContentType),
      );
    } catch (e) {
      log(
        name: AtomConstants.logName,
        'Transaction token request threw an exception: $e',
      );
    } finally {
      dio.close();
    }
  }

  Future<void> _validateAndCloseSDK(Map<String, dynamic>? jsonInput) async {
    if (jsonInput == null) {
      AtomSDK.close(
        transactionStatus: .decryptionFailed,
        data: {'message': 'Invalid Signature'},
      );
      return;
    }
    bool isSignatureValid = await SignatureHelper.validateSignature(
      jsonInput,
      widget.options.responseHashKey,
    );

    if (!isSignatureValid) {
      AtomSDK.close(
        transactionStatus: .signatureNotMatched,
        data: {'message': 'Invalid Signature'},
      );
      return;
    } else {
      final statusCode =
          jsonInput['payInstrument']['responseDetails']['statusCode'];
      if (AtomPgStatusCodes.success.contains(statusCode)) {
        AtomSDK.close(transactionStatus: .success, data: jsonInput);
      } else {
        AtomSDK.close(transactionStatus: .failed, data: jsonInput);
      }
    }
  }
}
