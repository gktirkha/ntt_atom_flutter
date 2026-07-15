/// Identifies the reason an [AtomException] was thrown.
enum AtomExceptionCode {
  /// The SDK was invoked without the required payment options configured.
  optionsNotConfigured,

  /// Requesting a transaction token from the payment gateway failed.
  transactionTokenRequestFailed,

  /// The transaction token returned by the payment gateway could not be
  /// validated.
  transactionTokenValidationFailed,

  /// An unexpected or unclassified error occurred.
  unknown,
}
