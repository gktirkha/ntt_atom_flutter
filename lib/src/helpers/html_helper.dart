import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

/// Helpers for scraping content out of the payment gateway's WebView pages.
sealed class HtmlHelper {
  /// Returns the raw content of the default payment gateway callback
  /// page's `<h5>` element.
  static Future<String> extractContentFromDefaultPGCallBack(
    WebViewController webViewController,
  ) async {
    final res = await webViewController.runJavaScriptReturningResult(
      "document.getElementsByTagName('h5')[0].innerHTML",
    );
    return res is String ? jsonDecode(res) as String : '$res';
  }

  /// Returns the current page's body content as JSON if it is valid JSON,
  /// otherwise returns the page's full HTML.
  static Future<String> getHTMLContent(
    WebViewController webViewController,
  ) async {
    final res = await webViewController.runJavaScriptReturningResult('''
        (function() {
          try {
            let content = JSON.stringify(JSON.parse(document.body.innerText)).toString();
            return content;
          } catch (e) {
            let content = document.documentElement.outerHTML.toString();
            return content;
          }
        })();
      ''');
    final response = res is String ? jsonDecode(res) as String : '$res';
    return response;
  }
}
