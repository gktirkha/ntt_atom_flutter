// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atom_payment_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AtomPaymentOptions _$AtomPaymentOptionsFromJson(Map<String, dynamic> json) {
  return _AtomPaymentOptions.fromJson(json);
}

/// @nodoc
mixin _$AtomPaymentOptions {
  @JsonKey(name: 'login')
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'prodid')
  String get prodid => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientcode')
  String get clientcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'txncurr')
  String get txncurr => throw _privateConstructorUsedError;
  @JsonKey(name: 'txnid')
  String get txnid => throw _privateConstructorUsedError;
  @JsonKey(name: 'mccCode')
  String get mccCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'merchType')
  String get merchType => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestHashKey')
  String get requestHashKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'responseHashKey')
  String get responseHashKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestencryptionKey')
  String get requestEncryptionKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'responseencypritonKey')
  String get responseDecryptionKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnUrl')
  String get returnUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'mode')
  AtomPaymentMode get mode => throw _privateConstructorUsedError;
  @JsonKey(name: 'custFirstName')
  String? get custFirstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'custLastName')
  String? get custLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile')
  String? get mobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'custacc')
  String? get custacc => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf1')
  String? get udf1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf2')
  String? get udf2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf3')
  String? get udf3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf4')
  String? get udf4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf5')
  String? get udf5 => throw _privateConstructorUsedError;

  /// Serializes this AtomPaymentOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AtomPaymentOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AtomPaymentOptionsCopyWith<AtomPaymentOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtomPaymentOptionsCopyWith<$Res> {
  factory $AtomPaymentOptionsCopyWith(
    AtomPaymentOptions value,
    $Res Function(AtomPaymentOptions) then,
  ) = _$AtomPaymentOptionsCopyWithImpl<$Res, AtomPaymentOptions>;
  @useResult
  $Res call({
    @JsonKey(name: 'login') String login,
    @JsonKey(name: 'password') String password,
    @JsonKey(name: 'prodid') String prodid,
    @JsonKey(name: 'amount') String amount,
    @JsonKey(name: 'clientcode') String clientcode,
    @JsonKey(name: 'txncurr') String txncurr,
    @JsonKey(name: 'txnid') String txnid,
    @JsonKey(name: 'mccCode') String mccCode,
    @JsonKey(name: 'merchType') String merchType,
    @JsonKey(name: 'requestHashKey') String requestHashKey,
    @JsonKey(name: 'responseHashKey') String responseHashKey,
    @JsonKey(name: 'requestencryptionKey') String requestEncryptionKey,
    @JsonKey(name: 'responseencypritonKey') String responseDecryptionKey,
    @JsonKey(name: 'returnUrl') String returnUrl,
    @JsonKey(name: 'mode') AtomPaymentMode mode,
    @JsonKey(name: 'custFirstName') String? custFirstName,
    @JsonKey(name: 'custLastName') String? custLastName,
    @JsonKey(name: 'mobile') String? mobile,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'custacc') String? custacc,
    @JsonKey(name: 'udf1') String? udf1,
    @JsonKey(name: 'udf2') String? udf2,
    @JsonKey(name: 'udf3') String? udf3,
    @JsonKey(name: 'udf4') String? udf4,
    @JsonKey(name: 'udf5') String? udf5,
  });
}

/// @nodoc
class _$AtomPaymentOptionsCopyWithImpl<$Res, $Val extends AtomPaymentOptions>
    implements $AtomPaymentOptionsCopyWith<$Res> {
  _$AtomPaymentOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AtomPaymentOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
    Object? prodid = null,
    Object? amount = null,
    Object? clientcode = null,
    Object? txncurr = null,
    Object? txnid = null,
    Object? mccCode = null,
    Object? merchType = null,
    Object? requestHashKey = null,
    Object? responseHashKey = null,
    Object? requestEncryptionKey = null,
    Object? responseDecryptionKey = null,
    Object? returnUrl = null,
    Object? mode = null,
    Object? custFirstName = freezed,
    Object? custLastName = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? custacc = freezed,
    Object? udf1 = freezed,
    Object? udf2 = freezed,
    Object? udf3 = freezed,
    Object? udf4 = freezed,
    Object? udf5 = freezed,
  }) {
    return _then(
      _value.copyWith(
            login:
                null == login
                    ? _value.login
                    : login // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
            prodid:
                null == prodid
                    ? _value.prodid
                    : prodid // ignore: cast_nullable_to_non_nullable
                        as String,
            amount:
                null == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as String,
            clientcode:
                null == clientcode
                    ? _value.clientcode
                    : clientcode // ignore: cast_nullable_to_non_nullable
                        as String,
            txncurr:
                null == txncurr
                    ? _value.txncurr
                    : txncurr // ignore: cast_nullable_to_non_nullable
                        as String,
            txnid:
                null == txnid
                    ? _value.txnid
                    : txnid // ignore: cast_nullable_to_non_nullable
                        as String,
            mccCode:
                null == mccCode
                    ? _value.mccCode
                    : mccCode // ignore: cast_nullable_to_non_nullable
                        as String,
            merchType:
                null == merchType
                    ? _value.merchType
                    : merchType // ignore: cast_nullable_to_non_nullable
                        as String,
            requestHashKey:
                null == requestHashKey
                    ? _value.requestHashKey
                    : requestHashKey // ignore: cast_nullable_to_non_nullable
                        as String,
            responseHashKey:
                null == responseHashKey
                    ? _value.responseHashKey
                    : responseHashKey // ignore: cast_nullable_to_non_nullable
                        as String,
            requestEncryptionKey:
                null == requestEncryptionKey
                    ? _value.requestEncryptionKey
                    : requestEncryptionKey // ignore: cast_nullable_to_non_nullable
                        as String,
            responseDecryptionKey:
                null == responseDecryptionKey
                    ? _value.responseDecryptionKey
                    : responseDecryptionKey // ignore: cast_nullable_to_non_nullable
                        as String,
            returnUrl:
                null == returnUrl
                    ? _value.returnUrl
                    : returnUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            mode:
                null == mode
                    ? _value.mode
                    : mode // ignore: cast_nullable_to_non_nullable
                        as AtomPaymentMode,
            custFirstName:
                freezed == custFirstName
                    ? _value.custFirstName
                    : custFirstName // ignore: cast_nullable_to_non_nullable
                        as String?,
            custLastName:
                freezed == custLastName
                    ? _value.custLastName
                    : custLastName // ignore: cast_nullable_to_non_nullable
                        as String?,
            mobile:
                freezed == mobile
                    ? _value.mobile
                    : mobile // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            address:
                freezed == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String?,
            custacc:
                freezed == custacc
                    ? _value.custacc
                    : custacc // ignore: cast_nullable_to_non_nullable
                        as String?,
            udf1:
                freezed == udf1
                    ? _value.udf1
                    : udf1 // ignore: cast_nullable_to_non_nullable
                        as String?,
            udf2:
                freezed == udf2
                    ? _value.udf2
                    : udf2 // ignore: cast_nullable_to_non_nullable
                        as String?,
            udf3:
                freezed == udf3
                    ? _value.udf3
                    : udf3 // ignore: cast_nullable_to_non_nullable
                        as String?,
            udf4:
                freezed == udf4
                    ? _value.udf4
                    : udf4 // ignore: cast_nullable_to_non_nullable
                        as String?,
            udf5:
                freezed == udf5
                    ? _value.udf5
                    : udf5 // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AtomPaymentOptionsImplCopyWith<$Res>
    implements $AtomPaymentOptionsCopyWith<$Res> {
  factory _$$AtomPaymentOptionsImplCopyWith(
    _$AtomPaymentOptionsImpl value,
    $Res Function(_$AtomPaymentOptionsImpl) then,
  ) = __$$AtomPaymentOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'login') String login,
    @JsonKey(name: 'password') String password,
    @JsonKey(name: 'prodid') String prodid,
    @JsonKey(name: 'amount') String amount,
    @JsonKey(name: 'clientcode') String clientcode,
    @JsonKey(name: 'txncurr') String txncurr,
    @JsonKey(name: 'txnid') String txnid,
    @JsonKey(name: 'mccCode') String mccCode,
    @JsonKey(name: 'merchType') String merchType,
    @JsonKey(name: 'requestHashKey') String requestHashKey,
    @JsonKey(name: 'responseHashKey') String responseHashKey,
    @JsonKey(name: 'requestencryptionKey') String requestEncryptionKey,
    @JsonKey(name: 'responseencypritonKey') String responseDecryptionKey,
    @JsonKey(name: 'returnUrl') String returnUrl,
    @JsonKey(name: 'mode') AtomPaymentMode mode,
    @JsonKey(name: 'custFirstName') String? custFirstName,
    @JsonKey(name: 'custLastName') String? custLastName,
    @JsonKey(name: 'mobile') String? mobile,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'custacc') String? custacc,
    @JsonKey(name: 'udf1') String? udf1,
    @JsonKey(name: 'udf2') String? udf2,
    @JsonKey(name: 'udf3') String? udf3,
    @JsonKey(name: 'udf4') String? udf4,
    @JsonKey(name: 'udf5') String? udf5,
  });
}

/// @nodoc
class __$$AtomPaymentOptionsImplCopyWithImpl<$Res>
    extends _$AtomPaymentOptionsCopyWithImpl<$Res, _$AtomPaymentOptionsImpl>
    implements _$$AtomPaymentOptionsImplCopyWith<$Res> {
  __$$AtomPaymentOptionsImplCopyWithImpl(
    _$AtomPaymentOptionsImpl _value,
    $Res Function(_$AtomPaymentOptionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AtomPaymentOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
    Object? prodid = null,
    Object? amount = null,
    Object? clientcode = null,
    Object? txncurr = null,
    Object? txnid = null,
    Object? mccCode = null,
    Object? merchType = null,
    Object? requestHashKey = null,
    Object? responseHashKey = null,
    Object? requestEncryptionKey = null,
    Object? responseDecryptionKey = null,
    Object? returnUrl = null,
    Object? mode = null,
    Object? custFirstName = freezed,
    Object? custLastName = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? custacc = freezed,
    Object? udf1 = freezed,
    Object? udf2 = freezed,
    Object? udf3 = freezed,
    Object? udf4 = freezed,
    Object? udf5 = freezed,
  }) {
    return _then(
      _$AtomPaymentOptionsImpl(
        login:
            null == login
                ? _value.login
                : login // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
        prodid:
            null == prodid
                ? _value.prodid
                : prodid // ignore: cast_nullable_to_non_nullable
                    as String,
        amount:
            null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as String,
        clientcode:
            null == clientcode
                ? _value.clientcode
                : clientcode // ignore: cast_nullable_to_non_nullable
                    as String,
        txncurr:
            null == txncurr
                ? _value.txncurr
                : txncurr // ignore: cast_nullable_to_non_nullable
                    as String,
        txnid:
            null == txnid
                ? _value.txnid
                : txnid // ignore: cast_nullable_to_non_nullable
                    as String,
        mccCode:
            null == mccCode
                ? _value.mccCode
                : mccCode // ignore: cast_nullable_to_non_nullable
                    as String,
        merchType:
            null == merchType
                ? _value.merchType
                : merchType // ignore: cast_nullable_to_non_nullable
                    as String,
        requestHashKey:
            null == requestHashKey
                ? _value.requestHashKey
                : requestHashKey // ignore: cast_nullable_to_non_nullable
                    as String,
        responseHashKey:
            null == responseHashKey
                ? _value.responseHashKey
                : responseHashKey // ignore: cast_nullable_to_non_nullable
                    as String,
        requestEncryptionKey:
            null == requestEncryptionKey
                ? _value.requestEncryptionKey
                : requestEncryptionKey // ignore: cast_nullable_to_non_nullable
                    as String,
        responseDecryptionKey:
            null == responseDecryptionKey
                ? _value.responseDecryptionKey
                : responseDecryptionKey // ignore: cast_nullable_to_non_nullable
                    as String,
        returnUrl:
            null == returnUrl
                ? _value.returnUrl
                : returnUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        mode:
            null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                    as AtomPaymentMode,
        custFirstName:
            freezed == custFirstName
                ? _value.custFirstName
                : custFirstName // ignore: cast_nullable_to_non_nullable
                    as String?,
        custLastName:
            freezed == custLastName
                ? _value.custLastName
                : custLastName // ignore: cast_nullable_to_non_nullable
                    as String?,
        mobile:
            freezed == mobile
                ? _value.mobile
                : mobile // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String?,
        custacc:
            freezed == custacc
                ? _value.custacc
                : custacc // ignore: cast_nullable_to_non_nullable
                    as String?,
        udf1:
            freezed == udf1
                ? _value.udf1
                : udf1 // ignore: cast_nullable_to_non_nullable
                    as String?,
        udf2:
            freezed == udf2
                ? _value.udf2
                : udf2 // ignore: cast_nullable_to_non_nullable
                    as String?,
        udf3:
            freezed == udf3
                ? _value.udf3
                : udf3 // ignore: cast_nullable_to_non_nullable
                    as String?,
        udf4:
            freezed == udf4
                ? _value.udf4
                : udf4 // ignore: cast_nullable_to_non_nullable
                    as String?,
        udf5:
            freezed == udf5
                ? _value.udf5
                : udf5 // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AtomPaymentOptionsImpl implements _AtomPaymentOptions {
  const _$AtomPaymentOptionsImpl({
    @JsonKey(name: 'login') required this.login,
    @JsonKey(name: 'password') required this.password,
    @JsonKey(name: 'prodid') required this.prodid,
    @JsonKey(name: 'amount') required this.amount,
    @JsonKey(name: 'clientcode') required this.clientcode,
    @JsonKey(name: 'txncurr') required this.txncurr,
    @JsonKey(name: 'txnid') required this.txnid,
    @JsonKey(name: 'mccCode') required this.mccCode,
    @JsonKey(name: 'merchType') required this.merchType,
    @JsonKey(name: 'requestHashKey') required this.requestHashKey,
    @JsonKey(name: 'responseHashKey') required this.responseHashKey,
    @JsonKey(name: 'requestencryptionKey') required this.requestEncryptionKey,
    @JsonKey(name: 'responseencypritonKey') required this.responseDecryptionKey,
    @JsonKey(name: 'returnUrl') this.returnUrl = AtomConstants.defaultUrl,
    @JsonKey(name: 'mode') required this.mode,
    @JsonKey(name: 'custFirstName') this.custFirstName,
    @JsonKey(name: 'custLastName') this.custLastName,
    @JsonKey(name: 'mobile') this.mobile,
    @JsonKey(name: 'email') this.email,
    @JsonKey(name: 'address') this.address,
    @JsonKey(name: 'custacc') this.custacc,
    @JsonKey(name: 'udf1') this.udf1,
    @JsonKey(name: 'udf2') this.udf2,
    @JsonKey(name: 'udf3') this.udf3,
    @JsonKey(name: 'udf4') this.udf4,
    @JsonKey(name: 'udf5') this.udf5,
  });

  factory _$AtomPaymentOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AtomPaymentOptionsImplFromJson(json);

  @override
  @JsonKey(name: 'login')
  final String login;
  @override
  @JsonKey(name: 'password')
  final String password;
  @override
  @JsonKey(name: 'prodid')
  final String prodid;
  @override
  @JsonKey(name: 'amount')
  final String amount;
  @override
  @JsonKey(name: 'clientcode')
  final String clientcode;
  @override
  @JsonKey(name: 'txncurr')
  final String txncurr;
  @override
  @JsonKey(name: 'txnid')
  final String txnid;
  @override
  @JsonKey(name: 'mccCode')
  final String mccCode;
  @override
  @JsonKey(name: 'merchType')
  final String merchType;
  @override
  @JsonKey(name: 'requestHashKey')
  final String requestHashKey;
  @override
  @JsonKey(name: 'responseHashKey')
  final String responseHashKey;
  @override
  @JsonKey(name: 'requestencryptionKey')
  final String requestEncryptionKey;
  @override
  @JsonKey(name: 'responseencypritonKey')
  final String responseDecryptionKey;
  @override
  @JsonKey(name: 'returnUrl')
  final String returnUrl;
  @override
  @JsonKey(name: 'mode')
  final AtomPaymentMode mode;
  @override
  @JsonKey(name: 'custFirstName')
  final String? custFirstName;
  @override
  @JsonKey(name: 'custLastName')
  final String? custLastName;
  @override
  @JsonKey(name: 'mobile')
  final String? mobile;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'custacc')
  final String? custacc;
  @override
  @JsonKey(name: 'udf1')
  final String? udf1;
  @override
  @JsonKey(name: 'udf2')
  final String? udf2;
  @override
  @JsonKey(name: 'udf3')
  final String? udf3;
  @override
  @JsonKey(name: 'udf4')
  final String? udf4;
  @override
  @JsonKey(name: 'udf5')
  final String? udf5;

  @override
  String toString() {
    return 'AtomPaymentOptions(login: $login, password: $password, prodid: $prodid, amount: $amount, clientcode: $clientcode, txncurr: $txncurr, txnid: $txnid, mccCode: $mccCode, merchType: $merchType, requestHashKey: $requestHashKey, responseHashKey: $responseHashKey, requestEncryptionKey: $requestEncryptionKey, responseDecryptionKey: $responseDecryptionKey, returnUrl: $returnUrl, mode: $mode, custFirstName: $custFirstName, custLastName: $custLastName, mobile: $mobile, email: $email, address: $address, custacc: $custacc, udf1: $udf1, udf2: $udf2, udf3: $udf3, udf4: $udf4, udf5: $udf5)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AtomPaymentOptionsImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.prodid, prodid) || other.prodid == prodid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.clientcode, clientcode) ||
                other.clientcode == clientcode) &&
            (identical(other.txncurr, txncurr) || other.txncurr == txncurr) &&
            (identical(other.txnid, txnid) || other.txnid == txnid) &&
            (identical(other.mccCode, mccCode) || other.mccCode == mccCode) &&
            (identical(other.merchType, merchType) ||
                other.merchType == merchType) &&
            (identical(other.requestHashKey, requestHashKey) ||
                other.requestHashKey == requestHashKey) &&
            (identical(other.responseHashKey, responseHashKey) ||
                other.responseHashKey == responseHashKey) &&
            (identical(other.requestEncryptionKey, requestEncryptionKey) ||
                other.requestEncryptionKey == requestEncryptionKey) &&
            (identical(other.responseDecryptionKey, responseDecryptionKey) ||
                other.responseDecryptionKey == responseDecryptionKey) &&
            (identical(other.returnUrl, returnUrl) ||
                other.returnUrl == returnUrl) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.custFirstName, custFirstName) ||
                other.custFirstName == custFirstName) &&
            (identical(other.custLastName, custLastName) ||
                other.custLastName == custLastName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.custacc, custacc) || other.custacc == custacc) &&
            (identical(other.udf1, udf1) || other.udf1 == udf1) &&
            (identical(other.udf2, udf2) || other.udf2 == udf2) &&
            (identical(other.udf3, udf3) || other.udf3 == udf3) &&
            (identical(other.udf4, udf4) || other.udf4 == udf4) &&
            (identical(other.udf5, udf5) || other.udf5 == udf5));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    login,
    password,
    prodid,
    amount,
    clientcode,
    txncurr,
    txnid,
    mccCode,
    merchType,
    requestHashKey,
    responseHashKey,
    requestEncryptionKey,
    responseDecryptionKey,
    returnUrl,
    mode,
    custFirstName,
    custLastName,
    mobile,
    email,
    address,
    custacc,
    udf1,
    udf2,
    udf3,
    udf4,
    udf5,
  ]);

  /// Create a copy of AtomPaymentOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AtomPaymentOptionsImplCopyWith<_$AtomPaymentOptionsImpl> get copyWith =>
      __$$AtomPaymentOptionsImplCopyWithImpl<_$AtomPaymentOptionsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AtomPaymentOptionsImplToJson(this);
  }
}

abstract class _AtomPaymentOptions implements AtomPaymentOptions {
  const factory _AtomPaymentOptions({
    @JsonKey(name: 'login') required final String login,
    @JsonKey(name: 'password') required final String password,
    @JsonKey(name: 'prodid') required final String prodid,
    @JsonKey(name: 'amount') required final String amount,
    @JsonKey(name: 'clientcode') required final String clientcode,
    @JsonKey(name: 'txncurr') required final String txncurr,
    @JsonKey(name: 'txnid') required final String txnid,
    @JsonKey(name: 'mccCode') required final String mccCode,
    @JsonKey(name: 'merchType') required final String merchType,
    @JsonKey(name: 'requestHashKey') required final String requestHashKey,
    @JsonKey(name: 'responseHashKey') required final String responseHashKey,
    @JsonKey(name: 'requestencryptionKey')
    required final String requestEncryptionKey,
    @JsonKey(name: 'responseencypritonKey')
    required final String responseDecryptionKey,
    @JsonKey(name: 'returnUrl') final String returnUrl,
    @JsonKey(name: 'mode') required final AtomPaymentMode mode,
    @JsonKey(name: 'custFirstName') final String? custFirstName,
    @JsonKey(name: 'custLastName') final String? custLastName,
    @JsonKey(name: 'mobile') final String? mobile,
    @JsonKey(name: 'email') final String? email,
    @JsonKey(name: 'address') final String? address,
    @JsonKey(name: 'custacc') final String? custacc,
    @JsonKey(name: 'udf1') final String? udf1,
    @JsonKey(name: 'udf2') final String? udf2,
    @JsonKey(name: 'udf3') final String? udf3,
    @JsonKey(name: 'udf4') final String? udf4,
    @JsonKey(name: 'udf5') final String? udf5,
  }) = _$AtomPaymentOptionsImpl;

  factory _AtomPaymentOptions.fromJson(Map<String, dynamic> json) =
      _$AtomPaymentOptionsImpl.fromJson;

  @override
  @JsonKey(name: 'login')
  String get login;
  @override
  @JsonKey(name: 'password')
  String get password;
  @override
  @JsonKey(name: 'prodid')
  String get prodid;
  @override
  @JsonKey(name: 'amount')
  String get amount;
  @override
  @JsonKey(name: 'clientcode')
  String get clientcode;
  @override
  @JsonKey(name: 'txncurr')
  String get txncurr;
  @override
  @JsonKey(name: 'txnid')
  String get txnid;
  @override
  @JsonKey(name: 'mccCode')
  String get mccCode;
  @override
  @JsonKey(name: 'merchType')
  String get merchType;
  @override
  @JsonKey(name: 'requestHashKey')
  String get requestHashKey;
  @override
  @JsonKey(name: 'responseHashKey')
  String get responseHashKey;
  @override
  @JsonKey(name: 'requestencryptionKey')
  String get requestEncryptionKey;
  @override
  @JsonKey(name: 'responseencypritonKey')
  String get responseDecryptionKey;
  @override
  @JsonKey(name: 'returnUrl')
  String get returnUrl;
  @override
  @JsonKey(name: 'mode')
  AtomPaymentMode get mode;
  @override
  @JsonKey(name: 'custFirstName')
  String? get custFirstName;
  @override
  @JsonKey(name: 'custLastName')
  String? get custLastName;
  @override
  @JsonKey(name: 'mobile')
  String? get mobile;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'custacc')
  String? get custacc;
  @override
  @JsonKey(name: 'udf1')
  String? get udf1;
  @override
  @JsonKey(name: 'udf2')
  String? get udf2;
  @override
  @JsonKey(name: 'udf3')
  String? get udf3;
  @override
  @JsonKey(name: 'udf4')
  String? get udf4;
  @override
  @JsonKey(name: 'udf5')
  String? get udf5;

  /// Create a copy of AtomPaymentOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AtomPaymentOptionsImplCopyWith<_$AtomPaymentOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
