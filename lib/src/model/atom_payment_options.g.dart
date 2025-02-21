// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atom_payment_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AtomPaymentOptionsImpl _$$AtomPaymentOptionsImplFromJson(
  Map<String, dynamic> json,
) => _$AtomPaymentOptionsImpl(
  login: json['login'] as String,
  password: json['password'] as String,
  prodid: json['prodid'] as String,
  amount: json['amount'] as String,
  clientcode: json['clientcode'] as String,
  txncurr: json['txncurr'] as String,
  txnid: json['txnid'] as String,
  mccCode: json['mccCode'] as String,
  merchType: json['merchType'] as String,
  requestHashKey: json['requestHashKey'] as String,
  responseHashKey: json['responseHashKey'] as String,
  requestEncryptionKey: json['requestencryptionKey'] as String,
  responseDecryptionKey: json['responseencypritonKey'] as String,
  returnUrl: json['returnUrl'] as String? ?? AtomConstants.defaultUrl,
  mode: $enumDecode(_$AtomPaymentModeEnumMap, json['mode']),
  custFirstName: json['custFirstName'] as String?,
  custLastName: json['custLastName'] as String?,
  mobile: json['mobile'] as String?,
  email: json['email'] as String?,
  address: json['address'] as String?,
  custacc: json['custacc'] as String?,
  udf1: json['udf1'] as String?,
  udf2: json['udf2'] as String?,
  udf3: json['udf3'] as String?,
  udf4: json['udf4'] as String?,
  udf5: json['udf5'] as String?,
);

Map<String, dynamic> _$$AtomPaymentOptionsImplToJson(
  _$AtomPaymentOptionsImpl instance,
) => <String, dynamic>{
  'login': instance.login,
  'password': instance.password,
  'prodid': instance.prodid,
  'amount': instance.amount,
  'clientcode': instance.clientcode,
  'txncurr': instance.txncurr,
  'txnid': instance.txnid,
  'mccCode': instance.mccCode,
  'merchType': instance.merchType,
  'requestHashKey': instance.requestHashKey,
  'responseHashKey': instance.responseHashKey,
  'requestencryptionKey': instance.requestEncryptionKey,
  'responseencypritonKey': instance.responseDecryptionKey,
  'returnUrl': instance.returnUrl,
  'mode': _$AtomPaymentModeEnumMap[instance.mode]!,
  'custFirstName': instance.custFirstName,
  'custLastName': instance.custLastName,
  'mobile': instance.mobile,
  'email': instance.email,
  'address': instance.address,
  'custacc': instance.custacc,
  'udf1': instance.udf1,
  'udf2': instance.udf2,
  'udf3': instance.udf3,
  'udf4': instance.udf4,
  'udf5': instance.udf5,
};

const _$AtomPaymentModeEnumMap = {
  AtomPaymentMode.uat: 'uat',
  AtomPaymentMode.live: 'live',
};
