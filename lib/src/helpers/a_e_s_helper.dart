import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:encrypt/encrypt.dart';

part '../constants/a_e_s_constants.dart';

sealed class AESHelper {
  static Future<String> encrypt({
    required String plainText,
    required String key,
  }) async {
    final salt = utf8.encode(key);

    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha512(),
      iterations: _AESConstants._passwordIterations,
      bits: _AESConstants._keySize,
    );

    final secretKey = await pbkdf2.deriveKeyFromPassword(
      password: key,
      nonce: salt,
    );

    final aesKey = await secretKey.extractBytes();
    final aesKeyObj = Key(Uint8List.fromList(aesKey));

    final aes = AES(aesKeyObj, mode: AESMode.cbc);

    final iv = Uint8List.fromList(_AESConstants._ivBytes);

    final encryptedBytes = aes
        .encrypt(utf8.encode(plainText), iv: IV(iv))
        .bytes;

    return _byteToHex(encryptedBytes);
  }

  static Future<String> decrypt({
    required String encryptedText,
    required String key,
  }) async {
    final salt = utf8.encode(key);

    final encryptedTextBytes = _hex2ByteArray(encryptedText);

    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha512(),
      iterations: _AESConstants._passwordIterations,
      bits: _AESConstants._keySize,
    );

    final secretKey = await pbkdf2.deriveKeyFromPassword(
      password: key,
      nonce: salt,
    );

    final aesKey = await secretKey.extractBytes();
    final aesKeyObj = Key(Uint8List.fromList(aesKey));

    final aes = AES(aesKeyObj, mode: AESMode.cbc);

    final iv = Uint8List.fromList(_AESConstants._ivBytes);

    final decryptedBytes = aes.decrypt(
      Encrypted(encryptedTextBytes),
      iv: IV(iv),
    );

    return utf8.decode(decryptedBytes);
  }

  static String _byteToHex(Uint8List bytes) {
    return bytes
        .map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase())
        .join();
  }

  static Uint8List _hex2ByteArray(String sHexData) {
    final rawData = Uint8List(sHexData.length ~/ 2);
    for (int i = 0; i < rawData.length; i++) {
      final index = i * 2;
      final v = int.parse(sHexData.substring(index, index + 2), radix: 16);
      rawData[i] = v;
    }
    return rawData;
  }
}
