import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/atom_constants.dart';
import '../pages/atom_payment_web_page.dart';
import '../router/atom_page_route.dart';
import '../sdk/atom_s_d_k.dart';
import 'a_e_s_helper.dart';
import 'atom_pay_helper.dart';

/// Starts the payment process by encrypting request data and obtaining an Atom token.
Future<void> startPayment() async {
  final String encryptedString = await AESHelper.getAtomEncryption(
    plainText: getRequestJsonData(jsonDecode(jsonEncode(AtomSDK.options))),
    key: AtomSDK.options.requestEncryptionKey,
  );

  return await _getAtomTokenId(authEncryptedString: encryptedString);
}

/// Retrieves the Atom Token ID by sending an authentication request.
///
/// Throws an exception if the request fails or if the response is invalid.
Future<void> _getAtomTokenId({required String authEncryptedString}) async {
  try {
    final String authApiUrl = _getAuthApiUrl(AtomSDK.options.mode);

    final request = http.Request('POST', Uri.parse(authApiUrl))
      ..bodyFields = {
        'encData': authEncryptedString,
        'merchId': AtomSDK.options.login,
      };

    final http.StreamedResponse response = await request.send();
    final String authApiResponse = await response.stream.bytesToString();

    if (response.statusCode != 200) {
      throw Exception(
        'Request failed with status: ${response.statusCode}\nResponse: $authApiResponse',
      );
    }

    log(name: 'Atom SDK', 'Payment Initialization Response\n$authApiResponse');

    final List<String> responseParts = authApiResponse.trim().split('&');
    if (responseParts.length < 2 || !responseParts[1].startsWith('encData=')) {
      throw Exception('Invalid response format: $authApiResponse');
    }

    final String encryptedData = responseParts[1].split('=')[1];

    final String decryptedResponse = await AESHelper.getAtomDecryption(
      encryptedText: encryptedData,
      key: AtomSDK.options.responseDecryptionKey,
    );

    final Map<String, dynamic> jsonResponse = jsonDecode(decryptedResponse);
    final txnStatus = jsonResponse['responseDetails']?['txnStatusCode'];

    if (txnStatus != 'OTS0000') {
      throw Exception('Transaction failed: $txnStatus');
    }

    final String atomTokenId = jsonResponse['atomTokenId'].toString();
    final String payDetails = jsonEncode({
      'atomTokenId': atomTokenId,
      'merchId': AtomSDK.options.login,
      'emailId': AtomSDK.options.email,
      'mobileNumber': AtomSDK.options.mobile,
      'returnUrl': AtomSDK.options.returnUrl,
    });

    AtomSDK.navigatorObserver.navigator?.pushReplacement(
      AtomPageRoute(
        builder: (context) => AtomPaymentWebPage(payDetails: payDetails),
      ),
    );
  } catch (e) {
    throw Exception('Failed to initialize payment:\n ${e.toString()}');
  }
}

/// Returns the authentication API URL based on the payment mode.
///
/// [mode] The current payment mode (UAT or Live).
String _getAuthApiUrl(AtomPaymentMode mode) {
  return switch (mode) {
    AtomPaymentMode.uat => 'https://caller.atomtech.in/ots/aipay/auth',
    AtomPaymentMode.live => 'https://payment1.atomtech.in/ots/aipay/auth',
  };
}
