// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atom_return_url_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AtomReturnUrlConfig _$AtomReturnUrlConfigFromJson(Map<String, dynamic> json) =>
    _AtomReturnUrlConfig(
      returnUrl: json['returnUrl'] as String? ?? AtomConstants.defaultReturnUrl,
      mode: $enumDecode(_$AtomReturnUrlModeEnumMap, json['mode']),
    );

Map<String, dynamic> _$AtomReturnUrlConfigToJson(
  _AtomReturnUrlConfig instance,
) => <String, dynamic>{
  'returnUrl': instance.returnUrl,
  'mode': _$AtomReturnUrlModeEnumMap[instance.mode]!,
};

const _$AtomReturnUrlModeEnumMap = {
  AtomReturnUrlMode.sendToServer: 'sendToServer',
  AtomReturnUrlMode.forwardEncrypted: 'forwardEncrypted',
  AtomReturnUrlMode.forwardUnencrypted: 'forwardUnencrypted',
};
