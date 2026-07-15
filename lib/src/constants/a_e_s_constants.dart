part of '../helpers/a_e_s_helper.dart';

sealed class _AESConstants {
  static const _passwordIterations = 65536;

  static const _keySize = 256;

  static final _ivBytes = List<int>.generate(16, (i) => i);
}
