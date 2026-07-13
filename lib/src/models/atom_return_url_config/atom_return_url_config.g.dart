// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atom_return_url_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AtomReturnUrlConfig _$AtomReturnUrlConfigFromJson(Map<String, dynamic> json) =>
    _AtomReturnUrlConfig(
      returnUrl: json['returnUrl'] as String? ?? AtomConstants.defaultReturnUrl,
      mode:
          $enumDecodeNullable(_$AtomCallbackModeEnumMap, json['mode']) ??
          AtomCallbackMode.forwardEncrypted,
    );

Map<String, dynamic> _$AtomReturnUrlConfigToJson(
  _AtomReturnUrlConfig instance,
) => <String, dynamic>{
  'returnUrl': instance.returnUrl,
  'mode': _$AtomCallbackModeEnumMap[instance.mode]!,
};

const _$AtomCallbackModeEnumMap = {
  AtomCallbackMode.sendToServer: 'sendToServer',
  AtomCallbackMode.forwardEncrypted: 'forwardEncrypted',
  AtomCallbackMode.forwardUnencrypted: 'forwardUnencrypted',
};
