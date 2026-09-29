// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_capture_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BiometricCaptureState {
  String get captureSessionId => throw _privateConstructorUsedError;
  BiometricPhase get phase => throw _privateConstructorUsedError;
  LivenessChallenge? get challenge => throw _privateConstructorUsedError;
  int get currentActionIndex => throw _privateConstructorUsedError;
  List<LivenessActionOutcome> get actionOutcomes =>
      throw _privateConstructorUsedError;
  FacePose? get currentFacePose => throw _privateConstructorUsedError;
  FaceQualityResult? get currentQuality => throw _privateConstructorUsedError;
  BiometricErrorReason? get errorReason => throw _privateConstructorUsedError;
  String? get verificationRequestId => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;

  /// Create a copy of BiometricCaptureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BiometricCaptureStateCopyWith<BiometricCaptureState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiometricCaptureStateCopyWith<$Res> {
  factory $BiometricCaptureStateCopyWith(
    BiometricCaptureState value,
    $Res Function(BiometricCaptureState) then,
  ) = _$BiometricCaptureStateCopyWithImpl<$Res, BiometricCaptureState>;
  @useResult
  $Res call({
    String captureSessionId,
    BiometricPhase phase,
    LivenessChallenge? challenge,
    int currentActionIndex,
    List<LivenessActionOutcome> actionOutcomes,
    FacePose? currentFacePose,
    FaceQualityResult? currentQuality,
    BiometricErrorReason? errorReason,
    String? verificationRequestId,
    String? verificationId,
  });

  $LivenessChallengeCopyWith<$Res>? get challenge;
  $FacePoseCopyWith<$Res>? get currentFacePose;
  $FaceQualityResultCopyWith<$Res>? get currentQuality;
}

/// @nodoc
class _$BiometricCaptureStateCopyWithImpl<
  $Res,
  $Val extends BiometricCaptureState
>
    implements $BiometricCaptureStateCopyWith<$Res> {
  _$BiometricCaptureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiometricCaptureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? captureSessionId = null,
    Object? phase = null,
    Object? challenge = freezed,
    Object? currentActionIndex = null,
    Object? actionOutcomes = null,
    Object? currentFacePose = freezed,
    Object? currentQuality = freezed,
    Object? errorReason = freezed,
    Object? verificationRequestId = freezed,
    Object? verificationId = freezed,
  }) {
    return _then(
      _value.copyWith(
            captureSessionId: null == captureSessionId
                ? _value.captureSessionId
                : captureSessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            phase: null == phase
                ? _value.phase
                : phase // ignore: cast_nullable_to_non_nullable
                      as BiometricPhase,
            challenge: freezed == challenge
                ? _value.challenge
                : challenge // ignore: cast_nullable_to_non_nullable
                      as LivenessChallenge?,
            currentActionIndex: null == currentActionIndex
                ? _value.currentActionIndex
                : currentActionIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            actionOutcomes: null == actionOutcomes
                ? _value.actionOutcomes
                : actionOutcomes // ignore: cast_nullable_to_non_nullable
                      as List<LivenessActionOutcome>,
            currentFacePose: freezed == currentFacePose
                ? _value.currentFacePose
                : currentFacePose // ignore: cast_nullable_to_non_nullable
                      as FacePose?,
            currentQuality: freezed == currentQuality
                ? _value.currentQuality
                : currentQuality // ignore: cast_nullable_to_non_nullable
                      as FaceQualityResult?,
            errorReason: freezed == errorReason
                ? _value.errorReason
                : errorReason // ignore: cast_nullable_to_non_nullable
                      as BiometricErrorReason?,
            verificationRequestId: freezed == verificationRequestId
                ? _value.verificationRequestId
                : verificationRequestId // ignore: cast_nullable_to_non_nullable
                      as String?,
            verificationId: freezed == verificationId
                ? _value.verificationId
                : verificationId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of BiometricCaptureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LivenessChallengeCopyWith<$Res>? get challenge {
    if (_value.challenge == null) {
      return null;
    }

    return $LivenessChallengeCopyWith<$Res>(_value.challenge!, (value) {
      return _then(_value.copyWith(challenge: value) as $Val);
    });
  }

  /// Create a copy of BiometricCaptureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacePoseCopyWith<$Res>? get currentFacePose {
    if (_value.currentFacePose == null) {
      return null;
    }

    return $FacePoseCopyWith<$Res>(_value.currentFacePose!, (value) {
      return _then(_value.copyWith(currentFacePose: value) as $Val);
    });
  }

  /// Create a copy of BiometricCaptureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FaceQualityResultCopyWith<$Res>? get currentQuality {
    if (_value.currentQuality == null) {
      return null;
    }

    return $FaceQualityResultCopyWith<$Res>(_value.currentQuality!, (value) {
      return _then(_value.copyWith(currentQuality: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BiometricCaptureStateImplCopyWith<$Res>
    implements $BiometricCaptureStateCopyWith<$Res> {
  factory _$$BiometricCaptureStateImplCopyWith(
    _$BiometricCaptureStateImpl value,
    $Res Function(_$BiometricCaptureStateImpl) then,
  ) = __$$BiometricCaptureStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String captureSessionId,
    BiometricPhase phase,
    LivenessChallenge? challenge,
    int currentActionIndex,
    List<LivenessActionOutcome> actionOutcomes,
    FacePose? currentFacePose,
    FaceQualityResult? currentQuality,
    BiometricErrorReason? errorReason,
    String? verificationRequestId,
    String? verificationId,
  });

  @override
  $LivenessChallengeCopyWith<$Res>? get challenge;
  @override
  $FacePoseCopyWith<$Res>? get currentFacePose;
  @override
  $FaceQualityResultCopyWith<$Res>? get currentQuality;
}

/// @nodoc
class __$$BiometricCaptureStateImplCopyWithImpl<$Res>
    extends
        _$BiometricCaptureStateCopyWithImpl<$Res, _$BiometricCaptureStateImpl>
    implements _$$BiometricCaptureStateImplCopyWith<$Res> {
  __$$BiometricCaptureStateImplCopyWithImpl(
    _$BiometricCaptureStateImpl _value,
    $Res Function(_$BiometricCaptureStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricCaptureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? captureSessionId = null,
    Object? phase = null,
    Object? challenge = freezed,
    Object? currentActionIndex = null,
    Object? actionOutcomes = null,
    Object? currentFacePose = freezed,
    Object? currentQuality = freezed,
    Object? errorReason = freezed,
    Object? verificationRequestId = freezed,
    Object? verificationId = freezed,
  }) {
    return _then(
      _$BiometricCaptureStateImpl(
        captureSessionId: null == captureSessionId
            ? _value.captureSessionId
            : captureSessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        phase: null == phase
            ? _value.phase
            : phase // ignore: cast_nullable_to_non_nullable
                  as BiometricPhase,
        challenge: freezed == challenge
            ? _value.challenge
            : challenge // ignore: cast_nullable_to_non_nullable
                  as LivenessChallenge?,
        currentActionIndex: null == currentActionIndex
            ? _value.currentActionIndex
            : currentActionIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        actionOutcomes: null == actionOutcomes
            ? _value._actionOutcomes
            : actionOutcomes // ignore: cast_nullable_to_non_nullable
                  as List<LivenessActionOutcome>,
        currentFacePose: freezed == currentFacePose
            ? _value.currentFacePose
            : currentFacePose // ignore: cast_nullable_to_non_nullable
                  as FacePose?,
        currentQuality: freezed == currentQuality
            ? _value.currentQuality
            : currentQuality // ignore: cast_nullable_to_non_nullable
                  as FaceQualityResult?,
        errorReason: freezed == errorReason
            ? _value.errorReason
            : errorReason // ignore: cast_nullable_to_non_nullable
                  as BiometricErrorReason?,
        verificationRequestId: freezed == verificationRequestId
            ? _value.verificationRequestId
            : verificationRequestId // ignore: cast_nullable_to_non_nullable
                  as String?,
        verificationId: freezed == verificationId
            ? _value.verificationId
            : verificationId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$BiometricCaptureStateImpl extends _BiometricCaptureState {
  const _$BiometricCaptureStateImpl({
    required this.captureSessionId,
    this.phase = BiometricPhase.idle,
    this.challenge,
    this.currentActionIndex = 0,
    final List<LivenessActionOutcome> actionOutcomes = const [],
    this.currentFacePose,
    this.currentQuality,
    this.errorReason,
    this.verificationRequestId,
    this.verificationId,
  }) : _actionOutcomes = actionOutcomes,
       super._();

  @override
  final String captureSessionId;
  @override
  @JsonKey()
  final BiometricPhase phase;
  @override
  final LivenessChallenge? challenge;
  @override
  @JsonKey()
  final int currentActionIndex;
  final List<LivenessActionOutcome> _actionOutcomes;
  @override
  @JsonKey()
  List<LivenessActionOutcome> get actionOutcomes {
    if (_actionOutcomes is EqualUnmodifiableListView) return _actionOutcomes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionOutcomes);
  }

  @override
  final FacePose? currentFacePose;
  @override
  final FaceQualityResult? currentQuality;
  @override
  final BiometricErrorReason? errorReason;
  @override
  final String? verificationRequestId;
  @override
  final String? verificationId;

  @override
  String toString() {
    return 'BiometricCaptureState(captureSessionId: $captureSessionId, phase: $phase, challenge: $challenge, currentActionIndex: $currentActionIndex, actionOutcomes: $actionOutcomes, currentFacePose: $currentFacePose, currentQuality: $currentQuality, errorReason: $errorReason, verificationRequestId: $verificationRequestId, verificationId: $verificationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricCaptureStateImpl &&
            (identical(other.captureSessionId, captureSessionId) ||
                other.captureSessionId == captureSessionId) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.challenge, challenge) ||
                other.challenge == challenge) &&
            (identical(other.currentActionIndex, currentActionIndex) ||
                other.currentActionIndex == currentActionIndex) &&
            const DeepCollectionEquality().equals(
              other._actionOutcomes,
              _actionOutcomes,
            ) &&
            (identical(other.currentFacePose, currentFacePose) ||
                other.currentFacePose == currentFacePose) &&
            (identical(other.currentQuality, currentQuality) ||
                other.currentQuality == currentQuality) &&
            (identical(other.errorReason, errorReason) ||
                other.errorReason == errorReason) &&
            (identical(other.verificationRequestId, verificationRequestId) ||
                other.verificationRequestId == verificationRequestId) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    captureSessionId,
    phase,
    challenge,
    currentActionIndex,
    const DeepCollectionEquality().hash(_actionOutcomes),
    currentFacePose,
    currentQuality,
    errorReason,
    verificationRequestId,
    verificationId,
  );

  /// Create a copy of BiometricCaptureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricCaptureStateImplCopyWith<_$BiometricCaptureStateImpl>
  get copyWith =>
      __$$BiometricCaptureStateImplCopyWithImpl<_$BiometricCaptureStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BiometricCaptureState extends BiometricCaptureState {
  const factory _BiometricCaptureState({
    required final String captureSessionId,
    final BiometricPhase phase,
    final LivenessChallenge? challenge,
    final int currentActionIndex,
    final List<LivenessActionOutcome> actionOutcomes,
    final FacePose? currentFacePose,
    final FaceQualityResult? currentQuality,
    final BiometricErrorReason? errorReason,
    final String? verificationRequestId,
    final String? verificationId,
  }) = _$BiometricCaptureStateImpl;
  const _BiometricCaptureState._() : super._();

  @override
  String get captureSessionId;
  @override
  BiometricPhase get phase;
  @override
  LivenessChallenge? get challenge;
  @override
  int get currentActionIndex;
  @override
  List<LivenessActionOutcome> get actionOutcomes;
  @override
  FacePose? get currentFacePose;
  @override
  FaceQualityResult? get currentQuality;
  @override
  BiometricErrorReason? get errorReason;
  @override
  String? get verificationRequestId;
  @override
  String? get verificationId;

  /// Create a copy of BiometricCaptureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricCaptureStateImplCopyWith<_$BiometricCaptureStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
