/// The outcome of a payment initiated through the Atom SDK, reported via
/// `AtomSDK.checkOut`'s `onClose` callback.
enum AtomTransactionStatus {
  /// The transaction completed successfully.
  success,

  /// The transaction was attempted but failed at the gateway.
  failed,

  /// The user cancelled the transaction before it completed.
  cancelled,

  /// The response signature did not match the expected value.
  signatureNotMatched,

  /// The response payload could not be decrypted.
  decryptionFailed,

  /// The response payload could not be extracted from the gateway page.
  extractionFailed,

  /// An unexpected or unclassified outcome occurred.
  unknown,
}
