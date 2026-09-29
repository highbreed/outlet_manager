// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BiometricStatus {

 BiometricEnrollmentStatus get status; bool get canEnroll; bool get requiresEnrollment; bool get clockInVerificationRequired; bool? get modelCompatible; DateTime? get enrolledAt; DateTime? get lastVerifiedAt;
/// Create a copy of BiometricStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiometricStatusCopyWith<BiometricStatus> get copyWith => _$BiometricStatusCopyWithImpl<BiometricStatus>(this as BiometricStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricStatus&&(identical(other.status, status) || other.status == status)&&(identical(other.canEnroll, canEnroll) || other.canEnroll == canEnroll)&&(identical(other.requiresEnrollment, requiresEnrollment) || other.requiresEnrollment == requiresEnrollment)&&(identical(other.clockInVerificationRequired, clockInVerificationRequired) || other.clockInVerificationRequired == clockInVerificationRequired)&&(identical(other.modelCompatible, modelCompatible) || other.modelCompatible == modelCompatible)&&(identical(other.enrolledAt, enrolledAt) || other.enrolledAt == enrolledAt)&&(identical(other.lastVerifiedAt, lastVerifiedAt) || other.lastVerifiedAt == lastVerifiedAt));
}


@override
int get hashCode => Object.hash(runtimeType,status,canEnroll,requiresEnrollment,clockInVerificationRequired,modelCompatible,enrolledAt,lastVerifiedAt);

@override
String toString() {
  return 'BiometricStatus(status: $status, canEnroll: $canEnroll, requiresEnrollment: $requiresEnrollment, clockInVerificationRequired: $clockInVerificationRequired, modelCompatible: $modelCompatible, enrolledAt: $enrolledAt, lastVerifiedAt: $lastVerifiedAt)';
}


}

/// @nodoc
abstract mixin class $BiometricStatusCopyWith<$Res>  {
  factory $BiometricStatusCopyWith(BiometricStatus value, $Res Function(BiometricStatus) _then) = _$BiometricStatusCopyWithImpl;
@useResult
$Res call({
 BiometricEnrollmentStatus status, bool canEnroll, bool requiresEnrollment, bool clockInVerificationRequired, bool? modelCompatible, DateTime? enrolledAt, DateTime? lastVerifiedAt
});




}
/// @nodoc
class _$BiometricStatusCopyWithImpl<$Res>
    implements $BiometricStatusCopyWith<$Res> {
  _$BiometricStatusCopyWithImpl(this._self, this._then);

  final BiometricStatus _self;
  final $Res Function(BiometricStatus) _then;

/// Create a copy of BiometricStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? canEnroll = null,Object? requiresEnrollment = null,Object? clockInVerificationRequired = null,Object? modelCompatible = freezed,Object? enrolledAt = freezed,Object? lastVerifiedAt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BiometricEnrollmentStatus,canEnroll: null == canEnroll ? _self.canEnroll : canEnroll // ignore: cast_nullable_to_non_nullable
as bool,requiresEnrollment: null == requiresEnrollment ? _self.requiresEnrollment : requiresEnrollment // ignore: cast_nullable_to_non_nullable
as bool,clockInVerificationRequired: null == clockInVerificationRequired ? _self.clockInVerificationRequired : clockInVerificationRequired // ignore: cast_nullable_to_non_nullable
as bool,modelCompatible: freezed == modelCompatible ? _self.modelCompatible : modelCompatible // ignore: cast_nullable_to_non_nullable
as bool?,enrolledAt: freezed == enrolledAt ? _self.enrolledAt : enrolledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastVerifiedAt: freezed == lastVerifiedAt ? _self.lastVerifiedAt : lastVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BiometricStatus].
extension BiometricStatusPatterns on BiometricStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiometricStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiometricStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiometricStatus value)  $default,){
final _that = this;
switch (_that) {
case _BiometricStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiometricStatus value)?  $default,){
final _that = this;
switch (_that) {
case _BiometricStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BiometricEnrollmentStatus status,  bool canEnroll,  bool requiresEnrollment,  bool clockInVerificationRequired,  bool? modelCompatible,  DateTime? enrolledAt,  DateTime? lastVerifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiometricStatus() when $default != null:
return $default(_that.status,_that.canEnroll,_that.requiresEnrollment,_that.clockInVerificationRequired,_that.modelCompatible,_that.enrolledAt,_that.lastVerifiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BiometricEnrollmentStatus status,  bool canEnroll,  bool requiresEnrollment,  bool clockInVerificationRequired,  bool? modelCompatible,  DateTime? enrolledAt,  DateTime? lastVerifiedAt)  $default,) {final _that = this;
switch (_that) {
case _BiometricStatus():
return $default(_that.status,_that.canEnroll,_that.requiresEnrollment,_that.clockInVerificationRequired,_that.modelCompatible,_that.enrolledAt,_that.lastVerifiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BiometricEnrollmentStatus status,  bool canEnroll,  bool requiresEnrollment,  bool clockInVerificationRequired,  bool? modelCompatible,  DateTime? enrolledAt,  DateTime? lastVerifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _BiometricStatus() when $default != null:
return $default(_that.status,_that.canEnroll,_that.requiresEnrollment,_that.clockInVerificationRequired,_that.modelCompatible,_that.enrolledAt,_that.lastVerifiedAt);case _:
  return null;

}
}

}

/// @nodoc


class _BiometricStatus extends BiometricStatus {
  const _BiometricStatus({required this.status, required this.canEnroll, required this.requiresEnrollment, required this.clockInVerificationRequired, this.modelCompatible, this.enrolledAt, this.lastVerifiedAt}): super._();
  

@override final  BiometricEnrollmentStatus status;
@override final  bool canEnroll;
@override final  bool requiresEnrollment;
@override final  bool clockInVerificationRequired;
@override final  bool? modelCompatible;
@override final  DateTime? enrolledAt;
@override final  DateTime? lastVerifiedAt;

/// Create a copy of BiometricStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiometricStatusCopyWith<_BiometricStatus> get copyWith => __$BiometricStatusCopyWithImpl<_BiometricStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiometricStatus&&(identical(other.status, status) || other.status == status)&&(identical(other.canEnroll, canEnroll) || other.canEnroll == canEnroll)&&(identical(other.requiresEnrollment, requiresEnrollment) || other.requiresEnrollment == requiresEnrollment)&&(identical(other.clockInVerificationRequired, clockInVerificationRequired) || other.clockInVerificationRequired == clockInVerificationRequired)&&(identical(other.modelCompatible, modelCompatible) || other.modelCompatible == modelCompatible)&&(identical(other.enrolledAt, enrolledAt) || other.enrolledAt == enrolledAt)&&(identical(other.lastVerifiedAt, lastVerifiedAt) || other.lastVerifiedAt == lastVerifiedAt));
}


@override
int get hashCode => Object.hash(runtimeType,status,canEnroll,requiresEnrollment,clockInVerificationRequired,modelCompatible,enrolledAt,lastVerifiedAt);

@override
String toString() {
  return 'BiometricStatus(status: $status, canEnroll: $canEnroll, requiresEnrollment: $requiresEnrollment, clockInVerificationRequired: $clockInVerificationRequired, modelCompatible: $modelCompatible, enrolledAt: $enrolledAt, lastVerifiedAt: $lastVerifiedAt)';
}


}

/// @nodoc
abstract mixin class _$BiometricStatusCopyWith<$Res> implements $BiometricStatusCopyWith<$Res> {
  factory _$BiometricStatusCopyWith(_BiometricStatus value, $Res Function(_BiometricStatus) _then) = __$BiometricStatusCopyWithImpl;
@override @useResult
$Res call({
 BiometricEnrollmentStatus status, bool canEnroll, bool requiresEnrollment, bool clockInVerificationRequired, bool? modelCompatible, DateTime? enrolledAt, DateTime? lastVerifiedAt
});




}
/// @nodoc
class __$BiometricStatusCopyWithImpl<$Res>
    implements _$BiometricStatusCopyWith<$Res> {
  __$BiometricStatusCopyWithImpl(this._self, this._then);

  final _BiometricStatus _self;
  final $Res Function(_BiometricStatus) _then;

/// Create a copy of BiometricStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? canEnroll = null,Object? requiresEnrollment = null,Object? clockInVerificationRequired = null,Object? modelCompatible = freezed,Object? enrolledAt = freezed,Object? lastVerifiedAt = freezed,}) {
  return _then(_BiometricStatus(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BiometricEnrollmentStatus,canEnroll: null == canEnroll ? _self.canEnroll : canEnroll // ignore: cast_nullable_to_non_nullable
as bool,requiresEnrollment: null == requiresEnrollment ? _self.requiresEnrollment : requiresEnrollment // ignore: cast_nullable_to_non_nullable
as bool,clockInVerificationRequired: null == clockInVerificationRequired ? _self.clockInVerificationRequired : clockInVerificationRequired // ignore: cast_nullable_to_non_nullable
as bool,modelCompatible: freezed == modelCompatible ? _self.modelCompatible : modelCompatible // ignore: cast_nullable_to_non_nullable
as bool?,enrolledAt: freezed == enrolledAt ? _self.enrolledAt : enrolledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastVerifiedAt: freezed == lastVerifiedAt ? _self.lastVerifiedAt : lastVerifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
