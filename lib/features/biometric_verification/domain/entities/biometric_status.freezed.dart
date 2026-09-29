// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BiometricStatus {
  BiometricEnrollmentStatus get status => throw _privateConstructorUsedError;
  bool get canEnroll => throw _privateConstructorUsedError;
  bool get requiresEnrollment => throw _privateConstructorUsedError;
  bool get clockInVerificationRequired => throw _privateConstructorUsedError;
  bool? get modelCompatible => throw _privateConstructorUsedError;
  DateTime? get enrolledAt => throw _privateConstructorUsedError;
  DateTime? get lastVerifiedAt => throw _privateConstructorUsedError;

  /// Create a copy of BiometricStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BiometricStatusCopyWith<BiometricStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiometricStatusCopyWith<$Res> {
  factory $BiometricStatusCopyWith(
    BiometricStatus value,
    $Res Function(BiometricStatus) then,
  ) = _$BiometricStatusCopyWithImpl<$Res, BiometricStatus>;
  @useResult
  $Res call({
    BiometricEnrollmentStatus status,
    bool canEnroll,
    bool requiresEnrollment,
    bool clockInVerificationRequired,
    bool? modelCompatible,
    DateTime? enrolledAt,
    DateTime? lastVerifiedAt,
  });
}

/// @nodoc
class _$BiometricStatusCopyWithImpl<$Res, $Val extends BiometricStatus>
    implements $BiometricStatusCopyWith<$Res> {
  _$BiometricStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiometricStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? canEnroll = null,
    Object? requiresEnrollment = null,
    Object? clockInVerificationRequired = null,
    Object? modelCompatible = freezed,
    Object? enrolledAt = freezed,
    Object? lastVerifiedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as BiometricEnrollmentStatus,
            canEnroll: null == canEnroll
                ? _value.canEnroll
                : canEnroll // ignore: cast_nullable_to_non_nullable
                      as bool,
            requiresEnrollment: null == requiresEnrollment
                ? _value.requiresEnrollment
                : requiresEnrollment // ignore: cast_nullable_to_non_nullable
                      as bool,
            clockInVerificationRequired: null == clockInVerificationRequired
                ? _value.clockInVerificationRequired
                : clockInVerificationRequired // ignore: cast_nullable_to_non_nullable
                      as bool,
            modelCompatible: freezed == modelCompatible
                ? _value.modelCompatible
                : modelCompatible // ignore: cast_nullable_to_non_nullable
                      as bool?,
            enrolledAt: freezed == enrolledAt
                ? _value.enrolledAt
                : enrolledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastVerifiedAt: freezed == lastVerifiedAt
                ? _value.lastVerifiedAt
                : lastVerifiedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BiometricStatusImplCopyWith<$Res>
    implements $BiometricStatusCopyWith<$Res> {
  factory _$$BiometricStatusImplCopyWith(
    _$BiometricStatusImpl value,
    $Res Function(_$BiometricStatusImpl) then,
  ) = __$$BiometricStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BiometricEnrollmentStatus status,
    bool canEnroll,
    bool requiresEnrollment,
    bool clockInVerificationRequired,
    bool? modelCompatible,
    DateTime? enrolledAt,
    DateTime? lastVerifiedAt,
  });
}

/// @nodoc
class __$$BiometricStatusImplCopyWithImpl<$Res>
    extends _$BiometricStatusCopyWithImpl<$Res, _$BiometricStatusImpl>
    implements _$$BiometricStatusImplCopyWith<$Res> {
  __$$BiometricStatusImplCopyWithImpl(
    _$BiometricStatusImpl _value,
    $Res Function(_$BiometricStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? canEnroll = null,
    Object? requiresEnrollment = null,
    Object? clockInVerificationRequired = null,
    Object? modelCompatible = freezed,
    Object? enrolledAt = freezed,
    Object? lastVerifiedAt = freezed,
  }) {
    return _then(
      _$BiometricStatusImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BiometricEnrollmentStatus,
        canEnroll: null == canEnroll
            ? _value.canEnroll
            : canEnroll // ignore: cast_nullable_to_non_nullable
                  as bool,
        requiresEnrollment: null == requiresEnrollment
            ? _value.requiresEnrollment
            : requiresEnrollment // ignore: cast_nullable_to_non_nullable
                  as bool,
        clockInVerificationRequired: null == clockInVerificationRequired
            ? _value.clockInVerificationRequired
            : clockInVerificationRequired // ignore: cast_nullable_to_non_nullable
                  as bool,
        modelCompatible: freezed == modelCompatible
            ? _value.modelCompatible
            : modelCompatible // ignore: cast_nullable_to_non_nullable
                  as bool?,
        enrolledAt: freezed == enrolledAt
            ? _value.enrolledAt
            : enrolledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastVerifiedAt: freezed == lastVerifiedAt
            ? _value.lastVerifiedAt
            : lastVerifiedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$BiometricStatusImpl extends _BiometricStatus {
  const _$BiometricStatusImpl({
    required this.status,
    required this.canEnroll,
    required this.requiresEnrollment,
    required this.clockInVerificationRequired,
    this.modelCompatible,
    this.enrolledAt,
    this.lastVerifiedAt,
  }) : super._();

  @override
  final BiometricEnrollmentStatus status;
  @override
  final bool canEnroll;
  @override
  final bool requiresEnrollment;
  @override
  final bool clockInVerificationRequired;
  @override
  final bool? modelCompatible;
  @override
  final DateTime? enrolledAt;
  @override
  final DateTime? lastVerifiedAt;

  @override
  String toString() {
    return 'BiometricStatus(status: $status, canEnroll: $canEnroll, requiresEnrollment: $requiresEnrollment, clockInVerificationRequired: $clockInVerificationRequired, modelCompatible: $modelCompatible, enrolledAt: $enrolledAt, lastVerifiedAt: $lastVerifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricStatusImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.canEnroll, canEnroll) ||
                other.canEnroll == canEnroll) &&
            (identical(other.requiresEnrollment, requiresEnrollment) ||
                other.requiresEnrollment == requiresEnrollment) &&
            (identical(
                  other.clockInVerificationRequired,
                  clockInVerificationRequired,
                ) ||
                other.clockInVerificationRequired ==
                    clockInVerificationRequired) &&
            (identical(other.modelCompatible, modelCompatible) ||
                other.modelCompatible == modelCompatible) &&
            (identical(other.enrolledAt, enrolledAt) ||
                other.enrolledAt == enrolledAt) &&
            (identical(other.lastVerifiedAt, lastVerifiedAt) ||
                other.lastVerifiedAt == lastVerifiedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    canEnroll,
    requiresEnrollment,
    clockInVerificationRequired,
    modelCompatible,
    enrolledAt,
    lastVerifiedAt,
  );

  /// Create a copy of BiometricStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricStatusImplCopyWith<_$BiometricStatusImpl> get copyWith =>
      __$$BiometricStatusImplCopyWithImpl<_$BiometricStatusImpl>(
        this,
        _$identity,
      );
}

abstract class _BiometricStatus extends BiometricStatus {
  const factory _BiometricStatus({
    required final BiometricEnrollmentStatus status,
    required final bool canEnroll,
    required final bool requiresEnrollment,
    required final bool clockInVerificationRequired,
    final bool? modelCompatible,
    final DateTime? enrolledAt,
    final DateTime? lastVerifiedAt,
  }) = _$BiometricStatusImpl;
  const _BiometricStatus._() : super._();

  @override
  BiometricEnrollmentStatus get status;
  @override
  bool get canEnroll;
  @override
  bool get requiresEnrollment;
  @override
  bool get clockInVerificationRequired;
  @override
  bool? get modelCompatible;
  @override
  DateTime? get enrolledAt;
  @override
  DateTime? get lastVerifiedAt;

  /// Create a copy of BiometricStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricStatusImplCopyWith<_$BiometricStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
