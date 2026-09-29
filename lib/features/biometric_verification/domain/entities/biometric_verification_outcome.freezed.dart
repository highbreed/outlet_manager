// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_verification_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BiometricVerificationOutcome {

 bool get verified; String? get verificationId;// Single use, bound to this employee/CLOCK_IN/device — must reach
// clock-in within this window (contract: 120s).
 DateTime? get verificationExpiresAt; BiometricErrorReason? get errorReason; Failure? get rawFailure;
/// Create a copy of BiometricVerificationOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiometricVerificationOutcomeCopyWith<BiometricVerificationOutcome> get copyWith => _$BiometricVerificationOutcomeCopyWithImpl<BiometricVerificationOutcome>(this as BiometricVerificationOutcome, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricVerificationOutcome&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.verificationExpiresAt, verificationExpiresAt) || other.verificationExpiresAt == verificationExpiresAt)&&(identical(other.errorReason, errorReason) || other.errorReason == errorReason)&&(identical(other.rawFailure, rawFailure) || other.rawFailure == rawFailure));
}


@override
int get hashCode => Object.hash(runtimeType,verified,verificationId,verificationExpiresAt,errorReason,rawFailure);

@override
String toString() {
  return 'BiometricVerificationOutcome(verified: $verified, verificationId: $verificationId, verificationExpiresAt: $verificationExpiresAt, errorReason: $errorReason, rawFailure: $rawFailure)';
}


}

/// @nodoc
abstract mixin class $BiometricVerificationOutcomeCopyWith<$Res>  {
  factory $BiometricVerificationOutcomeCopyWith(BiometricVerificationOutcome value, $Res Function(BiometricVerificationOutcome) _then) = _$BiometricVerificationOutcomeCopyWithImpl;
@useResult
$Res call({
 bool verified, String? verificationId, DateTime? verificationExpiresAt, BiometricErrorReason? errorReason, Failure? rawFailure
});




}
/// @nodoc
class _$BiometricVerificationOutcomeCopyWithImpl<$Res>
    implements $BiometricVerificationOutcomeCopyWith<$Res> {
  _$BiometricVerificationOutcomeCopyWithImpl(this._self, this._then);

  final BiometricVerificationOutcome _self;
  final $Res Function(BiometricVerificationOutcome) _then;

/// Create a copy of BiometricVerificationOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verified = null,Object? verificationId = freezed,Object? verificationExpiresAt = freezed,Object? errorReason = freezed,Object? rawFailure = freezed,}) {
  return _then(_self.copyWith(
verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,verificationExpiresAt: freezed == verificationExpiresAt ? _self.verificationExpiresAt : verificationExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,errorReason: freezed == errorReason ? _self.errorReason : errorReason // ignore: cast_nullable_to_non_nullable
as BiometricErrorReason?,rawFailure: freezed == rawFailure ? _self.rawFailure : rawFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [BiometricVerificationOutcome].
extension BiometricVerificationOutcomePatterns on BiometricVerificationOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiometricVerificationOutcome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiometricVerificationOutcome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiometricVerificationOutcome value)  $default,){
final _that = this;
switch (_that) {
case _BiometricVerificationOutcome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiometricVerificationOutcome value)?  $default,){
final _that = this;
switch (_that) {
case _BiometricVerificationOutcome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool verified,  String? verificationId,  DateTime? verificationExpiresAt,  BiometricErrorReason? errorReason,  Failure? rawFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiometricVerificationOutcome() when $default != null:
return $default(_that.verified,_that.verificationId,_that.verificationExpiresAt,_that.errorReason,_that.rawFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool verified,  String? verificationId,  DateTime? verificationExpiresAt,  BiometricErrorReason? errorReason,  Failure? rawFailure)  $default,) {final _that = this;
switch (_that) {
case _BiometricVerificationOutcome():
return $default(_that.verified,_that.verificationId,_that.verificationExpiresAt,_that.errorReason,_that.rawFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool verified,  String? verificationId,  DateTime? verificationExpiresAt,  BiometricErrorReason? errorReason,  Failure? rawFailure)?  $default,) {final _that = this;
switch (_that) {
case _BiometricVerificationOutcome() when $default != null:
return $default(_that.verified,_that.verificationId,_that.verificationExpiresAt,_that.errorReason,_that.rawFailure);case _:
  return null;

}
}

}

/// @nodoc


class _BiometricVerificationOutcome implements BiometricVerificationOutcome {
  const _BiometricVerificationOutcome({required this.verified, this.verificationId, this.verificationExpiresAt, this.errorReason, this.rawFailure});
  

@override final  bool verified;
@override final  String? verificationId;
// Single use, bound to this employee/CLOCK_IN/device — must reach
// clock-in within this window (contract: 120s).
@override final  DateTime? verificationExpiresAt;
@override final  BiometricErrorReason? errorReason;
@override final  Failure? rawFailure;

/// Create a copy of BiometricVerificationOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiometricVerificationOutcomeCopyWith<_BiometricVerificationOutcome> get copyWith => __$BiometricVerificationOutcomeCopyWithImpl<_BiometricVerificationOutcome>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiometricVerificationOutcome&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.verificationExpiresAt, verificationExpiresAt) || other.verificationExpiresAt == verificationExpiresAt)&&(identical(other.errorReason, errorReason) || other.errorReason == errorReason)&&(identical(other.rawFailure, rawFailure) || other.rawFailure == rawFailure));
}


@override
int get hashCode => Object.hash(runtimeType,verified,verificationId,verificationExpiresAt,errorReason,rawFailure);

@override
String toString() {
  return 'BiometricVerificationOutcome(verified: $verified, verificationId: $verificationId, verificationExpiresAt: $verificationExpiresAt, errorReason: $errorReason, rawFailure: $rawFailure)';
}


}

/// @nodoc
abstract mixin class _$BiometricVerificationOutcomeCopyWith<$Res> implements $BiometricVerificationOutcomeCopyWith<$Res> {
  factory _$BiometricVerificationOutcomeCopyWith(_BiometricVerificationOutcome value, $Res Function(_BiometricVerificationOutcome) _then) = __$BiometricVerificationOutcomeCopyWithImpl;
@override @useResult
$Res call({
 bool verified, String? verificationId, DateTime? verificationExpiresAt, BiometricErrorReason? errorReason, Failure? rawFailure
});




}
/// @nodoc
class __$BiometricVerificationOutcomeCopyWithImpl<$Res>
    implements _$BiometricVerificationOutcomeCopyWith<$Res> {
  __$BiometricVerificationOutcomeCopyWithImpl(this._self, this._then);

  final _BiometricVerificationOutcome _self;
  final $Res Function(_BiometricVerificationOutcome) _then;

/// Create a copy of BiometricVerificationOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verified = null,Object? verificationId = freezed,Object? verificationExpiresAt = freezed,Object? errorReason = freezed,Object? rawFailure = freezed,}) {
  return _then(_BiometricVerificationOutcome(
verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,verificationExpiresAt: freezed == verificationExpiresAt ? _self.verificationExpiresAt : verificationExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,errorReason: freezed == errorReason ? _self.errorReason : errorReason // ignore: cast_nullable_to_non_nullable
as BiometricErrorReason?,rawFailure: freezed == rawFailure ? _self.rawFailure : rawFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
