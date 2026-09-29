// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_quality_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FaceQualityResult {
  bool get acceptable => throw _privateConstructorUsedError;
  FaceQualityFailureReason get failureReason =>
      throw _privateConstructorUsedError;
  double? get brightness => throw _privateConstructorUsedError;
  double? get blurScore => throw _privateConstructorUsedError;
  double? get faceAreaRatio => throw _privateConstructorUsedError;

  /// Create a copy of FaceQualityResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaceQualityResultCopyWith<FaceQualityResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaceQualityResultCopyWith<$Res> {
  factory $FaceQualityResultCopyWith(
    FaceQualityResult value,
    $Res Function(FaceQualityResult) then,
  ) = _$FaceQualityResultCopyWithImpl<$Res, FaceQualityResult>;
  @useResult
  $Res call({
    bool acceptable,
    FaceQualityFailureReason failureReason,
    double? brightness,
    double? blurScore,
    double? faceAreaRatio,
  });
}

/// @nodoc
class _$FaceQualityResultCopyWithImpl<$Res, $Val extends FaceQualityResult>
    implements $FaceQualityResultCopyWith<$Res> {
  _$FaceQualityResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaceQualityResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptable = null,
    Object? failureReason = null,
    Object? brightness = freezed,
    Object? blurScore = freezed,
    Object? faceAreaRatio = freezed,
  }) {
    return _then(
      _value.copyWith(
            acceptable: null == acceptable
                ? _value.acceptable
                : acceptable // ignore: cast_nullable_to_non_nullable
                      as bool,
            failureReason: null == failureReason
                ? _value.failureReason
                : failureReason // ignore: cast_nullable_to_non_nullable
                      as FaceQualityFailureReason,
            brightness: freezed == brightness
                ? _value.brightness
                : brightness // ignore: cast_nullable_to_non_nullable
                      as double?,
            blurScore: freezed == blurScore
                ? _value.blurScore
                : blurScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            faceAreaRatio: freezed == faceAreaRatio
                ? _value.faceAreaRatio
                : faceAreaRatio // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FaceQualityResultImplCopyWith<$Res>
    implements $FaceQualityResultCopyWith<$Res> {
  factory _$$FaceQualityResultImplCopyWith(
    _$FaceQualityResultImpl value,
    $Res Function(_$FaceQualityResultImpl) then,
  ) = __$$FaceQualityResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool acceptable,
    FaceQualityFailureReason failureReason,
    double? brightness,
    double? blurScore,
    double? faceAreaRatio,
  });
}

/// @nodoc
class __$$FaceQualityResultImplCopyWithImpl<$Res>
    extends _$FaceQualityResultCopyWithImpl<$Res, _$FaceQualityResultImpl>
    implements _$$FaceQualityResultImplCopyWith<$Res> {
  __$$FaceQualityResultImplCopyWithImpl(
    _$FaceQualityResultImpl _value,
    $Res Function(_$FaceQualityResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FaceQualityResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptable = null,
    Object? failureReason = null,
    Object? brightness = freezed,
    Object? blurScore = freezed,
    Object? faceAreaRatio = freezed,
  }) {
    return _then(
      _$FaceQualityResultImpl(
        acceptable: null == acceptable
            ? _value.acceptable
            : acceptable // ignore: cast_nullable_to_non_nullable
                  as bool,
        failureReason: null == failureReason
            ? _value.failureReason
            : failureReason // ignore: cast_nullable_to_non_nullable
                  as FaceQualityFailureReason,
        brightness: freezed == brightness
            ? _value.brightness
            : brightness // ignore: cast_nullable_to_non_nullable
                  as double?,
        blurScore: freezed == blurScore
            ? _value.blurScore
            : blurScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        faceAreaRatio: freezed == faceAreaRatio
            ? _value.faceAreaRatio
            : faceAreaRatio // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc

class _$FaceQualityResultImpl implements _FaceQualityResult {
  const _$FaceQualityResultImpl({
    required this.acceptable,
    this.failureReason = FaceQualityFailureReason.none,
    this.brightness,
    this.blurScore,
    this.faceAreaRatio,
  });

  @override
  final bool acceptable;
  @override
  @JsonKey()
  final FaceQualityFailureReason failureReason;
  @override
  final double? brightness;
  @override
  final double? blurScore;
  @override
  final double? faceAreaRatio;

  @override
  String toString() {
    return 'FaceQualityResult(acceptable: $acceptable, failureReason: $failureReason, brightness: $brightness, blurScore: $blurScore, faceAreaRatio: $faceAreaRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaceQualityResultImpl &&
            (identical(other.acceptable, acceptable) ||
                other.acceptable == acceptable) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            (identical(other.blurScore, blurScore) ||
                other.blurScore == blurScore) &&
            (identical(other.faceAreaRatio, faceAreaRatio) ||
                other.faceAreaRatio == faceAreaRatio));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    acceptable,
    failureReason,
    brightness,
    blurScore,
    faceAreaRatio,
  );

  /// Create a copy of FaceQualityResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaceQualityResultImplCopyWith<_$FaceQualityResultImpl> get copyWith =>
      __$$FaceQualityResultImplCopyWithImpl<_$FaceQualityResultImpl>(
        this,
        _$identity,
      );
}

abstract class _FaceQualityResult implements FaceQualityResult {
  const factory _FaceQualityResult({
    required final bool acceptable,
    final FaceQualityFailureReason failureReason,
    final double? brightness,
    final double? blurScore,
    final double? faceAreaRatio,
  }) = _$FaceQualityResultImpl;

  @override
  bool get acceptable;
  @override
  FaceQualityFailureReason get failureReason;
  @override
  double? get brightness;
  @override
  double? get blurScore;
  @override
  double? get faceAreaRatio;

  /// Create a copy of FaceQualityResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaceQualityResultImplCopyWith<_$FaceQualityResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
