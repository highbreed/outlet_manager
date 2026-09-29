// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_quality_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaceQualityResult {

 bool get acceptable; FaceQualityFailureReason get failureReason; double? get brightness; double? get blurScore; double? get faceAreaRatio;
/// Create a copy of FaceQualityResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceQualityResultCopyWith<FaceQualityResult> get copyWith => _$FaceQualityResultCopyWithImpl<FaceQualityResult>(this as FaceQualityResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceQualityResult&&(identical(other.acceptable, acceptable) || other.acceptable == acceptable)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.blurScore, blurScore) || other.blurScore == blurScore)&&(identical(other.faceAreaRatio, faceAreaRatio) || other.faceAreaRatio == faceAreaRatio));
}


@override
int get hashCode => Object.hash(runtimeType,acceptable,failureReason,brightness,blurScore,faceAreaRatio);

@override
String toString() {
  return 'FaceQualityResult(acceptable: $acceptable, failureReason: $failureReason, brightness: $brightness, blurScore: $blurScore, faceAreaRatio: $faceAreaRatio)';
}


}

/// @nodoc
abstract mixin class $FaceQualityResultCopyWith<$Res>  {
  factory $FaceQualityResultCopyWith(FaceQualityResult value, $Res Function(FaceQualityResult) _then) = _$FaceQualityResultCopyWithImpl;
@useResult
$Res call({
 bool acceptable, FaceQualityFailureReason failureReason, double? brightness, double? blurScore, double? faceAreaRatio
});




}
/// @nodoc
class _$FaceQualityResultCopyWithImpl<$Res>
    implements $FaceQualityResultCopyWith<$Res> {
  _$FaceQualityResultCopyWithImpl(this._self, this._then);

  final FaceQualityResult _self;
  final $Res Function(FaceQualityResult) _then;

/// Create a copy of FaceQualityResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? acceptable = null,Object? failureReason = null,Object? brightness = freezed,Object? blurScore = freezed,Object? faceAreaRatio = freezed,}) {
  return _then(_self.copyWith(
acceptable: null == acceptable ? _self.acceptable : acceptable // ignore: cast_nullable_to_non_nullable
as bool,failureReason: null == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as FaceQualityFailureReason,brightness: freezed == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as double?,blurScore: freezed == blurScore ? _self.blurScore : blurScore // ignore: cast_nullable_to_non_nullable
as double?,faceAreaRatio: freezed == faceAreaRatio ? _self.faceAreaRatio : faceAreaRatio // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceQualityResult].
extension FaceQualityResultPatterns on FaceQualityResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceQualityResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceQualityResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceQualityResult value)  $default,){
final _that = this;
switch (_that) {
case _FaceQualityResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceQualityResult value)?  $default,){
final _that = this;
switch (_that) {
case _FaceQualityResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool acceptable,  FaceQualityFailureReason failureReason,  double? brightness,  double? blurScore,  double? faceAreaRatio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceQualityResult() when $default != null:
return $default(_that.acceptable,_that.failureReason,_that.brightness,_that.blurScore,_that.faceAreaRatio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool acceptable,  FaceQualityFailureReason failureReason,  double? brightness,  double? blurScore,  double? faceAreaRatio)  $default,) {final _that = this;
switch (_that) {
case _FaceQualityResult():
return $default(_that.acceptable,_that.failureReason,_that.brightness,_that.blurScore,_that.faceAreaRatio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool acceptable,  FaceQualityFailureReason failureReason,  double? brightness,  double? blurScore,  double? faceAreaRatio)?  $default,) {final _that = this;
switch (_that) {
case _FaceQualityResult() when $default != null:
return $default(_that.acceptable,_that.failureReason,_that.brightness,_that.blurScore,_that.faceAreaRatio);case _:
  return null;

}
}

}

/// @nodoc


class _FaceQualityResult implements FaceQualityResult {
  const _FaceQualityResult({required this.acceptable, this.failureReason = FaceQualityFailureReason.none, this.brightness, this.blurScore, this.faceAreaRatio});
  

@override final  bool acceptable;
@override@JsonKey() final  FaceQualityFailureReason failureReason;
@override final  double? brightness;
@override final  double? blurScore;
@override final  double? faceAreaRatio;

/// Create a copy of FaceQualityResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceQualityResultCopyWith<_FaceQualityResult> get copyWith => __$FaceQualityResultCopyWithImpl<_FaceQualityResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceQualityResult&&(identical(other.acceptable, acceptable) || other.acceptable == acceptable)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.brightness, brightness) || other.brightness == brightness)&&(identical(other.blurScore, blurScore) || other.blurScore == blurScore)&&(identical(other.faceAreaRatio, faceAreaRatio) || other.faceAreaRatio == faceAreaRatio));
}


@override
int get hashCode => Object.hash(runtimeType,acceptable,failureReason,brightness,blurScore,faceAreaRatio);

@override
String toString() {
  return 'FaceQualityResult(acceptable: $acceptable, failureReason: $failureReason, brightness: $brightness, blurScore: $blurScore, faceAreaRatio: $faceAreaRatio)';
}


}

/// @nodoc
abstract mixin class _$FaceQualityResultCopyWith<$Res> implements $FaceQualityResultCopyWith<$Res> {
  factory _$FaceQualityResultCopyWith(_FaceQualityResult value, $Res Function(_FaceQualityResult) _then) = __$FaceQualityResultCopyWithImpl;
@override @useResult
$Res call({
 bool acceptable, FaceQualityFailureReason failureReason, double? brightness, double? blurScore, double? faceAreaRatio
});




}
/// @nodoc
class __$FaceQualityResultCopyWithImpl<$Res>
    implements _$FaceQualityResultCopyWith<$Res> {
  __$FaceQualityResultCopyWithImpl(this._self, this._then);

  final _FaceQualityResult _self;
  final $Res Function(_FaceQualityResult) _then;

/// Create a copy of FaceQualityResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? acceptable = null,Object? failureReason = null,Object? brightness = freezed,Object? blurScore = freezed,Object? faceAreaRatio = freezed,}) {
  return _then(_FaceQualityResult(
acceptable: null == acceptable ? _self.acceptable : acceptable // ignore: cast_nullable_to_non_nullable
as bool,failureReason: null == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as FaceQualityFailureReason,brightness: freezed == brightness ? _self.brightness : brightness // ignore: cast_nullable_to_non_nullable
as double?,blurScore: freezed == blurScore ? _self.blurScore : blurScore // ignore: cast_nullable_to_non_nullable
as double?,faceAreaRatio: freezed == faceAreaRatio ? _self.faceAreaRatio : faceAreaRatio // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
