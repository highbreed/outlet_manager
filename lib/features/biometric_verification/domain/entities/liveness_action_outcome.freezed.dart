// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liveness_action_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LivenessActionOutcome {
  LivenessAction get action => throw _privateConstructorUsedError;
  bool get satisfied => throw _privateConstructorUsedError;
  int get consecutiveQualifyingFrames => throw _privateConstructorUsedError;
  DateTime? get firstQualifyingObservationAt =>
      throw _privateConstructorUsedError;

  /// Create a copy of LivenessActionOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LivenessActionOutcomeCopyWith<LivenessActionOutcome> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LivenessActionOutcomeCopyWith<$Res> {
  factory $LivenessActionOutcomeCopyWith(
    LivenessActionOutcome value,
    $Res Function(LivenessActionOutcome) then,
  ) = _$LivenessActionOutcomeCopyWithImpl<$Res, LivenessActionOutcome>;
  @useResult
  $Res call({
    LivenessAction action,
    bool satisfied,
    int consecutiveQualifyingFrames,
    DateTime? firstQualifyingObservationAt,
  });
}

/// @nodoc
class _$LivenessActionOutcomeCopyWithImpl<
  $Res,
  $Val extends LivenessActionOutcome
>
    implements $LivenessActionOutcomeCopyWith<$Res> {
  _$LivenessActionOutcomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LivenessActionOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? satisfied = null,
    Object? consecutiveQualifyingFrames = null,
    Object? firstQualifyingObservationAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as LivenessAction,
            satisfied: null == satisfied
                ? _value.satisfied
                : satisfied // ignore: cast_nullable_to_non_nullable
                      as bool,
            consecutiveQualifyingFrames: null == consecutiveQualifyingFrames
                ? _value.consecutiveQualifyingFrames
                : consecutiveQualifyingFrames // ignore: cast_nullable_to_non_nullable
                      as int,
            firstQualifyingObservationAt:
                freezed == firstQualifyingObservationAt
                ? _value.firstQualifyingObservationAt
                : firstQualifyingObservationAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LivenessActionOutcomeImplCopyWith<$Res>
    implements $LivenessActionOutcomeCopyWith<$Res> {
  factory _$$LivenessActionOutcomeImplCopyWith(
    _$LivenessActionOutcomeImpl value,
    $Res Function(_$LivenessActionOutcomeImpl) then,
  ) = __$$LivenessActionOutcomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    LivenessAction action,
    bool satisfied,
    int consecutiveQualifyingFrames,
    DateTime? firstQualifyingObservationAt,
  });
}

/// @nodoc
class __$$LivenessActionOutcomeImplCopyWithImpl<$Res>
    extends
        _$LivenessActionOutcomeCopyWithImpl<$Res, _$LivenessActionOutcomeImpl>
    implements _$$LivenessActionOutcomeImplCopyWith<$Res> {
  __$$LivenessActionOutcomeImplCopyWithImpl(
    _$LivenessActionOutcomeImpl _value,
    $Res Function(_$LivenessActionOutcomeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LivenessActionOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? satisfied = null,
    Object? consecutiveQualifyingFrames = null,
    Object? firstQualifyingObservationAt = freezed,
  }) {
    return _then(
      _$LivenessActionOutcomeImpl(
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as LivenessAction,
        satisfied: null == satisfied
            ? _value.satisfied
            : satisfied // ignore: cast_nullable_to_non_nullable
                  as bool,
        consecutiveQualifyingFrames: null == consecutiveQualifyingFrames
            ? _value.consecutiveQualifyingFrames
            : consecutiveQualifyingFrames // ignore: cast_nullable_to_non_nullable
                  as int,
        firstQualifyingObservationAt: freezed == firstQualifyingObservationAt
            ? _value.firstQualifyingObservationAt
            : firstQualifyingObservationAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$LivenessActionOutcomeImpl implements _LivenessActionOutcome {
  const _$LivenessActionOutcomeImpl({
    required this.action,
    this.satisfied = false,
    this.consecutiveQualifyingFrames = 0,
    this.firstQualifyingObservationAt,
  });

  @override
  final LivenessAction action;
  @override
  @JsonKey()
  final bool satisfied;
  @override
  @JsonKey()
  final int consecutiveQualifyingFrames;
  @override
  final DateTime? firstQualifyingObservationAt;

  @override
  String toString() {
    return 'LivenessActionOutcome(action: $action, satisfied: $satisfied, consecutiveQualifyingFrames: $consecutiveQualifyingFrames, firstQualifyingObservationAt: $firstQualifyingObservationAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LivenessActionOutcomeImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.satisfied, satisfied) ||
                other.satisfied == satisfied) &&
            (identical(
                  other.consecutiveQualifyingFrames,
                  consecutiveQualifyingFrames,
                ) ||
                other.consecutiveQualifyingFrames ==
                    consecutiveQualifyingFrames) &&
            (identical(
                  other.firstQualifyingObservationAt,
                  firstQualifyingObservationAt,
                ) ||
                other.firstQualifyingObservationAt ==
                    firstQualifyingObservationAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    action,
    satisfied,
    consecutiveQualifyingFrames,
    firstQualifyingObservationAt,
  );

  /// Create a copy of LivenessActionOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LivenessActionOutcomeImplCopyWith<_$LivenessActionOutcomeImpl>
  get copyWith =>
      __$$LivenessActionOutcomeImplCopyWithImpl<_$LivenessActionOutcomeImpl>(
        this,
        _$identity,
      );
}

abstract class _LivenessActionOutcome implements LivenessActionOutcome {
  const factory _LivenessActionOutcome({
    required final LivenessAction action,
    final bool satisfied,
    final int consecutiveQualifyingFrames,
    final DateTime? firstQualifyingObservationAt,
  }) = _$LivenessActionOutcomeImpl;

  @override
  LivenessAction get action;
  @override
  bool get satisfied;
  @override
  int get consecutiveQualifyingFrames;
  @override
  DateTime? get firstQualifyingObservationAt;

  /// Create a copy of LivenessActionOutcome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LivenessActionOutcomeImplCopyWith<_$LivenessActionOutcomeImpl>
  get copyWith => throw _privateConstructorUsedError;
}
