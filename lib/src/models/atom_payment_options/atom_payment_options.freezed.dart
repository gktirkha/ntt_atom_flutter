// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atom_payment_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AtomPaymentOptions {

@JsonKey(name: 'login') String get login;@JsonKey(name: 'password') String get password;@JsonKey(name: 'prodid') String get prodid;@JsonKey(name: 'amount') String get amount;@JsonKey(name: 'clientcode') String get clientcode;@JsonKey(name: 'txncurr') String get txncurr;@JsonKey(name: 'txnid') String get txnid;@JsonKey(name: 'mccCode') String get mccCode;@JsonKey(name: 'merchType') String get merchType;@JsonKey(name: 'requestHashKey') String get requestHashKey;@JsonKey(name: 'responseHashKey') String get responseHashKey;@JsonKey(name: 'requestencryptionKey') String get requestEncryptionKey;@JsonKey(name: 'responseencypritonKey') String get responseDecryptionKey;@JsonKey(name: 'returnUrlConfig') AtomReturnUrlConfig? get returnUrlConfig;@JsonKey(name: 'mode') AtomEnv get mode;@JsonKey(name: 'custFirstName') String? get custFirstName;@JsonKey(name: 'custLastName') String? get custLastName;@JsonKey(name: 'mobile') String? get mobile;@JsonKey(name: 'email') String? get email;@JsonKey(name: 'address') String? get address;@JsonKey(name: 'custacc') String? get custacc;@JsonKey(name: 'udf1') String? get udf1;@JsonKey(name: 'udf2') String? get udf2;@JsonKey(name: 'udf3') String? get udf3;@JsonKey(name: 'udf4') String? get udf4;@JsonKey(name: 'udf5') String? get udf5;
/// Create a copy of AtomPaymentOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AtomPaymentOptionsCopyWith<AtomPaymentOptions> get copyWith => _$AtomPaymentOptionsCopyWithImpl<AtomPaymentOptions>(this as AtomPaymentOptions, _$identity);

  /// Serializes this AtomPaymentOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AtomPaymentOptions&&(identical(other.login, login) || other.login == login)&&(identical(other.password, password) || other.password == password)&&(identical(other.prodid, prodid) || other.prodid == prodid)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.clientcode, clientcode) || other.clientcode == clientcode)&&(identical(other.txncurr, txncurr) || other.txncurr == txncurr)&&(identical(other.txnid, txnid) || other.txnid == txnid)&&(identical(other.mccCode, mccCode) || other.mccCode == mccCode)&&(identical(other.merchType, merchType) || other.merchType == merchType)&&(identical(other.requestHashKey, requestHashKey) || other.requestHashKey == requestHashKey)&&(identical(other.responseHashKey, responseHashKey) || other.responseHashKey == responseHashKey)&&(identical(other.requestEncryptionKey, requestEncryptionKey) || other.requestEncryptionKey == requestEncryptionKey)&&(identical(other.responseDecryptionKey, responseDecryptionKey) || other.responseDecryptionKey == responseDecryptionKey)&&(identical(other.returnUrlConfig, returnUrlConfig) || other.returnUrlConfig == returnUrlConfig)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.custFirstName, custFirstName) || other.custFirstName == custFirstName)&&(identical(other.custLastName, custLastName) || other.custLastName == custLastName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.custacc, custacc) || other.custacc == custacc)&&(identical(other.udf1, udf1) || other.udf1 == udf1)&&(identical(other.udf2, udf2) || other.udf2 == udf2)&&(identical(other.udf3, udf3) || other.udf3 == udf3)&&(identical(other.udf4, udf4) || other.udf4 == udf4)&&(identical(other.udf5, udf5) || other.udf5 == udf5));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,login,password,prodid,amount,clientcode,txncurr,txnid,mccCode,merchType,requestHashKey,responseHashKey,requestEncryptionKey,responseDecryptionKey,returnUrlConfig,mode,custFirstName,custLastName,mobile,email,address,custacc,udf1,udf2,udf3,udf4,udf5]);

@override
String toString() {
  return 'AtomPaymentOptions(login: $login, password: $password, prodid: $prodid, amount: $amount, clientcode: $clientcode, txncurr: $txncurr, txnid: $txnid, mccCode: $mccCode, merchType: $merchType, requestHashKey: $requestHashKey, responseHashKey: $responseHashKey, requestEncryptionKey: $requestEncryptionKey, responseDecryptionKey: $responseDecryptionKey, returnUrlConfig: $returnUrlConfig, mode: $mode, custFirstName: $custFirstName, custLastName: $custLastName, mobile: $mobile, email: $email, address: $address, custacc: $custacc, udf1: $udf1, udf2: $udf2, udf3: $udf3, udf4: $udf4, udf5: $udf5)';
}


}

/// @nodoc
abstract mixin class $AtomPaymentOptionsCopyWith<$Res>  {
  factory $AtomPaymentOptionsCopyWith(AtomPaymentOptions value, $Res Function(AtomPaymentOptions) _then) = _$AtomPaymentOptionsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'login') String login,@JsonKey(name: 'password') String password,@JsonKey(name: 'prodid') String prodid,@JsonKey(name: 'amount') String amount,@JsonKey(name: 'clientcode') String clientcode,@JsonKey(name: 'txncurr') String txncurr,@JsonKey(name: 'txnid') String txnid,@JsonKey(name: 'mccCode') String mccCode,@JsonKey(name: 'merchType') String merchType,@JsonKey(name: 'requestHashKey') String requestHashKey,@JsonKey(name: 'responseHashKey') String responseHashKey,@JsonKey(name: 'requestencryptionKey') String requestEncryptionKey,@JsonKey(name: 'responseencypritonKey') String responseDecryptionKey,@JsonKey(name: 'returnUrlConfig') AtomReturnUrlConfig? returnUrlConfig,@JsonKey(name: 'mode') AtomEnv mode,@JsonKey(name: 'custFirstName') String? custFirstName,@JsonKey(name: 'custLastName') String? custLastName,@JsonKey(name: 'mobile') String? mobile,@JsonKey(name: 'email') String? email,@JsonKey(name: 'address') String? address,@JsonKey(name: 'custacc') String? custacc,@JsonKey(name: 'udf1') String? udf1,@JsonKey(name: 'udf2') String? udf2,@JsonKey(name: 'udf3') String? udf3,@JsonKey(name: 'udf4') String? udf4,@JsonKey(name: 'udf5') String? udf5
});


$AtomReturnUrlConfigCopyWith<$Res>? get returnUrlConfig;

}
/// @nodoc
class _$AtomPaymentOptionsCopyWithImpl<$Res>
    implements $AtomPaymentOptionsCopyWith<$Res> {
  _$AtomPaymentOptionsCopyWithImpl(this._self, this._then);

  final AtomPaymentOptions _self;
  final $Res Function(AtomPaymentOptions) _then;

/// Create a copy of AtomPaymentOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? login = null,Object? password = null,Object? prodid = null,Object? amount = null,Object? clientcode = null,Object? txncurr = null,Object? txnid = null,Object? mccCode = null,Object? merchType = null,Object? requestHashKey = null,Object? responseHashKey = null,Object? requestEncryptionKey = null,Object? responseDecryptionKey = null,Object? returnUrlConfig = freezed,Object? mode = null,Object? custFirstName = freezed,Object? custLastName = freezed,Object? mobile = freezed,Object? email = freezed,Object? address = freezed,Object? custacc = freezed,Object? udf1 = freezed,Object? udf2 = freezed,Object? udf3 = freezed,Object? udf4 = freezed,Object? udf5 = freezed,}) {
  return _then(_self.copyWith(
login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,prodid: null == prodid ? _self.prodid : prodid // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,clientcode: null == clientcode ? _self.clientcode : clientcode // ignore: cast_nullable_to_non_nullable
as String,txncurr: null == txncurr ? _self.txncurr : txncurr // ignore: cast_nullable_to_non_nullable
as String,txnid: null == txnid ? _self.txnid : txnid // ignore: cast_nullable_to_non_nullable
as String,mccCode: null == mccCode ? _self.mccCode : mccCode // ignore: cast_nullable_to_non_nullable
as String,merchType: null == merchType ? _self.merchType : merchType // ignore: cast_nullable_to_non_nullable
as String,requestHashKey: null == requestHashKey ? _self.requestHashKey : requestHashKey // ignore: cast_nullable_to_non_nullable
as String,responseHashKey: null == responseHashKey ? _self.responseHashKey : responseHashKey // ignore: cast_nullable_to_non_nullable
as String,requestEncryptionKey: null == requestEncryptionKey ? _self.requestEncryptionKey : requestEncryptionKey // ignore: cast_nullable_to_non_nullable
as String,responseDecryptionKey: null == responseDecryptionKey ? _self.responseDecryptionKey : responseDecryptionKey // ignore: cast_nullable_to_non_nullable
as String,returnUrlConfig: freezed == returnUrlConfig ? _self.returnUrlConfig : returnUrlConfig // ignore: cast_nullable_to_non_nullable
as AtomReturnUrlConfig?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AtomEnv,custFirstName: freezed == custFirstName ? _self.custFirstName : custFirstName // ignore: cast_nullable_to_non_nullable
as String?,custLastName: freezed == custLastName ? _self.custLastName : custLastName // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,custacc: freezed == custacc ? _self.custacc : custacc // ignore: cast_nullable_to_non_nullable
as String?,udf1: freezed == udf1 ? _self.udf1 : udf1 // ignore: cast_nullable_to_non_nullable
as String?,udf2: freezed == udf2 ? _self.udf2 : udf2 // ignore: cast_nullable_to_non_nullable
as String?,udf3: freezed == udf3 ? _self.udf3 : udf3 // ignore: cast_nullable_to_non_nullable
as String?,udf4: freezed == udf4 ? _self.udf4 : udf4 // ignore: cast_nullable_to_non_nullable
as String?,udf5: freezed == udf5 ? _self.udf5 : udf5 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AtomPaymentOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AtomReturnUrlConfigCopyWith<$Res>? get returnUrlConfig {
    if (_self.returnUrlConfig == null) {
    return null;
  }

  return $AtomReturnUrlConfigCopyWith<$Res>(_self.returnUrlConfig!, (value) {
    return _then(_self.copyWith(returnUrlConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [AtomPaymentOptions].
extension AtomPaymentOptionsPatterns on AtomPaymentOptions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AtomPaymentOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AtomPaymentOptions() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AtomPaymentOptions value)  $default,){
final _that = this;
switch (_that) {
case _AtomPaymentOptions():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AtomPaymentOptions value)?  $default,){
final _that = this;
switch (_that) {
case _AtomPaymentOptions() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'login')  String login, @JsonKey(name: 'password')  String password, @JsonKey(name: 'prodid')  String prodid, @JsonKey(name: 'amount')  String amount, @JsonKey(name: 'clientcode')  String clientcode, @JsonKey(name: 'txncurr')  String txncurr, @JsonKey(name: 'txnid')  String txnid, @JsonKey(name: 'mccCode')  String mccCode, @JsonKey(name: 'merchType')  String merchType, @JsonKey(name: 'requestHashKey')  String requestHashKey, @JsonKey(name: 'responseHashKey')  String responseHashKey, @JsonKey(name: 'requestencryptionKey')  String requestEncryptionKey, @JsonKey(name: 'responseencypritonKey')  String responseDecryptionKey, @JsonKey(name: 'returnUrlConfig')  AtomReturnUrlConfig? returnUrlConfig, @JsonKey(name: 'mode')  AtomEnv mode, @JsonKey(name: 'custFirstName')  String? custFirstName, @JsonKey(name: 'custLastName')  String? custLastName, @JsonKey(name: 'mobile')  String? mobile, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'custacc')  String? custacc, @JsonKey(name: 'udf1')  String? udf1, @JsonKey(name: 'udf2')  String? udf2, @JsonKey(name: 'udf3')  String? udf3, @JsonKey(name: 'udf4')  String? udf4, @JsonKey(name: 'udf5')  String? udf5)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AtomPaymentOptions() when $default != null:
return $default(_that.login,_that.password,_that.prodid,_that.amount,_that.clientcode,_that.txncurr,_that.txnid,_that.mccCode,_that.merchType,_that.requestHashKey,_that.responseHashKey,_that.requestEncryptionKey,_that.responseDecryptionKey,_that.returnUrlConfig,_that.mode,_that.custFirstName,_that.custLastName,_that.mobile,_that.email,_that.address,_that.custacc,_that.udf1,_that.udf2,_that.udf3,_that.udf4,_that.udf5);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'login')  String login, @JsonKey(name: 'password')  String password, @JsonKey(name: 'prodid')  String prodid, @JsonKey(name: 'amount')  String amount, @JsonKey(name: 'clientcode')  String clientcode, @JsonKey(name: 'txncurr')  String txncurr, @JsonKey(name: 'txnid')  String txnid, @JsonKey(name: 'mccCode')  String mccCode, @JsonKey(name: 'merchType')  String merchType, @JsonKey(name: 'requestHashKey')  String requestHashKey, @JsonKey(name: 'responseHashKey')  String responseHashKey, @JsonKey(name: 'requestencryptionKey')  String requestEncryptionKey, @JsonKey(name: 'responseencypritonKey')  String responseDecryptionKey, @JsonKey(name: 'returnUrlConfig')  AtomReturnUrlConfig? returnUrlConfig, @JsonKey(name: 'mode')  AtomEnv mode, @JsonKey(name: 'custFirstName')  String? custFirstName, @JsonKey(name: 'custLastName')  String? custLastName, @JsonKey(name: 'mobile')  String? mobile, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'custacc')  String? custacc, @JsonKey(name: 'udf1')  String? udf1, @JsonKey(name: 'udf2')  String? udf2, @JsonKey(name: 'udf3')  String? udf3, @JsonKey(name: 'udf4')  String? udf4, @JsonKey(name: 'udf5')  String? udf5)  $default,) {final _that = this;
switch (_that) {
case _AtomPaymentOptions():
return $default(_that.login,_that.password,_that.prodid,_that.amount,_that.clientcode,_that.txncurr,_that.txnid,_that.mccCode,_that.merchType,_that.requestHashKey,_that.responseHashKey,_that.requestEncryptionKey,_that.responseDecryptionKey,_that.returnUrlConfig,_that.mode,_that.custFirstName,_that.custLastName,_that.mobile,_that.email,_that.address,_that.custacc,_that.udf1,_that.udf2,_that.udf3,_that.udf4,_that.udf5);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'login')  String login, @JsonKey(name: 'password')  String password, @JsonKey(name: 'prodid')  String prodid, @JsonKey(name: 'amount')  String amount, @JsonKey(name: 'clientcode')  String clientcode, @JsonKey(name: 'txncurr')  String txncurr, @JsonKey(name: 'txnid')  String txnid, @JsonKey(name: 'mccCode')  String mccCode, @JsonKey(name: 'merchType')  String merchType, @JsonKey(name: 'requestHashKey')  String requestHashKey, @JsonKey(name: 'responseHashKey')  String responseHashKey, @JsonKey(name: 'requestencryptionKey')  String requestEncryptionKey, @JsonKey(name: 'responseencypritonKey')  String responseDecryptionKey, @JsonKey(name: 'returnUrlConfig')  AtomReturnUrlConfig? returnUrlConfig, @JsonKey(name: 'mode')  AtomEnv mode, @JsonKey(name: 'custFirstName')  String? custFirstName, @JsonKey(name: 'custLastName')  String? custLastName, @JsonKey(name: 'mobile')  String? mobile, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'address')  String? address, @JsonKey(name: 'custacc')  String? custacc, @JsonKey(name: 'udf1')  String? udf1, @JsonKey(name: 'udf2')  String? udf2, @JsonKey(name: 'udf3')  String? udf3, @JsonKey(name: 'udf4')  String? udf4, @JsonKey(name: 'udf5')  String? udf5)?  $default,) {final _that = this;
switch (_that) {
case _AtomPaymentOptions() when $default != null:
return $default(_that.login,_that.password,_that.prodid,_that.amount,_that.clientcode,_that.txncurr,_that.txnid,_that.mccCode,_that.merchType,_that.requestHashKey,_that.responseHashKey,_that.requestEncryptionKey,_that.responseDecryptionKey,_that.returnUrlConfig,_that.mode,_that.custFirstName,_that.custLastName,_that.mobile,_that.email,_that.address,_that.custacc,_that.udf1,_that.udf2,_that.udf3,_that.udf4,_that.udf5);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AtomPaymentOptions implements AtomPaymentOptions {
  const _AtomPaymentOptions({@JsonKey(name: 'login') required this.login, @JsonKey(name: 'password') required this.password, @JsonKey(name: 'prodid') required this.prodid, @JsonKey(name: 'amount') required this.amount, @JsonKey(name: 'clientcode') required this.clientcode, @JsonKey(name: 'txncurr') required this.txncurr, @JsonKey(name: 'txnid') required this.txnid, @JsonKey(name: 'mccCode') required this.mccCode, @JsonKey(name: 'merchType') required this.merchType, @JsonKey(name: 'requestHashKey') required this.requestHashKey, @JsonKey(name: 'responseHashKey') required this.responseHashKey, @JsonKey(name: 'requestencryptionKey') required this.requestEncryptionKey, @JsonKey(name: 'responseencypritonKey') required this.responseDecryptionKey, @JsonKey(name: 'returnUrlConfig') this.returnUrlConfig, @JsonKey(name: 'mode') required this.mode, @JsonKey(name: 'custFirstName') this.custFirstName, @JsonKey(name: 'custLastName') this.custLastName, @JsonKey(name: 'mobile') this.mobile, @JsonKey(name: 'email') this.email, @JsonKey(name: 'address') this.address, @JsonKey(name: 'custacc') this.custacc, @JsonKey(name: 'udf1') this.udf1, @JsonKey(name: 'udf2') this.udf2, @JsonKey(name: 'udf3') this.udf3, @JsonKey(name: 'udf4') this.udf4, @JsonKey(name: 'udf5') this.udf5});
  factory _AtomPaymentOptions.fromJson(Map<String, dynamic> json) => _$AtomPaymentOptionsFromJson(json);

@override@JsonKey(name: 'login') final  String login;
@override@JsonKey(name: 'password') final  String password;
@override@JsonKey(name: 'prodid') final  String prodid;
@override@JsonKey(name: 'amount') final  String amount;
@override@JsonKey(name: 'clientcode') final  String clientcode;
@override@JsonKey(name: 'txncurr') final  String txncurr;
@override@JsonKey(name: 'txnid') final  String txnid;
@override@JsonKey(name: 'mccCode') final  String mccCode;
@override@JsonKey(name: 'merchType') final  String merchType;
@override@JsonKey(name: 'requestHashKey') final  String requestHashKey;
@override@JsonKey(name: 'responseHashKey') final  String responseHashKey;
@override@JsonKey(name: 'requestencryptionKey') final  String requestEncryptionKey;
@override@JsonKey(name: 'responseencypritonKey') final  String responseDecryptionKey;
@override@JsonKey(name: 'returnUrlConfig') final  AtomReturnUrlConfig? returnUrlConfig;
@override@JsonKey(name: 'mode') final  AtomEnv mode;
@override@JsonKey(name: 'custFirstName') final  String? custFirstName;
@override@JsonKey(name: 'custLastName') final  String? custLastName;
@override@JsonKey(name: 'mobile') final  String? mobile;
@override@JsonKey(name: 'email') final  String? email;
@override@JsonKey(name: 'address') final  String? address;
@override@JsonKey(name: 'custacc') final  String? custacc;
@override@JsonKey(name: 'udf1') final  String? udf1;
@override@JsonKey(name: 'udf2') final  String? udf2;
@override@JsonKey(name: 'udf3') final  String? udf3;
@override@JsonKey(name: 'udf4') final  String? udf4;
@override@JsonKey(name: 'udf5') final  String? udf5;

/// Create a copy of AtomPaymentOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AtomPaymentOptionsCopyWith<_AtomPaymentOptions> get copyWith => __$AtomPaymentOptionsCopyWithImpl<_AtomPaymentOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AtomPaymentOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AtomPaymentOptions&&(identical(other.login, login) || other.login == login)&&(identical(other.password, password) || other.password == password)&&(identical(other.prodid, prodid) || other.prodid == prodid)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.clientcode, clientcode) || other.clientcode == clientcode)&&(identical(other.txncurr, txncurr) || other.txncurr == txncurr)&&(identical(other.txnid, txnid) || other.txnid == txnid)&&(identical(other.mccCode, mccCode) || other.mccCode == mccCode)&&(identical(other.merchType, merchType) || other.merchType == merchType)&&(identical(other.requestHashKey, requestHashKey) || other.requestHashKey == requestHashKey)&&(identical(other.responseHashKey, responseHashKey) || other.responseHashKey == responseHashKey)&&(identical(other.requestEncryptionKey, requestEncryptionKey) || other.requestEncryptionKey == requestEncryptionKey)&&(identical(other.responseDecryptionKey, responseDecryptionKey) || other.responseDecryptionKey == responseDecryptionKey)&&(identical(other.returnUrlConfig, returnUrlConfig) || other.returnUrlConfig == returnUrlConfig)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.custFirstName, custFirstName) || other.custFirstName == custFirstName)&&(identical(other.custLastName, custLastName) || other.custLastName == custLastName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.custacc, custacc) || other.custacc == custacc)&&(identical(other.udf1, udf1) || other.udf1 == udf1)&&(identical(other.udf2, udf2) || other.udf2 == udf2)&&(identical(other.udf3, udf3) || other.udf3 == udf3)&&(identical(other.udf4, udf4) || other.udf4 == udf4)&&(identical(other.udf5, udf5) || other.udf5 == udf5));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,login,password,prodid,amount,clientcode,txncurr,txnid,mccCode,merchType,requestHashKey,responseHashKey,requestEncryptionKey,responseDecryptionKey,returnUrlConfig,mode,custFirstName,custLastName,mobile,email,address,custacc,udf1,udf2,udf3,udf4,udf5]);

@override
String toString() {
  return 'AtomPaymentOptions(login: $login, password: $password, prodid: $prodid, amount: $amount, clientcode: $clientcode, txncurr: $txncurr, txnid: $txnid, mccCode: $mccCode, merchType: $merchType, requestHashKey: $requestHashKey, responseHashKey: $responseHashKey, requestEncryptionKey: $requestEncryptionKey, responseDecryptionKey: $responseDecryptionKey, returnUrlConfig: $returnUrlConfig, mode: $mode, custFirstName: $custFirstName, custLastName: $custLastName, mobile: $mobile, email: $email, address: $address, custacc: $custacc, udf1: $udf1, udf2: $udf2, udf3: $udf3, udf4: $udf4, udf5: $udf5)';
}


}

/// @nodoc
abstract mixin class _$AtomPaymentOptionsCopyWith<$Res> implements $AtomPaymentOptionsCopyWith<$Res> {
  factory _$AtomPaymentOptionsCopyWith(_AtomPaymentOptions value, $Res Function(_AtomPaymentOptions) _then) = __$AtomPaymentOptionsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'login') String login,@JsonKey(name: 'password') String password,@JsonKey(name: 'prodid') String prodid,@JsonKey(name: 'amount') String amount,@JsonKey(name: 'clientcode') String clientcode,@JsonKey(name: 'txncurr') String txncurr,@JsonKey(name: 'txnid') String txnid,@JsonKey(name: 'mccCode') String mccCode,@JsonKey(name: 'merchType') String merchType,@JsonKey(name: 'requestHashKey') String requestHashKey,@JsonKey(name: 'responseHashKey') String responseHashKey,@JsonKey(name: 'requestencryptionKey') String requestEncryptionKey,@JsonKey(name: 'responseencypritonKey') String responseDecryptionKey,@JsonKey(name: 'returnUrlConfig') AtomReturnUrlConfig? returnUrlConfig,@JsonKey(name: 'mode') AtomEnv mode,@JsonKey(name: 'custFirstName') String? custFirstName,@JsonKey(name: 'custLastName') String? custLastName,@JsonKey(name: 'mobile') String? mobile,@JsonKey(name: 'email') String? email,@JsonKey(name: 'address') String? address,@JsonKey(name: 'custacc') String? custacc,@JsonKey(name: 'udf1') String? udf1,@JsonKey(name: 'udf2') String? udf2,@JsonKey(name: 'udf3') String? udf3,@JsonKey(name: 'udf4') String? udf4,@JsonKey(name: 'udf5') String? udf5
});


@override $AtomReturnUrlConfigCopyWith<$Res>? get returnUrlConfig;

}
/// @nodoc
class __$AtomPaymentOptionsCopyWithImpl<$Res>
    implements _$AtomPaymentOptionsCopyWith<$Res> {
  __$AtomPaymentOptionsCopyWithImpl(this._self, this._then);

  final _AtomPaymentOptions _self;
  final $Res Function(_AtomPaymentOptions) _then;

/// Create a copy of AtomPaymentOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? login = null,Object? password = null,Object? prodid = null,Object? amount = null,Object? clientcode = null,Object? txncurr = null,Object? txnid = null,Object? mccCode = null,Object? merchType = null,Object? requestHashKey = null,Object? responseHashKey = null,Object? requestEncryptionKey = null,Object? responseDecryptionKey = null,Object? returnUrlConfig = freezed,Object? mode = null,Object? custFirstName = freezed,Object? custLastName = freezed,Object? mobile = freezed,Object? email = freezed,Object? address = freezed,Object? custacc = freezed,Object? udf1 = freezed,Object? udf2 = freezed,Object? udf3 = freezed,Object? udf4 = freezed,Object? udf5 = freezed,}) {
  return _then(_AtomPaymentOptions(
login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,prodid: null == prodid ? _self.prodid : prodid // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,clientcode: null == clientcode ? _self.clientcode : clientcode // ignore: cast_nullable_to_non_nullable
as String,txncurr: null == txncurr ? _self.txncurr : txncurr // ignore: cast_nullable_to_non_nullable
as String,txnid: null == txnid ? _self.txnid : txnid // ignore: cast_nullable_to_non_nullable
as String,mccCode: null == mccCode ? _self.mccCode : mccCode // ignore: cast_nullable_to_non_nullable
as String,merchType: null == merchType ? _self.merchType : merchType // ignore: cast_nullable_to_non_nullable
as String,requestHashKey: null == requestHashKey ? _self.requestHashKey : requestHashKey // ignore: cast_nullable_to_non_nullable
as String,responseHashKey: null == responseHashKey ? _self.responseHashKey : responseHashKey // ignore: cast_nullable_to_non_nullable
as String,requestEncryptionKey: null == requestEncryptionKey ? _self.requestEncryptionKey : requestEncryptionKey // ignore: cast_nullable_to_non_nullable
as String,responseDecryptionKey: null == responseDecryptionKey ? _self.responseDecryptionKey : responseDecryptionKey // ignore: cast_nullable_to_non_nullable
as String,returnUrlConfig: freezed == returnUrlConfig ? _self.returnUrlConfig : returnUrlConfig // ignore: cast_nullable_to_non_nullable
as AtomReturnUrlConfig?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AtomEnv,custFirstName: freezed == custFirstName ? _self.custFirstName : custFirstName // ignore: cast_nullable_to_non_nullable
as String?,custLastName: freezed == custLastName ? _self.custLastName : custLastName // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,custacc: freezed == custacc ? _self.custacc : custacc // ignore: cast_nullable_to_non_nullable
as String?,udf1: freezed == udf1 ? _self.udf1 : udf1 // ignore: cast_nullable_to_non_nullable
as String?,udf2: freezed == udf2 ? _self.udf2 : udf2 // ignore: cast_nullable_to_non_nullable
as String?,udf3: freezed == udf3 ? _self.udf3 : udf3 // ignore: cast_nullable_to_non_nullable
as String?,udf4: freezed == udf4 ? _self.udf4 : udf4 // ignore: cast_nullable_to_non_nullable
as String?,udf5: freezed == udf5 ? _self.udf5 : udf5 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AtomPaymentOptions
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AtomReturnUrlConfigCopyWith<$Res>? get returnUrlConfig {
    if (_self.returnUrlConfig == null) {
    return null;
  }

  return $AtomReturnUrlConfigCopyWith<$Res>(_self.returnUrlConfig!, (value) {
    return _then(_self.copyWith(returnUrlConfig: value));
  });
}
}

// dart format on
