// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet_visit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OutletVisit {

/// Local UUID for offline-first operations
 String get localId;/// Backend visit ID (null until synced)
 String? get serverId;// === Route Linkage ===
/// Local ID of the parent daily route
 String get dailyRouteLocalId;/// Server ID of the parent daily route (null until route synced)
 String? get dailyRouteServerId;// === Outlet Information ===
/// Customer/Outlet ID from backend
 String get outletId;/// Outlet code (e.g., "CL000001")
 String get outletCode;/// Outlet display name
 String get outletName;/// Outlet GPS latitude
 double get outletLatitude;/// Outlet GPS longitude
 double get outletLongitude;/// Geofence radius for this outlet (meters)
 double get geofenceRadiusMeters;// === Schedule Information ===
/// Server ID of the schedule this visit was generated from
 String? get scheduleServerId;/// Order in the route (1, 2, 3, ...)
 int get visitOrder;/// Scheduled clock-in time (time of day)
 String? get scheduledClockIn;/// Scheduled clock-out time (time of day)
 String? get scheduledClockOut;/// Allocated time for this visit (minutes)
 int get allocatedMinutes;/// Visit priority (1=must visit, 2=important, 3=flexible)
 int get visitPriority;// === Visit Type ===
/// Whether this is a scheduled or ad-hoc visit
 VisitType get visitType;// === Status & Timing ===
/// Current status of the visit
 VisitStatus get status;/// Actual clock-in timestamp
 DateTime? get actualClockIn;/// Actual clock-out timestamp
 DateTime? get actualClockOut;/// Calculated visit duration (minutes)
 int? get visitDurationMins;// === Location Data ===
/// GPS latitude at clock-in
 double? get clockInLatitude;/// GPS longitude at clock-in
 double? get clockInLongitude;/// GPS accuracy at clock-in (meters)
 double? get clockInAccuracyMeters;/// Distance from outlet at clock-in (meters)
 double? get clockInDistanceMeters;/// GPS latitude at clock-out
 double? get clockOutLatitude;/// GPS longitude at clock-out
 double? get clockOutLongitude;/// GPS accuracy at clock-out (meters)
 double? get clockOutAccuracyMeters;/// Distance from outlet at clock-out (meters)
 double? get clockOutDistanceMeters;// === Geofence Override ===
/// Whether geofence was overridden for this visit
 bool get geofenceOverride;/// ID of the approved override request (if any)
 String? get overrideRequestId;// === Skip Information ===
/// ID of the skip reason (from SkipReasonCache)
 int? get skipReasonId;/// Skip reason code (e.g., "CLOSED", "OUT_OF_STOCK")
 String? get skipReasonCode;/// Additional notes for skip
 String? get skipNotes;// === Notes ===
/// Notes entered at clock-in
 String? get clockInNotes;/// Notes entered at clock-out
 String? get clockOutNotes;/// General visit notes
 String? get visitNotes;// === Sync State ===
/// Current sync state with backend
 SyncState get syncState;/// Last sync error message (if any)
 String? get syncError;/// Timestamp of last successful sync
 DateTime? get lastSyncedAt;// === Outlet Mapping ===
/// Null when this outlet doesn't currently need mapping. Parsed from
/// the visit/route response's `mapping_request` field, never from
/// `OutletVisit.fromJson` directly (excluded from json_serializable —
/// the real parsing path is `OutletVisitResponse.toDomain()`, a
/// hand-written mapper, matching how every other field on this entity
/// is already sourced).
@JsonKey(includeFromJson: false, includeToJson: false) MappingRequest? get mappingRequest;
/// Create a copy of OutletVisit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutletVisitCopyWith<OutletVisit> get copyWith => _$OutletVisitCopyWithImpl<OutletVisit>(this as OutletVisit, _$identity);

  /// Serializes this OutletVisit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutletVisit&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.dailyRouteLocalId, dailyRouteLocalId) || other.dailyRouteLocalId == dailyRouteLocalId)&&(identical(other.dailyRouteServerId, dailyRouteServerId) || other.dailyRouteServerId == dailyRouteServerId)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.outletLatitude, outletLatitude) || other.outletLatitude == outletLatitude)&&(identical(other.outletLongitude, outletLongitude) || other.outletLongitude == outletLongitude)&&(identical(other.geofenceRadiusMeters, geofenceRadiusMeters) || other.geofenceRadiusMeters == geofenceRadiusMeters)&&(identical(other.scheduleServerId, scheduleServerId) || other.scheduleServerId == scheduleServerId)&&(identical(other.visitOrder, visitOrder) || other.visitOrder == visitOrder)&&(identical(other.scheduledClockIn, scheduledClockIn) || other.scheduledClockIn == scheduledClockIn)&&(identical(other.scheduledClockOut, scheduledClockOut) || other.scheduledClockOut == scheduledClockOut)&&(identical(other.allocatedMinutes, allocatedMinutes) || other.allocatedMinutes == allocatedMinutes)&&(identical(other.visitPriority, visitPriority) || other.visitPriority == visitPriority)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.status, status) || other.status == status)&&(identical(other.actualClockIn, actualClockIn) || other.actualClockIn == actualClockIn)&&(identical(other.actualClockOut, actualClockOut) || other.actualClockOut == actualClockOut)&&(identical(other.visitDurationMins, visitDurationMins) || other.visitDurationMins == visitDurationMins)&&(identical(other.clockInLatitude, clockInLatitude) || other.clockInLatitude == clockInLatitude)&&(identical(other.clockInLongitude, clockInLongitude) || other.clockInLongitude == clockInLongitude)&&(identical(other.clockInAccuracyMeters, clockInAccuracyMeters) || other.clockInAccuracyMeters == clockInAccuracyMeters)&&(identical(other.clockInDistanceMeters, clockInDistanceMeters) || other.clockInDistanceMeters == clockInDistanceMeters)&&(identical(other.clockOutLatitude, clockOutLatitude) || other.clockOutLatitude == clockOutLatitude)&&(identical(other.clockOutLongitude, clockOutLongitude) || other.clockOutLongitude == clockOutLongitude)&&(identical(other.clockOutAccuracyMeters, clockOutAccuracyMeters) || other.clockOutAccuracyMeters == clockOutAccuracyMeters)&&(identical(other.clockOutDistanceMeters, clockOutDistanceMeters) || other.clockOutDistanceMeters == clockOutDistanceMeters)&&(identical(other.geofenceOverride, geofenceOverride) || other.geofenceOverride == geofenceOverride)&&(identical(other.overrideRequestId, overrideRequestId) || other.overrideRequestId == overrideRequestId)&&(identical(other.skipReasonId, skipReasonId) || other.skipReasonId == skipReasonId)&&(identical(other.skipReasonCode, skipReasonCode) || other.skipReasonCode == skipReasonCode)&&(identical(other.skipNotes, skipNotes) || other.skipNotes == skipNotes)&&(identical(other.clockInNotes, clockInNotes) || other.clockInNotes == clockInNotes)&&(identical(other.clockOutNotes, clockOutNotes) || other.clockOutNotes == clockOutNotes)&&(identical(other.visitNotes, visitNotes) || other.visitNotes == visitNotes)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt)&&(identical(other.mappingRequest, mappingRequest) || other.mappingRequest == mappingRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,localId,serverId,dailyRouteLocalId,dailyRouteServerId,outletId,outletCode,outletName,outletLatitude,outletLongitude,geofenceRadiusMeters,scheduleServerId,visitOrder,scheduledClockIn,scheduledClockOut,allocatedMinutes,visitPriority,visitType,status,actualClockIn,actualClockOut,visitDurationMins,clockInLatitude,clockInLongitude,clockInAccuracyMeters,clockInDistanceMeters,clockOutLatitude,clockOutLongitude,clockOutAccuracyMeters,clockOutDistanceMeters,geofenceOverride,overrideRequestId,skipReasonId,skipReasonCode,skipNotes,clockInNotes,clockOutNotes,visitNotes,syncState,syncError,lastSyncedAt,mappingRequest]);

@override
String toString() {
  return 'OutletVisit(localId: $localId, serverId: $serverId, dailyRouteLocalId: $dailyRouteLocalId, dailyRouteServerId: $dailyRouteServerId, outletId: $outletId, outletCode: $outletCode, outletName: $outletName, outletLatitude: $outletLatitude, outletLongitude: $outletLongitude, geofenceRadiusMeters: $geofenceRadiusMeters, scheduleServerId: $scheduleServerId, visitOrder: $visitOrder, scheduledClockIn: $scheduledClockIn, scheduledClockOut: $scheduledClockOut, allocatedMinutes: $allocatedMinutes, visitPriority: $visitPriority, visitType: $visitType, status: $status, actualClockIn: $actualClockIn, actualClockOut: $actualClockOut, visitDurationMins: $visitDurationMins, clockInLatitude: $clockInLatitude, clockInLongitude: $clockInLongitude, clockInAccuracyMeters: $clockInAccuracyMeters, clockInDistanceMeters: $clockInDistanceMeters, clockOutLatitude: $clockOutLatitude, clockOutLongitude: $clockOutLongitude, clockOutAccuracyMeters: $clockOutAccuracyMeters, clockOutDistanceMeters: $clockOutDistanceMeters, geofenceOverride: $geofenceOverride, overrideRequestId: $overrideRequestId, skipReasonId: $skipReasonId, skipReasonCode: $skipReasonCode, skipNotes: $skipNotes, clockInNotes: $clockInNotes, clockOutNotes: $clockOutNotes, visitNotes: $visitNotes, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt, mappingRequest: $mappingRequest)';
}


}

/// @nodoc
abstract mixin class $OutletVisitCopyWith<$Res>  {
  factory $OutletVisitCopyWith(OutletVisit value, $Res Function(OutletVisit) _then) = _$OutletVisitCopyWithImpl;
@useResult
$Res call({
 String localId, String? serverId, String dailyRouteLocalId, String? dailyRouteServerId, String outletId, String outletCode, String outletName, double outletLatitude, double outletLongitude, double geofenceRadiusMeters, String? scheduleServerId, int visitOrder, String? scheduledClockIn, String? scheduledClockOut, int allocatedMinutes, int visitPriority, VisitType visitType, VisitStatus status, DateTime? actualClockIn, DateTime? actualClockOut, int? visitDurationMins, double? clockInLatitude, double? clockInLongitude, double? clockInAccuracyMeters, double? clockInDistanceMeters, double? clockOutLatitude, double? clockOutLongitude, double? clockOutAccuracyMeters, double? clockOutDistanceMeters, bool geofenceOverride, String? overrideRequestId, int? skipReasonId, String? skipReasonCode, String? skipNotes, String? clockInNotes, String? clockOutNotes, String? visitNotes, SyncState syncState, String? syncError, DateTime? lastSyncedAt,@JsonKey(includeFromJson: false, includeToJson: false) MappingRequest? mappingRequest
});




}
/// @nodoc
class _$OutletVisitCopyWithImpl<$Res>
    implements $OutletVisitCopyWith<$Res> {
  _$OutletVisitCopyWithImpl(this._self, this._then);

  final OutletVisit _self;
  final $Res Function(OutletVisit) _then;

/// Create a copy of OutletVisit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? serverId = freezed,Object? dailyRouteLocalId = null,Object? dailyRouteServerId = freezed,Object? outletId = null,Object? outletCode = null,Object? outletName = null,Object? outletLatitude = null,Object? outletLongitude = null,Object? geofenceRadiusMeters = null,Object? scheduleServerId = freezed,Object? visitOrder = null,Object? scheduledClockIn = freezed,Object? scheduledClockOut = freezed,Object? allocatedMinutes = null,Object? visitPriority = null,Object? visitType = null,Object? status = null,Object? actualClockIn = freezed,Object? actualClockOut = freezed,Object? visitDurationMins = freezed,Object? clockInLatitude = freezed,Object? clockInLongitude = freezed,Object? clockInAccuracyMeters = freezed,Object? clockInDistanceMeters = freezed,Object? clockOutLatitude = freezed,Object? clockOutLongitude = freezed,Object? clockOutAccuracyMeters = freezed,Object? clockOutDistanceMeters = freezed,Object? geofenceOverride = null,Object? overrideRequestId = freezed,Object? skipReasonId = freezed,Object? skipReasonCode = freezed,Object? skipNotes = freezed,Object? clockInNotes = freezed,Object? clockOutNotes = freezed,Object? visitNotes = freezed,Object? syncState = null,Object? syncError = freezed,Object? lastSyncedAt = freezed,Object? mappingRequest = freezed,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String?,dailyRouteLocalId: null == dailyRouteLocalId ? _self.dailyRouteLocalId : dailyRouteLocalId // ignore: cast_nullable_to_non_nullable
as String,dailyRouteServerId: freezed == dailyRouteServerId ? _self.dailyRouteServerId : dailyRouteServerId // ignore: cast_nullable_to_non_nullable
as String?,outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,outletCode: null == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String,outletName: null == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String,outletLatitude: null == outletLatitude ? _self.outletLatitude : outletLatitude // ignore: cast_nullable_to_non_nullable
as double,outletLongitude: null == outletLongitude ? _self.outletLongitude : outletLongitude // ignore: cast_nullable_to_non_nullable
as double,geofenceRadiusMeters: null == geofenceRadiusMeters ? _self.geofenceRadiusMeters : geofenceRadiusMeters // ignore: cast_nullable_to_non_nullable
as double,scheduleServerId: freezed == scheduleServerId ? _self.scheduleServerId : scheduleServerId // ignore: cast_nullable_to_non_nullable
as String?,visitOrder: null == visitOrder ? _self.visitOrder : visitOrder // ignore: cast_nullable_to_non_nullable
as int,scheduledClockIn: freezed == scheduledClockIn ? _self.scheduledClockIn : scheduledClockIn // ignore: cast_nullable_to_non_nullable
as String?,scheduledClockOut: freezed == scheduledClockOut ? _self.scheduledClockOut : scheduledClockOut // ignore: cast_nullable_to_non_nullable
as String?,allocatedMinutes: null == allocatedMinutes ? _self.allocatedMinutes : allocatedMinutes // ignore: cast_nullable_to_non_nullable
as int,visitPriority: null == visitPriority ? _self.visitPriority : visitPriority // ignore: cast_nullable_to_non_nullable
as int,visitType: null == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as VisitType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VisitStatus,actualClockIn: freezed == actualClockIn ? _self.actualClockIn : actualClockIn // ignore: cast_nullable_to_non_nullable
as DateTime?,actualClockOut: freezed == actualClockOut ? _self.actualClockOut : actualClockOut // ignore: cast_nullable_to_non_nullable
as DateTime?,visitDurationMins: freezed == visitDurationMins ? _self.visitDurationMins : visitDurationMins // ignore: cast_nullable_to_non_nullable
as int?,clockInLatitude: freezed == clockInLatitude ? _self.clockInLatitude : clockInLatitude // ignore: cast_nullable_to_non_nullable
as double?,clockInLongitude: freezed == clockInLongitude ? _self.clockInLongitude : clockInLongitude // ignore: cast_nullable_to_non_nullable
as double?,clockInAccuracyMeters: freezed == clockInAccuracyMeters ? _self.clockInAccuracyMeters : clockInAccuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,clockInDistanceMeters: freezed == clockInDistanceMeters ? _self.clockInDistanceMeters : clockInDistanceMeters // ignore: cast_nullable_to_non_nullable
as double?,clockOutLatitude: freezed == clockOutLatitude ? _self.clockOutLatitude : clockOutLatitude // ignore: cast_nullable_to_non_nullable
as double?,clockOutLongitude: freezed == clockOutLongitude ? _self.clockOutLongitude : clockOutLongitude // ignore: cast_nullable_to_non_nullable
as double?,clockOutAccuracyMeters: freezed == clockOutAccuracyMeters ? _self.clockOutAccuracyMeters : clockOutAccuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,clockOutDistanceMeters: freezed == clockOutDistanceMeters ? _self.clockOutDistanceMeters : clockOutDistanceMeters // ignore: cast_nullable_to_non_nullable
as double?,geofenceOverride: null == geofenceOverride ? _self.geofenceOverride : geofenceOverride // ignore: cast_nullable_to_non_nullable
as bool,overrideRequestId: freezed == overrideRequestId ? _self.overrideRequestId : overrideRequestId // ignore: cast_nullable_to_non_nullable
as String?,skipReasonId: freezed == skipReasonId ? _self.skipReasonId : skipReasonId // ignore: cast_nullable_to_non_nullable
as int?,skipReasonCode: freezed == skipReasonCode ? _self.skipReasonCode : skipReasonCode // ignore: cast_nullable_to_non_nullable
as String?,skipNotes: freezed == skipNotes ? _self.skipNotes : skipNotes // ignore: cast_nullable_to_non_nullable
as String?,clockInNotes: freezed == clockInNotes ? _self.clockInNotes : clockInNotes // ignore: cast_nullable_to_non_nullable
as String?,clockOutNotes: freezed == clockOutNotes ? _self.clockOutNotes : clockOutNotes // ignore: cast_nullable_to_non_nullable
as String?,visitNotes: freezed == visitNotes ? _self.visitNotes : visitNotes // ignore: cast_nullable_to_non_nullable
as String?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,mappingRequest: freezed == mappingRequest ? _self.mappingRequest : mappingRequest // ignore: cast_nullable_to_non_nullable
as MappingRequest?,
  ));
}

}


/// Adds pattern-matching-related methods to [OutletVisit].
extension OutletVisitPatterns on OutletVisit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutletVisit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutletVisit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutletVisit value)  $default,){
final _that = this;
switch (_that) {
case _OutletVisit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutletVisit value)?  $default,){
final _that = this;
switch (_that) {
case _OutletVisit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  String? serverId,  String dailyRouteLocalId,  String? dailyRouteServerId,  String outletId,  String outletCode,  String outletName,  double outletLatitude,  double outletLongitude,  double geofenceRadiusMeters,  String? scheduleServerId,  int visitOrder,  String? scheduledClockIn,  String? scheduledClockOut,  int allocatedMinutes,  int visitPriority,  VisitType visitType,  VisitStatus status,  DateTime? actualClockIn,  DateTime? actualClockOut,  int? visitDurationMins,  double? clockInLatitude,  double? clockInLongitude,  double? clockInAccuracyMeters,  double? clockInDistanceMeters,  double? clockOutLatitude,  double? clockOutLongitude,  double? clockOutAccuracyMeters,  double? clockOutDistanceMeters,  bool geofenceOverride,  String? overrideRequestId,  int? skipReasonId,  String? skipReasonCode,  String? skipNotes,  String? clockInNotes,  String? clockOutNotes,  String? visitNotes,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt, @JsonKey(includeFromJson: false, includeToJson: false)  MappingRequest? mappingRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutletVisit() when $default != null:
return $default(_that.localId,_that.serverId,_that.dailyRouteLocalId,_that.dailyRouteServerId,_that.outletId,_that.outletCode,_that.outletName,_that.outletLatitude,_that.outletLongitude,_that.geofenceRadiusMeters,_that.scheduleServerId,_that.visitOrder,_that.scheduledClockIn,_that.scheduledClockOut,_that.allocatedMinutes,_that.visitPriority,_that.visitType,_that.status,_that.actualClockIn,_that.actualClockOut,_that.visitDurationMins,_that.clockInLatitude,_that.clockInLongitude,_that.clockInAccuracyMeters,_that.clockInDistanceMeters,_that.clockOutLatitude,_that.clockOutLongitude,_that.clockOutAccuracyMeters,_that.clockOutDistanceMeters,_that.geofenceOverride,_that.overrideRequestId,_that.skipReasonId,_that.skipReasonCode,_that.skipNotes,_that.clockInNotes,_that.clockOutNotes,_that.visitNotes,_that.syncState,_that.syncError,_that.lastSyncedAt,_that.mappingRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  String? serverId,  String dailyRouteLocalId,  String? dailyRouteServerId,  String outletId,  String outletCode,  String outletName,  double outletLatitude,  double outletLongitude,  double geofenceRadiusMeters,  String? scheduleServerId,  int visitOrder,  String? scheduledClockIn,  String? scheduledClockOut,  int allocatedMinutes,  int visitPriority,  VisitType visitType,  VisitStatus status,  DateTime? actualClockIn,  DateTime? actualClockOut,  int? visitDurationMins,  double? clockInLatitude,  double? clockInLongitude,  double? clockInAccuracyMeters,  double? clockInDistanceMeters,  double? clockOutLatitude,  double? clockOutLongitude,  double? clockOutAccuracyMeters,  double? clockOutDistanceMeters,  bool geofenceOverride,  String? overrideRequestId,  int? skipReasonId,  String? skipReasonCode,  String? skipNotes,  String? clockInNotes,  String? clockOutNotes,  String? visitNotes,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt, @JsonKey(includeFromJson: false, includeToJson: false)  MappingRequest? mappingRequest)  $default,) {final _that = this;
switch (_that) {
case _OutletVisit():
return $default(_that.localId,_that.serverId,_that.dailyRouteLocalId,_that.dailyRouteServerId,_that.outletId,_that.outletCode,_that.outletName,_that.outletLatitude,_that.outletLongitude,_that.geofenceRadiusMeters,_that.scheduleServerId,_that.visitOrder,_that.scheduledClockIn,_that.scheduledClockOut,_that.allocatedMinutes,_that.visitPriority,_that.visitType,_that.status,_that.actualClockIn,_that.actualClockOut,_that.visitDurationMins,_that.clockInLatitude,_that.clockInLongitude,_that.clockInAccuracyMeters,_that.clockInDistanceMeters,_that.clockOutLatitude,_that.clockOutLongitude,_that.clockOutAccuracyMeters,_that.clockOutDistanceMeters,_that.geofenceOverride,_that.overrideRequestId,_that.skipReasonId,_that.skipReasonCode,_that.skipNotes,_that.clockInNotes,_that.clockOutNotes,_that.visitNotes,_that.syncState,_that.syncError,_that.lastSyncedAt,_that.mappingRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  String? serverId,  String dailyRouteLocalId,  String? dailyRouteServerId,  String outletId,  String outletCode,  String outletName,  double outletLatitude,  double outletLongitude,  double geofenceRadiusMeters,  String? scheduleServerId,  int visitOrder,  String? scheduledClockIn,  String? scheduledClockOut,  int allocatedMinutes,  int visitPriority,  VisitType visitType,  VisitStatus status,  DateTime? actualClockIn,  DateTime? actualClockOut,  int? visitDurationMins,  double? clockInLatitude,  double? clockInLongitude,  double? clockInAccuracyMeters,  double? clockInDistanceMeters,  double? clockOutLatitude,  double? clockOutLongitude,  double? clockOutAccuracyMeters,  double? clockOutDistanceMeters,  bool geofenceOverride,  String? overrideRequestId,  int? skipReasonId,  String? skipReasonCode,  String? skipNotes,  String? clockInNotes,  String? clockOutNotes,  String? visitNotes,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt, @JsonKey(includeFromJson: false, includeToJson: false)  MappingRequest? mappingRequest)?  $default,) {final _that = this;
switch (_that) {
case _OutletVisit() when $default != null:
return $default(_that.localId,_that.serverId,_that.dailyRouteLocalId,_that.dailyRouteServerId,_that.outletId,_that.outletCode,_that.outletName,_that.outletLatitude,_that.outletLongitude,_that.geofenceRadiusMeters,_that.scheduleServerId,_that.visitOrder,_that.scheduledClockIn,_that.scheduledClockOut,_that.allocatedMinutes,_that.visitPriority,_that.visitType,_that.status,_that.actualClockIn,_that.actualClockOut,_that.visitDurationMins,_that.clockInLatitude,_that.clockInLongitude,_that.clockInAccuracyMeters,_that.clockInDistanceMeters,_that.clockOutLatitude,_that.clockOutLongitude,_that.clockOutAccuracyMeters,_that.clockOutDistanceMeters,_that.geofenceOverride,_that.overrideRequestId,_that.skipReasonId,_that.skipReasonCode,_that.skipNotes,_that.clockInNotes,_that.clockOutNotes,_that.visitNotes,_that.syncState,_that.syncError,_that.lastSyncedAt,_that.mappingRequest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutletVisit implements OutletVisit {
  const _OutletVisit({required this.localId, this.serverId, required this.dailyRouteLocalId, this.dailyRouteServerId, required this.outletId, required this.outletCode, required this.outletName, required this.outletLatitude, required this.outletLongitude, this.geofenceRadiusMeters = 200.0, this.scheduleServerId, required this.visitOrder, this.scheduledClockIn, this.scheduledClockOut, required this.allocatedMinutes, this.visitPriority = 2, required this.visitType, required this.status, this.actualClockIn, this.actualClockOut, this.visitDurationMins, this.clockInLatitude, this.clockInLongitude, this.clockInAccuracyMeters, this.clockInDistanceMeters, this.clockOutLatitude, this.clockOutLongitude, this.clockOutAccuracyMeters, this.clockOutDistanceMeters, this.geofenceOverride = false, this.overrideRequestId, this.skipReasonId, this.skipReasonCode, this.skipNotes, this.clockInNotes, this.clockOutNotes, this.visitNotes, this.syncState = SyncState.localOnly, this.syncError, this.lastSyncedAt, @JsonKey(includeFromJson: false, includeToJson: false) this.mappingRequest});
  factory _OutletVisit.fromJson(Map<String, dynamic> json) => _$OutletVisitFromJson(json);

/// Local UUID for offline-first operations
@override final  String localId;
/// Backend visit ID (null until synced)
@override final  String? serverId;
// === Route Linkage ===
/// Local ID of the parent daily route
@override final  String dailyRouteLocalId;
/// Server ID of the parent daily route (null until route synced)
@override final  String? dailyRouteServerId;
// === Outlet Information ===
/// Customer/Outlet ID from backend
@override final  String outletId;
/// Outlet code (e.g., "CL000001")
@override final  String outletCode;
/// Outlet display name
@override final  String outletName;
/// Outlet GPS latitude
@override final  double outletLatitude;
/// Outlet GPS longitude
@override final  double outletLongitude;
/// Geofence radius for this outlet (meters)
@override@JsonKey() final  double geofenceRadiusMeters;
// === Schedule Information ===
/// Server ID of the schedule this visit was generated from
@override final  String? scheduleServerId;
/// Order in the route (1, 2, 3, ...)
@override final  int visitOrder;
/// Scheduled clock-in time (time of day)
@override final  String? scheduledClockIn;
/// Scheduled clock-out time (time of day)
@override final  String? scheduledClockOut;
/// Allocated time for this visit (minutes)
@override final  int allocatedMinutes;
/// Visit priority (1=must visit, 2=important, 3=flexible)
@override@JsonKey() final  int visitPriority;
// === Visit Type ===
/// Whether this is a scheduled or ad-hoc visit
@override final  VisitType visitType;
// === Status & Timing ===
/// Current status of the visit
@override final  VisitStatus status;
/// Actual clock-in timestamp
@override final  DateTime? actualClockIn;
/// Actual clock-out timestamp
@override final  DateTime? actualClockOut;
/// Calculated visit duration (minutes)
@override final  int? visitDurationMins;
// === Location Data ===
/// GPS latitude at clock-in
@override final  double? clockInLatitude;
/// GPS longitude at clock-in
@override final  double? clockInLongitude;
/// GPS accuracy at clock-in (meters)
@override final  double? clockInAccuracyMeters;
/// Distance from outlet at clock-in (meters)
@override final  double? clockInDistanceMeters;
/// GPS latitude at clock-out
@override final  double? clockOutLatitude;
/// GPS longitude at clock-out
@override final  double? clockOutLongitude;
/// GPS accuracy at clock-out (meters)
@override final  double? clockOutAccuracyMeters;
/// Distance from outlet at clock-out (meters)
@override final  double? clockOutDistanceMeters;
// === Geofence Override ===
/// Whether geofence was overridden for this visit
@override@JsonKey() final  bool geofenceOverride;
/// ID of the approved override request (if any)
@override final  String? overrideRequestId;
// === Skip Information ===
/// ID of the skip reason (from SkipReasonCache)
@override final  int? skipReasonId;
/// Skip reason code (e.g., "CLOSED", "OUT_OF_STOCK")
@override final  String? skipReasonCode;
/// Additional notes for skip
@override final  String? skipNotes;
// === Notes ===
/// Notes entered at clock-in
@override final  String? clockInNotes;
/// Notes entered at clock-out
@override final  String? clockOutNotes;
/// General visit notes
@override final  String? visitNotes;
// === Sync State ===
/// Current sync state with backend
@override@JsonKey() final  SyncState syncState;
/// Last sync error message (if any)
@override final  String? syncError;
/// Timestamp of last successful sync
@override final  DateTime? lastSyncedAt;
// === Outlet Mapping ===
/// Null when this outlet doesn't currently need mapping. Parsed from
/// the visit/route response's `mapping_request` field, never from
/// `OutletVisit.fromJson` directly (excluded from json_serializable —
/// the real parsing path is `OutletVisitResponse.toDomain()`, a
/// hand-written mapper, matching how every other field on this entity
/// is already sourced).
@override@JsonKey(includeFromJson: false, includeToJson: false) final  MappingRequest? mappingRequest;

/// Create a copy of OutletVisit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutletVisitCopyWith<_OutletVisit> get copyWith => __$OutletVisitCopyWithImpl<_OutletVisit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutletVisitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutletVisit&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.dailyRouteLocalId, dailyRouteLocalId) || other.dailyRouteLocalId == dailyRouteLocalId)&&(identical(other.dailyRouteServerId, dailyRouteServerId) || other.dailyRouteServerId == dailyRouteServerId)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.outletLatitude, outletLatitude) || other.outletLatitude == outletLatitude)&&(identical(other.outletLongitude, outletLongitude) || other.outletLongitude == outletLongitude)&&(identical(other.geofenceRadiusMeters, geofenceRadiusMeters) || other.geofenceRadiusMeters == geofenceRadiusMeters)&&(identical(other.scheduleServerId, scheduleServerId) || other.scheduleServerId == scheduleServerId)&&(identical(other.visitOrder, visitOrder) || other.visitOrder == visitOrder)&&(identical(other.scheduledClockIn, scheduledClockIn) || other.scheduledClockIn == scheduledClockIn)&&(identical(other.scheduledClockOut, scheduledClockOut) || other.scheduledClockOut == scheduledClockOut)&&(identical(other.allocatedMinutes, allocatedMinutes) || other.allocatedMinutes == allocatedMinutes)&&(identical(other.visitPriority, visitPriority) || other.visitPriority == visitPriority)&&(identical(other.visitType, visitType) || other.visitType == visitType)&&(identical(other.status, status) || other.status == status)&&(identical(other.actualClockIn, actualClockIn) || other.actualClockIn == actualClockIn)&&(identical(other.actualClockOut, actualClockOut) || other.actualClockOut == actualClockOut)&&(identical(other.visitDurationMins, visitDurationMins) || other.visitDurationMins == visitDurationMins)&&(identical(other.clockInLatitude, clockInLatitude) || other.clockInLatitude == clockInLatitude)&&(identical(other.clockInLongitude, clockInLongitude) || other.clockInLongitude == clockInLongitude)&&(identical(other.clockInAccuracyMeters, clockInAccuracyMeters) || other.clockInAccuracyMeters == clockInAccuracyMeters)&&(identical(other.clockInDistanceMeters, clockInDistanceMeters) || other.clockInDistanceMeters == clockInDistanceMeters)&&(identical(other.clockOutLatitude, clockOutLatitude) || other.clockOutLatitude == clockOutLatitude)&&(identical(other.clockOutLongitude, clockOutLongitude) || other.clockOutLongitude == clockOutLongitude)&&(identical(other.clockOutAccuracyMeters, clockOutAccuracyMeters) || other.clockOutAccuracyMeters == clockOutAccuracyMeters)&&(identical(other.clockOutDistanceMeters, clockOutDistanceMeters) || other.clockOutDistanceMeters == clockOutDistanceMeters)&&(identical(other.geofenceOverride, geofenceOverride) || other.geofenceOverride == geofenceOverride)&&(identical(other.overrideRequestId, overrideRequestId) || other.overrideRequestId == overrideRequestId)&&(identical(other.skipReasonId, skipReasonId) || other.skipReasonId == skipReasonId)&&(identical(other.skipReasonCode, skipReasonCode) || other.skipReasonCode == skipReasonCode)&&(identical(other.skipNotes, skipNotes) || other.skipNotes == skipNotes)&&(identical(other.clockInNotes, clockInNotes) || other.clockInNotes == clockInNotes)&&(identical(other.clockOutNotes, clockOutNotes) || other.clockOutNotes == clockOutNotes)&&(identical(other.visitNotes, visitNotes) || other.visitNotes == visitNotes)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt)&&(identical(other.mappingRequest, mappingRequest) || other.mappingRequest == mappingRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,localId,serverId,dailyRouteLocalId,dailyRouteServerId,outletId,outletCode,outletName,outletLatitude,outletLongitude,geofenceRadiusMeters,scheduleServerId,visitOrder,scheduledClockIn,scheduledClockOut,allocatedMinutes,visitPriority,visitType,status,actualClockIn,actualClockOut,visitDurationMins,clockInLatitude,clockInLongitude,clockInAccuracyMeters,clockInDistanceMeters,clockOutLatitude,clockOutLongitude,clockOutAccuracyMeters,clockOutDistanceMeters,geofenceOverride,overrideRequestId,skipReasonId,skipReasonCode,skipNotes,clockInNotes,clockOutNotes,visitNotes,syncState,syncError,lastSyncedAt,mappingRequest]);

@override
String toString() {
  return 'OutletVisit(localId: $localId, serverId: $serverId, dailyRouteLocalId: $dailyRouteLocalId, dailyRouteServerId: $dailyRouteServerId, outletId: $outletId, outletCode: $outletCode, outletName: $outletName, outletLatitude: $outletLatitude, outletLongitude: $outletLongitude, geofenceRadiusMeters: $geofenceRadiusMeters, scheduleServerId: $scheduleServerId, visitOrder: $visitOrder, scheduledClockIn: $scheduledClockIn, scheduledClockOut: $scheduledClockOut, allocatedMinutes: $allocatedMinutes, visitPriority: $visitPriority, visitType: $visitType, status: $status, actualClockIn: $actualClockIn, actualClockOut: $actualClockOut, visitDurationMins: $visitDurationMins, clockInLatitude: $clockInLatitude, clockInLongitude: $clockInLongitude, clockInAccuracyMeters: $clockInAccuracyMeters, clockInDistanceMeters: $clockInDistanceMeters, clockOutLatitude: $clockOutLatitude, clockOutLongitude: $clockOutLongitude, clockOutAccuracyMeters: $clockOutAccuracyMeters, clockOutDistanceMeters: $clockOutDistanceMeters, geofenceOverride: $geofenceOverride, overrideRequestId: $overrideRequestId, skipReasonId: $skipReasonId, skipReasonCode: $skipReasonCode, skipNotes: $skipNotes, clockInNotes: $clockInNotes, clockOutNotes: $clockOutNotes, visitNotes: $visitNotes, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt, mappingRequest: $mappingRequest)';
}


}

/// @nodoc
abstract mixin class _$OutletVisitCopyWith<$Res> implements $OutletVisitCopyWith<$Res> {
  factory _$OutletVisitCopyWith(_OutletVisit value, $Res Function(_OutletVisit) _then) = __$OutletVisitCopyWithImpl;
@override @useResult
$Res call({
 String localId, String? serverId, String dailyRouteLocalId, String? dailyRouteServerId, String outletId, String outletCode, String outletName, double outletLatitude, double outletLongitude, double geofenceRadiusMeters, String? scheduleServerId, int visitOrder, String? scheduledClockIn, String? scheduledClockOut, int allocatedMinutes, int visitPriority, VisitType visitType, VisitStatus status, DateTime? actualClockIn, DateTime? actualClockOut, int? visitDurationMins, double? clockInLatitude, double? clockInLongitude, double? clockInAccuracyMeters, double? clockInDistanceMeters, double? clockOutLatitude, double? clockOutLongitude, double? clockOutAccuracyMeters, double? clockOutDistanceMeters, bool geofenceOverride, String? overrideRequestId, int? skipReasonId, String? skipReasonCode, String? skipNotes, String? clockInNotes, String? clockOutNotes, String? visitNotes, SyncState syncState, String? syncError, DateTime? lastSyncedAt,@JsonKey(includeFromJson: false, includeToJson: false) MappingRequest? mappingRequest
});




}
/// @nodoc
class __$OutletVisitCopyWithImpl<$Res>
    implements _$OutletVisitCopyWith<$Res> {
  __$OutletVisitCopyWithImpl(this._self, this._then);

  final _OutletVisit _self;
  final $Res Function(_OutletVisit) _then;

/// Create a copy of OutletVisit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? serverId = freezed,Object? dailyRouteLocalId = null,Object? dailyRouteServerId = freezed,Object? outletId = null,Object? outletCode = null,Object? outletName = null,Object? outletLatitude = null,Object? outletLongitude = null,Object? geofenceRadiusMeters = null,Object? scheduleServerId = freezed,Object? visitOrder = null,Object? scheduledClockIn = freezed,Object? scheduledClockOut = freezed,Object? allocatedMinutes = null,Object? visitPriority = null,Object? visitType = null,Object? status = null,Object? actualClockIn = freezed,Object? actualClockOut = freezed,Object? visitDurationMins = freezed,Object? clockInLatitude = freezed,Object? clockInLongitude = freezed,Object? clockInAccuracyMeters = freezed,Object? clockInDistanceMeters = freezed,Object? clockOutLatitude = freezed,Object? clockOutLongitude = freezed,Object? clockOutAccuracyMeters = freezed,Object? clockOutDistanceMeters = freezed,Object? geofenceOverride = null,Object? overrideRequestId = freezed,Object? skipReasonId = freezed,Object? skipReasonCode = freezed,Object? skipNotes = freezed,Object? clockInNotes = freezed,Object? clockOutNotes = freezed,Object? visitNotes = freezed,Object? syncState = null,Object? syncError = freezed,Object? lastSyncedAt = freezed,Object? mappingRequest = freezed,}) {
  return _then(_OutletVisit(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String?,dailyRouteLocalId: null == dailyRouteLocalId ? _self.dailyRouteLocalId : dailyRouteLocalId // ignore: cast_nullable_to_non_nullable
as String,dailyRouteServerId: freezed == dailyRouteServerId ? _self.dailyRouteServerId : dailyRouteServerId // ignore: cast_nullable_to_non_nullable
as String?,outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,outletCode: null == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String,outletName: null == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String,outletLatitude: null == outletLatitude ? _self.outletLatitude : outletLatitude // ignore: cast_nullable_to_non_nullable
as double,outletLongitude: null == outletLongitude ? _self.outletLongitude : outletLongitude // ignore: cast_nullable_to_non_nullable
as double,geofenceRadiusMeters: null == geofenceRadiusMeters ? _self.geofenceRadiusMeters : geofenceRadiusMeters // ignore: cast_nullable_to_non_nullable
as double,scheduleServerId: freezed == scheduleServerId ? _self.scheduleServerId : scheduleServerId // ignore: cast_nullable_to_non_nullable
as String?,visitOrder: null == visitOrder ? _self.visitOrder : visitOrder // ignore: cast_nullable_to_non_nullable
as int,scheduledClockIn: freezed == scheduledClockIn ? _self.scheduledClockIn : scheduledClockIn // ignore: cast_nullable_to_non_nullable
as String?,scheduledClockOut: freezed == scheduledClockOut ? _self.scheduledClockOut : scheduledClockOut // ignore: cast_nullable_to_non_nullable
as String?,allocatedMinutes: null == allocatedMinutes ? _self.allocatedMinutes : allocatedMinutes // ignore: cast_nullable_to_non_nullable
as int,visitPriority: null == visitPriority ? _self.visitPriority : visitPriority // ignore: cast_nullable_to_non_nullable
as int,visitType: null == visitType ? _self.visitType : visitType // ignore: cast_nullable_to_non_nullable
as VisitType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VisitStatus,actualClockIn: freezed == actualClockIn ? _self.actualClockIn : actualClockIn // ignore: cast_nullable_to_non_nullable
as DateTime?,actualClockOut: freezed == actualClockOut ? _self.actualClockOut : actualClockOut // ignore: cast_nullable_to_non_nullable
as DateTime?,visitDurationMins: freezed == visitDurationMins ? _self.visitDurationMins : visitDurationMins // ignore: cast_nullable_to_non_nullable
as int?,clockInLatitude: freezed == clockInLatitude ? _self.clockInLatitude : clockInLatitude // ignore: cast_nullable_to_non_nullable
as double?,clockInLongitude: freezed == clockInLongitude ? _self.clockInLongitude : clockInLongitude // ignore: cast_nullable_to_non_nullable
as double?,clockInAccuracyMeters: freezed == clockInAccuracyMeters ? _self.clockInAccuracyMeters : clockInAccuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,clockInDistanceMeters: freezed == clockInDistanceMeters ? _self.clockInDistanceMeters : clockInDistanceMeters // ignore: cast_nullable_to_non_nullable
as double?,clockOutLatitude: freezed == clockOutLatitude ? _self.clockOutLatitude : clockOutLatitude // ignore: cast_nullable_to_non_nullable
as double?,clockOutLongitude: freezed == clockOutLongitude ? _self.clockOutLongitude : clockOutLongitude // ignore: cast_nullable_to_non_nullable
as double?,clockOutAccuracyMeters: freezed == clockOutAccuracyMeters ? _self.clockOutAccuracyMeters : clockOutAccuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,clockOutDistanceMeters: freezed == clockOutDistanceMeters ? _self.clockOutDistanceMeters : clockOutDistanceMeters // ignore: cast_nullable_to_non_nullable
as double?,geofenceOverride: null == geofenceOverride ? _self.geofenceOverride : geofenceOverride // ignore: cast_nullable_to_non_nullable
as bool,overrideRequestId: freezed == overrideRequestId ? _self.overrideRequestId : overrideRequestId // ignore: cast_nullable_to_non_nullable
as String?,skipReasonId: freezed == skipReasonId ? _self.skipReasonId : skipReasonId // ignore: cast_nullable_to_non_nullable
as int?,skipReasonCode: freezed == skipReasonCode ? _self.skipReasonCode : skipReasonCode // ignore: cast_nullable_to_non_nullable
as String?,skipNotes: freezed == skipNotes ? _self.skipNotes : skipNotes // ignore: cast_nullable_to_non_nullable
as String?,clockInNotes: freezed == clockInNotes ? _self.clockInNotes : clockInNotes // ignore: cast_nullable_to_non_nullable
as String?,clockOutNotes: freezed == clockOutNotes ? _self.clockOutNotes : clockOutNotes // ignore: cast_nullable_to_non_nullable
as String?,visitNotes: freezed == visitNotes ? _self.visitNotes : visitNotes // ignore: cast_nullable_to_non_nullable
as String?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,mappingRequest: freezed == mappingRequest ? _self.mappingRequest : mappingRequest // ignore: cast_nullable_to_non_nullable
as MappingRequest?,
  ));
}


}

// dart format on
