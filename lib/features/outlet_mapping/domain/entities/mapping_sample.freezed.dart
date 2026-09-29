// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mapping_sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MappingSample {

/// Local UUID — Isar row identity, distinct from [clientSampleId].
 String get localId; int get footprintId;/// Immutable once generated (spec §11/§23) — the backend dedup key,
/// together with footprintId. Never regenerated on retry.
 String get clientSampleId;/// Monotonic within a footprint (spec §24) — tie-breaker for equal
/// `recorded_at`.
 int get sequence; double get latitude; double get longitude; double get accuracyM; DateTime get recordedAt;// Diagnostic only — never read for any accept/reject/enforcement
// decision anywhere in this feature. See spec §6.
 double? get altitudeM; double? get verticalAccuracyM; String? get floorLabel; double? get speedMps; double? get headingDeg; String? get provider; bool? get isMock; MappingSampleSyncState get syncState; int get attemptCount; DateTime? get lastAttemptAt; String? get lastError; DateTime get createdAt;
/// Create a copy of MappingSample
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MappingSampleCopyWith<MappingSample> get copyWith => _$MappingSampleCopyWithImpl<MappingSample>(this as MappingSample, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MappingSample&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.footprintId, footprintId) || other.footprintId == footprintId)&&(identical(other.clientSampleId, clientSampleId) || other.clientSampleId == clientSampleId)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracyM, accuracyM) || other.accuracyM == accuracyM)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.altitudeM, altitudeM) || other.altitudeM == altitudeM)&&(identical(other.verticalAccuracyM, verticalAccuracyM) || other.verticalAccuracyM == verticalAccuracyM)&&(identical(other.floorLabel, floorLabel) || other.floorLabel == floorLabel)&&(identical(other.speedMps, speedMps) || other.speedMps == speedMps)&&(identical(other.headingDeg, headingDeg) || other.headingDeg == headingDeg)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.isMock, isMock) || other.isMock == isMock)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.attemptCount, attemptCount) || other.attemptCount == attemptCount)&&(identical(other.lastAttemptAt, lastAttemptAt) || other.lastAttemptAt == lastAttemptAt)&&(identical(other.lastError, lastError) || other.lastError == lastError)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,localId,footprintId,clientSampleId,sequence,latitude,longitude,accuracyM,recordedAt,altitudeM,verticalAccuracyM,floorLabel,speedMps,headingDeg,provider,isMock,syncState,attemptCount,lastAttemptAt,lastError,createdAt]);

@override
String toString() {
  return 'MappingSample(localId: $localId, footprintId: $footprintId, clientSampleId: $clientSampleId, sequence: $sequence, latitude: $latitude, longitude: $longitude, accuracyM: $accuracyM, recordedAt: $recordedAt, altitudeM: $altitudeM, verticalAccuracyM: $verticalAccuracyM, floorLabel: $floorLabel, speedMps: $speedMps, headingDeg: $headingDeg, provider: $provider, isMock: $isMock, syncState: $syncState, attemptCount: $attemptCount, lastAttemptAt: $lastAttemptAt, lastError: $lastError, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MappingSampleCopyWith<$Res>  {
  factory $MappingSampleCopyWith(MappingSample value, $Res Function(MappingSample) _then) = _$MappingSampleCopyWithImpl;
@useResult
$Res call({
 String localId, int footprintId, String clientSampleId, int sequence, double latitude, double longitude, double accuracyM, DateTime recordedAt, double? altitudeM, double? verticalAccuracyM, String? floorLabel, double? speedMps, double? headingDeg, String? provider, bool? isMock, MappingSampleSyncState syncState, int attemptCount, DateTime? lastAttemptAt, String? lastError, DateTime createdAt
});




}
/// @nodoc
class _$MappingSampleCopyWithImpl<$Res>
    implements $MappingSampleCopyWith<$Res> {
  _$MappingSampleCopyWithImpl(this._self, this._then);

  final MappingSample _self;
  final $Res Function(MappingSample) _then;

/// Create a copy of MappingSample
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? footprintId = null,Object? clientSampleId = null,Object? sequence = null,Object? latitude = null,Object? longitude = null,Object? accuracyM = null,Object? recordedAt = null,Object? altitudeM = freezed,Object? verticalAccuracyM = freezed,Object? floorLabel = freezed,Object? speedMps = freezed,Object? headingDeg = freezed,Object? provider = freezed,Object? isMock = freezed,Object? syncState = null,Object? attemptCount = null,Object? lastAttemptAt = freezed,Object? lastError = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,footprintId: null == footprintId ? _self.footprintId : footprintId // ignore: cast_nullable_to_non_nullable
as int,clientSampleId: null == clientSampleId ? _self.clientSampleId : clientSampleId // ignore: cast_nullable_to_non_nullable
as String,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracyM: null == accuracyM ? _self.accuracyM : accuracyM // ignore: cast_nullable_to_non_nullable
as double,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,altitudeM: freezed == altitudeM ? _self.altitudeM : altitudeM // ignore: cast_nullable_to_non_nullable
as double?,verticalAccuracyM: freezed == verticalAccuracyM ? _self.verticalAccuracyM : verticalAccuracyM // ignore: cast_nullable_to_non_nullable
as double?,floorLabel: freezed == floorLabel ? _self.floorLabel : floorLabel // ignore: cast_nullable_to_non_nullable
as String?,speedMps: freezed == speedMps ? _self.speedMps : speedMps // ignore: cast_nullable_to_non_nullable
as double?,headingDeg: freezed == headingDeg ? _self.headingDeg : headingDeg // ignore: cast_nullable_to_non_nullable
as double?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,isMock: freezed == isMock ? _self.isMock : isMock // ignore: cast_nullable_to_non_nullable
as bool?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as MappingSampleSyncState,attemptCount: null == attemptCount ? _self.attemptCount : attemptCount // ignore: cast_nullable_to_non_nullable
as int,lastAttemptAt: freezed == lastAttemptAt ? _self.lastAttemptAt : lastAttemptAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MappingSample].
extension MappingSamplePatterns on MappingSample {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MappingSample value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MappingSample() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MappingSample value)  $default,){
final _that = this;
switch (_that) {
case _MappingSample():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MappingSample value)?  $default,){
final _that = this;
switch (_that) {
case _MappingSample() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  int footprintId,  String clientSampleId,  int sequence,  double latitude,  double longitude,  double accuracyM,  DateTime recordedAt,  double? altitudeM,  double? verticalAccuracyM,  String? floorLabel,  double? speedMps,  double? headingDeg,  String? provider,  bool? isMock,  MappingSampleSyncState syncState,  int attemptCount,  DateTime? lastAttemptAt,  String? lastError,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MappingSample() when $default != null:
return $default(_that.localId,_that.footprintId,_that.clientSampleId,_that.sequence,_that.latitude,_that.longitude,_that.accuracyM,_that.recordedAt,_that.altitudeM,_that.verticalAccuracyM,_that.floorLabel,_that.speedMps,_that.headingDeg,_that.provider,_that.isMock,_that.syncState,_that.attemptCount,_that.lastAttemptAt,_that.lastError,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  int footprintId,  String clientSampleId,  int sequence,  double latitude,  double longitude,  double accuracyM,  DateTime recordedAt,  double? altitudeM,  double? verticalAccuracyM,  String? floorLabel,  double? speedMps,  double? headingDeg,  String? provider,  bool? isMock,  MappingSampleSyncState syncState,  int attemptCount,  DateTime? lastAttemptAt,  String? lastError,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MappingSample():
return $default(_that.localId,_that.footprintId,_that.clientSampleId,_that.sequence,_that.latitude,_that.longitude,_that.accuracyM,_that.recordedAt,_that.altitudeM,_that.verticalAccuracyM,_that.floorLabel,_that.speedMps,_that.headingDeg,_that.provider,_that.isMock,_that.syncState,_that.attemptCount,_that.lastAttemptAt,_that.lastError,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  int footprintId,  String clientSampleId,  int sequence,  double latitude,  double longitude,  double accuracyM,  DateTime recordedAt,  double? altitudeM,  double? verticalAccuracyM,  String? floorLabel,  double? speedMps,  double? headingDeg,  String? provider,  bool? isMock,  MappingSampleSyncState syncState,  int attemptCount,  DateTime? lastAttemptAt,  String? lastError,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MappingSample() when $default != null:
return $default(_that.localId,_that.footprintId,_that.clientSampleId,_that.sequence,_that.latitude,_that.longitude,_that.accuracyM,_that.recordedAt,_that.altitudeM,_that.verticalAccuracyM,_that.floorLabel,_that.speedMps,_that.headingDeg,_that.provider,_that.isMock,_that.syncState,_that.attemptCount,_that.lastAttemptAt,_that.lastError,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _MappingSample implements MappingSample {
  const _MappingSample({required this.localId, required this.footprintId, required this.clientSampleId, required this.sequence, required this.latitude, required this.longitude, required this.accuracyM, required this.recordedAt, this.altitudeM, this.verticalAccuracyM, this.floorLabel, this.speedMps, this.headingDeg, this.provider, this.isMock, this.syncState = MappingSampleSyncState.pending, this.attemptCount = 0, this.lastAttemptAt, this.lastError, required this.createdAt});
  

/// Local UUID — Isar row identity, distinct from [clientSampleId].
@override final  String localId;
@override final  int footprintId;
/// Immutable once generated (spec §11/§23) — the backend dedup key,
/// together with footprintId. Never regenerated on retry.
@override final  String clientSampleId;
/// Monotonic within a footprint (spec §24) — tie-breaker for equal
/// `recorded_at`.
@override final  int sequence;
@override final  double latitude;
@override final  double longitude;
@override final  double accuracyM;
@override final  DateTime recordedAt;
// Diagnostic only — never read for any accept/reject/enforcement
// decision anywhere in this feature. See spec §6.
@override final  double? altitudeM;
@override final  double? verticalAccuracyM;
@override final  String? floorLabel;
@override final  double? speedMps;
@override final  double? headingDeg;
@override final  String? provider;
@override final  bool? isMock;
@override@JsonKey() final  MappingSampleSyncState syncState;
@override@JsonKey() final  int attemptCount;
@override final  DateTime? lastAttemptAt;
@override final  String? lastError;
@override final  DateTime createdAt;

/// Create a copy of MappingSample
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MappingSampleCopyWith<_MappingSample> get copyWith => __$MappingSampleCopyWithImpl<_MappingSample>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MappingSample&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.footprintId, footprintId) || other.footprintId == footprintId)&&(identical(other.clientSampleId, clientSampleId) || other.clientSampleId == clientSampleId)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracyM, accuracyM) || other.accuracyM == accuracyM)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.altitudeM, altitudeM) || other.altitudeM == altitudeM)&&(identical(other.verticalAccuracyM, verticalAccuracyM) || other.verticalAccuracyM == verticalAccuracyM)&&(identical(other.floorLabel, floorLabel) || other.floorLabel == floorLabel)&&(identical(other.speedMps, speedMps) || other.speedMps == speedMps)&&(identical(other.headingDeg, headingDeg) || other.headingDeg == headingDeg)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.isMock, isMock) || other.isMock == isMock)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.attemptCount, attemptCount) || other.attemptCount == attemptCount)&&(identical(other.lastAttemptAt, lastAttemptAt) || other.lastAttemptAt == lastAttemptAt)&&(identical(other.lastError, lastError) || other.lastError == lastError)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,localId,footprintId,clientSampleId,sequence,latitude,longitude,accuracyM,recordedAt,altitudeM,verticalAccuracyM,floorLabel,speedMps,headingDeg,provider,isMock,syncState,attemptCount,lastAttemptAt,lastError,createdAt]);

@override
String toString() {
  return 'MappingSample(localId: $localId, footprintId: $footprintId, clientSampleId: $clientSampleId, sequence: $sequence, latitude: $latitude, longitude: $longitude, accuracyM: $accuracyM, recordedAt: $recordedAt, altitudeM: $altitudeM, verticalAccuracyM: $verticalAccuracyM, floorLabel: $floorLabel, speedMps: $speedMps, headingDeg: $headingDeg, provider: $provider, isMock: $isMock, syncState: $syncState, attemptCount: $attemptCount, lastAttemptAt: $lastAttemptAt, lastError: $lastError, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MappingSampleCopyWith<$Res> implements $MappingSampleCopyWith<$Res> {
  factory _$MappingSampleCopyWith(_MappingSample value, $Res Function(_MappingSample) _then) = __$MappingSampleCopyWithImpl;
@override @useResult
$Res call({
 String localId, int footprintId, String clientSampleId, int sequence, double latitude, double longitude, double accuracyM, DateTime recordedAt, double? altitudeM, double? verticalAccuracyM, String? floorLabel, double? speedMps, double? headingDeg, String? provider, bool? isMock, MappingSampleSyncState syncState, int attemptCount, DateTime? lastAttemptAt, String? lastError, DateTime createdAt
});




}
/// @nodoc
class __$MappingSampleCopyWithImpl<$Res>
    implements _$MappingSampleCopyWith<$Res> {
  __$MappingSampleCopyWithImpl(this._self, this._then);

  final _MappingSample _self;
  final $Res Function(_MappingSample) _then;

/// Create a copy of MappingSample
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? footprintId = null,Object? clientSampleId = null,Object? sequence = null,Object? latitude = null,Object? longitude = null,Object? accuracyM = null,Object? recordedAt = null,Object? altitudeM = freezed,Object? verticalAccuracyM = freezed,Object? floorLabel = freezed,Object? speedMps = freezed,Object? headingDeg = freezed,Object? provider = freezed,Object? isMock = freezed,Object? syncState = null,Object? attemptCount = null,Object? lastAttemptAt = freezed,Object? lastError = freezed,Object? createdAt = null,}) {
  return _then(_MappingSample(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,footprintId: null == footprintId ? _self.footprintId : footprintId // ignore: cast_nullable_to_non_nullable
as int,clientSampleId: null == clientSampleId ? _self.clientSampleId : clientSampleId // ignore: cast_nullable_to_non_nullable
as String,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracyM: null == accuracyM ? _self.accuracyM : accuracyM // ignore: cast_nullable_to_non_nullable
as double,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,altitudeM: freezed == altitudeM ? _self.altitudeM : altitudeM // ignore: cast_nullable_to_non_nullable
as double?,verticalAccuracyM: freezed == verticalAccuracyM ? _self.verticalAccuracyM : verticalAccuracyM // ignore: cast_nullable_to_non_nullable
as double?,floorLabel: freezed == floorLabel ? _self.floorLabel : floorLabel // ignore: cast_nullable_to_non_nullable
as String?,speedMps: freezed == speedMps ? _self.speedMps : speedMps // ignore: cast_nullable_to_non_nullable
as double?,headingDeg: freezed == headingDeg ? _self.headingDeg : headingDeg // ignore: cast_nullable_to_non_nullable
as double?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,isMock: freezed == isMock ? _self.isMock : isMock // ignore: cast_nullable_to_non_nullable
as bool?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as MappingSampleSyncState,attemptCount: null == attemptCount ? _self.attemptCount : attemptCount // ignore: cast_nullable_to_non_nullable
as int,lastAttemptAt: freezed == lastAttemptAt ? _self.lastAttemptAt : lastAttemptAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
