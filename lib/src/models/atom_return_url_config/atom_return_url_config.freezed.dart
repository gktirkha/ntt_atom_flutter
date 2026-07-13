// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atom_return_url_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AtomReturnUrlConfig {

 String get returnUrl; AtomCallbackMode get mode;
/// Create a copy of AtomReturnUrlConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AtomReturnUrlConfigCopyWith<AtomReturnUrlConfig> get copyWith => _$AtomReturnUrlConfigCopyWithImpl<AtomReturnUrlConfig>(this as AtomReturnUrlConfig, _$identity);

  /// Serializes this AtomReturnUrlConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AtomReturnUrlConfig&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,returnUrl,mode);

@override
String toString() {
  return 'AtomReturnUrlConfig(returnUrl: $returnUrl, mode: $mode)';
}


}

/// @nodoc
abstract mixin class $AtomReturnUrlConfigCopyWith<$Res>  {
  factory $AtomReturnUrlConfigCopyWith(AtomReturnUrlConfig value, $Res Function(AtomReturnUrlConfig) _then) = _$AtomReturnUrlConfigCopyWithImpl;
@useResult
$Res call({
 String returnUrl, AtomCallbackMode mode
});




}
/// @nodoc
class _$AtomReturnUrlConfigCopyWithImpl<$Res>
    implements $AtomReturnUrlConfigCopyWith<$Res> {
  _$AtomReturnUrlConfigCopyWithImpl(this._self, this._then);

  final AtomReturnUrlConfig _self;
  final $Res Function(AtomReturnUrlConfig) _then;

/// Create a copy of AtomReturnUrlConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? returnUrl = null,Object? mode = null,}) {
  return _then(_self.copyWith(
returnUrl: null == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AtomCallbackMode,
  ));
}

}


/// Adds pattern-matching-related methods to [AtomReturnUrlConfig].
extension AtomReturnUrlConfigPatterns on AtomReturnUrlConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AtomReturnUrlConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AtomReturnUrlConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AtomReturnUrlConfig value)  $default,){
final _that = this;
switch (_that) {
case _AtomReturnUrlConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AtomReturnUrlConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AtomReturnUrlConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String returnUrl,  AtomCallbackMode mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AtomReturnUrlConfig() when $default != null:
return $default(_that.returnUrl,_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String returnUrl,  AtomCallbackMode mode)  $default,) {final _that = this;
switch (_that) {
case _AtomReturnUrlConfig():
return $default(_that.returnUrl,_that.mode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String returnUrl,  AtomCallbackMode mode)?  $default,) {final _that = this;
switch (_that) {
case _AtomReturnUrlConfig() when $default != null:
return $default(_that.returnUrl,_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AtomReturnUrlConfig implements AtomReturnUrlConfig {
  const _AtomReturnUrlConfig({this.returnUrl = AtomConstants.defaultReturnUrl, this.mode = AtomCallbackMode.forwardEncrypted});
  factory _AtomReturnUrlConfig.fromJson(Map<String, dynamic> json) => _$AtomReturnUrlConfigFromJson(json);

@override@JsonKey() final  String returnUrl;
@override@JsonKey() final  AtomCallbackMode mode;

/// Create a copy of AtomReturnUrlConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AtomReturnUrlConfigCopyWith<_AtomReturnUrlConfig> get copyWith => __$AtomReturnUrlConfigCopyWithImpl<_AtomReturnUrlConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AtomReturnUrlConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AtomReturnUrlConfig&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,returnUrl,mode);

@override
String toString() {
  return 'AtomReturnUrlConfig(returnUrl: $returnUrl, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$AtomReturnUrlConfigCopyWith<$Res> implements $AtomReturnUrlConfigCopyWith<$Res> {
  factory _$AtomReturnUrlConfigCopyWith(_AtomReturnUrlConfig value, $Res Function(_AtomReturnUrlConfig) _then) = __$AtomReturnUrlConfigCopyWithImpl;
@override @useResult
$Res call({
 String returnUrl, AtomCallbackMode mode
});




}
/// @nodoc
class __$AtomReturnUrlConfigCopyWithImpl<$Res>
    implements _$AtomReturnUrlConfigCopyWith<$Res> {
  __$AtomReturnUrlConfigCopyWithImpl(this._self, this._then);

  final _AtomReturnUrlConfig _self;
  final $Res Function(_AtomReturnUrlConfig) _then;

/// Create a copy of AtomReturnUrlConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? returnUrl = null,Object? mode = null,}) {
  return _then(_AtomReturnUrlConfig(
returnUrl: null == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AtomCallbackMode,
  ));
}


}

// dart format on
