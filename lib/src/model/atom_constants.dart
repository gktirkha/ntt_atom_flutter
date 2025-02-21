/// Enum representing the payment mode.
enum AtomPaymentMode {
  /// UAT (User Acceptance Testing) environment.
  uat,

  /// Live production environment.
  live,
}

/// Enum representing different transaction statuses.
enum AtomTransactionStatus {
  /// Transaction was successful.
  success,

  /// Transaction failed.
  failed,

  /// Transaction was cancelled by the user.
  cancelled,

  /// Transaction signature did not match.
  signatureNotMatched,

  /// Decryption of transaction data failed.
  decryptionFailed,

  /// Unknown transaction status.
  unknown,
}

/// Contains constant values for Atom payment processing.
abstract class AtomConstants {
  /// Default URL for the Atom payment gateway.
  static const String defaultUrl = 'https://pgtest.atomtech.in/mobilesdk/param';
}
