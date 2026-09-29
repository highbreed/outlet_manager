// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_sale_otp_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailySaleOtpResult {

 String get message; int get expiresInMinutes;
/// Create a copy of DailySaleOtpResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailySaleOtpResultCopyWith<DailySaleOtpResult> get copyWith => _$DailySaleOtpResultCopyWithImpl<DailySaleOtpResult>(this as DailySaleOtpResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailySaleOtpResult&&(identical(other.message, message) || other.message == message)&&(identical(other.expiresInMinutes, expiresInMinutes) || other.expiresInMinutes == expiresInMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,message,expiresInMinutes);

@override
String toString() {
  return 'DailySaleOtpResult(message: $message, expiresInMinutes: $expiresInMinutes)';
}


}

/// @nodoc
abstract mixin class $DailySaleOtpResultCopyWith<$Res>  {
  factory $DailySaleOtpResultCopyWith(DailySaleOtpResult value, $Res Function(DailySaleOtpResult) _then) = _$DailySaleOtpResultCopyWithImpl;
@useResult
$Res call({
 String message, int expiresInMinutes
});




}
/// @nodoc
class _$DailySaleOtpResultCopyWithImpl<$Res>
    implements $DailySaleOtpResultCopyWith<$Res> {
  _$DailySaleOtpResultCopyWithImpl(this._self, this._then);

  final DailySaleOtpResult _self;
  final $Res Function(DailySaleOtpResult) _then;

/// Create a copy of DailySaleOtpResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? expiresInMinutes = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,expiresInMinutes: null == expiresInMinutes ? _self.expiresInMinutes : expiresInMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailySaleOtpResult].
extension DailySaleOtpResultPatterns on DailySaleOtpResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailySaleOtpResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailySaleOtpResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailySaleOtpResult value)  $default,){
final _that = this;
switch (_that) {
case _DailySaleOtpResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailySaleOtpResult value)?  $default,){
final _that = this;
switch (_that) {
case _DailySaleOtpResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  int expiresInMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailySaleOtpResult() when $default != null:
return $default(_that.message,_that.expiresInMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  int expiresInMinutes)  $default,) {final _that = this;
switch (_that) {
case _DailySaleOtpResult():
return $default(_that.message,_that.expiresInMinutes);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  int expiresInMinutes)?  $default,) {final _that = this;
switch (_that) {
case _DailySaleOtpResult() when $default != null:
return $default(_that.message,_that.expiresInMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _DailySaleOtpResult implements DailySaleOtpResult {
  const _DailySaleOtpResult({required this.message, required this.expiresInMinutes});
  

@override final  String message;
@override final  int expiresInMinutes;

/// Create a copy of DailySaleOtpResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailySaleOtpResultCopyWith<_DailySaleOtpResult> get copyWith => __$DailySaleOtpResultCopyWithImpl<_DailySaleOtpResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailySaleOtpResult&&(identical(other.message, message) || other.message == message)&&(identical(other.expiresInMinutes, expiresInMinutes) || other.expiresInMinutes == expiresInMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,message,expiresInMinutes);

@override
String toString() {
  return 'DailySaleOtpResult(message: $message, expiresInMinutes: $expiresInMinutes)';
}


}

/// @nodoc
abstract mixin class _$DailySaleOtpResultCopyWith<$Res> implements $DailySaleOtpResultCopyWith<$Res> {
  factory _$DailySaleOtpResultCopyWith(_DailySaleOtpResult value, $Res Function(_DailySaleOtpResult) _then) = __$DailySaleOtpResultCopyWithImpl;
@override @useResult
$Res call({
 String message, int expiresInMinutes
});




}
/// @nodoc
class __$DailySaleOtpResultCopyWithImpl<$Res>
    implements _$DailySaleOtpResultCopyWith<$Res> {
  __$DailySaleOtpResultCopyWithImpl(this._self, this._then);

  final _DailySaleOtpResult _self;
  final $Res Function(_DailySaleOtpResult) _then;

/// Create a copy of DailySaleOtpResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? expiresInMinutes = null,}) {
  return _then(_DailySaleOtpResult(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,expiresInMinutes: null == expiresInMinutes ? _self.expiresInMinutes : expiresInMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
