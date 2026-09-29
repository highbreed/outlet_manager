// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_in_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClockInSession {

 String get id; String get outletId; String get outletName; String get outletCode; bool get isDeviation; String? get routeId;// Link to assigned route
 DateTime get clockedInAt; double get clockInLatitude; double get clockInLongitude; double get clockInAccuracy;// GPS accuracy at clock-in
 int get allocatedMinutes; ClockInStatus get status;// Configuration snapshot (for audit trail)
 double get geofenceRadiusMeters; int get autoClockoutGraceMinutes;// Exit tracking with confirmation
 DateTime? get firstOutsideReadingAt;// Initial outside detection
 DateTime? get confirmedExitAt;// After 2 readings OR 3 min
 int get consecutiveOutsideReadings;// Counter for confirmation
 int get consecutiveInsideReadings;// Counter for re-entry
// Clock-out details
 DateTime? get clockedOutAt; double? get clockOutLatitude; double? get clockOutLongitude; double? get clockOutAccuracy;// GPS accuracy at clock-out
 double? get transportExpense; String? get routeCovered; bool? get hasOrder; ClockOutReason? get clockOutReason; SyncState get syncState;
/// Create a copy of ClockInSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockInSessionCopyWith<ClockInSession> get copyWith => _$ClockInSessionCopyWithImpl<ClockInSession>(this as ClockInSession, _$identity);

  /// Serializes this ClockInSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockInSession&&(identical(other.id, id) || other.id == id)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.isDeviation, isDeviation) || other.isDeviation == isDeviation)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.clockedInAt, clockedInAt) || other.clockedInAt == clockedInAt)&&(identical(other.clockInLatitude, clockInLatitude) || other.clockInLatitude == clockInLatitude)&&(identical(other.clockInLongitude, clockInLongitude) || other.clockInLongitude == clockInLongitude)&&(identical(other.clockInAccuracy, clockInAccuracy) || other.clockInAccuracy == clockInAccuracy)&&(identical(other.allocatedMinutes, allocatedMinutes) || other.allocatedMinutes == allocatedMinutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.geofenceRadiusMeters, geofenceRadiusMeters) || other.geofenceRadiusMeters == geofenceRadiusMeters)&&(identical(other.autoClockoutGraceMinutes, autoClockoutGraceMinutes) || other.autoClockoutGraceMinutes == autoClockoutGraceMinutes)&&(identical(other.firstOutsideReadingAt, firstOutsideReadingAt) || other.firstOutsideReadingAt == firstOutsideReadingAt)&&(identical(other.confirmedExitAt, confirmedExitAt) || other.confirmedExitAt == confirmedExitAt)&&(identical(other.consecutiveOutsideReadings, consecutiveOutsideReadings) || other.consecutiveOutsideReadings == consecutiveOutsideReadings)&&(identical(other.consecutiveInsideReadings, consecutiveInsideReadings) || other.consecutiveInsideReadings == consecutiveInsideReadings)&&(identical(other.clockedOutAt, clockedOutAt) || other.clockedOutAt == clockedOutAt)&&(identical(other.clockOutLatitude, clockOutLatitude) || other.clockOutLatitude == clockOutLatitude)&&(identical(other.clockOutLongitude, clockOutLongitude) || other.clockOutLongitude == clockOutLongitude)&&(identical(other.clockOutAccuracy, clockOutAccuracy) || other.clockOutAccuracy == clockOutAccuracy)&&(identical(other.transportExpense, transportExpense) || other.transportExpense == transportExpense)&&(identical(other.routeCovered, routeCovered) || other.routeCovered == routeCovered)&&(identical(other.hasOrder, hasOrder) || other.hasOrder == hasOrder)&&(identical(other.clockOutReason, clockOutReason) || other.clockOutReason == clockOutReason)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,outletId,outletName,outletCode,isDeviation,routeId,clockedInAt,clockInLatitude,clockInLongitude,clockInAccuracy,allocatedMinutes,status,geofenceRadiusMeters,autoClockoutGraceMinutes,firstOutsideReadingAt,confirmedExitAt,consecutiveOutsideReadings,consecutiveInsideReadings,clockedOutAt,clockOutLatitude,clockOutLongitude,clockOutAccuracy,transportExpense,routeCovered,hasOrder,clockOutReason,syncState]);

@override
String toString() {
  return 'ClockInSession(id: $id, outletId: $outletId, outletName: $outletName, outletCode: $outletCode, isDeviation: $isDeviation, routeId: $routeId, clockedInAt: $clockedInAt, clockInLatitude: $clockInLatitude, clockInLongitude: $clockInLongitude, clockInAccuracy: $clockInAccuracy, allocatedMinutes: $allocatedMinutes, status: $status, geofenceRadiusMeters: $geofenceRadiusMeters, autoClockoutGraceMinutes: $autoClockoutGraceMinutes, firstOutsideReadingAt: $firstOutsideReadingAt, confirmedExitAt: $confirmedExitAt, consecutiveOutsideReadings: $consecutiveOutsideReadings, consecutiveInsideReadings: $consecutiveInsideReadings, clockedOutAt: $clockedOutAt, clockOutLatitude: $clockOutLatitude, clockOutLongitude: $clockOutLongitude, clockOutAccuracy: $clockOutAccuracy, transportExpense: $transportExpense, routeCovered: $routeCovered, hasOrder: $hasOrder, clockOutReason: $clockOutReason, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class $ClockInSessionCopyWith<$Res>  {
  factory $ClockInSessionCopyWith(ClockInSession value, $Res Function(ClockInSession) _then) = _$ClockInSessionCopyWithImpl;
@useResult
$Res call({
 String id, String outletId, String outletName, String outletCode, bool isDeviation, String? routeId, DateTime clockedInAt, double clockInLatitude, double clockInLongitude, double clockInAccuracy, int allocatedMinutes, ClockInStatus status, double geofenceRadiusMeters, int autoClockoutGraceMinutes, DateTime? firstOutsideReadingAt, DateTime? confirmedExitAt, int consecutiveOutsideReadings, int consecutiveInsideReadings, DateTime? clockedOutAt, double? clockOutLatitude, double? clockOutLongitude, double? clockOutAccuracy, double? transportExpense, String? routeCovered, bool? hasOrder, ClockOutReason? clockOutReason, SyncState syncState
});




}
/// @nodoc
class _$ClockInSessionCopyWithImpl<$Res>
    implements $ClockInSessionCopyWith<$Res> {
  _$ClockInSessionCopyWithImpl(this._self, this._then);

  final ClockInSession _self;
  final $Res Function(ClockInSession) _then;

/// Create a copy of ClockInSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? outletId = null,Object? outletName = null,Object? outletCode = null,Object? isDeviation = null,Object? routeId = freezed,Object? clockedInAt = null,Object? clockInLatitude = null,Object? clockInLongitude = null,Object? clockInAccuracy = null,Object? allocatedMinutes = null,Object? status = null,Object? geofenceRadiusMeters = null,Object? autoClockoutGraceMinutes = null,Object? firstOutsideReadingAt = freezed,Object? confirmedExitAt = freezed,Object? consecutiveOutsideReadings = null,Object? consecutiveInsideReadings = null,Object? clockedOutAt = freezed,Object? clockOutLatitude = freezed,Object? clockOutLongitude = freezed,Object? clockOutAccuracy = freezed,Object? transportExpense = freezed,Object? routeCovered = freezed,Object? hasOrder = freezed,Object? clockOutReason = freezed,Object? syncState = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,outletName: null == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String,outletCode: null == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String,isDeviation: null == isDeviation ? _self.isDeviation : isDeviation // ignore: cast_nullable_to_non_nullable
as bool,routeId: freezed == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
as String?,clockedInAt: null == clockedInAt ? _self.clockedInAt : clockedInAt // ignore: cast_nullable_to_non_nullable
as DateTime,clockInLatitude: null == clockInLatitude ? _self.clockInLatitude : clockInLatitude // ignore: cast_nullable_to_non_nullable
as double,clockInLongitude: null == clockInLongitude ? _self.clockInLongitude : clockInLongitude // ignore: cast_nullable_to_non_nullable
as double,clockInAccuracy: null == clockInAccuracy ? _self.clockInAccuracy : clockInAccuracy // ignore: cast_nullable_to_non_nullable
as double,allocatedMinutes: null == allocatedMinutes ? _self.allocatedMinutes : allocatedMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClockInStatus,geofenceRadiusMeters: null == geofenceRadiusMeters ? _self.geofenceRadiusMeters : geofenceRadiusMeters // ignore: cast_nullable_to_non_nullable
as double,autoClockoutGraceMinutes: null == autoClockoutGraceMinutes ? _self.autoClockoutGraceMinutes : autoClockoutGraceMinutes // ignore: cast_nullable_to_non_nullable
as int,firstOutsideReadingAt: freezed == firstOutsideReadingAt ? _self.firstOutsideReadingAt : firstOutsideReadingAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmedExitAt: freezed == confirmedExitAt ? _self.confirmedExitAt : confirmedExitAt // ignore: cast_nullable_to_non_nullable
as DateTime?,consecutiveOutsideReadings: null == consecutiveOutsideReadings ? _self.consecutiveOutsideReadings : consecutiveOutsideReadings // ignore: cast_nullable_to_non_nullable
as int,consecutiveInsideReadings: null == consecutiveInsideReadings ? _self.consecutiveInsideReadings : consecutiveInsideReadings // ignore: cast_nullable_to_non_nullable
as int,clockedOutAt: freezed == clockedOutAt ? _self.clockedOutAt : clockedOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,clockOutLatitude: freezed == clockOutLatitude ? _self.clockOutLatitude : clockOutLatitude // ignore: cast_nullable_to_non_nullable
as double?,clockOutLongitude: freezed == clockOutLongitude ? _self.clockOutLongitude : clockOutLongitude // ignore: cast_nullable_to_non_nullable
as double?,clockOutAccuracy: freezed == clockOutAccuracy ? _self.clockOutAccuracy : clockOutAccuracy // ignore: cast_nullable_to_non_nullable
as double?,transportExpense: freezed == transportExpense ? _self.transportExpense : transportExpense // ignore: cast_nullable_to_non_nullable
as double?,routeCovered: freezed == routeCovered ? _self.routeCovered : routeCovered // ignore: cast_nullable_to_non_nullable
as String?,hasOrder: freezed == hasOrder ? _self.hasOrder : hasOrder // ignore: cast_nullable_to_non_nullable
as bool?,clockOutReason: freezed == clockOutReason ? _self.clockOutReason : clockOutReason // ignore: cast_nullable_to_non_nullable
as ClockOutReason?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}

}


/// Adds pattern-matching-related methods to [ClockInSession].
extension ClockInSessionPatterns on ClockInSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockInSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockInSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockInSession value)  $default,){
final _that = this;
switch (_that) {
case _ClockInSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockInSession value)?  $default,){
final _that = this;
switch (_that) {
case _ClockInSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String outletId,  String outletName,  String outletCode,  bool isDeviation,  String? routeId,  DateTime clockedInAt,  double clockInLatitude,  double clockInLongitude,  double clockInAccuracy,  int allocatedMinutes,  ClockInStatus status,  double geofenceRadiusMeters,  int autoClockoutGraceMinutes,  DateTime? firstOutsideReadingAt,  DateTime? confirmedExitAt,  int consecutiveOutsideReadings,  int consecutiveInsideReadings,  DateTime? clockedOutAt,  double? clockOutLatitude,  double? clockOutLongitude,  double? clockOutAccuracy,  double? transportExpense,  String? routeCovered,  bool? hasOrder,  ClockOutReason? clockOutReason,  SyncState syncState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClockInSession() when $default != null:
return $default(_that.id,_that.outletId,_that.outletName,_that.outletCode,_that.isDeviation,_that.routeId,_that.clockedInAt,_that.clockInLatitude,_that.clockInLongitude,_that.clockInAccuracy,_that.allocatedMinutes,_that.status,_that.geofenceRadiusMeters,_that.autoClockoutGraceMinutes,_that.firstOutsideReadingAt,_that.confirmedExitAt,_that.consecutiveOutsideReadings,_that.consecutiveInsideReadings,_that.clockedOutAt,_that.clockOutLatitude,_that.clockOutLongitude,_that.clockOutAccuracy,_that.transportExpense,_that.routeCovered,_that.hasOrder,_that.clockOutReason,_that.syncState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String outletId,  String outletName,  String outletCode,  bool isDeviation,  String? routeId,  DateTime clockedInAt,  double clockInLatitude,  double clockInLongitude,  double clockInAccuracy,  int allocatedMinutes,  ClockInStatus status,  double geofenceRadiusMeters,  int autoClockoutGraceMinutes,  DateTime? firstOutsideReadingAt,  DateTime? confirmedExitAt,  int consecutiveOutsideReadings,  int consecutiveInsideReadings,  DateTime? clockedOutAt,  double? clockOutLatitude,  double? clockOutLongitude,  double? clockOutAccuracy,  double? transportExpense,  String? routeCovered,  bool? hasOrder,  ClockOutReason? clockOutReason,  SyncState syncState)  $default,) {final _that = this;
switch (_that) {
case _ClockInSession():
return $default(_that.id,_that.outletId,_that.outletName,_that.outletCode,_that.isDeviation,_that.routeId,_that.clockedInAt,_that.clockInLatitude,_that.clockInLongitude,_that.clockInAccuracy,_that.allocatedMinutes,_that.status,_that.geofenceRadiusMeters,_that.autoClockoutGraceMinutes,_that.firstOutsideReadingAt,_that.confirmedExitAt,_that.consecutiveOutsideReadings,_that.consecutiveInsideReadings,_that.clockedOutAt,_that.clockOutLatitude,_that.clockOutLongitude,_that.clockOutAccuracy,_that.transportExpense,_that.routeCovered,_that.hasOrder,_that.clockOutReason,_that.syncState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String outletId,  String outletName,  String outletCode,  bool isDeviation,  String? routeId,  DateTime clockedInAt,  double clockInLatitude,  double clockInLongitude,  double clockInAccuracy,  int allocatedMinutes,  ClockInStatus status,  double geofenceRadiusMeters,  int autoClockoutGraceMinutes,  DateTime? firstOutsideReadingAt,  DateTime? confirmedExitAt,  int consecutiveOutsideReadings,  int consecutiveInsideReadings,  DateTime? clockedOutAt,  double? clockOutLatitude,  double? clockOutLongitude,  double? clockOutAccuracy,  double? transportExpense,  String? routeCovered,  bool? hasOrder,  ClockOutReason? clockOutReason,  SyncState syncState)?  $default,) {final _that = this;
switch (_that) {
case _ClockInSession() when $default != null:
return $default(_that.id,_that.outletId,_that.outletName,_that.outletCode,_that.isDeviation,_that.routeId,_that.clockedInAt,_that.clockInLatitude,_that.clockInLongitude,_that.clockInAccuracy,_that.allocatedMinutes,_that.status,_that.geofenceRadiusMeters,_that.autoClockoutGraceMinutes,_that.firstOutsideReadingAt,_that.confirmedExitAt,_that.consecutiveOutsideReadings,_that.consecutiveInsideReadings,_that.clockedOutAt,_that.clockOutLatitude,_that.clockOutLongitude,_that.clockOutAccuracy,_that.transportExpense,_that.routeCovered,_that.hasOrder,_that.clockOutReason,_that.syncState);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClockInSession implements ClockInSession {
  const _ClockInSession({required this.id, required this.outletId, required this.outletName, required this.outletCode, required this.isDeviation, this.routeId, required this.clockedInAt, required this.clockInLatitude, required this.clockInLongitude, required this.clockInAccuracy, required this.allocatedMinutes, required this.status, this.geofenceRadiusMeters = 200.0, this.autoClockoutGraceMinutes = 10, this.firstOutsideReadingAt, this.confirmedExitAt, this.consecutiveOutsideReadings = 0, this.consecutiveInsideReadings = 0, this.clockedOutAt, this.clockOutLatitude, this.clockOutLongitude, this.clockOutAccuracy, this.transportExpense, this.routeCovered, this.hasOrder, this.clockOutReason, this.syncState = SyncState.localOnly});
  factory _ClockInSession.fromJson(Map<String, dynamic> json) => _$ClockInSessionFromJson(json);

@override final  String id;
@override final  String outletId;
@override final  String outletName;
@override final  String outletCode;
@override final  bool isDeviation;
@override final  String? routeId;
// Link to assigned route
@override final  DateTime clockedInAt;
@override final  double clockInLatitude;
@override final  double clockInLongitude;
@override final  double clockInAccuracy;
// GPS accuracy at clock-in
@override final  int allocatedMinutes;
@override final  ClockInStatus status;
// Configuration snapshot (for audit trail)
@override@JsonKey() final  double geofenceRadiusMeters;
@override@JsonKey() final  int autoClockoutGraceMinutes;
// Exit tracking with confirmation
@override final  DateTime? firstOutsideReadingAt;
// Initial outside detection
@override final  DateTime? confirmedExitAt;
// After 2 readings OR 3 min
@override@JsonKey() final  int consecutiveOutsideReadings;
// Counter for confirmation
@override@JsonKey() final  int consecutiveInsideReadings;
// Counter for re-entry
// Clock-out details
@override final  DateTime? clockedOutAt;
@override final  double? clockOutLatitude;
@override final  double? clockOutLongitude;
@override final  double? clockOutAccuracy;
// GPS accuracy at clock-out
@override final  double? transportExpense;
@override final  String? routeCovered;
@override final  bool? hasOrder;
@override final  ClockOutReason? clockOutReason;
@override@JsonKey() final  SyncState syncState;

/// Create a copy of ClockInSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockInSessionCopyWith<_ClockInSession> get copyWith => __$ClockInSessionCopyWithImpl<_ClockInSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClockInSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockInSession&&(identical(other.id, id) || other.id == id)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.isDeviation, isDeviation) || other.isDeviation == isDeviation)&&(identical(other.routeId, routeId) || other.routeId == routeId)&&(identical(other.clockedInAt, clockedInAt) || other.clockedInAt == clockedInAt)&&(identical(other.clockInLatitude, clockInLatitude) || other.clockInLatitude == clockInLatitude)&&(identical(other.clockInLongitude, clockInLongitude) || other.clockInLongitude == clockInLongitude)&&(identical(other.clockInAccuracy, clockInAccuracy) || other.clockInAccuracy == clockInAccuracy)&&(identical(other.allocatedMinutes, allocatedMinutes) || other.allocatedMinutes == allocatedMinutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.geofenceRadiusMeters, geofenceRadiusMeters) || other.geofenceRadiusMeters == geofenceRadiusMeters)&&(identical(other.autoClockoutGraceMinutes, autoClockoutGraceMinutes) || other.autoClockoutGraceMinutes == autoClockoutGraceMinutes)&&(identical(other.firstOutsideReadingAt, firstOutsideReadingAt) || other.firstOutsideReadingAt == firstOutsideReadingAt)&&(identical(other.confirmedExitAt, confirmedExitAt) || other.confirmedExitAt == confirmedExitAt)&&(identical(other.consecutiveOutsideReadings, consecutiveOutsideReadings) || other.consecutiveOutsideReadings == consecutiveOutsideReadings)&&(identical(other.consecutiveInsideReadings, consecutiveInsideReadings) || other.consecutiveInsideReadings == consecutiveInsideReadings)&&(identical(other.clockedOutAt, clockedOutAt) || other.clockedOutAt == clockedOutAt)&&(identical(other.clockOutLatitude, clockOutLatitude) || other.clockOutLatitude == clockOutLatitude)&&(identical(other.clockOutLongitude, clockOutLongitude) || other.clockOutLongitude == clockOutLongitude)&&(identical(other.clockOutAccuracy, clockOutAccuracy) || other.clockOutAccuracy == clockOutAccuracy)&&(identical(other.transportExpense, transportExpense) || other.transportExpense == transportExpense)&&(identical(other.routeCovered, routeCovered) || other.routeCovered == routeCovered)&&(identical(other.hasOrder, hasOrder) || other.hasOrder == hasOrder)&&(identical(other.clockOutReason, clockOutReason) || other.clockOutReason == clockOutReason)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,outletId,outletName,outletCode,isDeviation,routeId,clockedInAt,clockInLatitude,clockInLongitude,clockInAccuracy,allocatedMinutes,status,geofenceRadiusMeters,autoClockoutGraceMinutes,firstOutsideReadingAt,confirmedExitAt,consecutiveOutsideReadings,consecutiveInsideReadings,clockedOutAt,clockOutLatitude,clockOutLongitude,clockOutAccuracy,transportExpense,routeCovered,hasOrder,clockOutReason,syncState]);

@override
String toString() {
  return 'ClockInSession(id: $id, outletId: $outletId, outletName: $outletName, outletCode: $outletCode, isDeviation: $isDeviation, routeId: $routeId, clockedInAt: $clockedInAt, clockInLatitude: $clockInLatitude, clockInLongitude: $clockInLongitude, clockInAccuracy: $clockInAccuracy, allocatedMinutes: $allocatedMinutes, status: $status, geofenceRadiusMeters: $geofenceRadiusMeters, autoClockoutGraceMinutes: $autoClockoutGraceMinutes, firstOutsideReadingAt: $firstOutsideReadingAt, confirmedExitAt: $confirmedExitAt, consecutiveOutsideReadings: $consecutiveOutsideReadings, consecutiveInsideReadings: $consecutiveInsideReadings, clockedOutAt: $clockedOutAt, clockOutLatitude: $clockOutLatitude, clockOutLongitude: $clockOutLongitude, clockOutAccuracy: $clockOutAccuracy, transportExpense: $transportExpense, routeCovered: $routeCovered, hasOrder: $hasOrder, clockOutReason: $clockOutReason, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class _$ClockInSessionCopyWith<$Res> implements $ClockInSessionCopyWith<$Res> {
  factory _$ClockInSessionCopyWith(_ClockInSession value, $Res Function(_ClockInSession) _then) = __$ClockInSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String outletId, String outletName, String outletCode, bool isDeviation, String? routeId, DateTime clockedInAt, double clockInLatitude, double clockInLongitude, double clockInAccuracy, int allocatedMinutes, ClockInStatus status, double geofenceRadiusMeters, int autoClockoutGraceMinutes, DateTime? firstOutsideReadingAt, DateTime? confirmedExitAt, int consecutiveOutsideReadings, int consecutiveInsideReadings, DateTime? clockedOutAt, double? clockOutLatitude, double? clockOutLongitude, double? clockOutAccuracy, double? transportExpense, String? routeCovered, bool? hasOrder, ClockOutReason? clockOutReason, SyncState syncState
});




}
/// @nodoc
class __$ClockInSessionCopyWithImpl<$Res>
    implements _$ClockInSessionCopyWith<$Res> {
  __$ClockInSessionCopyWithImpl(this._self, this._then);

  final _ClockInSession _self;
  final $Res Function(_ClockInSession) _then;

/// Create a copy of ClockInSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? outletId = null,Object? outletName = null,Object? outletCode = null,Object? isDeviation = null,Object? routeId = freezed,Object? clockedInAt = null,Object? clockInLatitude = null,Object? clockInLongitude = null,Object? clockInAccuracy = null,Object? allocatedMinutes = null,Object? status = null,Object? geofenceRadiusMeters = null,Object? autoClockoutGraceMinutes = null,Object? firstOutsideReadingAt = freezed,Object? confirmedExitAt = freezed,Object? consecutiveOutsideReadings = null,Object? consecutiveInsideReadings = null,Object? clockedOutAt = freezed,Object? clockOutLatitude = freezed,Object? clockOutLongitude = freezed,Object? clockOutAccuracy = freezed,Object? transportExpense = freezed,Object? routeCovered = freezed,Object? hasOrder = freezed,Object? clockOutReason = freezed,Object? syncState = null,}) {
  return _then(_ClockInSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,outletName: null == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String,outletCode: null == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String,isDeviation: null == isDeviation ? _self.isDeviation : isDeviation // ignore: cast_nullable_to_non_nullable
as bool,routeId: freezed == routeId ? _self.routeId : routeId // ignore: cast_nullable_to_non_nullable
as String?,clockedInAt: null == clockedInAt ? _self.clockedInAt : clockedInAt // ignore: cast_nullable_to_non_nullable
as DateTime,clockInLatitude: null == clockInLatitude ? _self.clockInLatitude : clockInLatitude // ignore: cast_nullable_to_non_nullable
as double,clockInLongitude: null == clockInLongitude ? _self.clockInLongitude : clockInLongitude // ignore: cast_nullable_to_non_nullable
as double,clockInAccuracy: null == clockInAccuracy ? _self.clockInAccuracy : clockInAccuracy // ignore: cast_nullable_to_non_nullable
as double,allocatedMinutes: null == allocatedMinutes ? _self.allocatedMinutes : allocatedMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClockInStatus,geofenceRadiusMeters: null == geofenceRadiusMeters ? _self.geofenceRadiusMeters : geofenceRadiusMeters // ignore: cast_nullable_to_non_nullable
as double,autoClockoutGraceMinutes: null == autoClockoutGraceMinutes ? _self.autoClockoutGraceMinutes : autoClockoutGraceMinutes // ignore: cast_nullable_to_non_nullable
as int,firstOutsideReadingAt: freezed == firstOutsideReadingAt ? _self.firstOutsideReadingAt : firstOutsideReadingAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmedExitAt: freezed == confirmedExitAt ? _self.confirmedExitAt : confirmedExitAt // ignore: cast_nullable_to_non_nullable
as DateTime?,consecutiveOutsideReadings: null == consecutiveOutsideReadings ? _self.consecutiveOutsideReadings : consecutiveOutsideReadings // ignore: cast_nullable_to_non_nullable
as int,consecutiveInsideReadings: null == consecutiveInsideReadings ? _self.consecutiveInsideReadings : consecutiveInsideReadings // ignore: cast_nullable_to_non_nullable
as int,clockedOutAt: freezed == clockedOutAt ? _self.clockedOutAt : clockedOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,clockOutLatitude: freezed == clockOutLatitude ? _self.clockOutLatitude : clockOutLatitude // ignore: cast_nullable_to_non_nullable
as double?,clockOutLongitude: freezed == clockOutLongitude ? _self.clockOutLongitude : clockOutLongitude // ignore: cast_nullable_to_non_nullable
as double?,clockOutAccuracy: freezed == clockOutAccuracy ? _self.clockOutAccuracy : clockOutAccuracy // ignore: cast_nullable_to_non_nullable
as double?,transportExpense: freezed == transportExpense ? _self.transportExpense : transportExpense // ignore: cast_nullable_to_non_nullable
as double?,routeCovered: freezed == routeCovered ? _self.routeCovered : routeCovered // ignore: cast_nullable_to_non_nullable
as String?,hasOrder: freezed == hasOrder ? _self.hasOrder : hasOrder // ignore: cast_nullable_to_non_nullable
as bool?,clockOutReason: freezed == clockOutReason ? _self.clockOutReason : clockOutReason // ignore: cast_nullable_to_non_nullable
as ClockOutReason?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}


}

// dart format on
