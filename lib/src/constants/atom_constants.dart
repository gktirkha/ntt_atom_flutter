/// Shared constant values used across the Atom SDK.
sealed class AtomConstants {
  /// Default return URL used when no return URL is configured.
  static const String defaultReturnUrl =
      'https://pgtest.atomtech.in/mobilesdk/param';

  /// Base auth URL used when [AtomEnv.uat] is selected.
  static const String uatUrl = 'https://caller.atomtech.in/ots/aipay/auth';

  /// Base auth URL used when [AtomEnv.live] is selected.
  static const String liveUrl = 'https://caller.atomtech.in/ots/aipay/auth';

  /// Name used for `dart:developer` log entries emitted by the SDK.
  static const String logName = 'Atom SDK';

  /// Name of the JavaScript channel used to report errors from the WebView.
  static const String errorChannelName = 'AtomErrorChannel';

  /// User Agent For SDK
  static const String userAgent = 'ntt_atom_flutter/v2';
}
