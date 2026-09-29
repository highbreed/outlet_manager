// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VisitSchedule {

/// Server ID from outlet_visit_schedules.id
 String get serverId;/// Agent this schedule belongs to
 String get salesAgentServerId;// === Outlet Information (denormalized for offline display) ===
/// Customer/Outlet ID from backend
 String get outletId;/// Outlet code (e.g., "CL000001")
 String get outletCode;/// Outlet display name
 String get outletName;/// Outlet GPS latitude
 double get outletLatitude;/// Outlet GPS longitude
 double get outletLongitude;/// Outlet address
 String? get outletAddress;// === Schedule Details ===
/// Day of week: 0=Monday, 1=Tuesday, ..., 6=Sunday
 int get dayOfWeek;/// Expected arrival time (HH:mm:ss or HH:mm format from backend)
 String? get scheduledClockIn;/// Expected departure time (HH:mm:ss or HH:mm format from backend)
 String? get scheduledClockOut;/// Sequence order for the day (1, 2, 3, ...)
 int get visitOrder;/// Visit priority: 1=must visit, 2=important, 3=flexible
 int get visitPriority;/// Allocated time for this visit (minutes)
 int get allocatedMinutes;// === Validity Period ===
/// When this schedule becomes effective
 DateTime get effectiveFrom;/// When this schedule expires (null = indefinite)
 DateTime? get effectiveTo;/// Whether this schedule is currently active
 bool get isActive;// === Sync Tracking ===
/// Last time this record was synced from backend
 DateTime? get lastSyncedAt;
/// Create a copy of VisitSchedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitScheduleCopyWith<VisitSchedule> get copyWith => _$VisitScheduleCopyWithImpl<VisitSchedule>(this as VisitSchedule, _$identity);

  /// Serializes this VisitSchedule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VisitSchedule&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.salesAgentServerId, salesAgentServerId) || other.salesAgentServerId == salesAgentServerId)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.outletLatitude, outletLatitude) || other.outletLatitude == outletLatitude)&&(identical(other.outletLongitude, outletLongitude) || other.outletLongitude == outletLongitude)&&(identical(other.outletAddress, outletAddress) || other.outletAddress == outletAddress)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.scheduledClockIn, scheduledClockIn) || other.scheduledClockIn == scheduledClockIn)&&(identical(other.scheduledClockOut, scheduledClockOut) || other.scheduledClockOut == scheduledClockOut)&&(identical(other.visitOrder, visitOrder) || other.visitOrder == visitOrder)&&(identical(other.visitPriority, visitPriority) || other.visitPriority == visitPriority)&&(identical(other.allocatedMinutes, allocatedMinutes) || other.allocatedMinutes == allocatedMinutes)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom)&&(identical(other.effectiveTo, effectiveTo) || other.effectiveTo == effectiveTo)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,salesAgentServerId,outletId,outletCode,outletName,outletLatitude,outletLongitude,outletAddress,dayOfWeek,scheduledClockIn,scheduledClockOut,visitOrder,visitPriority,allocatedMinutes,effectiveFrom,effectiveTo,isActive,lastSyncedAt);

@override
String toString() {
  return 'VisitSchedule(serverId: $serverId, salesAgentServerId: $salesAgentServerId, outletId: $outletId, outletCode: $outletCode, outletName: $outletName, outletLatitude: $outletLatitude, outletLongitude: $outletLongitude, outletAddress: $outletAddress, dayOfWeek: $dayOfWeek, scheduledClockIn: $scheduledClockIn, scheduledClockOut: $scheduledClockOut, visitOrder: $visitOrder, visitPriority: $visitPriority, allocatedMinutes: $allocatedMinutes, effectiveFrom: $effectiveFrom, effectiveTo: $effectiveTo, isActive: $isActive, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class $VisitScheduleCopyWith<$Res>  {
  factory $VisitScheduleCopyWith(VisitSchedule value, $Res Function(VisitSchedule) _then) = _$VisitScheduleCopyWithImpl;
@useResult
$Res call({
 String serverId, String salesAgentServerId, String outletId, String outletCode, String outletName, double outletLatitude, double outletLongitude, String? outletAddress, int dayOfWeek, String? scheduledClockIn, String? scheduledClockOut, int visitOrder, int visitPriority, int allocatedMinutes, DateTime effectiveFrom, DateTime? effectiveTo, bool isActive, DateTime? lastSyncedAt
});




}
/// @nodoc
class _$VisitScheduleCopyWithImpl<$Res>
    implements $VisitScheduleCopyWith<$Res> {
  _$VisitScheduleCopyWithImpl(this._self, this._then);

  final VisitSchedule _self;
  final $Res Function(VisitSchedule) _then;

/// Create a copy of VisitSchedule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverId = null,Object? salesAgentServerId = null,Object? outletId = null,Object? outletCode = null,Object? outletName = null,Object? outletLatitude = null,Object? outletLongitude = null,Object? outletAddress = freezed,Object? dayOfWeek = null,Object? scheduledClockIn = freezed,Object? scheduledClockOut = freezed,Object? visitOrder = null,Object? visitPriority = null,Object? allocatedMinutes = null,Object? effectiveFrom = null,Object? effectiveTo = freezed,Object? isActive = null,Object? lastSyncedAt = freezed,}) {
  return _then(_self.copyWith(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,salesAgentServerId: null == salesAgentServerId ? _self.salesAgentServerId : salesAgentServerId // ignore: cast_nullable_to_non_nullable
as String,outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,outletCode: null == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String,outletName: null == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String,outletLatitude: null == outletLatitude ? _self.outletLatitude : outletLatitude // ignore: cast_nullable_to_non_nullable
as double,outletLongitude: null == outletLongitude ? _self.outletLongitude : outletLongitude // ignore: cast_nullable_to_non_nullable
as double,outletAddress: freezed == outletAddress ? _self.outletAddress : outletAddress // ignore: cast_nullable_to_non_nullable
as String?,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,scheduledClockIn: freezed == scheduledClockIn ? _self.scheduledClockIn : scheduledClockIn // ignore: cast_nullable_to_non_nullable
as String?,scheduledClockOut: freezed == scheduledClockOut ? _self.scheduledClockOut : scheduledClockOut // ignore: cast_nullable_to_non_nullable
as String?,visitOrder: null == visitOrder ? _self.visitOrder : visitOrder // ignore: cast_nullable_to_non_nullable
as int,visitPriority: null == visitPriority ? _self.visitPriority : visitPriority // ignore: cast_nullable_to_non_nullable
as int,allocatedMinutes: null == allocatedMinutes ? _self.allocatedMinutes : allocatedMinutes // ignore: cast_nullable_to_non_nullable
as int,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as DateTime,effectiveTo: freezed == effectiveTo ? _self.effectiveTo : effectiveTo // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [VisitSchedule].
extension VisitSchedulePatterns on VisitSchedule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VisitSchedule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VisitSchedule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VisitSchedule value)  $default,){
final _that = this;
switch (_that) {
case _VisitSchedule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VisitSchedule value)?  $default,){
final _that = this;
switch (_that) {
case _VisitSchedule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverId,  String salesAgentServerId,  String outletId,  String outletCode,  String outletName,  double outletLatitude,  double outletLongitude,  String? outletAddress,  int dayOfWeek,  String? scheduledClockIn,  String? scheduledClockOut,  int visitOrder,  int visitPriority,  int allocatedMinutes,  DateTime effectiveFrom,  DateTime? effectiveTo,  bool isActive,  DateTime? lastSyncedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VisitSchedule() when $default != null:
return $default(_that.serverId,_that.salesAgentServerId,_that.outletId,_that.outletCode,_that.outletName,_that.outletLatitude,_that.outletLongitude,_that.outletAddress,_that.dayOfWeek,_that.scheduledClockIn,_that.scheduledClockOut,_that.visitOrder,_that.visitPriority,_that.allocatedMinutes,_that.effectiveFrom,_that.effectiveTo,_that.isActive,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverId,  String salesAgentServerId,  String outletId,  String outletCode,  String outletName,  double outletLatitude,  double outletLongitude,  String? outletAddress,  int dayOfWeek,  String? scheduledClockIn,  String? scheduledClockOut,  int visitOrder,  int visitPriority,  int allocatedMinutes,  DateTime effectiveFrom,  DateTime? effectiveTo,  bool isActive,  DateTime? lastSyncedAt)  $default,) {final _that = this;
switch (_that) {
case _VisitSchedule():
return $default(_that.serverId,_that.salesAgentServerId,_that.outletId,_that.outletCode,_that.outletName,_that.outletLatitude,_that.outletLongitude,_that.outletAddress,_that.dayOfWeek,_that.scheduledClockIn,_that.scheduledClockOut,_that.visitOrder,_that.visitPriority,_that.allocatedMinutes,_that.effectiveFrom,_that.effectiveTo,_that.isActive,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverId,  String salesAgentServerId,  String outletId,  String outletCode,  String outletName,  double outletLatitude,  double outletLongitude,  String? outletAddress,  int dayOfWeek,  String? scheduledClockIn,  String? scheduledClockOut,  int visitOrder,  int visitPriority,  int allocatedMinutes,  DateTime effectiveFrom,  DateTime? effectiveTo,  bool isActive,  DateTime? lastSyncedAt)?  $default,) {final _that = this;
switch (_that) {
case _VisitSchedule() when $default != null:
return $default(_that.serverId,_that.salesAgentServerId,_that.outletId,_that.outletCode,_that.outletName,_that.outletLatitude,_that.outletLongitude,_that.outletAddress,_that.dayOfWeek,_that.scheduledClockIn,_that.scheduledClockOut,_that.visitOrder,_that.visitPriority,_that.allocatedMinutes,_that.effectiveFrom,_that.effectiveTo,_that.isActive,_that.lastSyncedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VisitSchedule extends VisitSchedule {
  const _VisitSchedule({required this.serverId, required this.salesAgentServerId, required this.outletId, required this.outletCode, required this.outletName, required this.outletLatitude, required this.outletLongitude, this.outletAddress, required this.dayOfWeek, this.scheduledClockIn, this.scheduledClockOut, required this.visitOrder, this.visitPriority = 2, required this.allocatedMinutes, required this.effectiveFrom, this.effectiveTo, this.isActive = true, this.lastSyncedAt}): super._();
  factory _VisitSchedule.fromJson(Map<String, dynamic> json) => _$VisitScheduleFromJson(json);

/// Server ID from outlet_visit_schedules.id
@override final  String serverId;
/// Agent this schedule belongs to
@override final  String salesAgentServerId;
// === Outlet Information (denormalized for offline display) ===
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
/// Outlet address
@override final  String? outletAddress;
// === Schedule Details ===
/// Day of week: 0=Monday, 1=Tuesday, ..., 6=Sunday
@override final  int dayOfWeek;
/// Expected arrival time (HH:mm:ss or HH:mm format from backend)
@override final  String? scheduledClockIn;
/// Expected departure time (HH:mm:ss or HH:mm format from backend)
@override final  String? scheduledClockOut;
/// Sequence order for the day (1, 2, 3, ...)
@override final  int visitOrder;
/// Visit priority: 1=must visit, 2=important, 3=flexible
@override@JsonKey() final  int visitPriority;
/// Allocated time for this visit (minutes)
@override final  int allocatedMinutes;
// === Validity Period ===
/// When this schedule becomes effective
@override final  DateTime effectiveFrom;
/// When this schedule expires (null = indefinite)
@override final  DateTime? effectiveTo;
/// Whether this schedule is currently active
@override@JsonKey() final  bool isActive;
// === Sync Tracking ===
/// Last time this record was synced from backend
@override final  DateTime? lastSyncedAt;

/// Create a copy of VisitSchedule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisitScheduleCopyWith<_VisitSchedule> get copyWith => __$VisitScheduleCopyWithImpl<_VisitSchedule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VisitScheduleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisitSchedule&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.salesAgentServerId, salesAgentServerId) || other.salesAgentServerId == salesAgentServerId)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.outletLatitude, outletLatitude) || other.outletLatitude == outletLatitude)&&(identical(other.outletLongitude, outletLongitude) || other.outletLongitude == outletLongitude)&&(identical(other.outletAddress, outletAddress) || other.outletAddress == outletAddress)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.scheduledClockIn, scheduledClockIn) || other.scheduledClockIn == scheduledClockIn)&&(identical(other.scheduledClockOut, scheduledClockOut) || other.scheduledClockOut == scheduledClockOut)&&(identical(other.visitOrder, visitOrder) || other.visitOrder == visitOrder)&&(identical(other.visitPriority, visitPriority) || other.visitPriority == visitPriority)&&(identical(other.allocatedMinutes, allocatedMinutes) || other.allocatedMinutes == allocatedMinutes)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom)&&(identical(other.effectiveTo, effectiveTo) || other.effectiveTo == effectiveTo)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,salesAgentServerId,outletId,outletCode,outletName,outletLatitude,outletLongitude,outletAddress,dayOfWeek,scheduledClockIn,scheduledClockOut,visitOrder,visitPriority,allocatedMinutes,effectiveFrom,effectiveTo,isActive,lastSyncedAt);

@override
String toString() {
  return 'VisitSchedule(serverId: $serverId, salesAgentServerId: $salesAgentServerId, outletId: $outletId, outletCode: $outletCode, outletName: $outletName, outletLatitude: $outletLatitude, outletLongitude: $outletLongitude, outletAddress: $outletAddress, dayOfWeek: $dayOfWeek, scheduledClockIn: $scheduledClockIn, scheduledClockOut: $scheduledClockOut, visitOrder: $visitOrder, visitPriority: $visitPriority, allocatedMinutes: $allocatedMinutes, effectiveFrom: $effectiveFrom, effectiveTo: $effectiveTo, isActive: $isActive, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class _$VisitScheduleCopyWith<$Res> implements $VisitScheduleCopyWith<$Res> {
  factory _$VisitScheduleCopyWith(_VisitSchedule value, $Res Function(_VisitSchedule) _then) = __$VisitScheduleCopyWithImpl;
@override @useResult
$Res call({
 String serverId, String salesAgentServerId, String outletId, String outletCode, String outletName, double outletLatitude, double outletLongitude, String? outletAddress, int dayOfWeek, String? scheduledClockIn, String? scheduledClockOut, int visitOrder, int visitPriority, int allocatedMinutes, DateTime effectiveFrom, DateTime? effectiveTo, bool isActive, DateTime? lastSyncedAt
});




}
/// @nodoc
class __$VisitScheduleCopyWithImpl<$Res>
    implements _$VisitScheduleCopyWith<$Res> {
  __$VisitScheduleCopyWithImpl(this._self, this._then);

  final _VisitSchedule _self;
  final $Res Function(_VisitSchedule) _then;

/// Create a copy of VisitSchedule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverId = null,Object? salesAgentServerId = null,Object? outletId = null,Object? outletCode = null,Object? outletName = null,Object? outletLatitude = null,Object? outletLongitude = null,Object? outletAddress = freezed,Object? dayOfWeek = null,Object? scheduledClockIn = freezed,Object? scheduledClockOut = freezed,Object? visitOrder = null,Object? visitPriority = null,Object? allocatedMinutes = null,Object? effectiveFrom = null,Object? effectiveTo = freezed,Object? isActive = null,Object? lastSyncedAt = freezed,}) {
  return _then(_VisitSchedule(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,salesAgentServerId: null == salesAgentServerId ? _self.salesAgentServerId : salesAgentServerId // ignore: cast_nullable_to_non_nullable
as String,outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,outletCode: null == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String,outletName: null == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String,outletLatitude: null == outletLatitude ? _self.outletLatitude : outletLatitude // ignore: cast_nullable_to_non_nullable
as double,outletLongitude: null == outletLongitude ? _self.outletLongitude : outletLongitude // ignore: cast_nullable_to_non_nullable
as double,outletAddress: freezed == outletAddress ? _self.outletAddress : outletAddress // ignore: cast_nullable_to_non_nullable
as String?,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as int,scheduledClockIn: freezed == scheduledClockIn ? _self.scheduledClockIn : scheduledClockIn // ignore: cast_nullable_to_non_nullable
as String?,scheduledClockOut: freezed == scheduledClockOut ? _self.scheduledClockOut : scheduledClockOut // ignore: cast_nullable_to_non_nullable
as String?,visitOrder: null == visitOrder ? _self.visitOrder : visitOrder // ignore: cast_nullable_to_non_nullable
as int,visitPriority: null == visitPriority ? _self.visitPriority : visitPriority // ignore: cast_nullable_to_non_nullable
as int,allocatedMinutes: null == allocatedMinutes ? _self.allocatedMinutes : allocatedMinutes // ignore: cast_nullable_to_non_nullable
as int,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as DateTime,effectiveTo: freezed == effectiveTo ? _self.effectiveTo : effectiveTo // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
