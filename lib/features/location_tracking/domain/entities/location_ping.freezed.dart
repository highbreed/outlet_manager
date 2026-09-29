// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_ping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationPing {

/// Local UUID for deduplication
 String get localId;/// Backend ping_id after sync (null until synced)
 int? get serverId;// === Location Data ===
 double get latitude; double get longitude; double get accuracyMeters; double? get altitudeMeters; double? get speedMps; double? get headingDegrees;// === Device Context ===
/// Battery level 0-100
 int? get batteryLevel; bool? get isCharging;/// Network type: wifi, cellular, none
 String? get networkType;// === Tracking Metadata ===
 PingSource get pingSource;/// Device time when captured
 DateTime get recordedAt;/// When successfully sent to server
 DateTime? get syncedAt;// === Server Response ===
/// Server-suggested interval for next ping
 int? get nextPingSeconds; LocationPingSyncState get syncState;
/// Create a copy of LocationPing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationPingCopyWith<LocationPing> get copyWith => _$LocationPingCopyWithImpl<LocationPing>(this as LocationPing, _$identity);

  /// Serializes this LocationPing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationPing&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracyMeters, accuracyMeters) || other.accuracyMeters == accuracyMeters)&&(identical(other.altitudeMeters, altitudeMeters) || other.altitudeMeters == altitudeMeters)&&(identical(other.speedMps, speedMps) || other.speedMps == speedMps)&&(identical(other.headingDegrees, headingDegrees) || other.headingDegrees == headingDegrees)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.isCharging, isCharging) || other.isCharging == isCharging)&&(identical(other.networkType, networkType) || other.networkType == networkType)&&(identical(other.pingSource, pingSource) || other.pingSource == pingSource)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.syncedAt, syncedAt) || other.syncedAt == syncedAt)&&(identical(other.nextPingSeconds, nextPingSeconds) || other.nextPingSeconds == nextPingSeconds)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,serverId,latitude,longitude,accuracyMeters,altitudeMeters,speedMps,headingDegrees,batteryLevel,isCharging,networkType,pingSource,recordedAt,syncedAt,nextPingSeconds,syncState);

@override
String toString() {
  return 'LocationPing(localId: $localId, serverId: $serverId, latitude: $latitude, longitude: $longitude, accuracyMeters: $accuracyMeters, altitudeMeters: $altitudeMeters, speedMps: $speedMps, headingDegrees: $headingDegrees, batteryLevel: $batteryLevel, isCharging: $isCharging, networkType: $networkType, pingSource: $pingSource, recordedAt: $recordedAt, syncedAt: $syncedAt, nextPingSeconds: $nextPingSeconds, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class $LocationPingCopyWith<$Res>  {
  factory $LocationPingCopyWith(LocationPing value, $Res Function(LocationPing) _then) = _$LocationPingCopyWithImpl;
@useResult
$Res call({
 String localId, int? serverId, double latitude, double longitude, double accuracyMeters, double? altitudeMeters, double? speedMps, double? headingDegrees, int? batteryLevel, bool? isCharging, String? networkType, PingSource pingSource, DateTime recordedAt, DateTime? syncedAt, int? nextPingSeconds, LocationPingSyncState syncState
});




}
/// @nodoc
class _$LocationPingCopyWithImpl<$Res>
    implements $LocationPingCopyWith<$Res> {
  _$LocationPingCopyWithImpl(this._self, this._then);

  final LocationPing _self;
  final $Res Function(LocationPing) _then;

/// Create a copy of LocationPing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? serverId = freezed,Object? latitude = null,Object? longitude = null,Object? accuracyMeters = null,Object? altitudeMeters = freezed,Object? speedMps = freezed,Object? headingDegrees = freezed,Object? batteryLevel = freezed,Object? isCharging = freezed,Object? networkType = freezed,Object? pingSource = null,Object? recordedAt = null,Object? syncedAt = freezed,Object? nextPingSeconds = freezed,Object? syncState = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracyMeters: null == accuracyMeters ? _self.accuracyMeters : accuracyMeters // ignore: cast_nullable_to_non_nullable
as double,altitudeMeters: freezed == altitudeMeters ? _self.altitudeMeters : altitudeMeters // ignore: cast_nullable_to_non_nullable
as double?,speedMps: freezed == speedMps ? _self.speedMps : speedMps // ignore: cast_nullable_to_non_nullable
as double?,headingDegrees: freezed == headingDegrees ? _self.headingDegrees : headingDegrees // ignore: cast_nullable_to_non_nullable
as double?,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,isCharging: freezed == isCharging ? _self.isCharging : isCharging // ignore: cast_nullable_to_non_nullable
as bool?,networkType: freezed == networkType ? _self.networkType : networkType // ignore: cast_nullable_to_non_nullable
as String?,pingSource: null == pingSource ? _self.pingSource : pingSource // ignore: cast_nullable_to_non_nullable
as PingSource,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncedAt: freezed == syncedAt ? _self.syncedAt : syncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextPingSeconds: freezed == nextPingSeconds ? _self.nextPingSeconds : nextPingSeconds // ignore: cast_nullable_to_non_nullable
as int?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as LocationPingSyncState,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationPing].
extension LocationPingPatterns on LocationPing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationPing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationPing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationPing value)  $default,){
final _that = this;
switch (_that) {
case _LocationPing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationPing value)?  $default,){
final _that = this;
switch (_that) {
case _LocationPing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  int? serverId,  double latitude,  double longitude,  double accuracyMeters,  double? altitudeMeters,  double? speedMps,  double? headingDegrees,  int? batteryLevel,  bool? isCharging,  String? networkType,  PingSource pingSource,  DateTime recordedAt,  DateTime? syncedAt,  int? nextPingSeconds,  LocationPingSyncState syncState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationPing() when $default != null:
return $default(_that.localId,_that.serverId,_that.latitude,_that.longitude,_that.accuracyMeters,_that.altitudeMeters,_that.speedMps,_that.headingDegrees,_that.batteryLevel,_that.isCharging,_that.networkType,_that.pingSource,_that.recordedAt,_that.syncedAt,_that.nextPingSeconds,_that.syncState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  int? serverId,  double latitude,  double longitude,  double accuracyMeters,  double? altitudeMeters,  double? speedMps,  double? headingDegrees,  int? batteryLevel,  bool? isCharging,  String? networkType,  PingSource pingSource,  DateTime recordedAt,  DateTime? syncedAt,  int? nextPingSeconds,  LocationPingSyncState syncState)  $default,) {final _that = this;
switch (_that) {
case _LocationPing():
return $default(_that.localId,_that.serverId,_that.latitude,_that.longitude,_that.accuracyMeters,_that.altitudeMeters,_that.speedMps,_that.headingDegrees,_that.batteryLevel,_that.isCharging,_that.networkType,_that.pingSource,_that.recordedAt,_that.syncedAt,_that.nextPingSeconds,_that.syncState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  int? serverId,  double latitude,  double longitude,  double accuracyMeters,  double? altitudeMeters,  double? speedMps,  double? headingDegrees,  int? batteryLevel,  bool? isCharging,  String? networkType,  PingSource pingSource,  DateTime recordedAt,  DateTime? syncedAt,  int? nextPingSeconds,  LocationPingSyncState syncState)?  $default,) {final _that = this;
switch (_that) {
case _LocationPing() when $default != null:
return $default(_that.localId,_that.serverId,_that.latitude,_that.longitude,_that.accuracyMeters,_that.altitudeMeters,_that.speedMps,_that.headingDegrees,_that.batteryLevel,_that.isCharging,_that.networkType,_that.pingSource,_that.recordedAt,_that.syncedAt,_that.nextPingSeconds,_that.syncState);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationPing implements LocationPing {
  const _LocationPing({required this.localId, this.serverId, required this.latitude, required this.longitude, required this.accuracyMeters, this.altitudeMeters, this.speedMps, this.headingDegrees, this.batteryLevel, this.isCharging, this.networkType, required this.pingSource, required this.recordedAt, this.syncedAt, this.nextPingSeconds, this.syncState = LocationPingSyncState.pending});
  factory _LocationPing.fromJson(Map<String, dynamic> json) => _$LocationPingFromJson(json);

/// Local UUID for deduplication
@override final  String localId;
/// Backend ping_id after sync (null until synced)
@override final  int? serverId;
// === Location Data ===
@override final  double latitude;
@override final  double longitude;
@override final  double accuracyMeters;
@override final  double? altitudeMeters;
@override final  double? speedMps;
@override final  double? headingDegrees;
// === Device Context ===
/// Battery level 0-100
@override final  int? batteryLevel;
@override final  bool? isCharging;
/// Network type: wifi, cellular, none
@override final  String? networkType;
// === Tracking Metadata ===
@override final  PingSource pingSource;
/// Device time when captured
@override final  DateTime recordedAt;
/// When successfully sent to server
@override final  DateTime? syncedAt;
// === Server Response ===
/// Server-suggested interval for next ping
@override final  int? nextPingSeconds;
@override@JsonKey() final  LocationPingSyncState syncState;

/// Create a copy of LocationPing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationPingCopyWith<_LocationPing> get copyWith => __$LocationPingCopyWithImpl<_LocationPing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationPingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationPing&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracyMeters, accuracyMeters) || other.accuracyMeters == accuracyMeters)&&(identical(other.altitudeMeters, altitudeMeters) || other.altitudeMeters == altitudeMeters)&&(identical(other.speedMps, speedMps) || other.speedMps == speedMps)&&(identical(other.headingDegrees, headingDegrees) || other.headingDegrees == headingDegrees)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.isCharging, isCharging) || other.isCharging == isCharging)&&(identical(other.networkType, networkType) || other.networkType == networkType)&&(identical(other.pingSource, pingSource) || other.pingSource == pingSource)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.syncedAt, syncedAt) || other.syncedAt == syncedAt)&&(identical(other.nextPingSeconds, nextPingSeconds) || other.nextPingSeconds == nextPingSeconds)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,serverId,latitude,longitude,accuracyMeters,altitudeMeters,speedMps,headingDegrees,batteryLevel,isCharging,networkType,pingSource,recordedAt,syncedAt,nextPingSeconds,syncState);

@override
String toString() {
  return 'LocationPing(localId: $localId, serverId: $serverId, latitude: $latitude, longitude: $longitude, accuracyMeters: $accuracyMeters, altitudeMeters: $altitudeMeters, speedMps: $speedMps, headingDegrees: $headingDegrees, batteryLevel: $batteryLevel, isCharging: $isCharging, networkType: $networkType, pingSource: $pingSource, recordedAt: $recordedAt, syncedAt: $syncedAt, nextPingSeconds: $nextPingSeconds, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class _$LocationPingCopyWith<$Res> implements $LocationPingCopyWith<$Res> {
  factory _$LocationPingCopyWith(_LocationPing value, $Res Function(_LocationPing) _then) = __$LocationPingCopyWithImpl;
@override @useResult
$Res call({
 String localId, int? serverId, double latitude, double longitude, double accuracyMeters, double? altitudeMeters, double? speedMps, double? headingDegrees, int? batteryLevel, bool? isCharging, String? networkType, PingSource pingSource, DateTime recordedAt, DateTime? syncedAt, int? nextPingSeconds, LocationPingSyncState syncState
});




}
/// @nodoc
class __$LocationPingCopyWithImpl<$Res>
    implements _$LocationPingCopyWith<$Res> {
  __$LocationPingCopyWithImpl(this._self, this._then);

  final _LocationPing _self;
  final $Res Function(_LocationPing) _then;

/// Create a copy of LocationPing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? serverId = freezed,Object? latitude = null,Object? longitude = null,Object? accuracyMeters = null,Object? altitudeMeters = freezed,Object? speedMps = freezed,Object? headingDegrees = freezed,Object? batteryLevel = freezed,Object? isCharging = freezed,Object? networkType = freezed,Object? pingSource = null,Object? recordedAt = null,Object? syncedAt = freezed,Object? nextPingSeconds = freezed,Object? syncState = null,}) {
  return _then(_LocationPing(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracyMeters: null == accuracyMeters ? _self.accuracyMeters : accuracyMeters // ignore: cast_nullable_to_non_nullable
as double,altitudeMeters: freezed == altitudeMeters ? _self.altitudeMeters : altitudeMeters // ignore: cast_nullable_to_non_nullable
as double?,speedMps: freezed == speedMps ? _self.speedMps : speedMps // ignore: cast_nullable_to_non_nullable
as double?,headingDegrees: freezed == headingDegrees ? _self.headingDegrees : headingDegrees // ignore: cast_nullable_to_non_nullable
as double?,batteryLevel: freezed == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int?,isCharging: freezed == isCharging ? _self.isCharging : isCharging // ignore: cast_nullable_to_non_nullable
as bool?,networkType: freezed == networkType ? _self.networkType : networkType // ignore: cast_nullable_to_non_nullable
as String?,pingSource: null == pingSource ? _self.pingSource : pingSource // ignore: cast_nullable_to_non_nullable
as PingSource,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,syncedAt: freezed == syncedAt ? _self.syncedAt : syncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextPingSeconds: freezed == nextPingSeconds ? _self.nextPingSeconds : nextPingSeconds // ignore: cast_nullable_to_non_nullable
as int?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as LocationPingSyncState,
  ));
}


}


/// @nodoc
mixin _$LocationPingResponse {

 bool get success; int get pingId; int? get nextPingSeconds; DateTime get serverTime; bool get isDuplicate;
/// Create a copy of LocationPingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationPingResponseCopyWith<LocationPingResponse> get copyWith => _$LocationPingResponseCopyWithImpl<LocationPingResponse>(this as LocationPingResponse, _$identity);

  /// Serializes this LocationPingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationPingResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.pingId, pingId) || other.pingId == pingId)&&(identical(other.nextPingSeconds, nextPingSeconds) || other.nextPingSeconds == nextPingSeconds)&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime)&&(identical(other.isDuplicate, isDuplicate) || other.isDuplicate == isDuplicate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,pingId,nextPingSeconds,serverTime,isDuplicate);

@override
String toString() {
  return 'LocationPingResponse(success: $success, pingId: $pingId, nextPingSeconds: $nextPingSeconds, serverTime: $serverTime, isDuplicate: $isDuplicate)';
}


}

/// @nodoc
abstract mixin class $LocationPingResponseCopyWith<$Res>  {
  factory $LocationPingResponseCopyWith(LocationPingResponse value, $Res Function(LocationPingResponse) _then) = _$LocationPingResponseCopyWithImpl;
@useResult
$Res call({
 bool success, int pingId, int? nextPingSeconds, DateTime serverTime, bool isDuplicate
});




}
/// @nodoc
class _$LocationPingResponseCopyWithImpl<$Res>
    implements $LocationPingResponseCopyWith<$Res> {
  _$LocationPingResponseCopyWithImpl(this._self, this._then);

  final LocationPingResponse _self;
  final $Res Function(LocationPingResponse) _then;

/// Create a copy of LocationPingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? pingId = null,Object? nextPingSeconds = freezed,Object? serverTime = null,Object? isDuplicate = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,pingId: null == pingId ? _self.pingId : pingId // ignore: cast_nullable_to_non_nullable
as int,nextPingSeconds: freezed == nextPingSeconds ? _self.nextPingSeconds : nextPingSeconds // ignore: cast_nullable_to_non_nullable
as int?,serverTime: null == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as DateTime,isDuplicate: null == isDuplicate ? _self.isDuplicate : isDuplicate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationPingResponse].
extension LocationPingResponsePatterns on LocationPingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationPingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationPingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationPingResponse value)  $default,){
final _that = this;
switch (_that) {
case _LocationPingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationPingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LocationPingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int pingId,  int? nextPingSeconds,  DateTime serverTime,  bool isDuplicate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationPingResponse() when $default != null:
return $default(_that.success,_that.pingId,_that.nextPingSeconds,_that.serverTime,_that.isDuplicate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int pingId,  int? nextPingSeconds,  DateTime serverTime,  bool isDuplicate)  $default,) {final _that = this;
switch (_that) {
case _LocationPingResponse():
return $default(_that.success,_that.pingId,_that.nextPingSeconds,_that.serverTime,_that.isDuplicate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int pingId,  int? nextPingSeconds,  DateTime serverTime,  bool isDuplicate)?  $default,) {final _that = this;
switch (_that) {
case _LocationPingResponse() when $default != null:
return $default(_that.success,_that.pingId,_that.nextPingSeconds,_that.serverTime,_that.isDuplicate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationPingResponse implements LocationPingResponse {
  const _LocationPingResponse({required this.success, required this.pingId, this.nextPingSeconds, required this.serverTime, required this.isDuplicate});
  factory _LocationPingResponse.fromJson(Map<String, dynamic> json) => _$LocationPingResponseFromJson(json);

@override final  bool success;
@override final  int pingId;
@override final  int? nextPingSeconds;
@override final  DateTime serverTime;
@override final  bool isDuplicate;

/// Create a copy of LocationPingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationPingResponseCopyWith<_LocationPingResponse> get copyWith => __$LocationPingResponseCopyWithImpl<_LocationPingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationPingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationPingResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.pingId, pingId) || other.pingId == pingId)&&(identical(other.nextPingSeconds, nextPingSeconds) || other.nextPingSeconds == nextPingSeconds)&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime)&&(identical(other.isDuplicate, isDuplicate) || other.isDuplicate == isDuplicate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,pingId,nextPingSeconds,serverTime,isDuplicate);

@override
String toString() {
  return 'LocationPingResponse(success: $success, pingId: $pingId, nextPingSeconds: $nextPingSeconds, serverTime: $serverTime, isDuplicate: $isDuplicate)';
}


}

/// @nodoc
abstract mixin class _$LocationPingResponseCopyWith<$Res> implements $LocationPingResponseCopyWith<$Res> {
  factory _$LocationPingResponseCopyWith(_LocationPingResponse value, $Res Function(_LocationPingResponse) _then) = __$LocationPingResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, int pingId, int? nextPingSeconds, DateTime serverTime, bool isDuplicate
});




}
/// @nodoc
class __$LocationPingResponseCopyWithImpl<$Res>
    implements _$LocationPingResponseCopyWith<$Res> {
  __$LocationPingResponseCopyWithImpl(this._self, this._then);

  final _LocationPingResponse _self;
  final $Res Function(_LocationPingResponse) _then;

/// Create a copy of LocationPingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? pingId = null,Object? nextPingSeconds = freezed,Object? serverTime = null,Object? isDuplicate = null,}) {
  return _then(_LocationPingResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,pingId: null == pingId ? _self.pingId : pingId // ignore: cast_nullable_to_non_nullable
as int,nextPingSeconds: freezed == nextPingSeconds ? _self.nextPingSeconds : nextPingSeconds // ignore: cast_nullable_to_non_nullable
as int?,serverTime: null == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as DateTime,isDuplicate: null == isDuplicate ? _self.isDuplicate : isDuplicate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
