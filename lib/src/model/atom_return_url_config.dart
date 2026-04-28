library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'atom_constants.dart';

part 'atom_return_url_config.freezed.dart';
part 'atom_return_url_config.g.dart';

/// How the SDK should handle a custom return URL.
enum AtomReturnUrlMode {
  /// Browser navigates to the custom URL directly.
  /// The app will not receive a parsed transaction status.
  sendToServer,

  /// SDK captures the response at the default URL, then POSTs the raw
  /// encrypted payload (plain text) to [AtomReturnUrlConfig.returnUrl].
  /// The app still receives a parsed transaction status.
  forwardEncrypted,

  /// SDK captures the response at the default URL, decrypts it, then POSTs
  /// the decrypted JSON to [AtomReturnUrlConfig.returnUrl].
  /// The app still receives a parsed transaction status.
  forwardUnencrypted,
}

/// Configuration for handling a custom return URL after payment processing.
@freezed
sealed class AtomReturnUrlConfig with _$AtomReturnUrlConfig {
  const factory AtomReturnUrlConfig({
    /// The URL to which the SDK will send or forward the transaction response.
    /// Defaults to [AtomConstants.defaultReturnUrl].
    @Default(AtomConstants.defaultReturnUrl) String returnUrl,

    /// Determines how the response is handled.
    required AtomReturnUrlMode mode,
  }) = _AtomReturnUrlConfig;

  factory AtomReturnUrlConfig.fromJson(Map<String, dynamic> json) =>
      _$AtomReturnUrlConfigFromJson(json);
}
