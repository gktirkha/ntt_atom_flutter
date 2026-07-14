enum AtomUpiApp {
  googlePay('tez', 'Google Pay'),

  phonePe('phonepe', 'PhonePe'),

  paytm('paytmmp', 'Paytm'),

  generic('upi', 'UPI');

  const AtomUpiApp(this.scheme, this.appName);

  final String scheme;
  final String appName;

  static AtomUpiApp? fromScheme(String scheme) {
    for (final app in values) {
      if (app.scheme == scheme) return app;
    }
    return null;
  }
}
