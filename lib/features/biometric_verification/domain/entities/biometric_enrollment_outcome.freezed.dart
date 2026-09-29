// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_enrollment_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BiometricEnrollmentOutcome {
  bool get enrolled => throw _privateConstructorUsedError;
  BiometricEnrollmentStatus? get status =>
      throw _privateConstructorUsedError; // Set on a 200-level rejection (enrolled:false) — NO_FACE,
  // MULTIPLE_FACES, LOW_QUALITY, INVALID_IMAGE, ENROLLMENT_INCONSISTENT.
  String? get rejectionReason =>
      throw _privateConstructorUsedError; // Which of the 3 captured photos failed, when applicable (null for
  // ENROLLMENT_INCONSISTENT, which isn't about one specific photo).
  RegistrationPose? get failedPose => throw _privateConstructorUsedError;
  BiometricErrorReason? get errorReason => throw _privateConstructorUsedError;
  Failure? get rawFailure => throw _privateConstructorUsedError;

  /// Create a copy of BiometricEnrollmentOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BiometricEnrollmentOutcomeCopyWith<BiometricEnrollmentOutcome>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiometricEnrollmentOutcomeCopyWith<$Res> {
  factory $BiometricEnrollmentOutcomeCopyWith(
    BiometricEnrollmentOutcome value,
    $Res Function(BiometricEnrollmentOutcome) then,
  ) =
      _$BiometricEnrollmentOutcomeCopyWithImpl<
        $Res,
        BiometricEnrollmentOutcome
      >;
  @useResult
  $Res call({
    bool enrolled,
    BiometricEnrollmentStatus? status,
    String? rejectionReason,
    RegistrationPose? failedPose,
    BiometricErrorReason? errorReason,
    Failure? rawFailure,
  });
}

/// @nodoc
class _$BiometricEnrollmentOutcomeCopyWithImpl<
  $Res,
  $Val extends BiometricEnrollmentOutcome
>
    implements $BiometricEnrollmentOutcomeCopyWith<$Res> {
  _$BiometricEnrollmentOutcomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiometricEnrollmentOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrolled = null,
    Object? status = freezed,
    Object? rejectionReason = freezed,
    Object? failedPose = freezed,
    Object? errorReason = freezed,
    Object? rawFailure = freezed,
  }) {
    return _then(
      _value.copyWith(
            enrolled: null == enrolled
                ? _value.enrolled
                : enrolled // ignore: cast_nullable_to_non_nullable
                      as bool,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as BiometricEnrollmentStatus?,
            rejectionReason: freezed == rejectionReason
                ? _value.rejectionReason
                : rejectionReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            failedPose: freezed == failedPose
                ? _value.failedPose
                : failedPose // ignore: cast_nullable_to_non_nullable
                      as RegistrationPose?,
            errorReason: freezed == errorReason
                ? _value.errorReason
                : errorReason // ignore: cast_nullable_to_non_nullable
                      as BiometricErrorReason?,
            rawFailure: freezed == rawFailure
                ? _value.rawFailure
                : rawFailure // ignore: cast_nullable_to_non_nullable
                      as Failure?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BiometricEnrollmentOutcomeImplCopyWith<$Res>
    implements $BiometricEnrollmentOutcomeCopyWith<$Res> {
  factory _$$BiometricEnrollmentOutcomeImplCopyWith(
    _$BiometricEnrollmentOutcomeImpl value,
    $Res Function(_$BiometricEnrollmentOutcomeImpl) then,
  ) = __$$BiometricEnrollmentOutcomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enrolled,
    BiometricEnrollmentStatus? status,
    String? rejectionReason,
    RegistrationPose? failedPose,
    BiometricErrorReason? errorReason,
    Failure? rawFailure,
  });
}

/// @nodoc
class __$$BiometricEnrollmentOutcomeImplCopyWithImpl<$Res>
    extends
        _$BiometricEnrollmentOutcomeCopyWithImpl<
          $Res,
          _$BiometricEnrollmentOutcomeImpl
        >
    implements _$$BiometricEnrollmentOutcomeImplCopyWith<$Res> {
  __$$BiometricEnrollmentOutcomeImplCopyWithImpl(
    _$BiometricEnrollmentOutcomeImpl _value,
    $Res Function(_$BiometricEnrollmentOutcomeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricEnrollmentOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrolled = null,
    Object? status = freezed,
    Object? rejectionReason = freezed,
    Object? failedPose = freezed,
    Object? errorReason = freezed,
    Object? rawFailure = freezed,
  }) {
    return _then(
      _$BiometricEnrollmentOutcomeImpl(
        enrolled: null == enrolled
            ? _value.enrolled
            : enrolled // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BiometricEnrollmentStatus?,
        rejectionReason: freezed == rejectionReason
            ? _value.rejectionReason
            : rejectionReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        failedPose: freezed == failedPose
            ? _value.failedPose
            : failedPose // ignore: cast_nullable_to_non_nullable
                  as RegistrationPose?,
        errorReason: freezed == errorReason
            ? _value.errorReason
            : errorReason // ignore: cast_nullable_to_non_nullable
                  as BiometricErrorReason?,
        rawFailure: freezed == rawFailure
            ? _value.rawFailure
            : rawFailure // ignore: cast_nullable_to_non_nullable
                  as Failure?,
      ),
    );
  }
}

/// @nodoc

class _$BiometricEnrollmentOutcomeImpl implements _BiometricEnrollmentOutcome {
  const _$BiometricEnrollmentOutcomeImpl({
    required this.enrolled,
    this.status,
    this.rejectionReason,
    this.failedPose,
    this.errorReason,
    this.rawFailure,
  });

  @override
  final bool enrolled;
  @override
  final BiometricEnrollmentStatus? status;
  // Set on a 200-level rejection (enrolled:false) — NO_FACE,
  // MULTIPLE_FACES, LOW_QUALITY, INVALID_IMAGE, ENROLLMENT_INCONSISTENT.
  @override
  final String? rejectionReason;
  // Which of the 3 captured photos failed, when applicable (null for
  // ENROLLMENT_INCONSISTENT, which isn't about one specific photo).
  @override
  final RegistrationPose? failedPose;
  @override
  final BiometricErrorReason? errorReason;
  @override
  final Failure? rawFailure;

  @override
  String toString() {
    return 'BiometricEnrollmentOutcome(enrolled: $enrolled, status: $status, rejectionReason: $rejectionReason, failedPose: $failedPose, errorReason: $errorReason, rawFailure: $rawFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricEnrollmentOutcomeImpl &&
            (identical(other.enrolled, enrolled) ||
                other.enrolled == enrolled) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.failedPose, failedPose) ||
                other.failedPose == failedPose) &&
            (identical(other.errorReason, errorReason) ||
                other.errorReason == errorReason) &&
            (identical(other.rawFailure, rawFailure) ||
                other.rawFailure == rawFailure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enrolled,
    status,
    rejectionReason,
    failedPose,
    errorReason,
    rawFailure,
  );

  /// Create a copy of BiometricEnrollmentOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricEnrollmentOutcomeImplCopyWith<_$BiometricEnrollmentOutcomeImpl>
  get copyWith =>
      __$$BiometricEnrollmentOutcomeImplCopyWithImpl<
        _$BiometricEnrollmentOutcomeImpl
      >(this, _$identity);
}

abstract class _BiometricEnrollmentOutcome
    implements BiometricEnrollmentOutcome {
  const factory _BiometricEnrollmentOutcome({
    required final bool enrolled,
    final BiometricEnrollmentStatus? status,
    final String? rejectionReason,
    final RegistrationPose? failedPose,
    final BiometricErrorReason? errorReason,
    final Failure? rawFailure,
  }) = _$BiometricEnrollmentOutcomeImpl;

  @override
  bool get enrolled;
  @override
  BiometricEnrollmentStatus? get status; // Set on a 200-level rejection (enrolled:false) — NO_FACE,
  // MULTIPLE_FACES, LOW_QUALITY, INVALID_IMAGE, ENROLLMENT_INCONSISTENT.
  @override
  String? get rejectionReason; // Which of the 3 captured photos failed, when applicable (null for
  // ENROLLMENT_INCONSISTENT, which isn't about one specific photo).
  @override
  RegistrationPose? get failedPose;
  @override
  BiometricErrorReason? get errorReason;
  @override
  Failure? get rawFailure;

  /// Create a copy of BiometricEnrollmentOutcome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricEnrollmentOutcomeImplCopyWith<_$BiometricEnrollmentOutcomeImpl>
  get copyWith => throw _privateConstructorUsedError;
}
