import 'dart:convert';

import 'package:crypto/crypto.dart' as legacy_crypto;
import 'package:flutter_test/flutter_test.dart';
import 'package:ntt_atom_flutter/src/helpers/signature_helper.dart';

void main() {
  group('SignatureHelper HMAC output', () {
    test(
      'createSignature matches package:crypto HMAC-SHA512 for the same inputs',
      () async {
        final data = {
          'login': 'merchant123',
          'password': 'p@ssw0rd',
          'txnid': 'TXN-0001',
          'amount': '100.00',
          'txncurr': 'INR',
          'requestHashKey': 'requestHashKeySecret',
        };

        final signatureString =
            '${data['login']}${data['password']}${data['txnid']}'
            'RD${data['amount']}${data['txncurr']}1';
        final expected = legacy_crypto.Hmac(
          legacy_crypto.sha512,
          utf8.encode(data['requestHashKey']!),
        ).convert(utf8.encode(signatureString)).toString();

        final actual = await SignatureHelper.createSignature(data);

        expect(actual, expected);
      },
    );

    test(
      'validateSignature matches package:crypto HMAC-SHA512 and validates correctly',
      () async {
        const resHashKey = 'responseHashKeySecret';

        final signatureString =
            'merchant123'
            'ATOMTXN0001'
            'MERCHTXN0001'
            '100.00'
            'OTS0000'
            'UPI'
            'BANKTXN0001';
        final expectedSignature = legacy_crypto.Hmac(
          legacy_crypto.sha512,
          utf8.encode(resHashKey),
        ).convert(utf8.encode(signatureString)).toString();

        final data = {
          'payInstrument': {
            'merchDetails': {
              'merchId': 'merchant123',
              'merchTxnId': 'MERCHTXN0001',
            },
            'payDetails': {
              'atomTxnId': 'ATOMTXN0001',
              'totalAmount': 100.0,
              'signature': expectedSignature,
            },
            'responseDetails': {'statusCode': 'OTS0000'},
            'payModeSpecificData': {
              'subChannel': ['UPI'],
              'bankDetails': {'bankTxnId': 'BANKTXN0001'},
            },
          },
        };

        final isValid = await SignatureHelper.validateSignature(
          data,
          resHashKey,
        );

        expect(isValid, isTrue);
      },
    );

    test('validateSignature rejects a tampered signature', () async {
      final data = {
        'payInstrument': {
          'merchDetails': {'merchId': 'merchant123', 'merchTxnId': 'M1'},
          'payDetails': {
            'atomTxnId': 'A1',
            'totalAmount': 100.0,
            'signature': 'not-a-real-signature',
          },
          'responseDetails': {'statusCode': 'OTS0000'},
          'payModeSpecificData': {
            'subChannel': ['UPI'],
            'bankDetails': {'bankTxnId': 'B1'},
          },
        },
      };

      final isValid = await SignatureHelper.validateSignature(data, 'anyKey');

      expect(isValid, isFalse);
    });
  });
}
