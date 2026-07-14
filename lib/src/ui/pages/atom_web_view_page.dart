import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../ntt_atom_flutter.dart';
import '../../constants/atom_constants.dart';
import '../../constants/atom_web_page.dart';
import '../../helpers/atom_web_view_helper.dart';

class AtomWebViewPage extends StatefulWidget {
  const AtomWebViewPage({
    super.key,
    required this.payDetails,
    required this.options,
    this.forwardUrl,
    this.onUserExitRequest,
  });

  final String payDetails;
  final AtomPaymentOptions options;
  final String? forwardUrl;
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
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (url) async {
          if (!url.startsWith(returnUrl)) return;

          final result = await webViewController.runJavaScriptReturningResult(
            'document.documentElement.outerHTML',
          );
          final html = result is String
              ? jsonDecode(result) as String
              : '$result';
          log(html, name: AtomConstants.logName);
        },
      ),
    )
    ..addJavaScriptChannel(
      AtomConstants.errorChannelName,
      onMessageReceived: (message) {
        AtomWebViewHelper.handleJsError(message);
      },
    )
    ..loadHtmlString(initFile)
    ..setOnConsoleMessage((message) {
      log(message.message, name: AtomConstants.logName);
    })
    ..setNavigationDelegate(
      .new(
        onPageFinished: (url) async {
          log('Page Loaded: $url', name: AtomConstants.logName);
          await webViewController.runJavaScript('''
          var meta = document.createElement('meta');
                      meta.name = 'viewport';
                      meta.content = 'width=device-width, initial-scale=1.0';
                      document.getElementsByTagName('head')[0].appendChild(meta);
          ''');
          await AtomWebViewHelper.resolveForwarding(
            webViewController: webViewController,
            url: url,
            returnUrlConfig: widget.options.returnUrlConfig!,
            forwardUrl: widget.forwardUrl,
            options: widget.options,
          );
        },
        onNavigationRequest: (request) {
          return AtomWebViewHelper.resolveNavigationRequest(
            request,
            onLaunchFailure: (upiApp) {
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
            },
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
