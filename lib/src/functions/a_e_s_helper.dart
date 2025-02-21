import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:encrypt/encrypt.dart';

/// A helper class for AES encryption and decryption using PBKDF2 key derivation.
class AESHelper {
  /// Number of iterations for PBKDF2 key derivation.
  static const pswdIterations = 65536;

  /// Key size in bits.
  static const keySize = 256;

  /// Initialization vector (IV) used for AES encryption.
  static final ivBytes = List<int>.generate(16, (i) => i);

  /// Encrypts the given [plainText] using AES encryption with the provided [key].
  ///
  /// Returns the encrypted text as a hexadecimal string.
  static Future<String> getAtomEncryption({
    required String plainText,
    required String key,
  }) async {
    final salt = utf8.encode(key);

    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha512(),
      iterations: pswdIterations,
      bits: keySize,
    );

    final secretKey = await pbkdf2.deriveKeyFromPassword(
      password: key,
      nonce: salt,
    );

    final aesKey = await secretKey.extractBytes();
    final aesKeyObj = Key(Uint8List.fromList(aesKey));

    final aes = AES(aesKeyObj, mode: AESMode.cbc);

    final iv = Uint8List.fromList(ivBytes);

    final encryptedBytes =
        aes.encrypt(utf8.encode(plainText), iv: IV(iv)).bytes;

    return _byteToHex(encryptedBytes);
  }

  /// Converts a [Uint8List] of bytes to a hexadecimal string.
  static String _byteToHex(Uint8List bytes) {
    return bytes
        .map((byte) => byte.toRadixString(16).padLeft(2, '0').toUpperCase())
        .join();
  }

  /// Decrypts the given [encryptedText] using AES decryption with the provided [key].
  ///
  /// Returns the original plain text.
  static Future<String> getAtomDecryption({
    required String encryptedText,
    required String key,
  }) async {
    final salt = utf8.encode(key);

    final encryptedTextBytes = _hex2ByteArray(encryptedText);

    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha512(),
      iterations: pswdIterations,
      bits: keySize,
    );

    final secretKey = await pbkdf2.deriveKeyFromPassword(
      password: key,
      nonce: salt,
    );

    final aesKey = await secretKey.extractBytes();
    final aesKeyObj = Key(Uint8List.fromList(aesKey));

    final aes = AES(aesKeyObj, mode: AESMode.cbc);

    final iv = Uint8List.fromList(ivBytes);

    final decryptedBytes = aes.decrypt(
      Encrypted(encryptedTextBytes),
      iv: IV(iv),
    );

    return utf8.decode(decryptedBytes);
  }

  /// Converts a hexadecimal string [sHexData] to a [Uint8List] of bytes.
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
