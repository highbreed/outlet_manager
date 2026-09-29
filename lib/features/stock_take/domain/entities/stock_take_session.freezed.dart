// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_take_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockTakeSession {

 String get localId; int? get serverId; String get visitLocalId; int? get visitServerId; int get customerId; String get outletCode; String get outletName; int get warehouseId; String get warehouseName; WarehouseType get warehouseType; int get salesAgentId; DateTime get startedAt; DateTime? get pausedAt; DateTime? get resumedAt; DateTime? get completedAt; StockTakeStatus get status; int get totalProducts; int get totalSerials; String? get notes; String? get sapStockTakeCode; SyncState get syncState; String? get syncError; DateTime? get lastSyncedAt; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of StockTakeSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockTakeSessionCopyWith<StockTakeSession> get copyWith => _$StockTakeSessionCopyWithImpl<StockTakeSession>(this as StockTakeSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockTakeSession&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.visitLocalId, visitLocalId) || other.visitLocalId == visitLocalId)&&(identical(other.visitServerId, visitServerId) || other.visitServerId == visitServerId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.warehouseName, warehouseName) || other.warehouseName == warehouseName)&&(identical(other.warehouseType, warehouseType) || other.warehouseType == warehouseType)&&(identical(other.salesAgentId, salesAgentId) || other.salesAgentId == salesAgentId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.pausedAt, pausedAt) || other.pausedAt == pausedAt)&&(identical(other.resumedAt, resumedAt) || other.resumedAt == resumedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.totalSerials, totalSerials) || other.totalSerials == totalSerials)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.sapStockTakeCode, sapStockTakeCode) || other.sapStockTakeCode == sapStockTakeCode)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,localId,serverId,visitLocalId,visitServerId,customerId,outletCode,outletName,warehouseId,warehouseName,warehouseType,salesAgentId,startedAt,pausedAt,resumedAt,completedAt,status,totalProducts,totalSerials,notes,sapStockTakeCode,syncState,syncError,lastSyncedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'StockTakeSession(localId: $localId, serverId: $serverId, visitLocalId: $visitLocalId, visitServerId: $visitServerId, customerId: $customerId, outletCode: $outletCode, outletName: $outletName, warehouseId: $warehouseId, warehouseName: $warehouseName, warehouseType: $warehouseType, salesAgentId: $salesAgentId, startedAt: $startedAt, pausedAt: $pausedAt, resumedAt: $resumedAt, completedAt: $completedAt, status: $status, totalProducts: $totalProducts, totalSerials: $totalSerials, notes: $notes, sapStockTakeCode: $sapStockTakeCode, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $StockTakeSessionCopyWith<$Res>  {
  factory $StockTakeSessionCopyWith(StockTakeSession value, $Res Function(StockTakeSession) _then) = _$StockTakeSessionCopyWithImpl;
@useResult
$Res call({
 String localId, int? serverId, String visitLocalId, int? visitServerId, int customerId, String outletCode, String outletName, int warehouseId, String warehouseName, WarehouseType warehouseType, int salesAgentId, DateTime startedAt, DateTime? pausedAt, DateTime? resumedAt, DateTime? completedAt, StockTakeStatus status, int totalProducts, int totalSerials, String? notes, String? sapStockTakeCode, SyncState syncState, String? syncError, DateTime? lastSyncedAt, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$StockTakeSessionCopyWithImpl<$Res>
    implements $StockTakeSessionCopyWith<$Res> {
  _$StockTakeSessionCopyWithImpl(this._self, this._then);

  final StockTakeSession _self;
  final $Res Function(StockTakeSession) _then;

/// Create a copy of StockTakeSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? serverId = freezed,Object? visitLocalId = null,Object? visitServerId = freezed,Object? customerId = null,Object? outletCode = null,Object? outletName = null,Object? warehouseId = null,Object? warehouseName = null,Object? warehouseType = null,Object? salesAgentId = null,Object? startedAt = null,Object? pausedAt = freezed,Object? resumedAt = freezed,Object? completedAt = freezed,Object? status = null,Object? totalProducts = null,Object? totalSerials = null,Object? notes = freezed,Object? sapStockTakeCode = freezed,Object? syncState = null,Object? syncError = freezed,Object? lastSyncedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,visitLocalId: null == visitLocalId ? _self.visitLocalId : visitLocalId // ignore: cast_nullable_to_non_nullable
as String,visitServerId: freezed == visitServerId ? _self.visitServerId : visitServerId // ignore: cast_nullable_to_non_nullable
as int?,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,outletCode: null == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String,outletName: null == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as int,warehouseName: null == warehouseName ? _self.warehouseName : warehouseName // ignore: cast_nullable_to_non_nullable
as String,warehouseType: null == warehouseType ? _self.warehouseType : warehouseType // ignore: cast_nullable_to_non_nullable
as WarehouseType,salesAgentId: null == salesAgentId ? _self.salesAgentId : salesAgentId // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pausedAt: freezed == pausedAt ? _self.pausedAt : pausedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resumedAt: freezed == resumedAt ? _self.resumedAt : resumedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StockTakeStatus,totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,totalSerials: null == totalSerials ? _self.totalSerials : totalSerials // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,sapStockTakeCode: freezed == sapStockTakeCode ? _self.sapStockTakeCode : sapStockTakeCode // ignore: cast_nullable_to_non_nullable
as String?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StockTakeSession].
extension StockTakeSessionPatterns on StockTakeSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockTakeSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockTakeSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockTakeSession value)  $default,){
final _that = this;
switch (_that) {
case _StockTakeSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockTakeSession value)?  $default,){
final _that = this;
switch (_that) {
case _StockTakeSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  int? serverId,  String visitLocalId,  int? visitServerId,  int customerId,  String outletCode,  String outletName,  int warehouseId,  String warehouseName,  WarehouseType warehouseType,  int salesAgentId,  DateTime startedAt,  DateTime? pausedAt,  DateTime? resumedAt,  DateTime? completedAt,  StockTakeStatus status,  int totalProducts,  int totalSerials,  String? notes,  String? sapStockTakeCode,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockTakeSession() when $default != null:
return $default(_that.localId,_that.serverId,_that.visitLocalId,_that.visitServerId,_that.customerId,_that.outletCode,_that.outletName,_that.warehouseId,_that.warehouseName,_that.warehouseType,_that.salesAgentId,_that.startedAt,_that.pausedAt,_that.resumedAt,_that.completedAt,_that.status,_that.totalProducts,_that.totalSerials,_that.notes,_that.sapStockTakeCode,_that.syncState,_that.syncError,_that.lastSyncedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  int? serverId,  String visitLocalId,  int? visitServerId,  int customerId,  String outletCode,  String outletName,  int warehouseId,  String warehouseName,  WarehouseType warehouseType,  int salesAgentId,  DateTime startedAt,  DateTime? pausedAt,  DateTime? resumedAt,  DateTime? completedAt,  StockTakeStatus status,  int totalProducts,  int totalSerials,  String? notes,  String? sapStockTakeCode,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _StockTakeSession():
return $default(_that.localId,_that.serverId,_that.visitLocalId,_that.visitServerId,_that.customerId,_that.outletCode,_that.outletName,_that.warehouseId,_that.warehouseName,_that.warehouseType,_that.salesAgentId,_that.startedAt,_that.pausedAt,_that.resumedAt,_that.completedAt,_that.status,_that.totalProducts,_that.totalSerials,_that.notes,_that.sapStockTakeCode,_that.syncState,_that.syncError,_that.lastSyncedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  int? serverId,  String visitLocalId,  int? visitServerId,  int customerId,  String outletCode,  String outletName,  int warehouseId,  String warehouseName,  WarehouseType warehouseType,  int salesAgentId,  DateTime startedAt,  DateTime? pausedAt,  DateTime? resumedAt,  DateTime? completedAt,  StockTakeStatus status,  int totalProducts,  int totalSerials,  String? notes,  String? sapStockTakeCode,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _StockTakeSession() when $default != null:
return $default(_that.localId,_that.serverId,_that.visitLocalId,_that.visitServerId,_that.customerId,_that.outletCode,_that.outletName,_that.warehouseId,_that.warehouseName,_that.warehouseType,_that.salesAgentId,_that.startedAt,_that.pausedAt,_that.resumedAt,_that.completedAt,_that.status,_that.totalProducts,_that.totalSerials,_that.notes,_that.sapStockTakeCode,_that.syncState,_that.syncError,_that.lastSyncedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _StockTakeSession extends StockTakeSession {
  const _StockTakeSession({required this.localId, this.serverId, required this.visitLocalId, this.visitServerId, required this.customerId, required this.outletCode, required this.outletName, required this.warehouseId, required this.warehouseName, required this.warehouseType, required this.salesAgentId, required this.startedAt, this.pausedAt, this.resumedAt, this.completedAt, required this.status, required this.totalProducts, required this.totalSerials, this.notes, this.sapStockTakeCode, required this.syncState, this.syncError, this.lastSyncedAt, required this.createdAt, required this.updatedAt}): super._();
  

@override final  String localId;
@override final  int? serverId;
@override final  String visitLocalId;
@override final  int? visitServerId;
@override final  int customerId;
@override final  String outletCode;
@override final  String outletName;
@override final  int warehouseId;
@override final  String warehouseName;
@override final  WarehouseType warehouseType;
@override final  int salesAgentId;
@override final  DateTime startedAt;
@override final  DateTime? pausedAt;
@override final  DateTime? resumedAt;
@override final  DateTime? completedAt;
@override final  StockTakeStatus status;
@override final  int totalProducts;
@override final  int totalSerials;
@override final  String? notes;
@override final  String? sapStockTakeCode;
@override final  SyncState syncState;
@override final  String? syncError;
@override final  DateTime? lastSyncedAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of StockTakeSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockTakeSessionCopyWith<_StockTakeSession> get copyWith => __$StockTakeSessionCopyWithImpl<_StockTakeSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockTakeSession&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.visitLocalId, visitLocalId) || other.visitLocalId == visitLocalId)&&(identical(other.visitServerId, visitServerId) || other.visitServerId == visitServerId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.outletCode, outletCode) || other.outletCode == outletCode)&&(identical(other.outletName, outletName) || other.outletName == outletName)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.warehouseName, warehouseName) || other.warehouseName == warehouseName)&&(identical(other.warehouseType, warehouseType) || other.warehouseType == warehouseType)&&(identical(other.salesAgentId, salesAgentId) || other.salesAgentId == salesAgentId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.pausedAt, pausedAt) || other.pausedAt == pausedAt)&&(identical(other.resumedAt, resumedAt) || other.resumedAt == resumedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.totalSerials, totalSerials) || other.totalSerials == totalSerials)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.sapStockTakeCode, sapStockTakeCode) || other.sapStockTakeCode == sapStockTakeCode)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,localId,serverId,visitLocalId,visitServerId,customerId,outletCode,outletName,warehouseId,warehouseName,warehouseType,salesAgentId,startedAt,pausedAt,resumedAt,completedAt,status,totalProducts,totalSerials,notes,sapStockTakeCode,syncState,syncError,lastSyncedAt,createdAt,updatedAt]);

@override
String toString() {
  return 'StockTakeSession(localId: $localId, serverId: $serverId, visitLocalId: $visitLocalId, visitServerId: $visitServerId, customerId: $customerId, outletCode: $outletCode, outletName: $outletName, warehouseId: $warehouseId, warehouseName: $warehouseName, warehouseType: $warehouseType, salesAgentId: $salesAgentId, startedAt: $startedAt, pausedAt: $pausedAt, resumedAt: $resumedAt, completedAt: $completedAt, status: $status, totalProducts: $totalProducts, totalSerials: $totalSerials, notes: $notes, sapStockTakeCode: $sapStockTakeCode, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$StockTakeSessionCopyWith<$Res> implements $StockTakeSessionCopyWith<$Res> {
  factory _$StockTakeSessionCopyWith(_StockTakeSession value, $Res Function(_StockTakeSession) _then) = __$StockTakeSessionCopyWithImpl;
@override @useResult
$Res call({
 String localId, int? serverId, String visitLocalId, int? visitServerId, int customerId, String outletCode, String outletName, int warehouseId, String warehouseName, WarehouseType warehouseType, int salesAgentId, DateTime startedAt, DateTime? pausedAt, DateTime? resumedAt, DateTime? completedAt, StockTakeStatus status, int totalProducts, int totalSerials, String? notes, String? sapStockTakeCode, SyncState syncState, String? syncError, DateTime? lastSyncedAt, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$StockTakeSessionCopyWithImpl<$Res>
    implements _$StockTakeSessionCopyWith<$Res> {
  __$StockTakeSessionCopyWithImpl(this._self, this._then);

  final _StockTakeSession _self;
  final $Res Function(_StockTakeSession) _then;

/// Create a copy of StockTakeSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? serverId = freezed,Object? visitLocalId = null,Object? visitServerId = freezed,Object? customerId = null,Object? outletCode = null,Object? outletName = null,Object? warehouseId = null,Object? warehouseName = null,Object? warehouseType = null,Object? salesAgentId = null,Object? startedAt = null,Object? pausedAt = freezed,Object? resumedAt = freezed,Object? completedAt = freezed,Object? status = null,Object? totalProducts = null,Object? totalSerials = null,Object? notes = freezed,Object? sapStockTakeCode = freezed,Object? syncState = null,Object? syncError = freezed,Object? lastSyncedAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_StockTakeSession(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,visitLocalId: null == visitLocalId ? _self.visitLocalId : visitLocalId // ignore: cast_nullable_to_non_nullable
as String,visitServerId: freezed == visitServerId ? _self.visitServerId : visitServerId // ignore: cast_nullable_to_non_nullable
as int?,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,outletCode: null == outletCode ? _self.outletCode : outletCode // ignore: cast_nullable_to_non_nullable
as String,outletName: null == outletName ? _self.outletName : outletName // ignore: cast_nullable_to_non_nullable
as String,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as int,warehouseName: null == warehouseName ? _self.warehouseName : warehouseName // ignore: cast_nullable_to_non_nullable
as String,warehouseType: null == warehouseType ? _self.warehouseType : warehouseType // ignore: cast_nullable_to_non_nullable
as WarehouseType,salesAgentId: null == salesAgentId ? _self.salesAgentId : salesAgentId // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pausedAt: freezed == pausedAt ? _self.pausedAt : pausedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resumedAt: freezed == resumedAt ? _self.resumedAt : resumedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StockTakeStatus,totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,totalSerials: null == totalSerials ? _self.totalSerials : totalSerials // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,sapStockTakeCode: freezed == sapStockTakeCode ? _self.sapStockTakeCode : sapStockTakeCode // ignore: cast_nullable_to_non_nullable
as String?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
