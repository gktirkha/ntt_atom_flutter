import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

/// Helpers for scraping content out of the payment gateway's WebView pages.
sealed class HtmlHelper {
  /// Extracts the encrypted transaction text embedded in the default
  /// payment gateway callback page's `<h5>` element, or `null` if it
  /// cannot be found.
  static Future<String?> extractContentFromDefaultPGCallBack(
    WebViewController webViewController,
  ) async {
    final res = await webViewController.runJavaScriptReturningResult(
      "document.getElementsByTagName('h5')[0].innerHTML",
    );
    final response = res is String ? jsonDecode(res) as String : '$res';
    final split = response.trim().split('|');
    final parsed = {for (int i = 0; i < split.length; i++) i: split[i]};
    if (parsed[1] == null) return null;
    final splitTwo = parsed[1]!.split('=');
    if (splitTwo.length < 2) return null;
    final extractedEncryptedText = splitTwo[1];
    return extractedEncryptedText;
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
