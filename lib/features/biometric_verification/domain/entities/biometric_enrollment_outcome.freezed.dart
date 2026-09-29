// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_enrollment_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BiometricEnrollmentOutcome {

 bool get enrolled; BiometricEnrollmentStatus? get status;// Set on a 200-level rejection (enrolled:false) — NO_FACE,
// MULTIPLE_FACES, LOW_QUALITY, INVALID_IMAGE, ENROLLMENT_INCONSISTENT.
 String? get rejectionReason;// Which of the 3 captured photos failed, when applicable (null for
// ENROLLMENT_INCONSISTENT, which isn't about one specific photo).
 RegistrationPose? get failedPose; BiometricErrorReason? get errorReason; Failure? get rawFailure;
/// Create a copy of BiometricEnrollmentOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiometricEnrollmentOutcomeCopyWith<BiometricEnrollmentOutcome> get copyWith => _$BiometricEnrollmentOutcomeCopyWithImpl<BiometricEnrollmentOutcome>(this as BiometricEnrollmentOutcome, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricEnrollmentOutcome&&(identical(other.enrolled, enrolled) || other.enrolled == enrolled)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.failedPose, failedPose) || other.failedPose == failedPose)&&(identical(other.errorReason, errorReason) || other.errorReason == errorReason)&&(identical(other.rawFailure, rawFailure) || other.rawFailure == rawFailure));
}


@override
int get hashCode => Object.hash(runtimeType,enrolled,status,rejectionReason,failedPose,errorReason,rawFailure);

@override
String toString() {
  return 'BiometricEnrollmentOutcome(enrolled: $enrolled, status: $status, rejectionReason: $rejectionReason, failedPose: $failedPose, errorReason: $errorReason, rawFailure: $rawFailure)';
}


}

/// @nodoc
abstract mixin class $BiometricEnrollmentOutcomeCopyWith<$Res>  {
  factory $BiometricEnrollmentOutcomeCopyWith(BiometricEnrollmentOutcome value, $Res Function(BiometricEnrollmentOutcome) _then) = _$BiometricEnrollmentOutcomeCopyWithImpl;
@useResult
$Res call({
 bool enrolled, BiometricEnrollmentStatus? status, String? rejectionReason, RegistrationPose? failedPose, BiometricErrorReason? errorReason, Failure? rawFailure
});




}
/// @nodoc
class _$BiometricEnrollmentOutcomeCopyWithImpl<$Res>
    implements $BiometricEnrollmentOutcomeCopyWith<$Res> {
  _$BiometricEnrollmentOutcomeCopyWithImpl(this._self, this._then);

  final BiometricEnrollmentOutcome _self;
  final $Res Function(BiometricEnrollmentOutcome) _then;

/// Create a copy of BiometricEnrollmentOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enrolled = null,Object? status = freezed,Object? rejectionReason = freezed,Object? failedPose = freezed,Object? errorReason = freezed,Object? rawFailure = freezed,}) {
  return _then(_self.copyWith(
enrolled: null == enrolled ? _self.enrolled : enrolled // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BiometricEnrollmentStatus?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,failedPose: freezed == failedPose ? _self.failedPose : failedPose // ignore: cast_nullable_to_non_nullable
as RegistrationPose?,errorReason: freezed == errorReason ? _self.errorReason : errorReason // ignore: cast_nullable_to_non_nullable
as BiometricErrorReason?,rawFailure: freezed == rawFailure ? _self.rawFailure : rawFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [BiometricEnrollmentOutcome].
extension BiometricEnrollmentOutcomePatterns on BiometricEnrollmentOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiometricEnrollmentOutcome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiometricEnrollmentOutcome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiometricEnrollmentOutcome value)  $default,){
final _that = this;
switch (_that) {
case _BiometricEnrollmentOutcome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiometricEnrollmentOutcome value)?  $default,){
final _that = this;
switch (_that) {
case _BiometricEnrollmentOutcome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enrolled,  BiometricEnrollmentStatus? status,  String? rejectionReason,  RegistrationPose? failedPose,  BiometricErrorReason? errorReason,  Failure? rawFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiometricEnrollmentOutcome() when $default != null:
return $default(_that.enrolled,_that.status,_that.rejectionReason,_that.failedPose,_that.errorReason,_that.rawFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enrolled,  BiometricEnrollmentStatus? status,  String? rejectionReason,  RegistrationPose? failedPose,  BiometricErrorReason? errorReason,  Failure? rawFailure)  $default,) {final _that = this;
switch (_that) {
case _BiometricEnrollmentOutcome():
return $default(_that.enrolled,_that.status,_that.rejectionReason,_that.failedPose,_that.errorReason,_that.rawFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enrolled,  BiometricEnrollmentStatus? status,  String? rejectionReason,  RegistrationPose? failedPose,  BiometricErrorReason? errorReason,  Failure? rawFailure)?  $default,) {final _that = this;
switch (_that) {
case _BiometricEnrollmentOutcome() when $default != null:
return $default(_that.enrolled,_that.status,_that.rejectionReason,_that.failedPose,_that.errorReason,_that.rawFailure);case _:
  return null;

}
}

}

/// @nodoc


class _BiometricEnrollmentOutcome implements BiometricEnrollmentOutcome {
  const _BiometricEnrollmentOutcome({required this.enrolled, this.status, this.rejectionReason, this.failedPose, this.errorReason, this.rawFailure});
  

@override final  bool enrolled;
@override final  BiometricEnrollmentStatus? status;
// Set on a 200-level rejection (enrolled:false) — NO_FACE,
// MULTIPLE_FACES, LOW_QUALITY, INVALID_IMAGE, ENROLLMENT_INCONSISTENT.
@override final  String? rejectionReason;
// Which of the 3 captured photos failed, when applicable (null for
// ENROLLMENT_INCONSISTENT, which isn't about one specific photo).
@override final  RegistrationPose? failedPose;
@override final  BiometricErrorReason? errorReason;
@override final  Failure? rawFailure;

/// Create a copy of BiometricEnrollmentOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiometricEnrollmentOutcomeCopyWith<_BiometricEnrollmentOutcome> get copyWith => __$BiometricEnrollmentOutcomeCopyWithImpl<_BiometricEnrollmentOutcome>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiometricEnrollmentOutcome&&(identical(other.enrolled, enrolled) || other.enrolled == enrolled)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.failedPose, failedPose) || other.failedPose == failedPose)&&(identical(other.errorReason, errorReason) || other.errorReason == errorReason)&&(identical(other.rawFailure, rawFailure) || other.rawFailure == rawFailure));
}


@override
int get hashCode => Object.hash(runtimeType,enrolled,status,rejectionReason,failedPose,errorReason,rawFailure);

@override
String toString() {
  return 'BiometricEnrollmentOutcome(enrolled: $enrolled, status: $status, rejectionReason: $rejectionReason, failedPose: $failedPose, errorReason: $errorReason, rawFailure: $rawFailure)';
}


}

/// @nodoc
abstract mixin class _$BiometricEnrollmentOutcomeCopyWith<$Res> implements $BiometricEnrollmentOutcomeCopyWith<$Res> {
  factory _$BiometricEnrollmentOutcomeCopyWith(_BiometricEnrollmentOutcome value, $Res Function(_BiometricEnrollmentOutcome) _then) = __$BiometricEnrollmentOutcomeCopyWithImpl;
@override @useResult
$Res call({
 bool enrolled, BiometricEnrollmentStatus? status, String? rejectionReason, RegistrationPose? failedPose, BiometricErrorReason? errorReason, Failure? rawFailure
});




}
/// @nodoc
class __$BiometricEnrollmentOutcomeCopyWithImpl<$Res>
    implements _$BiometricEnrollmentOutcomeCopyWith<$Res> {
  __$BiometricEnrollmentOutcomeCopyWithImpl(this._self, this._then);

  final _BiometricEnrollmentOutcome _self;
  final $Res Function(_BiometricEnrollmentOutcome) _then;

/// Create a copy of BiometricEnrollmentOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enrolled = null,Object? status = freezed,Object? rejectionReason = freezed,Object? failedPose = freezed,Object? errorReason = freezed,Object? rawFailure = freezed,}) {
  return _then(_BiometricEnrollmentOutcome(
enrolled: null == enrolled ? _self.enrolled : enrolled // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BiometricEnrollmentStatus?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,failedPose: freezed == failedPose ? _self.failedPose : failedPose // ignore: cast_nullable_to_non_nullable
as RegistrationPose?,errorReason: freezed == errorReason ? _self.errorReason : errorReason // ignore: cast_nullable_to_non_nullable
as BiometricErrorReason?,rawFailure: freezed == rawFailure ? _self.rawFailure : rawFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
