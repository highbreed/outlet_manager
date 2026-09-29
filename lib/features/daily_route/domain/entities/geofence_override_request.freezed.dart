// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geofence_override_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeofenceOverrideRequest {

/// Local UUID for offline-first operations
 String get localId;/// Backend override request ID (null until synced)
 String? get serverId;// === Visit Reference ===
/// Local ID of the visit this override is for
 String get outletVisitLocalId;/// Server ID of the visit (null until visit synced)
 String? get outletVisitServerId;// === Request Details ===
/// User who requested the override (agent)
 String get requestedByUserId;/// Agent's name (for display in supervisor UI)
 String? get requestedByName;/// When the override was requested
 DateTime get requestedAt;/// Agent's reason for the request
 String get reason;// === Location at Request Time ===
/// GPS latitude when requesting
 double get requestLatitude;/// GPS longitude when requesting
 double get requestLongitude;/// GPS accuracy when requesting (meters)
 double get requestAccuracyMeters;/// Distance from outlet when requesting (meters)
 double get distanceFromOutlet;// === Outlet Info (for supervisor display) ===
/// Outlet name
 String? get outletName;/// Outlet code
 String? get outletCode;// === Status ===
/// Current status of the request
 GeofenceOverrideStatus get status;/// When the request expires (default 15 min from request)
 DateTime get expiresAt;// === Decision Details (filled when approved/rejected) ===
/// User who made the decision (supervisor)
 String? get decidedByUserId;/// Supervisor's name
 String? get decidedByName;/// When the decision was made
 DateTime? get decidedAt;/// Notes from the supervisor
 String? get decisionNotes;// === Sync State ===
/// Current sync state with backend
 SyncState get syncState;/// Last sync error message (if any)
 String? get syncError;
/// Create a copy of GeofenceOverrideRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeofenceOverrideRequestCopyWith<GeofenceOverrideRequest> get copyWith => _$GeofenceOverrideRequestCopyWithImpl<GeofenceOverrideRequest>(this as GeofenceOverrideRequest, _$identity);

  /// Serializes this GeofenceOverrideRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeofenceOverrideRequest&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.outletVisitLocalId, outletVisitLocalId) || other.outletVisitLocalId == outletVisitLocalId)&&(identical(other.outletVisitServerId, outletVisitServerId) || other.outletVisitServerId == outletVisitServerId)&&(identical(other.requestedByUserId, requestedByUserId) || other.requestedByUserId == requestedByUserId)&&(identical(other.requestedByName, requestedByName) || other.requestedByName == requestedByName)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestLatitude, requestLatitude) || other.requestLatitude == requestLatitude)&&(identical(other.requestLongitude, requestLongitude) || other.requestLongitude == requestLongitude)&&(identical(other.requestAccuracyMeters, requestAccuracyMeters) || other.requestAccuracyMeters == requestAccuracyMeters)&&(identical(other.distanceFromOutlet, distanceFromOutlet) || other.distanceFromOutlet == distanceFromOutlet)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.decidedByUserId, decidedByUserId) || other.decidedByUserId == decidedByUserId)&&(identical(other.decidedByName, decidedByName) || other.decidedByName == decidedByName)&&(identical(other.decidedAt, decidedAt) || other.decidedAt == decidedAt)&&(identical(other.decisionNotes, decisionNotes) || other.decisionNotes == decisionNotes)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,localId,serverId,outletVisitLocalId,outletVisitServerId,requestedByUserId,requestedByName,requestedAt,reason,requestLatitude,requestLongitude,requestAccuracyMeters,distanceFromOutlet,outletName,outletCode,status,expiresAt,decidedByUserId,decidedByName,decidedAt,decisionNotes,syncState,syncError]);

@override
String toString() {
  return 'GeofenceOverrideRequest(localId: $localId, serverId: $serverId, outletVisitLocalId: $outletVisitLocalId, outletVisitServerId: $outletVisitServerId, requestedByUserId: $requestedByUserId, requestedByName: $requestedByName, requestedAt: $requestedAt, reason: $reason, requestLatitude: $requestLatitude, requestLongitude: $requestLongitude, requestAccuracyMeters: $requestAccuracyMeters, distanceFromOutlet: $distanceFromOutlet, outletName: $outletName, outletCode: $outletCode, status: $status, expiresAt: $expiresAt, decidedByUserId: $decidedByUserId, decidedByName: $decidedByName, decidedAt: $decidedAt, decisionNotes: $decisionNotes, syncState: $syncState, syncError: $syncError)';
}


}

/// @nodoc
abstract mixin class $GeofenceOverrideRequestCopyWith<$Res>  {
  factory $GeofenceOverrideRequestCopyWith(GeofenceOverrideRequest value, $Res Function(GeofenceOverrideRequest) _then) = _$GeofenceOverrideRequestCopyWithImpl;
@useResult
$Res call({
 String localId, String? serverId, String outletVisitLocalId, String? outletVisitServerId, String requestedByUserId, String? requestedByName, DateTime requestedAt, String reason, double requestLatitude, double requestLongitude, double requestAccuracyMeters, double distanceFromOutlet, String? outletName, String? outletCode, GeofenceOverrideStatus status, DateTime expiresAt, String? decidedByUserId, String? decidedByName, DateTime? decidedAt, String? decisionNotes, SyncState syncState, String? syncError
});




}
/// @nodoc
class _$GeofenceOverrideRequestCopyWithImpl<$Res>
    implements $GeofenceOverrideRequestCopyWith<$Res> {
  _$GeofenceOverrideRequestCopyWithImpl(this._self, this._then);

  final GeofenceOverrideRequest _self;
  final $Res Function(GeofenceOverrideRequest) _then;

/// Create a copy of GeofenceOverrideRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? serverId = freezed,Object? outletVisitLocalId = null,Object? outletVisitServerId = freezed,Object? requestedByUserId = null,Object? requestedByName = freezed,Object? requestedAt = null,Object? reason = null,Object? requestLatitude = null,Object? requestLongitude = null,Object? requestAccuracyMeters = null,Object? distanceFromOutlet = null,Object? outletName = freezed,Object? outletCode = freezed,Object? status = null,Object? expiresAt = null,Object? decidedByUserId = freezed,Object? decidedByName = freezed,Object? decidedAt = freezed,Object? decisionNotes = freezed,Object? syncState = null,Object? syncError = freezed,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String?,outletVisitLocalId: null == outletVisitLocalId ? _self.outletVisitLocalId : outletVisitLocalId // ignore: cast_nullable_to_non_nullable
as String,outletVisitServerId: freezed == outletVisitServerId ? _self.outletVisitServerId : outletVisitServerId // ignore: cast_nullable_to_non_nullable
as String?,requestedByUserId: null == requestedByUserId ? _self.requestedByUserId : requestedByUserId // ignore: cast_nullable_to_non_nullable
as String,requestedByName: freezed == requestedByName ? _self.requestedByName : requestedByName // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,requestLatitude: null == requestLatitude ? _self.requestLatitude : requestLatitude // ignore: cast_nullable_to_non_nullable
as double,requestLongitude: null == requestLongitude ? _self.requestLongitude : requestLongitude // ignore: cast_nullable_to_non_nullable
as double,requestAccuracyMeters: null == requestAccuracyMeters ? _self.requestAccuracyMeters : requestAccuracyMeters // ignore: cast_nullable_to_non_nullable
as double,distanceFromOutlet: null == distanceFromOutlet ? _self.distanceFromOutlet : distanceFromOutlet // ignore: cast_nullable_to_non_nullable
as double,outletName: freezed == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String?,outletCode: freezed == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeofenceOverrideStatus,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,decidedByUserId: freezed == decidedByUserId ? _self.decidedByUserId : decidedByUserId // ignore: cast_nullable_to_non_nullable
as String?,decidedByName: freezed == decidedByName ? _self.decidedByName : decidedByName // ignore: cast_nullable_to_non_nullable
as String?,decidedAt: freezed == decidedAt ? _self.decidedAt : decidedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,decisionNotes: freezed == decisionNotes ? _self.decisionNotes : decisionNotes // ignore: cast_nullable_to_non_nullable
as String?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GeofenceOverrideRequest].
extension GeofenceOverrideRequestPatterns on GeofenceOverrideRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeofenceOverrideRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeofenceOverrideRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeofenceOverrideRequest value)  $default,){
final _that = this;
switch (_that) {
case _GeofenceOverrideRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeofenceOverrideRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GeofenceOverrideRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  String? serverId,  String outletVisitLocalId,  String? outletVisitServerId,  String requestedByUserId,  String? requestedByName,  DateTime requestedAt,  String reason,  double requestLatitude,  double requestLongitude,  double requestAccuracyMeters,  double distanceFromOutlet,  String? outletName,  String? outletCode,  GeofenceOverrideStatus status,  DateTime expiresAt,  String? decidedByUserId,  String? decidedByName,  DateTime? decidedAt,  String? decisionNotes,  SyncState syncState,  String? syncError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeofenceOverrideRequest() when $default != null:
return $default(_that.localId,_that.serverId,_that.outletVisitLocalId,_that.outletVisitServerId,_that.requestedByUserId,_that.requestedByName,_that.requestedAt,_that.reason,_that.requestLatitude,_that.requestLongitude,_that.requestAccuracyMeters,_that.distanceFromOutlet,_that.outletName,_that.outletCode,_that.status,_that.expiresAt,_that.decidedByUserId,_that.decidedByName,_that.decidedAt,_that.decisionNotes,_that.syncState,_that.syncError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  String? serverId,  String outletVisitLocalId,  String? outletVisitServerId,  String requestedByUserId,  String? requestedByName,  DateTime requestedAt,  String reason,  double requestLatitude,  double requestLongitude,  double requestAccuracyMeters,  double distanceFromOutlet,  String? outletName,  String? outletCode,  GeofenceOverrideStatus status,  DateTime expiresAt,  String? decidedByUserId,  String? decidedByName,  DateTime? decidedAt,  String? decisionNotes,  SyncState syncState,  String? syncError)  $default,) {final _that = this;
switch (_that) {
case _GeofenceOverrideRequest():
return $default(_that.localId,_that.serverId,_that.outletVisitLocalId,_that.outletVisitServerId,_that.requestedByUserId,_that.requestedByName,_that.requestedAt,_that.reason,_that.requestLatitude,_that.requestLongitude,_that.requestAccuracyMeters,_that.distanceFromOutlet,_that.outletName,_that.outletCode,_that.status,_that.expiresAt,_that.decidedByUserId,_that.decidedByName,_that.decidedAt,_that.decisionNotes,_that.syncState,_that.syncError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  String? serverId,  String outletVisitLocalId,  String? outletVisitServerId,  String requestedByUserId,  String? requestedByName,  DateTime requestedAt,  String reason,  double requestLatitude,  double requestLongitude,  double requestAccuracyMeters,  double distanceFromOutlet,  String? outletName,  String? outletCode,  GeofenceOverrideStatus status,  DateTime expiresAt,  String? decidedByUserId,  String? decidedByName,  DateTime? decidedAt,  String? decisionNotes,  SyncState syncState,  String? syncError)?  $default,) {final _that = this;
switch (_that) {
case _GeofenceOverrideRequest() when $default != null:
return $default(_that.localId,_that.serverId,_that.outletVisitLocalId,_that.outletVisitServerId,_that.requestedByUserId,_that.requestedByName,_that.requestedAt,_that.reason,_that.requestLatitude,_that.requestLongitude,_that.requestAccuracyMeters,_that.distanceFromOutlet,_that.outletName,_that.outletCode,_that.status,_that.expiresAt,_that.decidedByUserId,_that.decidedByName,_that.decidedAt,_that.decisionNotes,_that.syncState,_that.syncError);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeofenceOverrideRequest implements GeofenceOverrideRequest {
  const _GeofenceOverrideRequest({required this.localId, this.serverId, required this.outletVisitLocalId, this.outletVisitServerId, required this.requestedByUserId, this.requestedByName, required this.requestedAt, required this.reason, required this.requestLatitude, required this.requestLongitude, required this.requestAccuracyMeters, required this.distanceFromOutlet, this.outletName, this.outletCode, required this.status, required this.expiresAt, this.decidedByUserId, this.decidedByName, this.decidedAt, this.decisionNotes, this.syncState = SyncState.localOnly, this.syncError});
  factory _GeofenceOverrideRequest.fromJson(Map<String, dynamic> json) => _$GeofenceOverrideRequestFromJson(json);

/// Local UUID for offline-first operations
@override final  String localId;
/// Backend override request ID (null until synced)
@override final  String? serverId;
// === Visit Reference ===
/// Local ID of the visit this override is for
@override final  String outletVisitLocalId;
/// Server ID of the visit (null until visit synced)
@override final  String? outletVisitServerId;
// === Request Details ===
/// User who requested the override (agent)
@override final  String requestedByUserId;
/// Agent's name (for display in supervisor UI)
@override final  String? requestedByName;
/// When the override was requested
@override final  DateTime requestedAt;
/// Agent's reason for the request
@override final  String reason;
// === Location at Request Time ===
/// GPS latitude when requesting
@override final  double requestLatitude;
/// GPS longitude when requesting
@override final  double requestLongitude;
/// GPS accuracy when requesting (meters)
@override final  double requestAccuracyMeters;
/// Distance from outlet when requesting (meters)
@override final  double distanceFromOutlet;
// === Outlet Info (for supervisor display) ===
/// Outlet name
@override final  String? outletName;
/// Outlet code
@override final  String? outletCode;
// === Status ===
/// Current status of the request
@override final  GeofenceOverrideStatus status;
/// When the request expires (default 15 min from request)
@override final  DateTime expiresAt;
// === Decision Details (filled when approved/rejected) ===
/// User who made the decision (supervisor)
@override final  String? decidedByUserId;
/// Supervisor's name
@override final  String? decidedByName;
/// When the decision was made
@override final  DateTime? decidedAt;
/// Notes from the supervisor
@override final  String? decisionNotes;
// === Sync State ===
/// Current sync state with backend
@override@JsonKey() final  SyncState syncState;
/// Last sync error message (if any)
@override final  String? syncError;

/// Create a copy of GeofenceOverrideRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeofenceOverrideRequestCopyWith<_GeofenceOverrideRequest> get copyWith => __$GeofenceOverrideRequestCopyWithImpl<_GeofenceOverrideRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeofenceOverrideRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeofenceOverrideRequest&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.outletVisitLocalId, outletVisitLocalId) || other.outletVisitLocalId == outletVisitLocalId)&&(identical(other.outletVisitServerId, outletVisitServerId) || other.outletVisitServerId == outletVisitServerId)&&(identical(other.requestedByUserId, requestedByUserId) || other.requestedByUserId == requestedByUserId)&&(identical(other.requestedByName, requestedByName) || other.requestedByName == requestedByName)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestLatitude, requestLatitude) || other.requestLatitude == requestLatitude)&&(identical(other.requestLongitude, requestLongitude) || other.requestLongitude == requestLongitude)&&(identical(other.requestAccuracyMeters, requestAccuracyMeters) || other.requestAccuracyMeters == requestAccuracyMeters)&&(identical(other.distanceFromOutlet, distanceFromOutlet) || other.distanceFromOutlet == distanceFromOutlet)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.decidedByUserId, decidedByUserId) || other.decidedByUserId == decidedByUserId)&&(identical(other.decidedByName, decidedByName) || other.decidedByName == decidedByName)&&(identical(other.decidedAt, decidedAt) || other.decidedAt == decidedAt)&&(identical(other.decisionNotes, decisionNotes) || other.decisionNotes == decisionNotes)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,localId,serverId,outletVisitLocalId,outletVisitServerId,requestedByUserId,requestedByName,requestedAt,reason,requestLatitude,requestLongitude,requestAccuracyMeters,distanceFromOutlet,outletName,outletCode,status,expiresAt,decidedByUserId,decidedByName,decidedAt,decisionNotes,syncState,syncError]);

@override
String toString() {
  return 'GeofenceOverrideRequest(localId: $localId, serverId: $serverId, outletVisitLocalId: $outletVisitLocalId, outletVisitServerId: $outletVisitServerId, requestedByUserId: $requestedByUserId, requestedByName: $requestedByName, requestedAt: $requestedAt, reason: $reason, requestLatitude: $requestLatitude, requestLongitude: $requestLongitude, requestAccuracyMeters: $requestAccuracyMeters, distanceFromOutlet: $distanceFromOutlet, outletName: $outletName, outletCode: $outletCode, status: $status, expiresAt: $expiresAt, decidedByUserId: $decidedByUserId, decidedByName: $decidedByName, decidedAt: $decidedAt, decisionNotes: $decisionNotes, syncState: $syncState, syncError: $syncError)';
}


}

/// @nodoc
abstract mixin class _$GeofenceOverrideRequestCopyWith<$Res> implements $GeofenceOverrideRequestCopyWith<$Res> {
  factory _$GeofenceOverrideRequestCopyWith(_GeofenceOverrideRequest value, $Res Function(_GeofenceOverrideRequest) _then) = __$GeofenceOverrideRequestCopyWithImpl;
@override @useResult
$Res call({
 String localId, String? serverId, String outletVisitLocalId, String? outletVisitServerId, String requestedByUserId, String? requestedByName, DateTime requestedAt, String reason, double requestLatitude, double requestLongitude, double requestAccuracyMeters, double distanceFromOutlet, String? outletName, String? outletCode, GeofenceOverrideStatus status, DateTime expiresAt, String? decidedByUserId, String? decidedByName, DateTime? decidedAt, String? decisionNotes, SyncState syncState, String? syncError
});




}
/// @nodoc
class __$GeofenceOverrideRequestCopyWithImpl<$Res>
    implements _$GeofenceOverrideRequestCopyWith<$Res> {
  __$GeofenceOverrideRequestCopyWithImpl(this._self, this._then);

  final _GeofenceOverrideRequest _self;
  final $Res Function(_GeofenceOverrideRequest) _then;

/// Create a copy of GeofenceOverrideRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? serverId = freezed,Object? outletVisitLocalId = null,Object? outletVisitServerId = freezed,Object? requestedByUserId = null,Object? requestedByName = freezed,Object? requestedAt = null,Object? reason = null,Object? requestLatitude = null,Object? requestLongitude = null,Object? requestAccuracyMeters = null,Object? distanceFromOutlet = null,Object? outletName = freezed,Object? outletCode = freezed,Object? status = null,Object? expiresAt = null,Object? decidedByUserId = freezed,Object? decidedByName = freezed,Object? decidedAt = freezed,Object? decisionNotes = freezed,Object? syncState = null,Object? syncError = freezed,}) {
  return _then(_GeofenceOverrideRequest(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String?,outletVisitLocalId: null == outletVisitLocalId ? _self.outletVisitLocalId : outletVisitLocalId // ignore: cast_nullable_to_non_nullable
as String,outletVisitServerId: freezed == outletVisitServerId ? _self.outletVisitServerId : outletVisitServerId // ignore: cast_nullable_to_non_nullable
as String?,requestedByUserId: null == requestedByUserId ? _self.requestedByUserId : requestedByUserId // ignore: cast_nullable_to_non_nullable
as String,requestedByName: freezed == requestedByName ? _self.requestedByName : requestedByName // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,requestLatitude: null == requestLatitude ? _self.requestLatitude : requestLatitude // ignore: cast_nullable_to_non_nullable
as double,requestLongitude: null == requestLongitude ? _self.requestLongitude : requestLongitude // ignore: cast_nullable_to_non_nullable
as double,requestAccuracyMeters: null == requestAccuracyMeters ? _self.requestAccuracyMeters : requestAccuracyMeters // ignore: cast_nullable_to_non_nullable
as double,distanceFromOutlet: null == distanceFromOutlet ? _self.distanceFromOutlet : distanceFromOutlet // ignore: cast_nullable_to_non_nullable
as double,outletName: freezed == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String?,outletCode: freezed == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GeofenceOverrideStatus,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,decidedByUserId: freezed == decidedByUserId ? _self.decidedByUserId : decidedByUserId // ignore: cast_nullable_to_non_nullable
as String?,decidedByName: freezed == decidedByName ? _self.decidedByName : decidedByName // ignore: cast_nullable_to_non_nullable
as String?,decidedAt: freezed == decidedAt ? _self.decidedAt : decidedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,decisionNotes: freezed == decisionNotes ? _self.decisionNotes : decisionNotes // ignore: cast_nullable_to_non_nullable
as String?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
