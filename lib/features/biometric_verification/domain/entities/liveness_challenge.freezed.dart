// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liveness_challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LivenessChallenge {
  String get challengeId => throw _privateConstructorUsedError;
  List<LivenessAction> get actions => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  BiometricPurpose get purpose => throw _privateConstructorUsedError;

  /// Create a copy of LivenessChallenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LivenessChallengeCopyWith<LivenessChallenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivenessChallengeCopyWith<$Res> {
  factory $LivenessChallengeCopyWith(
    LivenessChallenge value,
    $Res Function(LivenessChallenge) then,
  ) = _$LivenessChallengeCopyWithImpl<$Res, LivenessChallenge>;
  @useResult
  $Res call({
    String challengeId,
    List<LivenessAction> actions,
    DateTime expiresAt,
    BiometricPurpose purpose,
  });
}

/// @nodoc
class _$LivenessChallengeCopyWithImpl<$Res, $Val extends LivenessChallenge>
    implements $LivenessChallengeCopyWith<$Res> {
  _$LivenessChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LivenessChallenge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = null,
    Object? actions = null,
    Object? expiresAt = null,
    Object? purpose = null,
  }) {
    return _then(
      _value.copyWith(
            challengeId: null == challengeId
                ? _value.challengeId
                : challengeId // ignore: cast_nullable_to_non_nullable
                      as String,
            actions: null == actions
                ? _value.actions
                : actions // ignore: cast_nullable_to_non_nullable
                      as List<LivenessAction>,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            purpose: null == purpose
                ? _value.purpose
                : purpose // ignore: cast_nullable_to_non_nullable
                      as BiometricPurpose,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LivenessChallengeImplCopyWith<$Res>
    implements $LivenessChallengeCopyWith<$Res> {
  factory _$$LivenessChallengeImplCopyWith(
    _$LivenessChallengeImpl value,
    $Res Function(_$LivenessChallengeImpl) then,
  ) = __$$LivenessChallengeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String challengeId,
    List<LivenessAction> actions,
    DateTime expiresAt,
    BiometricPurpose purpose,
  });
}

/// @nodoc
class __$$LivenessChallengeImplCopyWithImpl<$Res>
    extends _$LivenessChallengeCopyWithImpl<$Res, _$LivenessChallengeImpl>
    implements _$$LivenessChallengeImplCopyWith<$Res> {
  __$$LivenessChallengeImplCopyWithImpl(
    _$LivenessChallengeImpl _value,
    $Res Function(_$LivenessChallengeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LivenessChallenge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeId = null,
    Object? actions = null,
    Object? expiresAt = null,
    Object? purpose = null,
  }) {
    return _then(
      _$LivenessChallengeImpl(
        challengeId: null == challengeId
            ? _value.challengeId
            : challengeId // ignore: cast_nullable_to_non_nullable
                  as String,
        actions: null == actions
            ? _value._actions
            : actions // ignore: cast_nullable_to_non_nullable
                  as List<LivenessAction>,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        purpose: null == purpose
            ? _value.purpose
            : purpose // ignore: cast_nullable_to_non_nullable
                  as BiometricPurpose,
      ),
    );
  }
}

/// @nodoc

class _$LivenessChallengeImpl extends _LivenessChallenge {
  const _$LivenessChallengeImpl({
    required this.challengeId,
    required final List<LivenessAction> actions,
    required this.expiresAt,
    required this.purpose,
  }) : _actions = actions,
       super._();

  @override
  final String challengeId;
  final List<LivenessAction> _actions;
  @override
  List<LivenessAction> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  final DateTime expiresAt;
  @override
  final BiometricPurpose purpose;

  @override
  String toString() {
    return 'LivenessChallenge(challengeId: $challengeId, actions: $actions, expiresAt: $expiresAt, purpose: $purpose)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivenessChallengeImpl &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.purpose, purpose) || other.purpose == purpose));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    challengeId,
    const DeepCollectionEquality().hash(_actions),
    expiresAt,
    purpose,
  );

  /// Create a copy of LivenessChallenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LivenessChallengeImplCopyWith<_$LivenessChallengeImpl> get copyWith =>
      __$$LivenessChallengeImplCopyWithImpl<_$LivenessChallengeImpl>(
        this,
        _$identity,
      );
}

abstract class _LivenessChallenge extends LivenessChallenge {
  const factory _LivenessChallenge({
    required final String challengeId,
    required final List<LivenessAction> actions,
    required final DateTime expiresAt,
    required final BiometricPurpose purpose,
  }) = _$LivenessChallengeImpl;
  const _LivenessChallenge._() : super._();

  @override
  String get challengeId;
  @override
  List<LivenessAction> get actions;
  @override
  DateTime get expiresAt;
  @override
  BiometricPurpose get purpose;

  /// Create a copy of LivenessChallenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LivenessChallengeImplCopyWith<_$LivenessChallengeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
