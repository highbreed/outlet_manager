// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liveness_challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LivenessChallenge {

 String get challengeId; List<LivenessAction> get actions; DateTime get expiresAt; BiometricPurpose get purpose;
/// Create a copy of LivenessChallenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivenessChallengeCopyWith<LivenessChallenge> get copyWith => _$LivenessChallengeCopyWithImpl<LivenessChallenge>(this as LivenessChallenge, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessChallenge&&(identical(other.challengeId, challengeId) || other.challengeId == challengeId)&&const DeepCollectionEquality().equals(other.actions, actions)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.purpose, purpose) || other.purpose == purpose));
}


@override
int get hashCode => Object.hash(runtimeType,challengeId,const DeepCollectionEquality().hash(actions),expiresAt,purpose);

@override
String toString() {
  return 'LivenessChallenge(challengeId: $challengeId, actions: $actions, expiresAt: $expiresAt, purpose: $purpose)';
}


}

/// @nodoc
abstract mixin class $LivenessChallengeCopyWith<$Res>  {
  factory $LivenessChallengeCopyWith(LivenessChallenge value, $Res Function(LivenessChallenge) _then) = _$LivenessChallengeCopyWithImpl;
@useResult
$Res call({
 String challengeId, List<LivenessAction> actions, DateTime expiresAt, BiometricPurpose purpose
});




}
/// @nodoc
class _$LivenessChallengeCopyWithImpl<$Res>
    implements $LivenessChallengeCopyWith<$Res> {
  _$LivenessChallengeCopyWithImpl(this._self, this._then);

  final LivenessChallenge _self;
  final $Res Function(LivenessChallenge) _then;

/// Create a copy of LivenessChallenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challengeId = null,Object? actions = null,Object? expiresAt = null,Object? purpose = null,}) {
  return _then(_self.copyWith(
challengeId: null == challengeId ? _self.challengeId : challengeId // ignore: cast_nullable_to_non_nullable
as String,actions: null == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as List<LivenessAction>,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as BiometricPurpose,
  ));
}

}


/// Adds pattern-matching-related methods to [LivenessChallenge].
extension LivenessChallengePatterns on LivenessChallenge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivenessChallenge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivenessChallenge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivenessChallenge value)  $default,){
final _that = this;
switch (_that) {
case _LivenessChallenge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivenessChallenge value)?  $default,){
final _that = this;
switch (_that) {
case _LivenessChallenge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String challengeId,  List<LivenessAction> actions,  DateTime expiresAt,  BiometricPurpose purpose)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivenessChallenge() when $default != null:
return $default(_that.challengeId,_that.actions,_that.expiresAt,_that.purpose);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String challengeId,  List<LivenessAction> actions,  DateTime expiresAt,  BiometricPurpose purpose)  $default,) {final _that = this;
switch (_that) {
case _LivenessChallenge():
return $default(_that.challengeId,_that.actions,_that.expiresAt,_that.purpose);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String challengeId,  List<LivenessAction> actions,  DateTime expiresAt,  BiometricPurpose purpose)?  $default,) {final _that = this;
switch (_that) {
case _LivenessChallenge() when $default != null:
return $default(_that.challengeId,_that.actions,_that.expiresAt,_that.purpose);case _:
  return null;

}
}

}

/// @nodoc


class _LivenessChallenge extends LivenessChallenge {
  const _LivenessChallenge({required this.challengeId, required final  List<LivenessAction> actions, required this.expiresAt, required this.purpose}): _actions = actions,super._();
  

@override final  String challengeId;
 final  List<LivenessAction> _actions;
@override List<LivenessAction> get actions {
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actions);
}

@override final  DateTime expiresAt;
@override final  BiometricPurpose purpose;

/// Create a copy of LivenessChallenge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivenessChallengeCopyWith<_LivenessChallenge> get copyWith => __$LivenessChallengeCopyWithImpl<_LivenessChallenge>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivenessChallenge&&(identical(other.challengeId, challengeId) || other.challengeId == challengeId)&&const DeepCollectionEquality().equals(other._actions, _actions)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.purpose, purpose) || other.purpose == purpose));
}


@override
int get hashCode => Object.hash(runtimeType,challengeId,const DeepCollectionEquality().hash(_actions),expiresAt,purpose);

@override
String toString() {
  return 'LivenessChallenge(challengeId: $challengeId, actions: $actions, expiresAt: $expiresAt, purpose: $purpose)';
}


}

/// @nodoc
abstract mixin class _$LivenessChallengeCopyWith<$Res> implements $LivenessChallengeCopyWith<$Res> {
  factory _$LivenessChallengeCopyWith(_LivenessChallenge value, $Res Function(_LivenessChallenge) _then) = __$LivenessChallengeCopyWithImpl;
@override @useResult
$Res call({
 String challengeId, List<LivenessAction> actions, DateTime expiresAt, BiometricPurpose purpose
});




}
/// @nodoc
class __$LivenessChallengeCopyWithImpl<$Res>
    implements _$LivenessChallengeCopyWith<$Res> {
  __$LivenessChallengeCopyWithImpl(this._self, this._then);

  final _LivenessChallenge _self;
  final $Res Function(_LivenessChallenge) _then;

/// Create a copy of LivenessChallenge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challengeId = null,Object? actions = null,Object? expiresAt = null,Object? purpose = null,}) {
  return _then(_LivenessChallenge(
challengeId: null == challengeId ? _self.challengeId : challengeId // ignore: cast_nullable_to_non_nullable
as String,actions: null == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<LivenessAction>,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as BiometricPurpose,
  ));
}


}

// dart format on
