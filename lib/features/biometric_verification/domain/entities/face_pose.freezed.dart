// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_pose.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacePose {

 double get boundingBoxLeft; double get boundingBoxTop; double get boundingBoxWidth; double get boundingBoxHeight; double get frameWidth; double get frameHeight; double get yawDegrees; double get pitchDegrees; double get rollDegrees; double? get leftEyeOpenProbability; double? get rightEyeOpenProbability; int? get trackingId;
/// Create a copy of FacePose
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacePoseCopyWith<FacePose> get copyWith => _$FacePoseCopyWithImpl<FacePose>(this as FacePose, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacePose&&(identical(other.boundingBoxLeft, boundingBoxLeft) || other.boundingBoxLeft == boundingBoxLeft)&&(identical(other.boundingBoxTop, boundingBoxTop) || other.boundingBoxTop == boundingBoxTop)&&(identical(other.boundingBoxWidth, boundingBoxWidth) || other.boundingBoxWidth == boundingBoxWidth)&&(identical(other.boundingBoxHeight, boundingBoxHeight) || other.boundingBoxHeight == boundingBoxHeight)&&(identical(other.frameWidth, frameWidth) || other.frameWidth == frameWidth)&&(identical(other.frameHeight, frameHeight) || other.frameHeight == frameHeight)&&(identical(other.yawDegrees, yawDegrees) || other.yawDegrees == yawDegrees)&&(identical(other.pitchDegrees, pitchDegrees) || other.pitchDegrees == pitchDegrees)&&(identical(other.rollDegrees, rollDegrees) || other.rollDegrees == rollDegrees)&&(identical(other.leftEyeOpenProbability, leftEyeOpenProbability) || other.leftEyeOpenProbability == leftEyeOpenProbability)&&(identical(other.rightEyeOpenProbability, rightEyeOpenProbability) || other.rightEyeOpenProbability == rightEyeOpenProbability)&&(identical(other.trackingId, trackingId) || other.trackingId == trackingId));
}


@override
int get hashCode => Object.hash(runtimeType,boundingBoxLeft,boundingBoxTop,boundingBoxWidth,boundingBoxHeight,frameWidth,frameHeight,yawDegrees,pitchDegrees,rollDegrees,leftEyeOpenProbability,rightEyeOpenProbability,trackingId);

@override
String toString() {
  return 'FacePose(boundingBoxLeft: $boundingBoxLeft, boundingBoxTop: $boundingBoxTop, boundingBoxWidth: $boundingBoxWidth, boundingBoxHeight: $boundingBoxHeight, frameWidth: $frameWidth, frameHeight: $frameHeight, yawDegrees: $yawDegrees, pitchDegrees: $pitchDegrees, rollDegrees: $rollDegrees, leftEyeOpenProbability: $leftEyeOpenProbability, rightEyeOpenProbability: $rightEyeOpenProbability, trackingId: $trackingId)';
}


}

/// @nodoc
abstract mixin class $FacePoseCopyWith<$Res>  {
  factory $FacePoseCopyWith(FacePose value, $Res Function(FacePose) _then) = _$FacePoseCopyWithImpl;
@useResult
$Res call({
 double boundingBoxLeft, double boundingBoxTop, double boundingBoxWidth, double boundingBoxHeight, double frameWidth, double frameHeight, double yawDegrees, double pitchDegrees, double rollDegrees, double? leftEyeOpenProbability, double? rightEyeOpenProbability, int? trackingId
});




}
/// @nodoc
class _$FacePoseCopyWithImpl<$Res>
    implements $FacePoseCopyWith<$Res> {
  _$FacePoseCopyWithImpl(this._self, this._then);

  final FacePose _self;
  final $Res Function(FacePose) _then;

/// Create a copy of FacePose
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? boundingBoxLeft = null,Object? boundingBoxTop = null,Object? boundingBoxWidth = null,Object? boundingBoxHeight = null,Object? frameWidth = null,Object? frameHeight = null,Object? yawDegrees = null,Object? pitchDegrees = null,Object? rollDegrees = null,Object? leftEyeOpenProbability = freezed,Object? rightEyeOpenProbability = freezed,Object? trackingId = freezed,}) {
  return _then(_self.copyWith(
boundingBoxLeft: null == boundingBoxLeft ? _self.boundingBoxLeft : boundingBoxLeft // ignore: cast_nullable_to_non_nullable
as double,boundingBoxTop: null == boundingBoxTop ? _self.boundingBoxTop : boundingBoxTop // ignore: cast_nullable_to_non_nullable
as double,boundingBoxWidth: null == boundingBoxWidth ? _self.boundingBoxWidth : boundingBoxWidth // ignore: cast_nullable_to_non_nullable
as double,boundingBoxHeight: null == boundingBoxHeight ? _self.boundingBoxHeight : boundingBoxHeight // ignore: cast_nullable_to_non_nullable
as double,frameWidth: null == frameWidth ? _self.frameWidth : frameWidth // ignore: cast_nullable_to_non_nullable
as double,frameHeight: null == frameHeight ? _self.frameHeight : frameHeight // ignore: cast_nullable_to_non_nullable
as double,yawDegrees: null == yawDegrees ? _self.yawDegrees : yawDegrees // ignore: cast_nullable_to_non_nullable
as double,pitchDegrees: null == pitchDegrees ? _self.pitchDegrees : pitchDegrees // ignore: cast_nullable_to_non_nullable
as double,rollDegrees: null == rollDegrees ? _self.rollDegrees : rollDegrees // ignore: cast_nullable_to_non_nullable
as double,leftEyeOpenProbability: freezed == leftEyeOpenProbability ? _self.leftEyeOpenProbability : leftEyeOpenProbability // ignore: cast_nullable_to_non_nullable
as double?,rightEyeOpenProbability: freezed == rightEyeOpenProbability ? _self.rightEyeOpenProbability : rightEyeOpenProbability // ignore: cast_nullable_to_non_nullable
as double?,trackingId: freezed == trackingId ? _self.trackingId : trackingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FacePose].
extension FacePosePatterns on FacePose {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacePose value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacePose() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacePose value)  $default,){
final _that = this;
switch (_that) {
case _FacePose():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacePose value)?  $default,){
final _that = this;
switch (_that) {
case _FacePose() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double boundingBoxLeft,  double boundingBoxTop,  double boundingBoxWidth,  double boundingBoxHeight,  double frameWidth,  double frameHeight,  double yawDegrees,  double pitchDegrees,  double rollDegrees,  double? leftEyeOpenProbability,  double? rightEyeOpenProbability,  int? trackingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacePose() when $default != null:
return $default(_that.boundingBoxLeft,_that.boundingBoxTop,_that.boundingBoxWidth,_that.boundingBoxHeight,_that.frameWidth,_that.frameHeight,_that.yawDegrees,_that.pitchDegrees,_that.rollDegrees,_that.leftEyeOpenProbability,_that.rightEyeOpenProbability,_that.trackingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double boundingBoxLeft,  double boundingBoxTop,  double boundingBoxWidth,  double boundingBoxHeight,  double frameWidth,  double frameHeight,  double yawDegrees,  double pitchDegrees,  double rollDegrees,  double? leftEyeOpenProbability,  double? rightEyeOpenProbability,  int? trackingId)  $default,) {final _that = this;
switch (_that) {
case _FacePose():
return $default(_that.boundingBoxLeft,_that.boundingBoxTop,_that.boundingBoxWidth,_that.boundingBoxHeight,_that.frameWidth,_that.frameHeight,_that.yawDegrees,_that.pitchDegrees,_that.rollDegrees,_that.leftEyeOpenProbability,_that.rightEyeOpenProbability,_that.trackingId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double boundingBoxLeft,  double boundingBoxTop,  double boundingBoxWidth,  double boundingBoxHeight,  double frameWidth,  double frameHeight,  double yawDegrees,  double pitchDegrees,  double rollDegrees,  double? leftEyeOpenProbability,  double? rightEyeOpenProbability,  int? trackingId)?  $default,) {final _that = this;
switch (_that) {
case _FacePose() when $default != null:
return $default(_that.boundingBoxLeft,_that.boundingBoxTop,_that.boundingBoxWidth,_that.boundingBoxHeight,_that.frameWidth,_that.frameHeight,_that.yawDegrees,_that.pitchDegrees,_that.rollDegrees,_that.leftEyeOpenProbability,_that.rightEyeOpenProbability,_that.trackingId);case _:
  return null;

}
}

}

/// @nodoc


class _FacePose extends FacePose {
  const _FacePose({required this.boundingBoxLeft, required this.boundingBoxTop, required this.boundingBoxWidth, required this.boundingBoxHeight, required this.frameWidth, required this.frameHeight, required this.yawDegrees, required this.pitchDegrees, required this.rollDegrees, this.leftEyeOpenProbability, this.rightEyeOpenProbability, required this.trackingId}): super._();
  

@override final  double boundingBoxLeft;
@override final  double boundingBoxTop;
@override final  double boundingBoxWidth;
@override final  double boundingBoxHeight;
@override final  double frameWidth;
@override final  double frameHeight;
@override final  double yawDegrees;
@override final  double pitchDegrees;
@override final  double rollDegrees;
@override final  double? leftEyeOpenProbability;
@override final  double? rightEyeOpenProbability;
@override final  int? trackingId;

/// Create a copy of FacePose
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacePoseCopyWith<_FacePose> get copyWith => __$FacePoseCopyWithImpl<_FacePose>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacePose&&(identical(other.boundingBoxLeft, boundingBoxLeft) || other.boundingBoxLeft == boundingBoxLeft)&&(identical(other.boundingBoxTop, boundingBoxTop) || other.boundingBoxTop == boundingBoxTop)&&(identical(other.boundingBoxWidth, boundingBoxWidth) || other.boundingBoxWidth == boundingBoxWidth)&&(identical(other.boundingBoxHeight, boundingBoxHeight) || other.boundingBoxHeight == boundingBoxHeight)&&(identical(other.frameWidth, frameWidth) || other.frameWidth == frameWidth)&&(identical(other.frameHeight, frameHeight) || other.frameHeight == frameHeight)&&(identical(other.yawDegrees, yawDegrees) || other.yawDegrees == yawDegrees)&&(identical(other.pitchDegrees, pitchDegrees) || other.pitchDegrees == pitchDegrees)&&(identical(other.rollDegrees, rollDegrees) || other.rollDegrees == rollDegrees)&&(identical(other.leftEyeOpenProbability, leftEyeOpenProbability) || other.leftEyeOpenProbability == leftEyeOpenProbability)&&(identical(other.rightEyeOpenProbability, rightEyeOpenProbability) || other.rightEyeOpenProbability == rightEyeOpenProbability)&&(identical(other.trackingId, trackingId) || other.trackingId == trackingId));
}


@override
int get hashCode => Object.hash(runtimeType,boundingBoxLeft,boundingBoxTop,boundingBoxWidth,boundingBoxHeight,frameWidth,frameHeight,yawDegrees,pitchDegrees,rollDegrees,leftEyeOpenProbability,rightEyeOpenProbability,trackingId);

@override
String toString() {
  return 'FacePose(boundingBoxLeft: $boundingBoxLeft, boundingBoxTop: $boundingBoxTop, boundingBoxWidth: $boundingBoxWidth, boundingBoxHeight: $boundingBoxHeight, frameWidth: $frameWidth, frameHeight: $frameHeight, yawDegrees: $yawDegrees, pitchDegrees: $pitchDegrees, rollDegrees: $rollDegrees, leftEyeOpenProbability: $leftEyeOpenProbability, rightEyeOpenProbability: $rightEyeOpenProbability, trackingId: $trackingId)';
}


}

/// @nodoc
abstract mixin class _$FacePoseCopyWith<$Res> implements $FacePoseCopyWith<$Res> {
  factory _$FacePoseCopyWith(_FacePose value, $Res Function(_FacePose) _then) = __$FacePoseCopyWithImpl;
@override @useResult
$Res call({
 double boundingBoxLeft, double boundingBoxTop, double boundingBoxWidth, double boundingBoxHeight, double frameWidth, double frameHeight, double yawDegrees, double pitchDegrees, double rollDegrees, double? leftEyeOpenProbability, double? rightEyeOpenProbability, int? trackingId
});




}
/// @nodoc
class __$FacePoseCopyWithImpl<$Res>
    implements _$FacePoseCopyWith<$Res> {
  __$FacePoseCopyWithImpl(this._self, this._then);

  final _FacePose _self;
  final $Res Function(_FacePose) _then;

/// Create a copy of FacePose
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? boundingBoxLeft = null,Object? boundingBoxTop = null,Object? boundingBoxWidth = null,Object? boundingBoxHeight = null,Object? frameWidth = null,Object? frameHeight = null,Object? yawDegrees = null,Object? pitchDegrees = null,Object? rollDegrees = null,Object? leftEyeOpenProbability = freezed,Object? rightEyeOpenProbability = freezed,Object? trackingId = freezed,}) {
  return _then(_FacePose(
boundingBoxLeft: null == boundingBoxLeft ? _self.boundingBoxLeft : boundingBoxLeft // ignore: cast_nullable_to_non_nullable
as double,boundingBoxTop: null == boundingBoxTop ? _self.boundingBoxTop : boundingBoxTop // ignore: cast_nullable_to_non_nullable
as double,boundingBoxWidth: null == boundingBoxWidth ? _self.boundingBoxWidth : boundingBoxWidth // ignore: cast_nullable_to_non_nullable
as double,boundingBoxHeight: null == boundingBoxHeight ? _self.boundingBoxHeight : boundingBoxHeight // ignore: cast_nullable_to_non_nullable
as double,frameWidth: null == frameWidth ? _self.frameWidth : frameWidth // ignore: cast_nullable_to_non_nullable
as double,frameHeight: null == frameHeight ? _self.frameHeight : frameHeight // ignore: cast_nullable_to_non_nullable
as double,yawDegrees: null == yawDegrees ? _self.yawDegrees : yawDegrees // ignore: cast_nullable_to_non_nullable
as double,pitchDegrees: null == pitchDegrees ? _self.pitchDegrees : pitchDegrees // ignore: cast_nullable_to_non_nullable
as double,rollDegrees: null == rollDegrees ? _self.rollDegrees : rollDegrees // ignore: cast_nullable_to_non_nullable
as double,leftEyeOpenProbability: freezed == leftEyeOpenProbability ? _self.leftEyeOpenProbability : leftEyeOpenProbability // ignore: cast_nullable_to_non_nullable
as double?,rightEyeOpenProbability: freezed == rightEyeOpenProbability ? _self.rightEyeOpenProbability : rightEyeOpenProbability // ignore: cast_nullable_to_non_nullable
as double?,trackingId: freezed == trackingId ? _self.trackingId : trackingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
