import '../constants/enums/atom_exception_code.dart';

class AtomException implements Exception {
  const AtomException(this.code, [this.message]);

  final AtomExceptionCode code;
  final String? message;

  @override
  String toString() => 'AtomException(code: $code, message: $message)';
}
