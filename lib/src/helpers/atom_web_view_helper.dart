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
import 'html_helper.dart';
import 'signature_helper.dart';

sealed class AtomWebViewHelper {
  static void handleJsError(JavaScriptMessage message) {
    log('openPay threw: ${message.message}', name: AtomConstants.logName);
    AtomSDK.close(
      transactionStatus: .failed,
      data: {'message': message.message},
    );
  }

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

  static bool areUrlsMatching(String l1, String l2) {
    return l1.contains(l2) || l2.contains(l1);
  }

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

      case .forwardUnencrypted:
        final encryptedText =
            await HtmlHelper.extractContentFromDefaultPGCallBack(
              webViewController,
            );
        if (forwardUrl != null && encryptedText != null) {
          await forwardTxn(
            content: encryptedText.toString(),
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

      case .forwardEncrypted:
        final encryptedText =
            await HtmlHelper.extractContentFromDefaultPGCallBack(
              webViewController,
            );
        final decryptedTxn = await extractTransaction(
          encryptedText: encryptedText,
          key: options.responseDecryptionKey,
        );
        if (forwardUrl != null && decryptedTxn != null) {
          await forwardTxn(
            content: jsonEncode(decryptedTxn),
            forwardUrl: forwardUrl,
          );
        }
        await validateAndCloseSDK(
          jsonInput: decryptedTxn,
          responseHashKey: options.responseHashKey,
        );
        break;
    }
  }

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

  static Future<void> forwardTxn({
    required String content,
    required String forwardUrl,
  }) async {
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
