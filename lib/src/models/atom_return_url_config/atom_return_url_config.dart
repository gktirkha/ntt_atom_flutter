import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/atom_constants.dart';
import '../../constants/enums/atom_callback_mode.dart';

part 'atom_return_url_config.freezed.dart';
part 'atom_return_url_config.g.dart';

@freezed
sealed class AtomReturnUrlConfig with _$AtomReturnUrlConfig {
  const factory AtomReturnUrlConfig({
    @Default(AtomConstants.defaultReturnUrl) String returnUrl,
    @Default(AtomCallbackMode.forwardEncrypted) AtomCallbackMode mode,
  }) = _AtomReturnUrlConfig;

  factory AtomReturnUrlConfig.fromJson(Map<String, dynamic> json) =>
      _$AtomReturnUrlConfigFromJson(json);
}
