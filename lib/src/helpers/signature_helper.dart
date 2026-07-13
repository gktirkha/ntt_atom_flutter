import 'dart:convert';

import 'package:crypto/crypto.dart';

sealed class SignatureHelper {
  static String getRequestJsonData(Map<String, dynamic> data) {
    String datetime = _getFormattedDateTime();

    Map<String, dynamic> payload = {
      'payInstrument': {
        'headDetails': {
          'version': 'OTSv1.1',
          'api': 'AUTH',
          'platform': 'FLASH',
        },
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
        'custDetails': {
          'custEmail': data['email'],
          'custMobile': data['mobile'],
        },
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

  static String createSignature(Map<String, dynamic> data) {
    final signatureString =
        '${data['login']}${data['password']}${data['txnid']}'
        'RD${data['amount']}${data['txncurr']}1';

    final signatureBytes = utf8.encode(signatureString);
    final hmacKey = utf8.encode(data['requestHashKey']);

    final hmac = Hmac(sha512, hmacKey);
    final hmacDigest = hmac.convert(signatureBytes);

    return hmacDigest.toString();
  }

  static bool validateSignature(Map<String, dynamic> data, String resHashKey) {
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

  static String _getFormattedDateTime() {
    DateTime now = .now();
    return '${now.year}-${_padTwoDigits(now.month)}-${_padTwoDigits(now.day)} '
        '${_padTwoDigits(now.hour)}:${_padTwoDigits(now.minute)}:${_padTwoDigits(now.second)}';
  }

  static String _padTwoDigits(int n) => n.toString().padLeft(2, '0');
}
