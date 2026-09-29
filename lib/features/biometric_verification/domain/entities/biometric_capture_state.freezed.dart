// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_capture_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BiometricCaptureState {

 String get captureSessionId; BiometricPhase get phase; LivenessChallenge? get challenge; int get currentActionIndex; List<LivenessActionOutcome> get actionOutcomes; FacePose? get currentFacePose; FaceQualityResult? get currentQuality; BiometricErrorReason? get errorReason; String? get verificationRequestId; String? get verificationId;
/// Create a copy of BiometricCaptureState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiometricCaptureStateCopyWith<BiometricCaptureState> get copyWith => _$BiometricCaptureStateCopyWithImpl<BiometricCaptureState>(this as BiometricCaptureState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricCaptureState&&(identical(other.captureSessionId, captureSessionId) || other.captureSessionId == captureSessionId)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.challenge, challenge) || other.challenge == challenge)&&(identical(other.currentActionIndex, currentActionIndex) || other.currentActionIndex == currentActionIndex)&&const DeepCollectionEquality().equals(other.actionOutcomes, actionOutcomes)&&(identical(other.currentFacePose, currentFacePose) || other.currentFacePose == currentFacePose)&&(identical(other.currentQuality, currentQuality) || other.currentQuality == currentQuality)&&(identical(other.errorReason, errorReason) || other.errorReason == errorReason)&&(identical(other.verificationRequestId, verificationRequestId) || other.verificationRequestId == verificationRequestId)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}


@override
int get hashCode => Object.hash(runtimeType,captureSessionId,phase,challenge,currentActionIndex,const DeepCollectionEquality().hash(actionOutcomes),currentFacePose,currentQuality,errorReason,verificationRequestId,verificationId);

@override
String toString() {
  return 'BiometricCaptureState(captureSessionId: $captureSessionId, phase: $phase, challenge: $challenge, currentActionIndex: $currentActionIndex, actionOutcomes: $actionOutcomes, currentFacePose: $currentFacePose, currentQuality: $currentQuality, errorReason: $errorReason, verificationRequestId: $verificationRequestId, verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class $BiometricCaptureStateCopyWith<$Res>  {
  factory $BiometricCaptureStateCopyWith(BiometricCaptureState value, $Res Function(BiometricCaptureState) _then) = _$BiometricCaptureStateCopyWithImpl;
@useResult
$Res call({
 String captureSessionId, BiometricPhase phase, LivenessChallenge? challenge, int currentActionIndex, List<LivenessActionOutcome> actionOutcomes, FacePose? currentFacePose, FaceQualityResult? currentQuality, BiometricErrorReason? errorReason, String? verificationRequestId, String? verificationId
});


$LivenessChallengeCopyWith<$Res>? get challenge;$FacePoseCopyWith<$Res>? get currentFacePose;$FaceQualityResultCopyWith<$Res>? get currentQuality;

}
/// @nodoc
class _$BiometricCaptureStateCopyWithImpl<$Res>
    implements $BiometricCaptureStateCopyWith<$Res> {
  _$BiometricCaptureStateCopyWithImpl(this._self, this._then);

  final BiometricCaptureState _self;
  final $Res Function(BiometricCaptureState) _then;

/// Create a copy of BiometricCaptureState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? captureSessionId = null,Object? phase = null,Object? challenge = freezed,Object? currentActionIndex = null,Object? actionOutcomes = null,Object? currentFacePose = freezed,Object? currentQuality = freezed,Object? errorReason = freezed,Object? verificationRequestId = freezed,Object? verificationId = freezed,}) {
  return _then(_self.copyWith(
captureSessionId: null == captureSessionId ? _self.captureSessionId : captureSessionId // ignore: cast_nullable_to_non_nullable
as String,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as BiometricPhase,challenge: freezed == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as LivenessChallenge?,currentActionIndex: null == currentActionIndex ? _self.currentActionIndex : currentActionIndex // ignore: cast_nullable_to_non_nullable
as int,actionOutcomes: null == actionOutcomes ? _self.actionOutcomes : actionOutcomes // ignore: cast_nullable_to_non_nullable
as List<LivenessActionOutcome>,currentFacePose: freezed == currentFacePose ? _self.currentFacePose : currentFacePose // ignore: cast_nullable_to_non_nullable
as FacePose?,currentQuality: freezed == currentQuality ? _self.currentQuality : currentQuality // ignore: cast_nullable_to_non_nullable
as FaceQualityResult?,errorReason: freezed == errorReason ? _self.errorReason : errorReason // ignore: cast_nullable_to_non_nullable
as BiometricErrorReason?,verificationRequestId: freezed == verificationRequestId ? _self.verificationRequestId : verificationRequestId // ignore: cast_nullable_to_non_nullable
as String?,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BiometricCaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivenessChallengeCopyWith<$Res>? get challenge {
    if (_self.challenge == null) {
    return null;
  }

  return $LivenessChallengeCopyWith<$Res>(_self.challenge!, (value) {
    return _then(_self.copyWith(challenge: value));
  });
}/// Create a copy of BiometricCaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacePoseCopyWith<$Res>? get currentFacePose {
    if (_self.currentFacePose == null) {
    return null;
  }

  return $FacePoseCopyWith<$Res>(_self.currentFacePose!, (value) {
    return _then(_self.copyWith(currentFacePose: value));
  });
}/// Create a copy of BiometricCaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaceQualityResultCopyWith<$Res>? get currentQuality {
    if (_self.currentQuality == null) {
    return null;
  }

  return $FaceQualityResultCopyWith<$Res>(_self.currentQuality!, (value) {
    return _then(_self.copyWith(currentQuality: value));
  });
}
}


/// Adds pattern-matching-related methods to [BiometricCaptureState].
extension BiometricCaptureStatePatterns on BiometricCaptureState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BiometricCaptureState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BiometricCaptureState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BiometricCaptureState value)  $default,){
final _that = this;
switch (_that) {
case _BiometricCaptureState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BiometricCaptureState value)?  $default,){
final _that = this;
switch (_that) {
case _BiometricCaptureState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String captureSessionId,  BiometricPhase phase,  LivenessChallenge? challenge,  int currentActionIndex,  List<LivenessActionOutcome> actionOutcomes,  FacePose? currentFacePose,  FaceQualityResult? currentQuality,  BiometricErrorReason? errorReason,  String? verificationRequestId,  String? verificationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BiometricCaptureState() when $default != null:
return $default(_that.captureSessionId,_that.phase,_that.challenge,_that.currentActionIndex,_that.actionOutcomes,_that.currentFacePose,_that.currentQuality,_that.errorReason,_that.verificationRequestId,_that.verificationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String captureSessionId,  BiometricPhase phase,  LivenessChallenge? challenge,  int currentActionIndex,  List<LivenessActionOutcome> actionOutcomes,  FacePose? currentFacePose,  FaceQualityResult? currentQuality,  BiometricErrorReason? errorReason,  String? verificationRequestId,  String? verificationId)  $default,) {final _that = this;
switch (_that) {
case _BiometricCaptureState():
return $default(_that.captureSessionId,_that.phase,_that.challenge,_that.currentActionIndex,_that.actionOutcomes,_that.currentFacePose,_that.currentQuality,_that.errorReason,_that.verificationRequestId,_that.verificationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String captureSessionId,  BiometricPhase phase,  LivenessChallenge? challenge,  int currentActionIndex,  List<LivenessActionOutcome> actionOutcomes,  FacePose? currentFacePose,  FaceQualityResult? currentQuality,  BiometricErrorReason? errorReason,  String? verificationRequestId,  String? verificationId)?  $default,) {final _that = this;
switch (_that) {
case _BiometricCaptureState() when $default != null:
return $default(_that.captureSessionId,_that.phase,_that.challenge,_that.currentActionIndex,_that.actionOutcomes,_that.currentFacePose,_that.currentQuality,_that.errorReason,_that.verificationRequestId,_that.verificationId);case _:
  return null;

}
}

}

/// @nodoc


class _BiometricCaptureState extends BiometricCaptureState {
  const _BiometricCaptureState({required this.captureSessionId, this.phase = BiometricPhase.idle, this.challenge, this.currentActionIndex = 0, final  List<LivenessActionOutcome> actionOutcomes = const [], this.currentFacePose, this.currentQuality, this.errorReason, this.verificationRequestId, this.verificationId}): _actionOutcomes = actionOutcomes,super._();
  

@override final  String captureSessionId;
@override@JsonKey() final  BiometricPhase phase;
@override final  LivenessChallenge? challenge;
@override@JsonKey() final  int currentActionIndex;
 final  List<LivenessActionOutcome> _actionOutcomes;
@override@JsonKey() List<LivenessActionOutcome> get actionOutcomes {
  if (_actionOutcomes is EqualUnmodifiableListView) return _actionOutcomes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actionOutcomes);
}

@override final  FacePose? currentFacePose;
@override final  FaceQualityResult? currentQuality;
@override final  BiometricErrorReason? errorReason;
@override final  String? verificationRequestId;
@override final  String? verificationId;

/// Create a copy of BiometricCaptureState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiometricCaptureStateCopyWith<_BiometricCaptureState> get copyWith => __$BiometricCaptureStateCopyWithImpl<_BiometricCaptureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiometricCaptureState&&(identical(other.captureSessionId, captureSessionId) || other.captureSessionId == captureSessionId)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.challenge, challenge) || other.challenge == challenge)&&(identical(other.currentActionIndex, currentActionIndex) || other.currentActionIndex == currentActionIndex)&&const DeepCollectionEquality().equals(other._actionOutcomes, _actionOutcomes)&&(identical(other.currentFacePose, currentFacePose) || other.currentFacePose == currentFacePose)&&(identical(other.currentQuality, currentQuality) || other.currentQuality == currentQuality)&&(identical(other.errorReason, errorReason) || other.errorReason == errorReason)&&(identical(other.verificationRequestId, verificationRequestId) || other.verificationRequestId == verificationRequestId)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}


@override
int get hashCode => Object.hash(runtimeType,captureSessionId,phase,challenge,currentActionIndex,const DeepCollectionEquality().hash(_actionOutcomes),currentFacePose,currentQuality,errorReason,verificationRequestId,verificationId);

@override
String toString() {
  return 'BiometricCaptureState(captureSessionId: $captureSessionId, phase: $phase, challenge: $challenge, currentActionIndex: $currentActionIndex, actionOutcomes: $actionOutcomes, currentFacePose: $currentFacePose, currentQuality: $currentQuality, errorReason: $errorReason, verificationRequestId: $verificationRequestId, verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class _$BiometricCaptureStateCopyWith<$Res> implements $BiometricCaptureStateCopyWith<$Res> {
  factory _$BiometricCaptureStateCopyWith(_BiometricCaptureState value, $Res Function(_BiometricCaptureState) _then) = __$BiometricCaptureStateCopyWithImpl;
@override @useResult
$Res call({
 String captureSessionId, BiometricPhase phase, LivenessChallenge? challenge, int currentActionIndex, List<LivenessActionOutcome> actionOutcomes, FacePose? currentFacePose, FaceQualityResult? currentQuality, BiometricErrorReason? errorReason, String? verificationRequestId, String? verificationId
});


@override $LivenessChallengeCopyWith<$Res>? get challenge;@override $FacePoseCopyWith<$Res>? get currentFacePose;@override $FaceQualityResultCopyWith<$Res>? get currentQuality;

}
/// @nodoc
class __$BiometricCaptureStateCopyWithImpl<$Res>
    implements _$BiometricCaptureStateCopyWith<$Res> {
  __$BiometricCaptureStateCopyWithImpl(this._self, this._then);

  final _BiometricCaptureState _self;
  final $Res Function(_BiometricCaptureState) _then;

/// Create a copy of BiometricCaptureState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? captureSessionId = null,Object? phase = null,Object? challenge = freezed,Object? currentActionIndex = null,Object? actionOutcomes = null,Object? currentFacePose = freezed,Object? currentQuality = freezed,Object? errorReason = freezed,Object? verificationRequestId = freezed,Object? verificationId = freezed,}) {
  return _then(_BiometricCaptureState(
captureSessionId: null == captureSessionId ? _self.captureSessionId : captureSessionId // ignore: cast_nullable_to_non_nullable
as String,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as BiometricPhase,challenge: freezed == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as LivenessChallenge?,currentActionIndex: null == currentActionIndex ? _self.currentActionIndex : currentActionIndex // ignore: cast_nullable_to_non_nullable
as int,actionOutcomes: null == actionOutcomes ? _self._actionOutcomes : actionOutcomes // ignore: cast_nullable_to_non_nullable
as List<LivenessActionOutcome>,currentFacePose: freezed == currentFacePose ? _self.currentFacePose : currentFacePose // ignore: cast_nullable_to_non_nullable
as FacePose?,currentQuality: freezed == currentQuality ? _self.currentQuality : currentQuality // ignore: cast_nullable_to_non_nullable
as FaceQualityResult?,errorReason: freezed == errorReason ? _self.errorReason : errorReason // ignore: cast_nullable_to_non_nullable
as BiometricErrorReason?,verificationRequestId: freezed == verificationRequestId ? _self.verificationRequestId : verificationRequestId // ignore: cast_nullable_to_non_nullable
as String?,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BiometricCaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivenessChallengeCopyWith<$Res>? get challenge {
    if (_self.challenge == null) {
    return null;
  }

  return $LivenessChallengeCopyWith<$Res>(_self.challenge!, (value) {
    return _then(_self.copyWith(challenge: value));
  });
}/// Create a copy of BiometricCaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FacePoseCopyWith<$Res>? get currentFacePose {
    if (_self.currentFacePose == null) {
    return null;
  }

  return $FacePoseCopyWith<$Res>(_self.currentFacePose!, (value) {
    return _then(_self.copyWith(currentFacePose: value));
  });
}/// Create a copy of BiometricCaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaceQualityResultCopyWith<$Res>? get currentQuality {
    if (_self.currentQuality == null) {
    return null;
  }

  return $FaceQualityResultCopyWith<$Res>(_self.currentQuality!, (value) {
    return _then(_self.copyWith(currentQuality: value));
  });
}
}

// dart format on
