// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_pose.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FacePose {
  double get boundingBoxLeft => throw _privateConstructorUsedError;
  double get boundingBoxTop => throw _privateConstructorUsedError;
  double get boundingBoxWidth => throw _privateConstructorUsedError;
  double get boundingBoxHeight => throw _privateConstructorUsedError;
  double get frameWidth => throw _privateConstructorUsedError;
  double get frameHeight => throw _privateConstructorUsedError;
  double get yawDegrees => throw _privateConstructorUsedError;
  double get pitchDegrees => throw _privateConstructorUsedError;
  double get rollDegrees => throw _privateConstructorUsedError;
  double? get leftEyeOpenProbability => throw _privateConstructorUsedError;
  double? get rightEyeOpenProbability => throw _privateConstructorUsedError;
  int? get trackingId => throw _privateConstructorUsedError;

  /// Create a copy of FacePose
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacePoseCopyWith<FacePose> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacePoseCopyWith<$Res> {
  factory $FacePoseCopyWith(FacePose value, $Res Function(FacePose) then) =
      _$FacePoseCopyWithImpl<$Res, FacePose>;
  @useResult
  $Res call({
    double boundingBoxLeft,
    double boundingBoxTop,
    double boundingBoxWidth,
    double boundingBoxHeight,
    double frameWidth,
    double frameHeight,
    double yawDegrees,
    double pitchDegrees,
    double rollDegrees,
    double? leftEyeOpenProbability,
    double? rightEyeOpenProbability,
    int? trackingId,
  });
}

/// @nodoc
class _$FacePoseCopyWithImpl<$Res, $Val extends FacePose>
    implements $FacePoseCopyWith<$Res> {
  _$FacePoseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacePose
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boundingBoxLeft = null,
    Object? boundingBoxTop = null,
    Object? boundingBoxWidth = null,
    Object? boundingBoxHeight = null,
    Object? frameWidth = null,
    Object? frameHeight = null,
    Object? yawDegrees = null,
    Object? pitchDegrees = null,
    Object? rollDegrees = null,
    Object? leftEyeOpenProbability = freezed,
    Object? rightEyeOpenProbability = freezed,
    Object? trackingId = freezed,
  }) {
    return _then(
      _value.copyWith(
            boundingBoxLeft: null == boundingBoxLeft
                ? _value.boundingBoxLeft
                : boundingBoxLeft // ignore: cast_nullable_to_non_nullable
                      as double,
            boundingBoxTop: null == boundingBoxTop
                ? _value.boundingBoxTop
                : boundingBoxTop // ignore: cast_nullable_to_non_nullable
                      as double,
            boundingBoxWidth: null == boundingBoxWidth
                ? _value.boundingBoxWidth
                : boundingBoxWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            boundingBoxHeight: null == boundingBoxHeight
                ? _value.boundingBoxHeight
                : boundingBoxHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            frameWidth: null == frameWidth
                ? _value.frameWidth
                : frameWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            frameHeight: null == frameHeight
                ? _value.frameHeight
                : frameHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            yawDegrees: null == yawDegrees
                ? _value.yawDegrees
                : yawDegrees // ignore: cast_nullable_to_non_nullable
                      as double,
            pitchDegrees: null == pitchDegrees
                ? _value.pitchDegrees
                : pitchDegrees // ignore: cast_nullable_to_non_nullable
                      as double,
            rollDegrees: null == rollDegrees
                ? _value.rollDegrees
                : rollDegrees // ignore: cast_nullable_to_non_nullable
                      as double,
            leftEyeOpenProbability: freezed == leftEyeOpenProbability
                ? _value.leftEyeOpenProbability
                : leftEyeOpenProbability // ignore: cast_nullable_to_non_nullable
                      as double?,
            rightEyeOpenProbability: freezed == rightEyeOpenProbability
                ? _value.rightEyeOpenProbability
                : rightEyeOpenProbability // ignore: cast_nullable_to_non_nullable
                      as double?,
            trackingId: freezed == trackingId
                ? _value.trackingId
                : trackingId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FacePoseImplCopyWith<$Res>
    implements $FacePoseCopyWith<$Res> {
  factory _$$FacePoseImplCopyWith(
    _$FacePoseImpl value,
    $Res Function(_$FacePoseImpl) then,
  ) = __$$FacePoseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double boundingBoxLeft,
    double boundingBoxTop,
    double boundingBoxWidth,
    double boundingBoxHeight,
    double frameWidth,
    double frameHeight,
    double yawDegrees,
    double pitchDegrees,
    double rollDegrees,
    double? leftEyeOpenProbability,
    double? rightEyeOpenProbability,
    int? trackingId,
  });
}

/// @nodoc
class __$$FacePoseImplCopyWithImpl<$Res>
    extends _$FacePoseCopyWithImpl<$Res, _$FacePoseImpl>
    implements _$$FacePoseImplCopyWith<$Res> {
  __$$FacePoseImplCopyWithImpl(
    _$FacePoseImpl _value,
    $Res Function(_$FacePoseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FacePose
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boundingBoxLeft = null,
    Object? boundingBoxTop = null,
    Object? boundingBoxWidth = null,
    Object? boundingBoxHeight = null,
    Object? frameWidth = null,
    Object? frameHeight = null,
    Object? yawDegrees = null,
    Object? pitchDegrees = null,
    Object? rollDegrees = null,
    Object? leftEyeOpenProbability = freezed,
    Object? rightEyeOpenProbability = freezed,
    Object? trackingId = freezed,
  }) {
    return _then(
      _$FacePoseImpl(
        boundingBoxLeft: null == boundingBoxLeft
            ? _value.boundingBoxLeft
            : boundingBoxLeft // ignore: cast_nullable_to_non_nullable
                  as double,
        boundingBoxTop: null == boundingBoxTop
            ? _value.boundingBoxTop
            : boundingBoxTop // ignore: cast_nullable_to_non_nullable
                  as double,
        boundingBoxWidth: null == boundingBoxWidth
            ? _value.boundingBoxWidth
            : boundingBoxWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        boundingBoxHeight: null == boundingBoxHeight
            ? _value.boundingBoxHeight
            : boundingBoxHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        frameWidth: null == frameWidth
            ? _value.frameWidth
            : frameWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        frameHeight: null == frameHeight
            ? _value.frameHeight
            : frameHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        yawDegrees: null == yawDegrees
            ? _value.yawDegrees
            : yawDegrees // ignore: cast_nullable_to_non_nullable
                  as double,
        pitchDegrees: null == pitchDegrees
            ? _value.pitchDegrees
            : pitchDegrees // ignore: cast_nullable_to_non_nullable
                  as double,
        rollDegrees: null == rollDegrees
            ? _value.rollDegrees
            : rollDegrees // ignore: cast_nullable_to_non_nullable
                  as double,
        leftEyeOpenProbability: freezed == leftEyeOpenProbability
            ? _value.leftEyeOpenProbability
            : leftEyeOpenProbability // ignore: cast_nullable_to_non_nullable
                  as double?,
        rightEyeOpenProbability: freezed == rightEyeOpenProbability
            ? _value.rightEyeOpenProbability
            : rightEyeOpenProbability // ignore: cast_nullable_to_non_nullable
                  as double?,
        trackingId: freezed == trackingId
            ? _value.trackingId
            : trackingId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$FacePoseImpl extends _FacePose {
  const _$FacePoseImpl({
    required this.boundingBoxLeft,
    required this.boundingBoxTop,
    required this.boundingBoxWidth,
    required this.boundingBoxHeight,
    required this.frameWidth,
    required this.frameHeight,
    required this.yawDegrees,
    required this.pitchDegrees,
    required this.rollDegrees,
    this.leftEyeOpenProbability,
    this.rightEyeOpenProbability,
    required this.trackingId,
  }) : super._();

  @override
  final double boundingBoxLeft;
  @override
  final double boundingBoxTop;
  @override
  final double boundingBoxWidth;
  @override
  final double boundingBoxHeight;
  @override
  final double frameWidth;
  @override
  final double frameHeight;
  @override
  final double yawDegrees;
  @override
  final double pitchDegrees;
  @override
  final double rollDegrees;
  @override
  final double? leftEyeOpenProbability;
  @override
  final double? rightEyeOpenProbability;
  @override
  final int? trackingId;

  @override
  String toString() {
    return 'FacePose(boundingBoxLeft: $boundingBoxLeft, boundingBoxTop: $boundingBoxTop, boundingBoxWidth: $boundingBoxWidth, boundingBoxHeight: $boundingBoxHeight, frameWidth: $frameWidth, frameHeight: $frameHeight, yawDegrees: $yawDegrees, pitchDegrees: $pitchDegrees, rollDegrees: $rollDegrees, leftEyeOpenProbability: $leftEyeOpenProbability, rightEyeOpenProbability: $rightEyeOpenProbability, trackingId: $trackingId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacePoseImpl &&
            (identical(other.boundingBoxLeft, boundingBoxLeft) ||
                other.boundingBoxLeft == boundingBoxLeft) &&
            (identical(other.boundingBoxTop, boundingBoxTop) ||
                other.boundingBoxTop == boundingBoxTop) &&
            (identical(other.boundingBoxWidth, boundingBoxWidth) ||
                other.boundingBoxWidth == boundingBoxWidth) &&
            (identical(other.boundingBoxHeight, boundingBoxHeight) ||
                other.boundingBoxHeight == boundingBoxHeight) &&
            (identical(other.frameWidth, frameWidth) ||
                other.frameWidth == frameWidth) &&
            (identical(other.frameHeight, frameHeight) ||
                other.frameHeight == frameHeight) &&
            (identical(other.yawDegrees, yawDegrees) ||
                other.yawDegrees == yawDegrees) &&
            (identical(other.pitchDegrees, pitchDegrees) ||
                other.pitchDegrees == pitchDegrees) &&
            (identical(other.rollDegrees, rollDegrees) ||
                other.rollDegrees == rollDegrees) &&
            (identical(other.leftEyeOpenProbability, leftEyeOpenProbability) ||
                other.leftEyeOpenProbability == leftEyeOpenProbability) &&
            (identical(
                  other.rightEyeOpenProbability,
                  rightEyeOpenProbability,
                ) ||
                other.rightEyeOpenProbability == rightEyeOpenProbability) &&
            (identical(other.trackingId, trackingId) ||
                other.trackingId == trackingId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    boundingBoxLeft,
    boundingBoxTop,
    boundingBoxWidth,
    boundingBoxHeight,
    frameWidth,
    frameHeight,
    yawDegrees,
    pitchDegrees,
    rollDegrees,
    leftEyeOpenProbability,
    rightEyeOpenProbability,
    trackingId,
  );

  /// Create a copy of FacePose
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacePoseImplCopyWith<_$FacePoseImpl> get copyWith =>
      __$$FacePoseImplCopyWithImpl<_$FacePoseImpl>(this, _$identity);
}

abstract class _FacePose extends FacePose {
  const factory _FacePose({
    required final double boundingBoxLeft,
    required final double boundingBoxTop,
    required final double boundingBoxWidth,
    required final double boundingBoxHeight,
    required final double frameWidth,
    required final double frameHeight,
    required final double yawDegrees,
    required final double pitchDegrees,
    required final double rollDegrees,
    final double? leftEyeOpenProbability,
    final double? rightEyeOpenProbability,
    required final int? trackingId,
  }) = _$FacePoseImpl;
  const _FacePose._() : super._();

  @override
  double get boundingBoxLeft;
  @override
  double get boundingBoxTop;
  @override
  double get boundingBoxWidth;
  @override
  double get boundingBoxHeight;
  @override
  double get frameWidth;
  @override
  double get frameHeight;
  @override
  double get yawDegrees;
  @override
  double get pitchDegrees;
  @override
  double get rollDegrees;
  @override
  double? get leftEyeOpenProbability;
  @override
  double? get rightEyeOpenProbability;
  @override
  int? get trackingId;

  /// Create a copy of FacePose
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacePoseImplCopyWith<_$FacePoseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
