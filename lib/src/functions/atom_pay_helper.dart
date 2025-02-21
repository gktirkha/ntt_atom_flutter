import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

/// Generates a JSON request payload for payment processing.
///
/// Takes a [data] map containing transaction details and returns a JSON-encoded string.
String getRequestJsonData(Map<String, dynamic> data) {
  String datetime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  Map<String, dynamic> payload = {
    'payInstrument': {
      'headDetails': {'version': 'OTSv1.1', 'api': 'AUTH', 'platform': 'FLASH'},
      'merchDetails': {
        'merchId': data['login'],
        'userId': '',
        'password': data['password'],
        'merchTxnDate': datetime,
        'merchTxnId': data['txnid'],
      },
      'payDetails': {
        'amount': data['amount'],
        'product': data['prodid'],
        'custAccNo': data['custacc'],
        'txnCurrency': data['txncurr'],
      },
      'custDetails': {'custEmail': data['email'], 'custMobile': data['mobile']},
      'extras': {
        'udf1': data['udf1'],
        'udf2': data['udf2'],
        'udf3': data['udf3'],
        'udf4': data['udf4'],
        'udf5': data['udf5'],
      },
    },
  };
  return json.encode(payload);
}

/// Creates an HMAC SHA-512 signature for authentication.
///
/// Takes a [data] map and generates a secure signature string using the provided request hash key.
String createSignature(Map<String, dynamic> data) {
  final signatureString =
      '${data['login']}${data['password']}${data['txnid']}'
      'RD${data['amount']}${data['txncurr']}1';

  final signatureBytes = utf8.encode(signatureString);
  final hmacKey = utf8.encode(data['requestHashKey']);

  final hmac = Hmac(sha512, hmacKey);
  final hmacDigest = hmac.convert(signatureBytes);

  return hmacDigest.toString();
}

/// Validates the HMAC SHA-512 signature from the response.
///
/// Takes a [data] map containing response details and a [resHashKey] for validation.
/// Returns `true` if the computed signature matches the expected signature.
bool validateSignature(Map<String, dynamic> data, String resHashKey) {
  final signatureString =
      '${data['payInstrument']['merchDetails']['merchId']}'
      '${data['payInstrument']['payDetails']['atomTxnId']}'
      '${data['payInstrument']['merchDetails']['merchTxnId']}'
      '${data['payInstrument']['payDetails']['totalAmount'].toStringAsFixed(2)}'
      '${data['payInstrument']['responseDetails']['statusCode']}'
      '${data['payInstrument']['payModeSpecificData']['subChannel'][0]}'
      '${data['payInstrument']['payModeSpecificData']['bankDetails']['bankTxnId']}';

  final signatureBytes = utf8.encode(signatureString);
  final hmacKey = utf8.encode(resHashKey);

  final hmac = Hmac(sha512, hmacKey);
  final hmacDigest = hmac.convert(signatureBytes);

  final genSig = hmacDigest.toString();

  return data['payInstrument']['payDetails']['signature'] == genSig;
}
