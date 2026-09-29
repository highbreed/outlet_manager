// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_verification_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BiometricVerificationOutcome {
  bool get verified => throw _privateConstructorUsedError;
  String? get verificationId =>
      throw _privateConstructorUsedError; // Single use, bound to this employee/CLOCK_IN/device — must reach
  // clock-in within this window (contract: 120s).
  DateTime? get verificationExpiresAt => throw _privateConstructorUsedError;
  BiometricErrorReason? get errorReason => throw _privateConstructorUsedError;
  Failure? get rawFailure => throw _privateConstructorUsedError;

  /// Create a copy of BiometricVerificationOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BiometricVerificationOutcomeCopyWith<BiometricVerificationOutcome>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiometricVerificationOutcomeCopyWith<$Res> {
  factory $BiometricVerificationOutcomeCopyWith(
    BiometricVerificationOutcome value,
    $Res Function(BiometricVerificationOutcome) then,
  ) =
      _$BiometricVerificationOutcomeCopyWithImpl<
        $Res,
        BiometricVerificationOutcome
      >;
  @useResult
  $Res call({
    bool verified,
    String? verificationId,
    DateTime? verificationExpiresAt,
    BiometricErrorReason? errorReason,
    Failure? rawFailure,
  });
}

/// @nodoc
class _$BiometricVerificationOutcomeCopyWithImpl<
  $Res,
  $Val extends BiometricVerificationOutcome
>
    implements $BiometricVerificationOutcomeCopyWith<$Res> {
  _$BiometricVerificationOutcomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiometricVerificationOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verified = null,
    Object? verificationId = freezed,
    Object? verificationExpiresAt = freezed,
    Object? errorReason = freezed,
    Object? rawFailure = freezed,
  }) {
    return _then(
      _value.copyWith(
            verified: null == verified
                ? _value.verified
                : verified // ignore: cast_nullable_to_non_nullable
                      as bool,
            verificationId: freezed == verificationId
                ? _value.verificationId
                : verificationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            verificationExpiresAt: freezed == verificationExpiresAt
                ? _value.verificationExpiresAt
                : verificationExpiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
abstract class _$$BiometricVerificationOutcomeImplCopyWith<$Res>
    implements $BiometricVerificationOutcomeCopyWith<$Res> {
  factory _$$BiometricVerificationOutcomeImplCopyWith(
    _$BiometricVerificationOutcomeImpl value,
    $Res Function(_$BiometricVerificationOutcomeImpl) then,
  ) = __$$BiometricVerificationOutcomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool verified,
    String? verificationId,
    DateTime? verificationExpiresAt,
    BiometricErrorReason? errorReason,
    Failure? rawFailure,
  });
}

/// @nodoc
class __$$BiometricVerificationOutcomeImplCopyWithImpl<$Res>
    extends
        _$BiometricVerificationOutcomeCopyWithImpl<
          $Res,
          _$BiometricVerificationOutcomeImpl
        >
    implements _$$BiometricVerificationOutcomeImplCopyWith<$Res> {
  __$$BiometricVerificationOutcomeImplCopyWithImpl(
    _$BiometricVerificationOutcomeImpl _value,
    $Res Function(_$BiometricVerificationOutcomeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricVerificationOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verified = null,
    Object? verificationId = freezed,
    Object? verificationExpiresAt = freezed,
    Object? errorReason = freezed,
    Object? rawFailure = freezed,
  }) {
    return _then(
      _$BiometricVerificationOutcomeImpl(
        verified: null == verified
            ? _value.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
        verificationId: freezed == verificationId
            ? _value.verificationId
            : verificationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        verificationExpiresAt: freezed == verificationExpiresAt
            ? _value.verificationExpiresAt
            : verificationExpiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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

class _$BiometricVerificationOutcomeImpl
    implements _BiometricVerificationOutcome {
  const _$BiometricVerificationOutcomeImpl({
    required this.verified,
    this.verificationId,
    this.verificationExpiresAt,
    this.errorReason,
    this.rawFailure,
  });

  @override
  final bool verified;
  @override
  final String? verificationId;
  // Single use, bound to this employee/CLOCK_IN/device — must reach
  // clock-in within this window (contract: 120s).
  @override
  final DateTime? verificationExpiresAt;
  @override
  final BiometricErrorReason? errorReason;
  @override
  final Failure? rawFailure;

  @override
  String toString() {
    return 'BiometricVerificationOutcome(verified: $verified, verificationId: $verificationId, verificationExpiresAt: $verificationExpiresAt, errorReason: $errorReason, rawFailure: $rawFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricVerificationOutcomeImpl &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.verificationExpiresAt, verificationExpiresAt) ||
                other.verificationExpiresAt == verificationExpiresAt) &&
            (identical(other.errorReason, errorReason) ||
                other.errorReason == errorReason) &&
            (identical(other.rawFailure, rawFailure) ||
                other.rawFailure == rawFailure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    verified,
    verificationId,
    verificationExpiresAt,
    errorReason,
    rawFailure,
  );

  /// Create a copy of BiometricVerificationOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricVerificationOutcomeImplCopyWith<
    _$BiometricVerificationOutcomeImpl
  >
  get copyWith =>
      __$$BiometricVerificationOutcomeImplCopyWithImpl<
        _$BiometricVerificationOutcomeImpl
      >(this, _$identity);
}

abstract class _BiometricVerificationOutcome
    implements BiometricVerificationOutcome {
  const factory _BiometricVerificationOutcome({
    required final bool verified,
    final String? verificationId,
    final DateTime? verificationExpiresAt,
    final BiometricErrorReason? errorReason,
    final Failure? rawFailure,
  }) = _$BiometricVerificationOutcomeImpl;

  @override
  bool get verified;
  @override
  String? get verificationId; // Single use, bound to this employee/CLOCK_IN/device — must reach
  // clock-in within this window (contract: 120s).
  @override
  DateTime? get verificationExpiresAt;
  @override
  BiometricErrorReason? get errorReason;
  @override
  Failure? get rawFailure;

  /// Create a copy of BiometricVerificationOutcome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricVerificationOutcomeImplCopyWith<
    _$BiometricVerificationOutcomeImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
