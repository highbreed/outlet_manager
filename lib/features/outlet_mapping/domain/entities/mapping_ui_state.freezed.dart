// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mapping_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MappingSessionUiState {

 MappingSession? get session;/// True only right after cold-start recovery found a `CAPTURING`
/// session that was actively being walked when the process died
/// (spec §56) — cleared the moment the employee taps Resume or Stop.
 bool get showResumePrompt;/// In-flight guard surfaced to the UI so a button can disable itself
/// during start/finish/abandon — the actual concurrency guard lives in
/// the notifier, this is display-only.
 bool get isBusy; String? get errorMessage; MappingCaptureSummary? get finishSummary; int get localSampleCount; int get pendingUploadCount;
/// Create a copy of MappingSessionUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MappingSessionUiStateCopyWith<MappingSessionUiState> get copyWith => _$MappingSessionUiStateCopyWithImpl<MappingSessionUiState>(this as MappingSessionUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MappingSessionUiState&&(identical(other.session, session) || other.session == session)&&(identical(other.showResumePrompt, showResumePrompt) || other.showResumePrompt == showResumePrompt)&&(identical(other.isBusy, isBusy) || other.isBusy == isBusy)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.finishSummary, finishSummary) || other.finishSummary == finishSummary)&&(identical(other.localSampleCount, localSampleCount) || other.localSampleCount == localSampleCount)&&(identical(other.pendingUploadCount, pendingUploadCount) || other.pendingUploadCount == pendingUploadCount));
}


@override
int get hashCode => Object.hash(runtimeType,session,showResumePrompt,isBusy,errorMessage,finishSummary,localSampleCount,pendingUploadCount);

@override
String toString() {
  return 'MappingSessionUiState(session: $session, showResumePrompt: $showResumePrompt, isBusy: $isBusy, errorMessage: $errorMessage, finishSummary: $finishSummary, localSampleCount: $localSampleCount, pendingUploadCount: $pendingUploadCount)';
}


}

/// @nodoc
abstract mixin class $MappingSessionUiStateCopyWith<$Res>  {
  factory $MappingSessionUiStateCopyWith(MappingSessionUiState value, $Res Function(MappingSessionUiState) _then) = _$MappingSessionUiStateCopyWithImpl;
@useResult
$Res call({
 MappingSession? session, bool showResumePrompt, bool isBusy, String? errorMessage, MappingCaptureSummary? finishSummary, int localSampleCount, int pendingUploadCount
});


$MappingSessionCopyWith<$Res>? get session;

}
/// @nodoc
class _$MappingSessionUiStateCopyWithImpl<$Res>
    implements $MappingSessionUiStateCopyWith<$Res> {
  _$MappingSessionUiStateCopyWithImpl(this._self, this._then);

  final MappingSessionUiState _self;
  final $Res Function(MappingSessionUiState) _then;

/// Create a copy of MappingSessionUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = freezed,Object? showResumePrompt = null,Object? isBusy = null,Object? errorMessage = freezed,Object? finishSummary = freezed,Object? localSampleCount = null,Object? pendingUploadCount = null,}) {
  return _then(_self.copyWith(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as MappingSession?,showResumePrompt: null == showResumePrompt ? _self.showResumePrompt : showResumePrompt // ignore: cast_nullable_to_non_nullable
as bool,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,finishSummary: freezed == finishSummary ? _self.finishSummary : finishSummary // ignore: cast_nullable_to_non_nullable
as MappingCaptureSummary?,localSampleCount: null == localSampleCount ? _self.localSampleCount : localSampleCount // ignore: cast_nullable_to_non_nullable
as int,pendingUploadCount: null == pendingUploadCount ? _self.pendingUploadCount : pendingUploadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of MappingSessionUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MappingSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $MappingSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [MappingSessionUiState].
extension MappingSessionUiStatePatterns on MappingSessionUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MappingSessionUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MappingSessionUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MappingSessionUiState value)  $default,){
final _that = this;
switch (_that) {
case _MappingSessionUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MappingSessionUiState value)?  $default,){
final _that = this;
switch (_that) {
case _MappingSessionUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MappingSession? session,  bool showResumePrompt,  bool isBusy,  String? errorMessage,  MappingCaptureSummary? finishSummary,  int localSampleCount,  int pendingUploadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MappingSessionUiState() when $default != null:
return $default(_that.session,_that.showResumePrompt,_that.isBusy,_that.errorMessage,_that.finishSummary,_that.localSampleCount,_that.pendingUploadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MappingSession? session,  bool showResumePrompt,  bool isBusy,  String? errorMessage,  MappingCaptureSummary? finishSummary,  int localSampleCount,  int pendingUploadCount)  $default,) {final _that = this;
switch (_that) {
case _MappingSessionUiState():
return $default(_that.session,_that.showResumePrompt,_that.isBusy,_that.errorMessage,_that.finishSummary,_that.localSampleCount,_that.pendingUploadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MappingSession? session,  bool showResumePrompt,  bool isBusy,  String? errorMessage,  MappingCaptureSummary? finishSummary,  int localSampleCount,  int pendingUploadCount)?  $default,) {final _that = this;
switch (_that) {
case _MappingSessionUiState() when $default != null:
return $default(_that.session,_that.showResumePrompt,_that.isBusy,_that.errorMessage,_that.finishSummary,_that.localSampleCount,_that.pendingUploadCount);case _:
  return null;

}
}

}

/// @nodoc


class _MappingSessionUiState implements MappingSessionUiState {
  const _MappingSessionUiState({this.session, this.showResumePrompt = false, this.isBusy = false, this.errorMessage, this.finishSummary, this.localSampleCount = 0, this.pendingUploadCount = 0});
  

@override final  MappingSession? session;
/// True only right after cold-start recovery found a `CAPTURING`
/// session that was actively being walked when the process died
/// (spec §56) — cleared the moment the employee taps Resume or Stop.
@override@JsonKey() final  bool showResumePrompt;
/// In-flight guard surfaced to the UI so a button can disable itself
/// during start/finish/abandon — the actual concurrency guard lives in
/// the notifier, this is display-only.
@override@JsonKey() final  bool isBusy;
@override final  String? errorMessage;
@override final  MappingCaptureSummary? finishSummary;
@override@JsonKey() final  int localSampleCount;
@override@JsonKey() final  int pendingUploadCount;

/// Create a copy of MappingSessionUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MappingSessionUiStateCopyWith<_MappingSessionUiState> get copyWith => __$MappingSessionUiStateCopyWithImpl<_MappingSessionUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MappingSessionUiState&&(identical(other.session, session) || other.session == session)&&(identical(other.showResumePrompt, showResumePrompt) || other.showResumePrompt == showResumePrompt)&&(identical(other.isBusy, isBusy) || other.isBusy == isBusy)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.finishSummary, finishSummary) || other.finishSummary == finishSummary)&&(identical(other.localSampleCount, localSampleCount) || other.localSampleCount == localSampleCount)&&(identical(other.pendingUploadCount, pendingUploadCount) || other.pendingUploadCount == pendingUploadCount));
}


@override
int get hashCode => Object.hash(runtimeType,session,showResumePrompt,isBusy,errorMessage,finishSummary,localSampleCount,pendingUploadCount);

@override
String toString() {
  return 'MappingSessionUiState(session: $session, showResumePrompt: $showResumePrompt, isBusy: $isBusy, errorMessage: $errorMessage, finishSummary: $finishSummary, localSampleCount: $localSampleCount, pendingUploadCount: $pendingUploadCount)';
}


}

/// @nodoc
abstract mixin class _$MappingSessionUiStateCopyWith<$Res> implements $MappingSessionUiStateCopyWith<$Res> {
  factory _$MappingSessionUiStateCopyWith(_MappingSessionUiState value, $Res Function(_MappingSessionUiState) _then) = __$MappingSessionUiStateCopyWithImpl;
@override @useResult
$Res call({
 MappingSession? session, bool showResumePrompt, bool isBusy, String? errorMessage, MappingCaptureSummary? finishSummary, int localSampleCount, int pendingUploadCount
});


@override $MappingSessionCopyWith<$Res>? get session;

}
/// @nodoc
class __$MappingSessionUiStateCopyWithImpl<$Res>
    implements _$MappingSessionUiStateCopyWith<$Res> {
  __$MappingSessionUiStateCopyWithImpl(this._self, this._then);

  final _MappingSessionUiState _self;
  final $Res Function(_MappingSessionUiState) _then;

/// Create a copy of MappingSessionUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = freezed,Object? showResumePrompt = null,Object? isBusy = null,Object? errorMessage = freezed,Object? finishSummary = freezed,Object? localSampleCount = null,Object? pendingUploadCount = null,}) {
  return _then(_MappingSessionUiState(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as MappingSession?,showResumePrompt: null == showResumePrompt ? _self.showResumePrompt : showResumePrompt // ignore: cast_nullable_to_non_nullable
as bool,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,finishSummary: freezed == finishSummary ? _self.finishSummary : finishSummary // ignore: cast_nullable_to_non_nullable
as MappingCaptureSummary?,localSampleCount: null == localSampleCount ? _self.localSampleCount : localSampleCount // ignore: cast_nullable_to_non_nullable
as int,pendingUploadCount: null == pendingUploadCount ? _self.pendingUploadCount : pendingUploadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of MappingSessionUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MappingSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $MappingSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
