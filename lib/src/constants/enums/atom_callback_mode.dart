/// Determines how the transaction result is delivered once the payment
/// gateway redirects back to the configured return URL.
enum AtomCallbackMode {
  /// The gateway posts the result directly to [AtomReturnUrlConfig.returnUrl]
  /// and the SDK does not forward or decrypt it.
  sendToServer,

  /// The SDK decrypts the result and forwards the decrypted payload to
  /// the configured forward URL.
  forwardEncrypted,

  /// The SDK forwards the raw encrypted result to the configured forward
  /// URL without decrypting it first.
  forwardUnencrypted,
}
