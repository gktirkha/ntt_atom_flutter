import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/atom_constants.dart';
import '../constants/atom_pg_status_codes.dart';
import '../exception/atom_exception.dart';
import '../models/atom_payment_options/atom_payment_options.dart';
import 'a_e_s_helper.dart';
import 'signature_helper.dart';

sealed class PaymentHelper {
  static Future<String> startPayment(AtomPaymentOptions options) async {
    final plainText = SignatureHelper.getRequestJsonData(options.toJson());
    final key = options.requestEncryptionKey;
    final encryptedToken = await AESHelper.encrypt(
      plainText: plainText,
      key: key,
    );

    final transactionToken = await _requestTransactionToken(
      encryptedToken,
      options,
    );

    if (transactionToken == null) {
      log(
        name: AtomConstants.logName,
        'startPayment aborted: failed to obtain transaction token',
      );
      throw const AtomException(
        .transactionTokenRequestFailed,
        'Failed to obtain transaction token',
      );
    }

    final decryptedResponse = await _validateTransactionToken(
      transactionToken,
      options,
    );

    if (decryptedResponse == null) {
      log(
        name: AtomConstants.logName,
        'startPayment aborted: transaction token validation failed',
      );
      throw const AtomException(
        .transactionTokenValidationFailed,
        'Transaction token validation failed',
      );
    }

    return _makePaymentDetails(transactionToken, decryptedResponse, options);
  }

  static Future<String?> _requestTransactionToken(
    String encryptedToken,
    AtomPaymentOptions options,
  ) async {
    final url = switch (options.mode) {
      .live => AtomConstants.liveUrl,
      .uat => AtomConstants.uatUrl,
    };

    final Dio dio = .new();
    try {
      final Response response = await dio.post(
        url,
        data: {'encData': encryptedToken, 'merchId': options.login},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          responseType: ResponseType.plain,
        ),
      );

      if (response.statusCode != 200) {
        log(
          name: AtomConstants.logName,
          'Transaction token request failed with status: '
          '${response.statusCode}',
        );
        return null;
      }
      return response.data.toString();
    } catch (e) {
      log(
        name: AtomConstants.logName,
        'Transaction token request threw an exception: $e',
      );
      return null;
    }
  }

  static Future<String?> _validateTransactionToken(
    String transactionToken,
    AtomPaymentOptions options,
  ) async {
    final List<String> responseParts = transactionToken.trim().split('&');
    if (responseParts.length < 2 || !responseParts[1].startsWith('encData=')) {
      log(
        name: AtomConstants.logName,
        'Invalid response format: $transactionToken',
      );
      return null;
    }

    final String encryptedData = responseParts[1].split('=')[1];

    final String decryptedResponse = await AESHelper.decrypt(
      encryptedText: encryptedData,
      key: options.responseDecryptionKey,
    );

    final Map<String, dynamic> jsonResponse = jsonDecode(decryptedResponse);
    final txnStatus = jsonResponse['responseDetails']?['txnStatusCode'];

    if (!AtomPgStatusCodes.success.contains(txnStatus)) {
      log(
        name: AtomConstants.logName,
        'Transaction validation failed with status: $txnStatus',
      );
      return null;
    }

    return decryptedResponse;
  }

  static String _makePaymentDetails(
    String transactionToken,
    String decryptedResponse,
    AtomPaymentOptions options,
  ) {
    final Map<String, dynamic> jsonResponse = jsonDecode(decryptedResponse);
    final String atomTokenId = jsonResponse['atomTokenId'].toString();
    final String payDetails = jsonEncode({
      'atomTokenId': atomTokenId,
      'merchId': options.login,
      'emailId': options.email,
      'mobileNumber': options.mobile,
      'returnUrl': _gatewayReturnUrl(options),
    });
    return payDetails;
  }

  static String _gatewayReturnUrl(AtomPaymentOptions options) {
    final config = options.returnUrlConfig;
    if (config != null &&
        config.returnUrl.trim().isNotEmpty &&
        config.mode == .sendToServer) {
      return config.returnUrl;
    }
    return AtomConstants.defaultReturnUrl;
  }
}
