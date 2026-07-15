import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../ntt_atom_flutter.dart';
import '../../constants/atom_constants.dart';
import '../../constants/atom_web_page.dart';
import '../../constants/enums/atom_upi_app.dart';
import '../../helpers/atom_web_view_helper.dart';

/// The WebView page that hosts the Atom checkout script and handles the
/// payment gateway's redirect back to the merchant's return URL.
class AtomWebViewPage extends StatefulWidget {
  /// Creates the checkout WebView page for a transaction.
  const AtomWebViewPage({
    super.key,
    required this.payDetails,
    required this.options,
    this.forwardUrl,
    this.onUserExitRequest,
  });

  /// The JSON-encoded payment details produced by `PaymentHelper.startPayment`.
  final String payDetails;

  /// The payment options the transaction was started with.
  final AtomPaymentOptions options;

  /// The URL the decrypted or raw transaction result should be forwarded
  /// to, if any.
  final String? forwardUrl;

  /// Called when the user attempts to leave the checkout page; may return
  /// `false` to block the exit.
  final Future<bool> Function()? onUserExitRequest;

  @override
  State<AtomWebViewPage> createState() => _AtomWebViewPageState();
}

class _AtomWebViewPageState extends State<AtomWebViewPage> {
  late final String initFile = AtomWebPage.page(
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
    ..setOnConsoleMessage(_onConsoleMessage)
    ..setNavigationDelegate(
      .new(
        onPageFinished: _onReturnUrlPageFinished,
        onNavigationRequest: _onNavigationRequest,
      ),
    )
    ..setUserAgent(AtomConstants.userAgent);

  @override
  void initState() {
    super.initState();
    assert(
      widget.options.returnUrlConfig != null,
      'AtomPaymentOptions.returnUrlConfig must not be null.',
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

  void _onJsError(JavaScriptMessage message) {
    AtomWebViewHelper.handleJsError(message);
  }

  void _onConsoleMessage(JavaScriptConsoleMessage message) {
    log(message.message, name: AtomConstants.logName);
  }

  Future<void> _onReturnUrlPageFinished(String url) async {
    log('Page Loaded: $url', name: AtomConstants.logName);
    await webViewController.runJavaScript('''
          var meta = document.createElement('meta');
                      meta.name = 'viewport';
                      meta.content = 'width=device-width, initial-scale=1.0';
                      document.getElementsByTagName('head')[0].appendChild(meta);
          ''');
    await AtomWebViewHelper.resolveForwarding(
      url: url,
      webViewController: webViewController,
      returnUrlConfig: widget.options.returnUrlConfig!,
      forwardUrl: widget.forwardUrl,
      options: widget.options,
    );
  }

  Future<NavigationDecision> _onNavigationRequest(NavigationRequest request) {
    return AtomWebViewHelper.resolveNavigationRequest(
      request,
      onLaunchFailure: _onUpiLaunchFailure,
    );
  }

  void _onUpiLaunchFailure(AtomUpiApp upiApp) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Unable To Start ${upiApp.appName} Transaction, '
          'Please Try other Payment Method',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldExit = await widget.onUserExitRequest?.call() ?? true;
        if (shouldExit) {
          AtomSDK.close(transactionStatus: .cancelled, data: {});
        }
      },
      child: Scaffold(
        body: SafeArea(child: WebViewWidget(controller: webViewController)),
      ),
    );
  }
}
