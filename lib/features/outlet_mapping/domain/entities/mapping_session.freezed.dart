// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mapping_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MappingSession {

 String get localId; int get footprintId; int get mappingRequestId; String get visitLocalId;// Denormalized for the resume/recovery UI — never used for any
// decision, display only.
 String get outletId; String get outletCode; String get outletName;/// Security-critical (spec §19/§95) — every session belongs to exactly
/// one authenticated user; recovery/upload/finish/abandon all check
/// this against the CURRENT session before acting.
 String get ownerUserId; MappingLocalState get localState; DateTime get startedAt; DateTime? get serverTimeAtStart; DateTime? get lastSampleAt; DateTime? get captureFinishedLocalAt;/// Cached, but never blindly trusted — recomputed from actual
/// [MappingSample] rows on every cold-start recovery (spec §24).
 int get nextSequence; MappingCaptureLimits get limits; int? get recommendedIntervalMs;/// The backend's own `total_samples`/`samples_received` figure, from
/// the most recent `/samples` or `/capture-status` response — used as
/// a defensive floor (`max(localCount, this)`) when seeding the
/// `max_samples` guard on resume. Local row count alone is only a
/// correct total today because nothing currently deletes `synced`
/// rows during an active session; this field means that stays true
/// even if a future retention/cleanup pass starts deleting them.
 int? get lastKnownServerTotalSamples;/// Exact snapshot to restore on exit from mapping mode — never
/// hardcoded assumptions (spec §5/§6/§36/§37).
 double get preMappingDistanceFilter; double get preMappingHeartbeatInterval; Map<String, dynamic>? get preMappingExtras; int get configVersion; MappingFailureCode? get failureCode; String? get failureMessage; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of MappingSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MappingSessionCopyWith<MappingSession> get copyWith => _$MappingSessionCopyWithImpl<MappingSession>(this as MappingSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MappingSession&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.footprintId, footprintId) || other.footprintId == footprintId)&&(identical(other.mappingRequestId, mappingRequestId) || other.mappingRequestId == mappingRequestId)&&(identical(other.visitLocalId, visitLocalId) || other.visitLocalId == visitLocalId)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.localState, localState) || other.localState == localState)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.serverTimeAtStart, serverTimeAtStart) || other.serverTimeAtStart == serverTimeAtStart)&&(identical(other.lastSampleAt, lastSampleAt) || other.lastSampleAt == lastSampleAt)&&(identical(other.captureFinishedLocalAt, captureFinishedLocalAt) || other.captureFinishedLocalAt == captureFinishedLocalAt)&&(identical(other.nextSequence, nextSequence) || other.nextSequence == nextSequence)&&(identical(other.limits, limits) || other.limits == limits)&&(identical(other.recommendedIntervalMs, recommendedIntervalMs) || other.recommendedIntervalMs == recommendedIntervalMs)&&(identical(other.lastKnownServerTotalSamples, lastKnownServerTotalSamples) || other.lastKnownServerTotalSamples == lastKnownServerTotalSamples)&&(identical(other.preMappingDistanceFilter, preMappingDistanceFilter) || other.preMappingDistanceFilter == preMappingDistanceFilter)&&(identical(other.preMappingHeartbeatInterval, preMappingHeartbeatInterval) || other.preMappingHeartbeatInterval == preMappingHeartbeatInterval)&&const DeepCollectionEquality().equals(other.preMappingExtras, preMappingExtras)&&(identical(other.configVersion, configVersion) || other.configVersion == configVersion)&&(identical(other.failureCode, failureCode) || other.failureCode == failureCode)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,localId,footprintId,mappingRequestId,visitLocalId,outletId,outletCode,outletName,ownerUserId,localState,startedAt,serverTimeAtStart,lastSampleAt,captureFinishedLocalAt,nextSequence,limits,recommendedIntervalMs,lastKnownServerTotalSamples,preMappingDistanceFilter,preMappingHeartbeatInterval,const DeepCollectionEquality().hash(preMappingExtras),configVersion,failureCode,failureMessage,createdAt,updatedAt]);

@override
String toString() {
  return 'MappingSession(localId: $localId, footprintId: $footprintId, mappingRequestId: $mappingRequestId, visitLocalId: $visitLocalId, outletId: $outletId, outletCode: $outletCode, outletName: $outletName, ownerUserId: $ownerUserId, localState: $localState, startedAt: $startedAt, serverTimeAtStart: $serverTimeAtStart, lastSampleAt: $lastSampleAt, captureFinishedLocalAt: $captureFinishedLocalAt, nextSequence: $nextSequence, limits: $limits, recommendedIntervalMs: $recommendedIntervalMs, lastKnownServerTotalSamples: $lastKnownServerTotalSamples, preMappingDistanceFilter: $preMappingDistanceFilter, preMappingHeartbeatInterval: $preMappingHeartbeatInterval, preMappingExtras: $preMappingExtras, configVersion: $configVersion, failureCode: $failureCode, failureMessage: $failureMessage, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MappingSessionCopyWith<$Res>  {
  factory $MappingSessionCopyWith(MappingSession value, $Res Function(MappingSession) _then) = _$MappingSessionCopyWithImpl;
@useResult
$Res call({
 String localId, int footprintId, int mappingRequestId, String visitLocalId, String outletId, String outletCode, String outletName, String ownerUserId, MappingLocalState localState, DateTime startedAt, DateTime? serverTimeAtStart, DateTime? lastSampleAt, DateTime? captureFinishedLocalAt, int nextSequence, MappingCaptureLimits limits, int? recommendedIntervalMs, int? lastKnownServerTotalSamples, double preMappingDistanceFilter, double preMappingHeartbeatInterval, Map<String, dynamic>? preMappingExtras, int configVersion, MappingFailureCode? failureCode, String? failureMessage, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$MappingSessionCopyWithImpl<$Res>
    implements $MappingSessionCopyWith<$Res> {
  _$MappingSessionCopyWithImpl(this._self, this._then);

  final MappingSession _self;
  final $Res Function(MappingSession) _then;

/// Create a copy of MappingSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? footprintId = null,Object? mappingRequestId = null,Object? visitLocalId = null,Object? outletId = null,Object? outletCode = null,Object? outletName = null,Object? ownerUserId = null,Object? localState = null,Object? startedAt = null,Object? serverTimeAtStart = freezed,Object? lastSampleAt = freezed,Object? captureFinishedLocalAt = freezed,Object? nextSequence = null,Object? limits = null,Object? recommendedIntervalMs = freezed,Object? lastKnownServerTotalSamples = freezed,Object? preMappingDistanceFilter = null,Object? preMappingHeartbeatInterval = null,Object? preMappingExtras = freezed,Object? configVersion = null,Object? failureCode = freezed,Object? failureMessage = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,footprintId: null == footprintId ? _self.footprintId : footprintId // ignore: cast_nullable_to_non_nullable
as int,mappingRequestId: null == mappingRequestId ? _self.mappingRequestId : mappingRequestId // ignore: cast_nullable_to_non_nullable
as int,visitLocalId: null == visitLocalId ? _self.visitLocalId : visitLocalId // ignore: cast_nullable_to_non_nullable
as String,outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,outletCode: null == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String,outletName: null == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String,ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,localState: null == localState ? _self.localState : localState // ignore: cast_nullable_to_non_nullable
as MappingLocalState,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,serverTimeAtStart: freezed == serverTimeAtStart ? _self.serverTimeAtStart : serverTimeAtStart // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSampleAt: freezed == lastSampleAt ? _self.lastSampleAt : lastSampleAt // ignore: cast_nullable_to_non_nullable
as DateTime?,captureFinishedLocalAt: freezed == captureFinishedLocalAt ? _self.captureFinishedLocalAt : captureFinishedLocalAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextSequence: null == nextSequence ? _self.nextSequence : nextSequence // ignore: cast_nullable_to_non_nullable
as int,limits: null == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as MappingCaptureLimits,recommendedIntervalMs: freezed == recommendedIntervalMs ? _self.recommendedIntervalMs : recommendedIntervalMs // ignore: cast_nullable_to_non_nullable
as int?,lastKnownServerTotalSamples: freezed == lastKnownServerTotalSamples ? _self.lastKnownServerTotalSamples : lastKnownServerTotalSamples // ignore: cast_nullable_to_non_nullable
as int?,preMappingDistanceFilter: null == preMappingDistanceFilter ? _self.preMappingDistanceFilter : preMappingDistanceFilter // ignore: cast_nullable_to_non_nullable
as double,preMappingHeartbeatInterval: null == preMappingHeartbeatInterval ? _self.preMappingHeartbeatInterval : preMappingHeartbeatInterval // ignore: cast_nullable_to_non_nullable
as double,preMappingExtras: freezed == preMappingExtras ? _self.preMappingExtras : preMappingExtras // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,configVersion: null == configVersion ? _self.configVersion : configVersion // ignore: cast_nullable_to_non_nullable
as int,failureCode: freezed == failureCode ? _self.failureCode : failureCode // ignore: cast_nullable_to_non_nullable
as MappingFailureCode?,failureMessage: freezed == failureMessage ? _self.failureMessage : failureMessage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MappingSession].
extension MappingSessionPatterns on MappingSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MappingSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MappingSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MappingSession value)  $default,){
final _that = this;
switch (_that) {
case _MappingSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MappingSession value)?  $default,){
final _that = this;
switch (_that) {
case _MappingSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  int footprintId,  int mappingRequestId,  String visitLocalId,  String outletId,  String outletCode,  String outletName,  String ownerUserId,  MappingLocalState localState,  DateTime startedAt,  DateTime? serverTimeAtStart,  DateTime? lastSampleAt,  DateTime? captureFinishedLocalAt,  int nextSequence,  MappingCaptureLimits limits,  int? recommendedIntervalMs,  int? lastKnownServerTotalSamples,  double preMappingDistanceFilter,  double preMappingHeartbeatInterval,  Map<String, dynamic>? preMappingExtras,  int configVersion,  MappingFailureCode? failureCode,  String? failureMessage,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MappingSession() when $default != null:
return $default(_that.localId,_that.footprintId,_that.mappingRequestId,_that.visitLocalId,_that.outletId,_that.outletCode,_that.outletName,_that.ownerUserId,_that.localState,_that.startedAt,_that.serverTimeAtStart,_that.lastSampleAt,_that.captureFinishedLocalAt,_that.nextSequence,_that.limits,_that.recommendedIntervalMs,_that.lastKnownServerTotalSamples,_that.preMappingDistanceFilter,_that.preMappingHeartbeatInterval,_that.preMappingExtras,_that.configVersion,_that.failureCode,_that.failureMessage,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  int footprintId,  int mappingRequestId,  String visitLocalId,  String outletId,  String outletCode,  String outletName,  String ownerUserId,  MappingLocalState localState,  DateTime startedAt,  DateTime? serverTimeAtStart,  DateTime? lastSampleAt,  DateTime? captureFinishedLocalAt,  int nextSequence,  MappingCaptureLimits limits,  int? recommendedIntervalMs,  int? lastKnownServerTotalSamples,  double preMappingDistanceFilter,  double preMappingHeartbeatInterval,  Map<String, dynamic>? preMappingExtras,  int configVersion,  MappingFailureCode? failureCode,  String? failureMessage,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MappingSession():
return $default(_that.localId,_that.footprintId,_that.mappingRequestId,_that.visitLocalId,_that.outletId,_that.outletCode,_that.outletName,_that.ownerUserId,_that.localState,_that.startedAt,_that.serverTimeAtStart,_that.lastSampleAt,_that.captureFinishedLocalAt,_that.nextSequence,_that.limits,_that.recommendedIntervalMs,_that.lastKnownServerTotalSamples,_that.preMappingDistanceFilter,_that.preMappingHeartbeatInterval,_that.preMappingExtras,_that.configVersion,_that.failureCode,_that.failureMessage,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  int footprintId,  int mappingRequestId,  String visitLocalId,  String outletId,  String outletCode,  String outletName,  String ownerUserId,  MappingLocalState localState,  DateTime startedAt,  DateTime? serverTimeAtStart,  DateTime? lastSampleAt,  DateTime? captureFinishedLocalAt,  int nextSequence,  MappingCaptureLimits limits,  int? recommendedIntervalMs,  int? lastKnownServerTotalSamples,  double preMappingDistanceFilter,  double preMappingHeartbeatInterval,  Map<String, dynamic>? preMappingExtras,  int configVersion,  MappingFailureCode? failureCode,  String? failureMessage,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MappingSession() when $default != null:
return $default(_that.localId,_that.footprintId,_that.mappingRequestId,_that.visitLocalId,_that.outletId,_that.outletCode,_that.outletName,_that.ownerUserId,_that.localState,_that.startedAt,_that.serverTimeAtStart,_that.lastSampleAt,_that.captureFinishedLocalAt,_that.nextSequence,_that.limits,_that.recommendedIntervalMs,_that.lastKnownServerTotalSamples,_that.preMappingDistanceFilter,_that.preMappingHeartbeatInterval,_that.preMappingExtras,_that.configVersion,_that.failureCode,_that.failureMessage,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _MappingSession extends MappingSession {
  const _MappingSession({required this.localId, required this.footprintId, required this.mappingRequestId, required this.visitLocalId, required this.outletId, required this.outletCode, required this.outletName, required this.ownerUserId, required this.localState, required this.startedAt, this.serverTimeAtStart, this.lastSampleAt, this.captureFinishedLocalAt, this.nextSequence = 0, required this.limits, this.recommendedIntervalMs, this.lastKnownServerTotalSamples, required this.preMappingDistanceFilter, required this.preMappingHeartbeatInterval, final  Map<String, dynamic>? preMappingExtras, this.configVersion = 1, this.failureCode, this.failureMessage, required this.createdAt, required this.updatedAt}): _preMappingExtras = preMappingExtras,super._();
  

@override final  String localId;
@override final  int footprintId;
@override final  int mappingRequestId;
@override final  String visitLocalId;
// Denormalized for the resume/recovery UI — never used for any
// decision, display only.
@override final  String outletId;
@override final  String outletCode;
@override final  String outletName;
/// Security-critical (spec §19/§95) — every session belongs to exactly
/// one authenticated user; recovery/upload/finish/abandon all check
/// this against the CURRENT session before acting.
@override final  String ownerUserId;
@override final  MappingLocalState localState;
@override final  DateTime startedAt;
@override final  DateTime? serverTimeAtStart;
@override final  DateTime? lastSampleAt;
@override final  DateTime? captureFinishedLocalAt;
/// Cached, but never blindly trusted — recomputed from actual
/// [MappingSample] rows on every cold-start recovery (spec §24).
@override@JsonKey() final  int nextSequence;
@override final  MappingCaptureLimits limits;
@override final  int? recommendedIntervalMs;
/// The backend's own `total_samples`/`samples_received` figure, from
/// the most recent `/samples` or `/capture-status` response — used as
/// a defensive floor (`max(localCount, this)`) when seeding the
/// `max_samples` guard on resume. Local row count alone is only a
/// correct total today because nothing currently deletes `synced`
/// rows during an active session; this field means that stays true
/// even if a future retention/cleanup pass starts deleting them.
@override final  int? lastKnownServerTotalSamples;
/// Exact snapshot to restore on exit from mapping mode — never
/// hardcoded assumptions (spec §5/§6/§36/§37).
@override final  double preMappingDistanceFilter;
@override final  double preMappingHeartbeatInterval;
 final  Map<String, dynamic>? _preMappingExtras;
@override Map<String, dynamic>? get preMappingExtras {
  final value = _preMappingExtras;
  if (value == null) return null;
  if (_preMappingExtras is EqualUnmodifiableMapView) return _preMappingExtras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  int configVersion;
@override final  MappingFailureCode? failureCode;
@override final  String? failureMessage;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of MappingSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MappingSessionCopyWith<_MappingSession> get copyWith => __$MappingSessionCopyWithImpl<_MappingSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MappingSession&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.footprintId, footprintId) || other.footprintId == footprintId)&&(identical(other.mappingRequestId, mappingRequestId) || other.mappingRequestId == mappingRequestId)&&(identical(other.visitLocalId, visitLocalId) || other.visitLocalId == visitLocalId)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.ownerUserId, ownerUserId) || other.ownerUserId == ownerUserId)&&(identical(other.localState, localState) || other.localState == localState)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.serverTimeAtStart, serverTimeAtStart) || other.serverTimeAtStart == serverTimeAtStart)&&(identical(other.lastSampleAt, lastSampleAt) || other.lastSampleAt == lastSampleAt)&&(identical(other.captureFinishedLocalAt, captureFinishedLocalAt) || other.captureFinishedLocalAt == captureFinishedLocalAt)&&(identical(other.nextSequence, nextSequence) || other.nextSequence == nextSequence)&&(identical(other.limits, limits) || other.limits == limits)&&(identical(other.recommendedIntervalMs, recommendedIntervalMs) || other.recommendedIntervalMs == recommendedIntervalMs)&&(identical(other.lastKnownServerTotalSamples, lastKnownServerTotalSamples) || other.lastKnownServerTotalSamples == lastKnownServerTotalSamples)&&(identical(other.preMappingDistanceFilter, preMappingDistanceFilter) || other.preMappingDistanceFilter == preMappingDistanceFilter)&&(identical(other.preMappingHeartbeatInterval, preMappingHeartbeatInterval) || other.preMappingHeartbeatInterval == preMappingHeartbeatInterval)&&const DeepCollectionEquality().equals(other._preMappingExtras, _preMappingExtras)&&(identical(other.configVersion, configVersion) || other.configVersion == configVersion)&&(identical(other.failureCode, failureCode) || other.failureCode == failureCode)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,localId,footprintId,mappingRequestId,visitLocalId,outletId,outletCode,outletName,ownerUserId,localState,startedAt,serverTimeAtStart,lastSampleAt,captureFinishedLocalAt,nextSequence,limits,recommendedIntervalMs,lastKnownServerTotalSamples,preMappingDistanceFilter,preMappingHeartbeatInterval,const DeepCollectionEquality().hash(_preMappingExtras),configVersion,failureCode,failureMessage,createdAt,updatedAt]);

@override
String toString() {
  return 'MappingSession(localId: $localId, footprintId: $footprintId, mappingRequestId: $mappingRequestId, visitLocalId: $visitLocalId, outletId: $outletId, outletCode: $outletCode, outletName: $outletName, ownerUserId: $ownerUserId, localState: $localState, startedAt: $startedAt, serverTimeAtStart: $serverTimeAtStart, lastSampleAt: $lastSampleAt, captureFinishedLocalAt: $captureFinishedLocalAt, nextSequence: $nextSequence, limits: $limits, recommendedIntervalMs: $recommendedIntervalMs, lastKnownServerTotalSamples: $lastKnownServerTotalSamples, preMappingDistanceFilter: $preMappingDistanceFilter, preMappingHeartbeatInterval: $preMappingHeartbeatInterval, preMappingExtras: $preMappingExtras, configVersion: $configVersion, failureCode: $failureCode, failureMessage: $failureMessage, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MappingSessionCopyWith<$Res> implements $MappingSessionCopyWith<$Res> {
  factory _$MappingSessionCopyWith(_MappingSession value, $Res Function(_MappingSession) _then) = __$MappingSessionCopyWithImpl;
@override @useResult
$Res call({
 String localId, int footprintId, int mappingRequestId, String visitLocalId, String outletId, String outletCode, String outletName, String ownerUserId, MappingLocalState localState, DateTime startedAt, DateTime? serverTimeAtStart, DateTime? lastSampleAt, DateTime? captureFinishedLocalAt, int nextSequence, MappingCaptureLimits limits, int? recommendedIntervalMs, int? lastKnownServerTotalSamples, double preMappingDistanceFilter, double preMappingHeartbeatInterval, Map<String, dynamic>? preMappingExtras, int configVersion, MappingFailureCode? failureCode, String? failureMessage, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$MappingSessionCopyWithImpl<$Res>
    implements _$MappingSessionCopyWith<$Res> {
  __$MappingSessionCopyWithImpl(this._self, this._then);

  final _MappingSession _self;
  final $Res Function(_MappingSession) _then;

/// Create a copy of MappingSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? footprintId = null,Object? mappingRequestId = null,Object? visitLocalId = null,Object? outletId = null,Object? outletCode = null,Object? outletName = null,Object? ownerUserId = null,Object? localState = null,Object? startedAt = null,Object? serverTimeAtStart = freezed,Object? lastSampleAt = freezed,Object? captureFinishedLocalAt = freezed,Object? nextSequence = null,Object? limits = null,Object? recommendedIntervalMs = freezed,Object? lastKnownServerTotalSamples = freezed,Object? preMappingDistanceFilter = null,Object? preMappingHeartbeatInterval = null,Object? preMappingExtras = freezed,Object? configVersion = null,Object? failureCode = freezed,Object? failureMessage = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_MappingSession(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,footprintId: null == footprintId ? _self.footprintId : footprintId // ignore: cast_nullable_to_non_nullable
as int,mappingRequestId: null == mappingRequestId ? _self.mappingRequestId : mappingRequestId // ignore: cast_nullable_to_non_nullable
as int,visitLocalId: null == visitLocalId ? _self.visitLocalId : visitLocalId // ignore: cast_nullable_to_non_nullable
as String,outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,outletCode: null == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String,outletName: null == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String,ownerUserId: null == ownerUserId ? _self.ownerUserId : ownerUserId // ignore: cast_nullable_to_non_nullable
as String,localState: null == localState ? _self.localState : localState // ignore: cast_nullable_to_non_nullable
as MappingLocalState,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,serverTimeAtStart: freezed == serverTimeAtStart ? _self.serverTimeAtStart : serverTimeAtStart // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSampleAt: freezed == lastSampleAt ? _self.lastSampleAt : lastSampleAt // ignore: cast_nullable_to_non_nullable
as DateTime?,captureFinishedLocalAt: freezed == captureFinishedLocalAt ? _self.captureFinishedLocalAt : captureFinishedLocalAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextSequence: null == nextSequence ? _self.nextSequence : nextSequence // ignore: cast_nullable_to_non_nullable
as int,limits: null == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as MappingCaptureLimits,recommendedIntervalMs: freezed == recommendedIntervalMs ? _self.recommendedIntervalMs : recommendedIntervalMs // ignore: cast_nullable_to_non_nullable
as int?,lastKnownServerTotalSamples: freezed == lastKnownServerTotalSamples ? _self.lastKnownServerTotalSamples : lastKnownServerTotalSamples // ignore: cast_nullable_to_non_nullable
as int?,preMappingDistanceFilter: null == preMappingDistanceFilter ? _self.preMappingDistanceFilter : preMappingDistanceFilter // ignore: cast_nullable_to_non_nullable
as double,preMappingHeartbeatInterval: null == preMappingHeartbeatInterval ? _self.preMappingHeartbeatInterval : preMappingHeartbeatInterval // ignore: cast_nullable_to_non_nullable
as double,preMappingExtras: freezed == preMappingExtras ? _self._preMappingExtras : preMappingExtras // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,configVersion: null == configVersion ? _self.configVersion : configVersion // ignore: cast_nullable_to_non_nullable
as int,failureCode: freezed == failureCode ? _self.failureCode : failureCode // ignore: cast_nullable_to_non_nullable
as MappingFailureCode?,failureMessage: freezed == failureMessage ? _self.failureMessage : failureMessage // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
