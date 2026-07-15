import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../ntt_atom_flutter.dart';
import '../constants/atom_constants.dart';
import '../constants/atom_pg_status_codes.dart';
import '../constants/enums/atom_upi_app.dart';
import 'a_e_s_helper.dart';
import 'dio_builder.dart';
import 'html_helper.dart';
import 'signature_helper.dart';

/// WebView orchestration helpers for the Atom checkout flow: handling JS
/// errors, resolving UPI intents, and processing the gateway's return URL.
sealed class AtomWebViewHelper {
  /// Logs a JavaScript error reported by the checkout page and closes the
  /// SDK with [AtomTransactionStatus.failed].
  static void handleJsError(JavaScriptMessage message) {
    log('openPay threw: ${message.message}', name: AtomConstants.logName);
    AtomSDK.close(
      transactionStatus: .failed,
      data: {'message': message.message},
    );
  }

  /// Intercepts navigation to a UPI app deep link, launching the matching
  /// app or calling [onLaunchFailure] if the app cannot be opened.
  ///
  /// Returns [NavigationDecision.navigate] for non-UPI URLs and
  /// [NavigationDecision.prevent] once a UPI URL has been handled.
  static Future<NavigationDecision> resolveNavigationRequest(
    NavigationRequest request, {
    required void Function(AtomUpiApp upiApp) onLaunchFailure,
  }) async {
    final uri = Uri.tryParse(request.url);
    final AtomUpiApp? upiApp = uri == null ? null : .fromScheme(uri.scheme);
    if (uri == null || upiApp == null) {
      return .navigate;
    }

    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      log('Unable to launch UPI app URL: $e', name: AtomConstants.logName);
      onLaunchFailure(upiApp);
    }
    return .prevent;
  }

  /// Returns whether [l1] and [l2] refer to the same URL, allowing either
  /// one to be a prefix of the other.
  static bool areUrlsMatching(String l1, String l2) {
    return l1.contains(l2) || l2.contains(l1);
  }

  /// Handles the WebView reaching the configured return URL: decrypts and/or
  /// forwards the transaction payload according to [returnUrlConfig]'s mode,
  /// then closes the SDK with the resulting status.
  static Future<void> resolveForwarding({
    required WebViewController webViewController,
    required String url,
    required AtomReturnUrlConfig returnUrlConfig,
    required String? forwardUrl,
    required AtomPaymentOptions options,
  }) async {
    if (!areUrlsMatching(url, returnUrlConfig.returnUrl)) return;
    switch (returnUrlConfig.mode) {
      case .sendToServer:
        AtomSDK.close(transactionStatus: .unknown, data: {});
        break;

      case .forwardEncrypted:
        final callBackResponse =
            await HtmlHelper.extractContentFromDefaultPGCallBack(
              webViewController,
            );
        final encryptedText = _extractEncryptedText(callBackResponse);
        if (forwardUrl != null && encryptedText != null) {
          await forwardTxn(
            content: 'encData=$encryptedText',
            forwardUrl: forwardUrl,
          );
        }
        final decryptedTxn = await extractTransaction(
          encryptedText: encryptedText,
          key: options.responseDecryptionKey,
        );
        await validateAndCloseSDK(
          jsonInput: decryptedTxn,
          responseHashKey: options.responseHashKey,
        );
        break;

      case .forwardUnencrypted:
        final callBackResponse =
            await HtmlHelper.extractContentFromDefaultPGCallBack(
              webViewController,
            );
        final encryptedText = _extractEncryptedText(callBackResponse);
        final decryptedTxn = await extractTransaction(
          encryptedText: encryptedText,
          key: options.responseDecryptionKey,
        );
        if (forwardUrl != null && decryptedTxn != null) {
          await forwardTxn(content: decryptedTxn, forwardUrl: forwardUrl);
        }
        await validateAndCloseSDK(
          jsonInput: decryptedTxn,
          responseHashKey: options.responseHashKey,
        );
        break;
    }
  }

  static String? _extractEncryptedText(String callBackResponse) {
    final split = callBackResponse.trim().split('|');
    final parsed = {for (int i = 0; i < split.length; i++) i: split[i]};
    if (parsed[1] == null) return null;
    final splitTwo = parsed[1]!.split('=');
    if (splitTwo.length < 2) return null;
    return splitTwo[1];
  }

  /// Decrypts [encryptedText] with [key] and parses it as JSON, returning
  /// `null` if [encryptedText] is `null` or decryption/parsing fails.
  static Future<Map<String, dynamic>?> extractTransaction({
    required String? encryptedText,
    required String key,
  }) async {
    if (encryptedText == null) {
      return null;
    }

    try {
      final decrypted = await AESHelper.decrypt(
        encryptedText: encryptedText,
        key: key,
      );

      return jsonDecode(decrypted);
    } catch (e) {
      return null;
    }
  }

  /// Posts [content] as plain text to [forwardUrl].
  static Future<void> forwardTxn({
    required dynamic content,
    required String forwardUrl,
  }) async {
    final Dio dio = DioBuilder.buildDio();
    try {
      await dio.post(
        forwardUrl,
        data: (content is Map<String, dynamic> || content is String)
            ? content
            : jsonEncode(content),
        options: .new(
          contentType: content is Map<String, dynamic>
              ? Headers.jsonContentType
              : Headers.textPlainContentType,
        ),
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

  /// Validates the signature of [jsonInput] against [responseHashKey] and
  /// closes the SDK with the corresponding [AtomTransactionStatus].
  static Future<void> validateAndCloseSDK({
    required Map<String, dynamic>? jsonInput,
    required String responseHashKey,
  }) async {
    if (jsonInput == null) {
      AtomSDK.close(
        transactionStatus: .decryptionFailed,
        data: {'message': 'Invalid Signature'},
      );
      return;
    }
    bool isSignatureValid = await SignatureHelper.validateSignature(
      jsonInput,
      responseHashKey,
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
