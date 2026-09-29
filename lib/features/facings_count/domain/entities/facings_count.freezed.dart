// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facings_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FacingsCount {

/// Local UUID for offline-first
 String get localId;/// Server ID (null until synced)
 int? get serverId;/// Visit context (clock-in traceability)
 String get visitLocalId; int? get visitServerId;/// Customer/outlet info (not echoed back by the API — kept locally)
 int get customerId; String get customerCode; String get customerName;/// Agent info ("my user ID")
 int get salesAgentId;/// Count status
 FacingsCountStatus get status;/// Item groups with facing counts
 List<FacingsCountItem> get items;/// Timestamps
 DateTime get createdAt; DateTime get updatedAt; DateTime? get submittedAt; DateTime? get approvedAt;/// Sync state
 FacingsSyncState get syncState; String? get syncError; DateTime? get lastSyncedAt;
/// Create a copy of FacingsCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacingsCountCopyWith<FacingsCount> get copyWith => _$FacingsCountCopyWithImpl<FacingsCount>(this as FacingsCount, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacingsCount&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.visitLocalId, visitLocalId) || other.visitLocalId == visitLocalId)&&(identical(other.visitServerId, visitServerId) || other.visitServerId == visitServerId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerCode, customerCode) || other.customerCode == customerCode)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.salesAgentId, salesAgentId) || other.salesAgentId == salesAgentId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}


@override
int get hashCode => Object.hash(runtimeType,localId,serverId,visitLocalId,visitServerId,customerId,customerCode,customerName,salesAgentId,status,const DeepCollectionEquality().hash(items),createdAt,updatedAt,submittedAt,approvedAt,syncState,syncError,lastSyncedAt);

@override
String toString() {
  return 'FacingsCount(localId: $localId, serverId: $serverId, visitLocalId: $visitLocalId, visitServerId: $visitServerId, customerId: $customerId, customerCode: $customerCode, customerName: $customerName, salesAgentId: $salesAgentId, status: $status, items: $items, createdAt: $createdAt, updatedAt: $updatedAt, submittedAt: $submittedAt, approvedAt: $approvedAt, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class $FacingsCountCopyWith<$Res>  {
  factory $FacingsCountCopyWith(FacingsCount value, $Res Function(FacingsCount) _then) = _$FacingsCountCopyWithImpl;
@useResult
$Res call({
 String localId, int? serverId, String visitLocalId, int? visitServerId, int customerId, String customerCode, String customerName, int salesAgentId, FacingsCountStatus status, List<FacingsCountItem> items, DateTime createdAt, DateTime updatedAt, DateTime? submittedAt, DateTime? approvedAt, FacingsSyncState syncState, String? syncError, DateTime? lastSyncedAt
});




}
/// @nodoc
class _$FacingsCountCopyWithImpl<$Res>
    implements $FacingsCountCopyWith<$Res> {
  _$FacingsCountCopyWithImpl(this._self, this._then);

  final FacingsCount _self;
  final $Res Function(FacingsCount) _then;

/// Create a copy of FacingsCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? serverId = freezed,Object? visitLocalId = null,Object? visitServerId = freezed,Object? customerId = null,Object? customerCode = null,Object? customerName = null,Object? salesAgentId = null,Object? status = null,Object? items = null,Object? createdAt = null,Object? updatedAt = null,Object? submittedAt = freezed,Object? approvedAt = freezed,Object? syncState = null,Object? syncError = freezed,Object? lastSyncedAt = freezed,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,visitLocalId: null == visitLocalId ? _self.visitLocalId : visitLocalId // ignore: cast_nullable_to_non_nullable
as String,visitServerId: freezed == visitServerId ? _self.visitServerId : visitServerId // ignore: cast_nullable_to_non_nullable
as int?,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,customerCode: null == customerCode ? _self.customerCode : customerCode // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,salesAgentId: null == salesAgentId ? _self.salesAgentId : salesAgentId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FacingsCountStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<FacingsCountItem>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as FacingsSyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FacingsCount].
extension FacingsCountPatterns on FacingsCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacingsCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacingsCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacingsCount value)  $default,){
final _that = this;
switch (_that) {
case _FacingsCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacingsCount value)?  $default,){
final _that = this;
switch (_that) {
case _FacingsCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  int? serverId,  String visitLocalId,  int? visitServerId,  int customerId,  String customerCode,  String customerName,  int salesAgentId,  FacingsCountStatus status,  List<FacingsCountItem> items,  DateTime createdAt,  DateTime updatedAt,  DateTime? submittedAt,  DateTime? approvedAt,  FacingsSyncState syncState,  String? syncError,  DateTime? lastSyncedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacingsCount() when $default != null:
return $default(_that.localId,_that.serverId,_that.visitLocalId,_that.visitServerId,_that.customerId,_that.customerCode,_that.customerName,_that.salesAgentId,_that.status,_that.items,_that.createdAt,_that.updatedAt,_that.submittedAt,_that.approvedAt,_that.syncState,_that.syncError,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  int? serverId,  String visitLocalId,  int? visitServerId,  int customerId,  String customerCode,  String customerName,  int salesAgentId,  FacingsCountStatus status,  List<FacingsCountItem> items,  DateTime createdAt,  DateTime updatedAt,  DateTime? submittedAt,  DateTime? approvedAt,  FacingsSyncState syncState,  String? syncError,  DateTime? lastSyncedAt)  $default,) {final _that = this;
switch (_that) {
case _FacingsCount():
return $default(_that.localId,_that.serverId,_that.visitLocalId,_that.visitServerId,_that.customerId,_that.customerCode,_that.customerName,_that.salesAgentId,_that.status,_that.items,_that.createdAt,_that.updatedAt,_that.submittedAt,_that.approvedAt,_that.syncState,_that.syncError,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  int? serverId,  String visitLocalId,  int? visitServerId,  int customerId,  String customerCode,  String customerName,  int salesAgentId,  FacingsCountStatus status,  List<FacingsCountItem> items,  DateTime createdAt,  DateTime updatedAt,  DateTime? submittedAt,  DateTime? approvedAt,  FacingsSyncState syncState,  String? syncError,  DateTime? lastSyncedAt)?  $default,) {final _that = this;
switch (_that) {
case _FacingsCount() when $default != null:
return $default(_that.localId,_that.serverId,_that.visitLocalId,_that.visitServerId,_that.customerId,_that.customerCode,_that.customerName,_that.salesAgentId,_that.status,_that.items,_that.createdAt,_that.updatedAt,_that.submittedAt,_that.approvedAt,_that.syncState,_that.syncError,_that.lastSyncedAt);case _:
  return null;

}
}

}

/// @nodoc


class _FacingsCount extends FacingsCount {
  const _FacingsCount({required this.localId, this.serverId, required this.visitLocalId, this.visitServerId, required this.customerId, required this.customerCode, required this.customerName, required this.salesAgentId, required this.status, required final  List<FacingsCountItem> items, required this.createdAt, required this.updatedAt, this.submittedAt, this.approvedAt, required this.syncState, this.syncError, this.lastSyncedAt}): _items = items,super._();
  

/// Local UUID for offline-first
@override final  String localId;
/// Server ID (null until synced)
@override final  int? serverId;
/// Visit context (clock-in traceability)
@override final  String visitLocalId;
@override final  int? visitServerId;
/// Customer/outlet info (not echoed back by the API — kept locally)
@override final  int customerId;
@override final  String customerCode;
@override final  String customerName;
/// Agent info ("my user ID")
@override final  int salesAgentId;
/// Count status
@override final  FacingsCountStatus status;
/// Item groups with facing counts
 final  List<FacingsCountItem> _items;
/// Item groups with facing counts
@override List<FacingsCountItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// Timestamps
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? submittedAt;
@override final  DateTime? approvedAt;
/// Sync state
@override final  FacingsSyncState syncState;
@override final  String? syncError;
@override final  DateTime? lastSyncedAt;

/// Create a copy of FacingsCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacingsCountCopyWith<_FacingsCount> get copyWith => __$FacingsCountCopyWithImpl<_FacingsCount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacingsCount&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.visitLocalId, visitLocalId) || other.visitLocalId == visitLocalId)&&(identical(other.visitServerId, visitServerId) || other.visitServerId == visitServerId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerCode, customerCode) || other.customerCode == customerCode)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.salesAgentId, salesAgentId) || other.salesAgentId == salesAgentId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}


@override
int get hashCode => Object.hash(runtimeType,localId,serverId,visitLocalId,visitServerId,customerId,customerCode,customerName,salesAgentId,status,const DeepCollectionEquality().hash(_items),createdAt,updatedAt,submittedAt,approvedAt,syncState,syncError,lastSyncedAt);

@override
String toString() {
  return 'FacingsCount(localId: $localId, serverId: $serverId, visitLocalId: $visitLocalId, visitServerId: $visitServerId, customerId: $customerId, customerCode: $customerCode, customerName: $customerName, salesAgentId: $salesAgentId, status: $status, items: $items, createdAt: $createdAt, updatedAt: $updatedAt, submittedAt: $submittedAt, approvedAt: $approvedAt, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class _$FacingsCountCopyWith<$Res> implements $FacingsCountCopyWith<$Res> {
  factory _$FacingsCountCopyWith(_FacingsCount value, $Res Function(_FacingsCount) _then) = __$FacingsCountCopyWithImpl;
@override @useResult
$Res call({
 String localId, int? serverId, String visitLocalId, int? visitServerId, int customerId, String customerCode, String customerName, int salesAgentId, FacingsCountStatus status, List<FacingsCountItem> items, DateTime createdAt, DateTime updatedAt, DateTime? submittedAt, DateTime? approvedAt, FacingsSyncState syncState, String? syncError, DateTime? lastSyncedAt
});




}
/// @nodoc
class __$FacingsCountCopyWithImpl<$Res>
    implements _$FacingsCountCopyWith<$Res> {
  __$FacingsCountCopyWithImpl(this._self, this._then);

  final _FacingsCount _self;
  final $Res Function(_FacingsCount) _then;

/// Create a copy of FacingsCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? serverId = freezed,Object? visitLocalId = null,Object? visitServerId = freezed,Object? customerId = null,Object? customerCode = null,Object? customerName = null,Object? salesAgentId = null,Object? status = null,Object? items = null,Object? createdAt = null,Object? updatedAt = null,Object? submittedAt = freezed,Object? approvedAt = freezed,Object? syncState = null,Object? syncError = freezed,Object? lastSyncedAt = freezed,}) {
  return _then(_FacingsCount(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,visitLocalId: null == visitLocalId ? _self.visitLocalId : visitLocalId // ignore: cast_nullable_to_non_nullable
as String,visitServerId: freezed == visitServerId ? _self.visitServerId : visitServerId // ignore: cast_nullable_to_non_nullable
as int?,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,customerCode: null == customerCode ? _self.customerCode : customerCode // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,salesAgentId: null == salesAgentId ? _self.salesAgentId : salesAgentId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FacingsCountStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<FacingsCountItem>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as FacingsSyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$FacingsCountItem {

 int get itemGroupId; String get itemGroupCode; String get itemGroupName; int get quantity;
/// Create a copy of FacingsCountItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacingsCountItemCopyWith<FacingsCountItem> get copyWith => _$FacingsCountItemCopyWithImpl<FacingsCountItem>(this as FacingsCountItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacingsCountItem&&(identical(other.itemGroupId, itemGroupId) || other.itemGroupId == itemGroupId)&&(identical(other.itemGroupCode, itemGroupCode) || other.itemGroupCode == itemGroupCode)&&(identical(other.itemGroupName, itemGroupName) || other.itemGroupName == itemGroupName)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,itemGroupId,itemGroupCode,itemGroupName,quantity);

@override
String toString() {
  return 'FacingsCountItem(itemGroupId: $itemGroupId, itemGroupCode: $itemGroupCode, itemGroupName: $itemGroupName, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $FacingsCountItemCopyWith<$Res>  {
  factory $FacingsCountItemCopyWith(FacingsCountItem value, $Res Function(FacingsCountItem) _then) = _$FacingsCountItemCopyWithImpl;
@useResult
$Res call({
 int itemGroupId, String itemGroupCode, String itemGroupName, int quantity
});




}
/// @nodoc
class _$FacingsCountItemCopyWithImpl<$Res>
    implements $FacingsCountItemCopyWith<$Res> {
  _$FacingsCountItemCopyWithImpl(this._self, this._then);

  final FacingsCountItem _self;
  final $Res Function(FacingsCountItem) _then;

/// Create a copy of FacingsCountItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemGroupId = null,Object? itemGroupCode = null,Object? itemGroupName = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
itemGroupId: null == itemGroupId ? _self.itemGroupId : itemGroupId // ignore: cast_nullable_to_non_nullable
as int,itemGroupCode: null == itemGroupCode ? _self.itemGroupCode : itemGroupCode // ignore: cast_nullable_to_non_nullable
as String,itemGroupName: null == itemGroupName ? _self.itemGroupName : itemGroupName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FacingsCountItem].
extension FacingsCountItemPatterns on FacingsCountItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacingsCountItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacingsCountItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacingsCountItem value)  $default,){
final _that = this;
switch (_that) {
case _FacingsCountItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacingsCountItem value)?  $default,){
final _that = this;
switch (_that) {
case _FacingsCountItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemGroupId,  String itemGroupCode,  String itemGroupName,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacingsCountItem() when $default != null:
return $default(_that.itemGroupId,_that.itemGroupCode,_that.itemGroupName,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemGroupId,  String itemGroupCode,  String itemGroupName,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _FacingsCountItem():
return $default(_that.itemGroupId,_that.itemGroupCode,_that.itemGroupName,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemGroupId,  String itemGroupCode,  String itemGroupName,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _FacingsCountItem() when $default != null:
return $default(_that.itemGroupId,_that.itemGroupCode,_that.itemGroupName,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc


class _FacingsCountItem extends FacingsCountItem {
  const _FacingsCountItem({required this.itemGroupId, required this.itemGroupCode, required this.itemGroupName, required this.quantity}): super._();
  

@override final  int itemGroupId;
@override final  String itemGroupCode;
@override final  String itemGroupName;
@override final  int quantity;

/// Create a copy of FacingsCountItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacingsCountItemCopyWith<_FacingsCountItem> get copyWith => __$FacingsCountItemCopyWithImpl<_FacingsCountItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacingsCountItem&&(identical(other.itemGroupId, itemGroupId) || other.itemGroupId == itemGroupId)&&(identical(other.itemGroupCode, itemGroupCode) || other.itemGroupCode == itemGroupCode)&&(identical(other.itemGroupName, itemGroupName) || other.itemGroupName == itemGroupName)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,itemGroupId,itemGroupCode,itemGroupName,quantity);

@override
String toString() {
  return 'FacingsCountItem(itemGroupId: $itemGroupId, itemGroupCode: $itemGroupCode, itemGroupName: $itemGroupName, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$FacingsCountItemCopyWith<$Res> implements $FacingsCountItemCopyWith<$Res> {
  factory _$FacingsCountItemCopyWith(_FacingsCountItem value, $Res Function(_FacingsCountItem) _then) = __$FacingsCountItemCopyWithImpl;
@override @useResult
$Res call({
 int itemGroupId, String itemGroupCode, String itemGroupName, int quantity
});




}
/// @nodoc
class __$FacingsCountItemCopyWithImpl<$Res>
    implements _$FacingsCountItemCopyWith<$Res> {
  __$FacingsCountItemCopyWithImpl(this._self, this._then);

  final _FacingsCountItem _self;
  final $Res Function(_FacingsCountItem) _then;

/// Create a copy of FacingsCountItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemGroupId = null,Object? itemGroupCode = null,Object? itemGroupName = null,Object? quantity = null,}) {
  return _then(_FacingsCountItem(
itemGroupId: null == itemGroupId ? _self.itemGroupId : itemGroupId // ignore: cast_nullable_to_non_nullable
as int,itemGroupCode: null == itemGroupCode ? _self.itemGroupCode : itemGroupCode // ignore: cast_nullable_to_non_nullable
as String,itemGroupName: null == itemGroupName ? _self.itemGroupName : itemGroupName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
