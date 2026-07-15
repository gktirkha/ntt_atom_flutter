import '../constants/enums/atom_exception_code.dart';

/// An exception thrown by the Atom SDK when a payment cannot proceed.
class AtomException implements Exception {
  /// Creates an [AtomException] with the given [code] and optional
  /// [message] describing the failure.
  const AtomException(this.code, [this.message]);

  /// The reason this exception was thrown.
  final AtomExceptionCode code;

  /// An optional human-readable description of the failure.
  final String? message;

  @override
  String toString() => 'AtomException(code: $code, message: $message)';
}
