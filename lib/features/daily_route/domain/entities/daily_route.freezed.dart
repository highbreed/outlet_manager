// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyRoute {

/// Local UUID for offline-first operations
 String get localId;/// Backend route ID (null until synced)
 String? get serverId;/// Agent this route belongs to
 String get salesAgentId;/// Date of the route (YYYY-MM-DD, no time component)
 DateTime get routeDate;/// Day of week (0=Monday, 6=Sunday)
 int get dayOfWeek;/// Current status of the route
 DailyRouteStatus get status;// === Timestamps ===
/// When the route was activated by the agent
 DateTime? get activatedAt;/// First clock-in time of the day
 DateTime? get firstClockInAt;/// Last clock-out time of the day
 DateTime? get lastClockOutAt;/// When the route was closed
 DateTime? get closedAt;// === Progress Tracking ===
/// Total number of scheduled visits
 int get totalScheduled;/// Number of completed visits
 int get completedCount;/// Number of skipped visits
 int get skippedCount;/// Number of visits currently in progress (should be 0 or 1)
 int get inProgressCount;/// Total time spent on visits (minutes)
 int get totalVisitTimeMins;// === Closing Details ===
/// Notes provided when closing the route
 String? get closingNotes;/// User who closed the route (usually the agent)
 String? get closedByUserId;// === Force Close (Supervisor/Manager action) ===
/// Whether route was force-closed by supervisor/manager
 bool get forceClosed;/// User who force-closed the route
 String? get forceClosedByUserId;/// When the route was force-closed
 DateTime? get forceClosedAt;/// Reason for force-closing
 String? get forceCloseReason;// === Sync State ===
/// Current sync state with backend
 SyncState get syncState;/// Last sync error message (if any)
 String? get syncError;/// Timestamp of last successful sync
 DateTime? get lastSyncedAt;
/// Create a copy of DailyRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyRouteCopyWith<DailyRoute> get copyWith => _$DailyRouteCopyWithImpl<DailyRoute>(this as DailyRoute, _$identity);

  /// Serializes this DailyRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyRoute&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.salesAgentId, salesAgentId) || other.salesAgentId == salesAgentId)&&(identical(other.routeDate, routeDate) || other.routeDate == routeDate)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.status, status) || other.status == status)&&(identical(other.activatedAt, activatedAt) || other.activatedAt == activatedAt)&&(identical(other.firstClockInAt, firstClockInAt) || other.firstClockInAt == firstClockInAt)&&(identical(other.lastClockOutAt, lastClockOutAt) || other.lastClockOutAt == lastClockOutAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.totalScheduled, totalScheduled) || other.totalScheduled == totalScheduled)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.skippedCount, skippedCount) || other.skippedCount == skippedCount)&&(identical(other.inProgressCount, inProgressCount) || other.inProgressCount == inProgressCount)&&(identical(other.totalVisitTimeMins, totalVisitTimeMins) || other.totalVisitTimeMins == totalVisitTimeMins)&&(identical(other.closingNotes, closingNotes) || other.closingNotes == closingNotes)&&(identical(other.closedByUserId, closedByUserId) || other.closedByUserId == closedByUserId)&&(identical(other.forceClosed, forceClosed) || other.forceClosed == forceClosed)&&(identical(other.forceClosedByUserId, forceClosedByUserId) || other.forceClosedByUserId == forceClosedByUserId)&&(identical(other.forceClosedAt, forceClosedAt) || other.forceClosedAt == forceClosedAt)&&(identical(other.forceCloseReason, forceCloseReason) || other.forceCloseReason == forceCloseReason)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,localId,serverId,salesAgentId,routeDate,dayOfWeek,status,activatedAt,firstClockInAt,lastClockOutAt,closedAt,totalScheduled,completedCount,skippedCount,inProgressCount,totalVisitTimeMins,closingNotes,closedByUserId,forceClosed,forceClosedByUserId,forceClosedAt,forceCloseReason,syncState,syncError,lastSyncedAt]);

@override
String toString() {
  return 'DailyRoute(localId: $localId, serverId: $serverId, salesAgentId: $salesAgentId, routeDate: $routeDate, dayOfWeek: $dayOfWeek, status: $status, activatedAt: $activatedAt, firstClockInAt: $firstClockInAt, lastClockOutAt: $lastClockOutAt, closedAt: $closedAt, totalScheduled: $totalScheduled, completedCount: $completedCount, skippedCount: $skippedCount, inProgressCount: $inProgressCount, totalVisitTimeMins: $totalVisitTimeMins, closingNotes: $closingNotes, closedByUserId: $closedByUserId, forceClosed: $forceClosed, forceClosedByUserId: $forceClosedByUserId, forceClosedAt: $forceClosedAt, forceCloseReason: $forceCloseReason, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class $DailyRouteCopyWith<$Res>  {
  factory $DailyRouteCopyWith(DailyRoute value, $Res Function(DailyRoute) _then) = _$DailyRouteCopyWithImpl;
@useResult
$Res call({
 String localId, String? serverId, String salesAgentId, DateTime routeDate, int dayOfWeek, DailyRouteStatus status, DateTime? activatedAt, DateTime? firstClockInAt, DateTime? lastClockOutAt, DateTime? closedAt, int totalScheduled, int completedCount, int skippedCount, int inProgressCount, int totalVisitTimeMins, String? closingNotes, String? closedByUserId, bool forceClosed, String? forceClosedByUserId, DateTime? forceClosedAt, String? forceCloseReason, SyncState syncState, String? syncError, DateTime? lastSyncedAt
});




}
/// @nodoc
class _$DailyRouteCopyWithImpl<$Res>
    implements $DailyRouteCopyWith<$Res> {
  _$DailyRouteCopyWithImpl(this._self, this._then);

  final DailyRoute _self;
  final $Res Function(DailyRoute) _then;

/// Create a copy of DailyRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? serverId = freezed,Object? salesAgentId = null,Object? routeDate = null,Object? dayOfWeek = null,Object? status = null,Object? activatedAt = freezed,Object? firstClockInAt = freezed,Object? lastClockOutAt = freezed,Object? closedAt = freezed,Object? totalScheduled = null,Object? completedCount = null,Object? skippedCount = null,Object? inProgressCount = null,Object? totalVisitTimeMins = null,Object? closingNotes = freezed,Object? closedByUserId = freezed,Object? forceClosed = null,Object? forceClosedByUserId = freezed,Object? forceClosedAt = freezed,Object? forceCloseReason = freezed,Object? syncState = null,Object? syncError = freezed,Object? lastSyncedAt = freezed,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String?,salesAgentId: null == salesAgentId ? _self.salesAgentId : salesAgentId // ignore: cast_nullable_to_non_nullable
as String,routeDate: null == routeDate ? _self.routeDate : routeDate // ignore: cast_nullable_to_non_nullable
as DateTime,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DailyRouteStatus,activatedAt: freezed == activatedAt ? _self.activatedAt : activatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,firstClockInAt: freezed == firstClockInAt ? _self.firstClockInAt : firstClockInAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastClockOutAt: freezed == lastClockOutAt ? _self.lastClockOutAt : lastClockOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalScheduled: null == totalScheduled ? _self.totalScheduled : totalScheduled // ignore: cast_nullable_to_non_nullable
as int,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,skippedCount: null == skippedCount ? _self.skippedCount : skippedCount // ignore: cast_nullable_to_non_nullable
as int,inProgressCount: null == inProgressCount ? _self.inProgressCount : inProgressCount // ignore: cast_nullable_to_non_nullable
as int,totalVisitTimeMins: null == totalVisitTimeMins ? _self.totalVisitTimeMins : totalVisitTimeMins // ignore: cast_nullable_to_non_nullable
as int,closingNotes: freezed == closingNotes ? _self.closingNotes : closingNotes // ignore: cast_nullable_to_non_nullable
as String?,closedByUserId: freezed == closedByUserId ? _self.closedByUserId : closedByUserId // ignore: cast_nullable_to_non_nullable
as String?,forceClosed: null == forceClosed ? _self.forceClosed : forceClosed // ignore: cast_nullable_to_non_nullable
as bool,forceClosedByUserId: freezed == forceClosedByUserId ? _self.forceClosedByUserId : forceClosedByUserId // ignore: cast_nullable_to_non_nullable
as String?,forceClosedAt: freezed == forceClosedAt ? _self.forceClosedAt : forceClosedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,forceCloseReason: freezed == forceCloseReason ? _self.forceCloseReason : forceCloseReason // ignore: cast_nullable_to_non_nullable
as String?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyRoute].
extension DailyRoutePatterns on DailyRoute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyRoute value)  $default,){
final _that = this;
switch (_that) {
case _DailyRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyRoute value)?  $default,){
final _that = this;
switch (_that) {
case _DailyRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  String? serverId,  String salesAgentId,  DateTime routeDate,  int dayOfWeek,  DailyRouteStatus status,  DateTime? activatedAt,  DateTime? firstClockInAt,  DateTime? lastClockOutAt,  DateTime? closedAt,  int totalScheduled,  int completedCount,  int skippedCount,  int inProgressCount,  int totalVisitTimeMins,  String? closingNotes,  String? closedByUserId,  bool forceClosed,  String? forceClosedByUserId,  DateTime? forceClosedAt,  String? forceCloseReason,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyRoute() when $default != null:
return $default(_that.localId,_that.serverId,_that.salesAgentId,_that.routeDate,_that.dayOfWeek,_that.status,_that.activatedAt,_that.firstClockInAt,_that.lastClockOutAt,_that.closedAt,_that.totalScheduled,_that.completedCount,_that.skippedCount,_that.inProgressCount,_that.totalVisitTimeMins,_that.closingNotes,_that.closedByUserId,_that.forceClosed,_that.forceClosedByUserId,_that.forceClosedAt,_that.forceCloseReason,_that.syncState,_that.syncError,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  String? serverId,  String salesAgentId,  DateTime routeDate,  int dayOfWeek,  DailyRouteStatus status,  DateTime? activatedAt,  DateTime? firstClockInAt,  DateTime? lastClockOutAt,  DateTime? closedAt,  int totalScheduled,  int completedCount,  int skippedCount,  int inProgressCount,  int totalVisitTimeMins,  String? closingNotes,  String? closedByUserId,  bool forceClosed,  String? forceClosedByUserId,  DateTime? forceClosedAt,  String? forceCloseReason,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt)  $default,) {final _that = this;
switch (_that) {
case _DailyRoute():
return $default(_that.localId,_that.serverId,_that.salesAgentId,_that.routeDate,_that.dayOfWeek,_that.status,_that.activatedAt,_that.firstClockInAt,_that.lastClockOutAt,_that.closedAt,_that.totalScheduled,_that.completedCount,_that.skippedCount,_that.inProgressCount,_that.totalVisitTimeMins,_that.closingNotes,_that.closedByUserId,_that.forceClosed,_that.forceClosedByUserId,_that.forceClosedAt,_that.forceCloseReason,_that.syncState,_that.syncError,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  String? serverId,  String salesAgentId,  DateTime routeDate,  int dayOfWeek,  DailyRouteStatus status,  DateTime? activatedAt,  DateTime? firstClockInAt,  DateTime? lastClockOutAt,  DateTime? closedAt,  int totalScheduled,  int completedCount,  int skippedCount,  int inProgressCount,  int totalVisitTimeMins,  String? closingNotes,  String? closedByUserId,  bool forceClosed,  String? forceClosedByUserId,  DateTime? forceClosedAt,  String? forceCloseReason,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt)?  $default,) {final _that = this;
switch (_that) {
case _DailyRoute() when $default != null:
return $default(_that.localId,_that.serverId,_that.salesAgentId,_that.routeDate,_that.dayOfWeek,_that.status,_that.activatedAt,_that.firstClockInAt,_that.lastClockOutAt,_that.closedAt,_that.totalScheduled,_that.completedCount,_that.skippedCount,_that.inProgressCount,_that.totalVisitTimeMins,_that.closingNotes,_that.closedByUserId,_that.forceClosed,_that.forceClosedByUserId,_that.forceClosedAt,_that.forceCloseReason,_that.syncState,_that.syncError,_that.lastSyncedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyRoute implements DailyRoute {
  const _DailyRoute({required this.localId, this.serverId, required this.salesAgentId, required this.routeDate, required this.dayOfWeek, required this.status, this.activatedAt, this.firstClockInAt, this.lastClockOutAt, this.closedAt, this.totalScheduled = 0, this.completedCount = 0, this.skippedCount = 0, this.inProgressCount = 0, this.totalVisitTimeMins = 0, this.closingNotes, this.closedByUserId, this.forceClosed = false, this.forceClosedByUserId, this.forceClosedAt, this.forceCloseReason, this.syncState = SyncState.localOnly, this.syncError, this.lastSyncedAt});
  factory _DailyRoute.fromJson(Map<String, dynamic> json) => _$DailyRouteFromJson(json);

/// Local UUID for offline-first operations
@override final  String localId;
/// Backend route ID (null until synced)
@override final  String? serverId;
/// Agent this route belongs to
@override final  String salesAgentId;
/// Date of the route (YYYY-MM-DD, no time component)
@override final  DateTime routeDate;
/// Day of week (0=Monday, 6=Sunday)
@override final  int dayOfWeek;
/// Current status of the route
@override final  DailyRouteStatus status;
// === Timestamps ===
/// When the route was activated by the agent
@override final  DateTime? activatedAt;
/// First clock-in time of the day
@override final  DateTime? firstClockInAt;
/// Last clock-out time of the day
@override final  DateTime? lastClockOutAt;
/// When the route was closed
@override final  DateTime? closedAt;
// === Progress Tracking ===
/// Total number of scheduled visits
@override@JsonKey() final  int totalScheduled;
/// Number of completed visits
@override@JsonKey() final  int completedCount;
/// Number of skipped visits
@override@JsonKey() final  int skippedCount;
/// Number of visits currently in progress (should be 0 or 1)
@override@JsonKey() final  int inProgressCount;
/// Total time spent on visits (minutes)
@override@JsonKey() final  int totalVisitTimeMins;
// === Closing Details ===
/// Notes provided when closing the route
@override final  String? closingNotes;
/// User who closed the route (usually the agent)
@override final  String? closedByUserId;
// === Force Close (Supervisor/Manager action) ===
/// Whether route was force-closed by supervisor/manager
@override@JsonKey() final  bool forceClosed;
/// User who force-closed the route
@override final  String? forceClosedByUserId;
/// When the route was force-closed
@override final  DateTime? forceClosedAt;
/// Reason for force-closing
@override final  String? forceCloseReason;
// === Sync State ===
/// Current sync state with backend
@override@JsonKey() final  SyncState syncState;
/// Last sync error message (if any)
@override final  String? syncError;
/// Timestamp of last successful sync
@override final  DateTime? lastSyncedAt;

/// Create a copy of DailyRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyRouteCopyWith<_DailyRoute> get copyWith => __$DailyRouteCopyWithImpl<_DailyRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyRouteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyRoute&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.salesAgentId, salesAgentId) || other.salesAgentId == salesAgentId)&&(identical(other.routeDate, routeDate) || other.routeDate == routeDate)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.status, status) || other.status == status)&&(identical(other.activatedAt, activatedAt) || other.activatedAt == activatedAt)&&(identical(other.firstClockInAt, firstClockInAt) || other.firstClockInAt == firstClockInAt)&&(identical(other.lastClockOutAt, lastClockOutAt) || other.lastClockOutAt == lastClockOutAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.totalScheduled, totalScheduled) || other.totalScheduled == totalScheduled)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.skippedCount, skippedCount) || other.skippedCount == skippedCount)&&(identical(other.inProgressCount, inProgressCount) || other.inProgressCount == inProgressCount)&&(identical(other.totalVisitTimeMins, totalVisitTimeMins) || other.totalVisitTimeMins == totalVisitTimeMins)&&(identical(other.closingNotes, closingNotes) || other.closingNotes == closingNotes)&&(identical(other.closedByUserId, closedByUserId) || other.closedByUserId == closedByUserId)&&(identical(other.forceClosed, forceClosed) || other.forceClosed == forceClosed)&&(identical(other.forceClosedByUserId, forceClosedByUserId) || other.forceClosedByUserId == forceClosedByUserId)&&(identical(other.forceClosedAt, forceClosedAt) || other.forceClosedAt == forceClosedAt)&&(identical(other.forceCloseReason, forceCloseReason) || other.forceCloseReason == forceCloseReason)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,localId,serverId,salesAgentId,routeDate,dayOfWeek,status,activatedAt,firstClockInAt,lastClockOutAt,closedAt,totalScheduled,completedCount,skippedCount,inProgressCount,totalVisitTimeMins,closingNotes,closedByUserId,forceClosed,forceClosedByUserId,forceClosedAt,forceCloseReason,syncState,syncError,lastSyncedAt]);

@override
String toString() {
  return 'DailyRoute(localId: $localId, serverId: $serverId, salesAgentId: $salesAgentId, routeDate: $routeDate, dayOfWeek: $dayOfWeek, status: $status, activatedAt: $activatedAt, firstClockInAt: $firstClockInAt, lastClockOutAt: $lastClockOutAt, closedAt: $closedAt, totalScheduled: $totalScheduled, completedCount: $completedCount, skippedCount: $skippedCount, inProgressCount: $inProgressCount, totalVisitTimeMins: $totalVisitTimeMins, closingNotes: $closingNotes, closedByUserId: $closedByUserId, forceClosed: $forceClosed, forceClosedByUserId: $forceClosedByUserId, forceClosedAt: $forceClosedAt, forceCloseReason: $forceCloseReason, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class _$DailyRouteCopyWith<$Res> implements $DailyRouteCopyWith<$Res> {
  factory _$DailyRouteCopyWith(_DailyRoute value, $Res Function(_DailyRoute) _then) = __$DailyRouteCopyWithImpl;
@override @useResult
$Res call({
 String localId, String? serverId, String salesAgentId, DateTime routeDate, int dayOfWeek, DailyRouteStatus status, DateTime? activatedAt, DateTime? firstClockInAt, DateTime? lastClockOutAt, DateTime? closedAt, int totalScheduled, int completedCount, int skippedCount, int inProgressCount, int totalVisitTimeMins, String? closingNotes, String? closedByUserId, bool forceClosed, String? forceClosedByUserId, DateTime? forceClosedAt, String? forceCloseReason, SyncState syncState, String? syncError, DateTime? lastSyncedAt
});




}
/// @nodoc
class __$DailyRouteCopyWithImpl<$Res>
    implements _$DailyRouteCopyWith<$Res> {
  __$DailyRouteCopyWithImpl(this._self, this._then);

  final _DailyRoute _self;
  final $Res Function(_DailyRoute) _then;

/// Create a copy of DailyRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? serverId = freezed,Object? salesAgentId = null,Object? routeDate = null,Object? dayOfWeek = null,Object? status = null,Object? activatedAt = freezed,Object? firstClockInAt = freezed,Object? lastClockOutAt = freezed,Object? closedAt = freezed,Object? totalScheduled = null,Object? completedCount = null,Object? skippedCount = null,Object? inProgressCount = null,Object? totalVisitTimeMins = null,Object? closingNotes = freezed,Object? closedByUserId = freezed,Object? forceClosed = null,Object? forceClosedByUserId = freezed,Object? forceClosedAt = freezed,Object? forceCloseReason = freezed,Object? syncState = null,Object? syncError = freezed,Object? lastSyncedAt = freezed,}) {
  return _then(_DailyRoute(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String?,salesAgentId: null == salesAgentId ? _self.salesAgentId : salesAgentId // ignore: cast_nullable_to_non_nullable
as String,routeDate: null == routeDate ? _self.routeDate : routeDate // ignore: cast_nullable_to_non_nullable
as DateTime,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DailyRouteStatus,activatedAt: freezed == activatedAt ? _self.activatedAt : activatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,firstClockInAt: freezed == firstClockInAt ? _self.firstClockInAt : firstClockInAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastClockOutAt: freezed == lastClockOutAt ? _self.lastClockOutAt : lastClockOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalScheduled: null == totalScheduled ? _self.totalScheduled : totalScheduled // ignore: cast_nullable_to_non_nullable
as int,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,skippedCount: null == skippedCount ? _self.skippedCount : skippedCount // ignore: cast_nullable_to_non_nullable
as int,inProgressCount: null == inProgressCount ? _self.inProgressCount : inProgressCount // ignore: cast_nullable_to_non_nullable
as int,totalVisitTimeMins: null == totalVisitTimeMins ? _self.totalVisitTimeMins : totalVisitTimeMins // ignore: cast_nullable_to_non_nullable
as int,closingNotes: freezed == closingNotes ? _self.closingNotes : closingNotes // ignore: cast_nullable_to_non_nullable
as String?,closedByUserId: freezed == closedByUserId ? _self.closedByUserId : closedByUserId // ignore: cast_nullable_to_non_nullable
as String?,forceClosed: null == forceClosed ? _self.forceClosed : forceClosed // ignore: cast_nullable_to_non_nullable
as bool,forceClosedByUserId: freezed == forceClosedByUserId ? _self.forceClosedByUserId : forceClosedByUserId // ignore: cast_nullable_to_non_nullable
as String?,forceClosedAt: freezed == forceClosedAt ? _self.forceClosedAt : forceClosedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,forceCloseReason: freezed == forceCloseReason ? _self.forceCloseReason : forceCloseReason // ignore: cast_nullable_to_non_nullable
as String?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
