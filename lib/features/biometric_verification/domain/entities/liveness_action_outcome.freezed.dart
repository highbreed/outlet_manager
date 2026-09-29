// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liveness_action_outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LivenessActionOutcome {

 LivenessAction get action; bool get satisfied; int get consecutiveQualifyingFrames; DateTime? get firstQualifyingObservationAt;
/// Create a copy of LivenessActionOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivenessActionOutcomeCopyWith<LivenessActionOutcome> get copyWith => _$LivenessActionOutcomeCopyWithImpl<LivenessActionOutcome>(this as LivenessActionOutcome, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessActionOutcome&&(identical(other.action, action) || other.action == action)&&(identical(other.satisfied, satisfied) || other.satisfied == satisfied)&&(identical(other.consecutiveQualifyingFrames, consecutiveQualifyingFrames) || other.consecutiveQualifyingFrames == consecutiveQualifyingFrames)&&(identical(other.firstQualifyingObservationAt, firstQualifyingObservationAt) || other.firstQualifyingObservationAt == firstQualifyingObservationAt));
}


@override
int get hashCode => Object.hash(runtimeType,action,satisfied,consecutiveQualifyingFrames,firstQualifyingObservationAt);

@override
String toString() {
  return 'LivenessActionOutcome(action: $action, satisfied: $satisfied, consecutiveQualifyingFrames: $consecutiveQualifyingFrames, firstQualifyingObservationAt: $firstQualifyingObservationAt)';
}


}

/// @nodoc
abstract mixin class $LivenessActionOutcomeCopyWith<$Res>  {
  factory $LivenessActionOutcomeCopyWith(LivenessActionOutcome value, $Res Function(LivenessActionOutcome) _then) = _$LivenessActionOutcomeCopyWithImpl;
@useResult
$Res call({
 LivenessAction action, bool satisfied, int consecutiveQualifyingFrames, DateTime? firstQualifyingObservationAt
});




}
/// @nodoc
class _$LivenessActionOutcomeCopyWithImpl<$Res>
    implements $LivenessActionOutcomeCopyWith<$Res> {
  _$LivenessActionOutcomeCopyWithImpl(this._self, this._then);

  final LivenessActionOutcome _self;
  final $Res Function(LivenessActionOutcome) _then;

/// Create a copy of LivenessActionOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = null,Object? satisfied = null,Object? consecutiveQualifyingFrames = null,Object? firstQualifyingObservationAt = freezed,}) {
  return _then(_self.copyWith(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as LivenessAction,satisfied: null == satisfied ? _self.satisfied : satisfied // ignore: cast_nullable_to_non_nullable
as bool,consecutiveQualifyingFrames: null == consecutiveQualifyingFrames ? _self.consecutiveQualifyingFrames : consecutiveQualifyingFrames // ignore: cast_nullable_to_non_nullable
as int,firstQualifyingObservationAt: freezed == firstQualifyingObservationAt ? _self.firstQualifyingObservationAt : firstQualifyingObservationAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LivenessActionOutcome].
extension LivenessActionOutcomePatterns on LivenessActionOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivenessActionOutcome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivenessActionOutcome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivenessActionOutcome value)  $default,){
final _that = this;
switch (_that) {
case _LivenessActionOutcome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivenessActionOutcome value)?  $default,){
final _that = this;
switch (_that) {
case _LivenessActionOutcome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LivenessAction action,  bool satisfied,  int consecutiveQualifyingFrames,  DateTime? firstQualifyingObservationAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivenessActionOutcome() when $default != null:
return $default(_that.action,_that.satisfied,_that.consecutiveQualifyingFrames,_that.firstQualifyingObservationAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LivenessAction action,  bool satisfied,  int consecutiveQualifyingFrames,  DateTime? firstQualifyingObservationAt)  $default,) {final _that = this;
switch (_that) {
case _LivenessActionOutcome():
return $default(_that.action,_that.satisfied,_that.consecutiveQualifyingFrames,_that.firstQualifyingObservationAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LivenessAction action,  bool satisfied,  int consecutiveQualifyingFrames,  DateTime? firstQualifyingObservationAt)?  $default,) {final _that = this;
switch (_that) {
case _LivenessActionOutcome() when $default != null:
return $default(_that.action,_that.satisfied,_that.consecutiveQualifyingFrames,_that.firstQualifyingObservationAt);case _:
  return null;

}
}

}

/// @nodoc


class _LivenessActionOutcome implements LivenessActionOutcome {
  const _LivenessActionOutcome({required this.action, this.satisfied = false, this.consecutiveQualifyingFrames = 0, this.firstQualifyingObservationAt});
  

@override final  LivenessAction action;
@override@JsonKey() final  bool satisfied;
@override@JsonKey() final  int consecutiveQualifyingFrames;
@override final  DateTime? firstQualifyingObservationAt;

/// Create a copy of LivenessActionOutcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivenessActionOutcomeCopyWith<_LivenessActionOutcome> get copyWith => __$LivenessActionOutcomeCopyWithImpl<_LivenessActionOutcome>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivenessActionOutcome&&(identical(other.action, action) || other.action == action)&&(identical(other.satisfied, satisfied) || other.satisfied == satisfied)&&(identical(other.consecutiveQualifyingFrames, consecutiveQualifyingFrames) || other.consecutiveQualifyingFrames == consecutiveQualifyingFrames)&&(identical(other.firstQualifyingObservationAt, firstQualifyingObservationAt) || other.firstQualifyingObservationAt == firstQualifyingObservationAt));
}


@override
int get hashCode => Object.hash(runtimeType,action,satisfied,consecutiveQualifyingFrames,firstQualifyingObservationAt);

@override
String toString() {
  return 'LivenessActionOutcome(action: $action, satisfied: $satisfied, consecutiveQualifyingFrames: $consecutiveQualifyingFrames, firstQualifyingObservationAt: $firstQualifyingObservationAt)';
}


}

/// @nodoc
abstract mixin class _$LivenessActionOutcomeCopyWith<$Res> implements $LivenessActionOutcomeCopyWith<$Res> {
  factory _$LivenessActionOutcomeCopyWith(_LivenessActionOutcome value, $Res Function(_LivenessActionOutcome) _then) = __$LivenessActionOutcomeCopyWithImpl;
@override @useResult
$Res call({
 LivenessAction action, bool satisfied, int consecutiveQualifyingFrames, DateTime? firstQualifyingObservationAt
});




}
/// @nodoc
class __$LivenessActionOutcomeCopyWithImpl<$Res>
    implements _$LivenessActionOutcomeCopyWith<$Res> {
  __$LivenessActionOutcomeCopyWithImpl(this._self, this._then);

  final _LivenessActionOutcome _self;
  final $Res Function(_LivenessActionOutcome) _then;

/// Create a copy of LivenessActionOutcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = null,Object? satisfied = null,Object? consecutiveQualifyingFrames = null,Object? firstQualifyingObservationAt = freezed,}) {
  return _then(_LivenessActionOutcome(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as LivenessAction,satisfied: null == satisfied ? _self.satisfied : satisfied // ignore: cast_nullable_to_non_nullable
as bool,consecutiveQualifyingFrames: null == consecutiveQualifyingFrames ? _self.consecutiveQualifyingFrames : consecutiveQualifyingFrames // ignore: cast_nullable_to_non_nullable
as int,firstQualifyingObservationAt: freezed == firstQualifyingObservationAt ? _self.firstQualifyingObservationAt : firstQualifyingObservationAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
