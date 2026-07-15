/// UPI apps the SDK can recognize and launch during a payment.
enum AtomUpiApp {
  /// Google Pay, identified by the `tez` URI scheme.
  googlePay('tez', 'Google Pay'),

  /// PhonePe, identified by the `phonepe` URI scheme.
  phonePe('phonepe', 'PhonePe'),

  /// Paytm, identified by the `paytmmp` URI scheme.
  paytm('paytmmp', 'Paytm'),

  /// A generic UPI handler, identified by the `upi` URI scheme.
  generic('upi', 'UPI');

  const AtomUpiApp(this.scheme, this.appName);

  /// The URI scheme used to launch this app.
  final String scheme;

  /// The human-readable name of this app.
  final String appName;

  /// Returns the [AtomUpiApp] matching [scheme], or `null` if none match.
  static AtomUpiApp? fromScheme(String scheme) {
    for (final app in values) {
      if (app.scheme == scheme) return app;
    }
    return null;
  }
}
