import 'dart:convert';

import 'package:cryptography/cryptography.dart';

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

  static Future<String> createSignature(Map<String, dynamic> data) async {
    final signatureString =
        '${data['login']}${data['password']}${data['txnid']}'
        'RD${data['amount']}${data['txncurr']}1';

    return _hmacSha512Hex(signatureString, data['requestHashKey'] as String);
  }

  static Future<bool> validateSignature(
    Map<String, dynamic> data,
    String resHashKey,
  ) async {
    final signatureString =
        '${data['payInstrument']['merchDetails']['merchId']}'
        '${data['payInstrument']['payDetails']['atomTxnId']}'
        '${data['payInstrument']['merchDetails']['merchTxnId']}'
        '${data['payInstrument']['payDetails']['totalAmount'].toStringAsFixed(2)}'
        '${data['payInstrument']['responseDetails']['statusCode']}'
        '${data['payInstrument']['payModeSpecificData']['subChannel'][0]}'
        '${data['payInstrument']['payModeSpecificData']['bankDetails']['bankTxnId']}';

    final genSig = await _hmacSha512Hex(signatureString, resHashKey);

    return data['payInstrument']['payDetails']['signature'] == genSig;
  }

  static Future<String> _hmacSha512Hex(String message, String key) async {
    final mac = await Hmac.sha512().calculateMac(
      utf8.encode(message),
      secretKey: SecretKey(utf8.encode(key)),
    );
    return mac.bytes
        .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
        .join();
  }

  static String _getFormattedDateTime() {
    DateTime now = .now();
    return '${now.year}-${_padTwoDigits(now.month)}-${_padTwoDigits(now.day)} '
        '${_padTwoDigits(now.hour)}:${_padTwoDigits(now.minute)}:${_padTwoDigits(now.second)}';
  }

  static String _padTwoDigits(int n) => n.toString().padLeft(2, '0');
}
