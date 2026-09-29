// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelf_share_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShelfShareSession {

/// Local UUID for offline-first
 String get localId;/// Server ID (null until synced)
 int? get serverId;/// Visit context
 String get visitLocalId; int? get visitServerId;/// Customer/outlet info
 int get customerId; String get customerCode; String get customerName;/// Agent info
 int get salesAgentId;/// Session status
 ShelfShareStatus get status;/// Item groups with brand entries
 List<ShelfShareItemGroup> get itemGroups;/// Notes
 String? get notes;/// Timestamps
 DateTime get createdAt; DateTime get updatedAt; DateTime? get submittedAt; DateTime? get approvedAt;/// Sync state
 SyncState get syncState; String? get syncError; DateTime? get lastSyncedAt;
/// Create a copy of ShelfShareSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfShareSessionCopyWith<ShelfShareSession> get copyWith => _$ShelfShareSessionCopyWithImpl<ShelfShareSession>(this as ShelfShareSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShelfShareSession&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.visitLocalId, visitLocalId) || other.visitLocalId == visitLocalId)&&(identical(other.visitServerId, visitServerId) || other.visitServerId == visitServerId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerCode, customerCode) || other.customerCode == customerCode)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.salesAgentId, salesAgentId) || other.salesAgentId == salesAgentId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.itemGroups, itemGroups)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}


@override
int get hashCode => Object.hash(runtimeType,localId,serverId,visitLocalId,visitServerId,customerId,customerCode,customerName,salesAgentId,status,const DeepCollectionEquality().hash(itemGroups),notes,createdAt,updatedAt,submittedAt,approvedAt,syncState,syncError,lastSyncedAt);

@override
String toString() {
  return 'ShelfShareSession(localId: $localId, serverId: $serverId, visitLocalId: $visitLocalId, visitServerId: $visitServerId, customerId: $customerId, customerCode: $customerCode, customerName: $customerName, salesAgentId: $salesAgentId, status: $status, itemGroups: $itemGroups, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, submittedAt: $submittedAt, approvedAt: $approvedAt, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class $ShelfShareSessionCopyWith<$Res>  {
  factory $ShelfShareSessionCopyWith(ShelfShareSession value, $Res Function(ShelfShareSession) _then) = _$ShelfShareSessionCopyWithImpl;
@useResult
$Res call({
 String localId, int? serverId, String visitLocalId, int? visitServerId, int customerId, String customerCode, String customerName, int salesAgentId, ShelfShareStatus status, List<ShelfShareItemGroup> itemGroups, String? notes, DateTime createdAt, DateTime updatedAt, DateTime? submittedAt, DateTime? approvedAt, SyncState syncState, String? syncError, DateTime? lastSyncedAt
});




}
/// @nodoc
class _$ShelfShareSessionCopyWithImpl<$Res>
    implements $ShelfShareSessionCopyWith<$Res> {
  _$ShelfShareSessionCopyWithImpl(this._self, this._then);

  final ShelfShareSession _self;
  final $Res Function(ShelfShareSession) _then;

/// Create a copy of ShelfShareSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? serverId = freezed,Object? visitLocalId = null,Object? visitServerId = freezed,Object? customerId = null,Object? customerCode = null,Object? customerName = null,Object? salesAgentId = null,Object? status = null,Object? itemGroups = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? submittedAt = freezed,Object? approvedAt = freezed,Object? syncState = null,Object? syncError = freezed,Object? lastSyncedAt = freezed,}) {
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
as ShelfShareStatus,itemGroups: null == itemGroups ? _self.itemGroups : itemGroups // ignore: cast_nullable_to_non_nullable
as List<ShelfShareItemGroup>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShelfShareSession].
extension ShelfShareSessionPatterns on ShelfShareSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShelfShareSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShelfShareSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShelfShareSession value)  $default,){
final _that = this;
switch (_that) {
case _ShelfShareSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShelfShareSession value)?  $default,){
final _that = this;
switch (_that) {
case _ShelfShareSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  int? serverId,  String visitLocalId,  int? visitServerId,  int customerId,  String customerCode,  String customerName,  int salesAgentId,  ShelfShareStatus status,  List<ShelfShareItemGroup> itemGroups,  String? notes,  DateTime createdAt,  DateTime updatedAt,  DateTime? submittedAt,  DateTime? approvedAt,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShelfShareSession() when $default != null:
return $default(_that.localId,_that.serverId,_that.visitLocalId,_that.visitServerId,_that.customerId,_that.customerCode,_that.customerName,_that.salesAgentId,_that.status,_that.itemGroups,_that.notes,_that.createdAt,_that.updatedAt,_that.submittedAt,_that.approvedAt,_that.syncState,_that.syncError,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  int? serverId,  String visitLocalId,  int? visitServerId,  int customerId,  String customerCode,  String customerName,  int salesAgentId,  ShelfShareStatus status,  List<ShelfShareItemGroup> itemGroups,  String? notes,  DateTime createdAt,  DateTime updatedAt,  DateTime? submittedAt,  DateTime? approvedAt,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt)  $default,) {final _that = this;
switch (_that) {
case _ShelfShareSession():
return $default(_that.localId,_that.serverId,_that.visitLocalId,_that.visitServerId,_that.customerId,_that.customerCode,_that.customerName,_that.salesAgentId,_that.status,_that.itemGroups,_that.notes,_that.createdAt,_that.updatedAt,_that.submittedAt,_that.approvedAt,_that.syncState,_that.syncError,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  int? serverId,  String visitLocalId,  int? visitServerId,  int customerId,  String customerCode,  String customerName,  int salesAgentId,  ShelfShareStatus status,  List<ShelfShareItemGroup> itemGroups,  String? notes,  DateTime createdAt,  DateTime updatedAt,  DateTime? submittedAt,  DateTime? approvedAt,  SyncState syncState,  String? syncError,  DateTime? lastSyncedAt)?  $default,) {final _that = this;
switch (_that) {
case _ShelfShareSession() when $default != null:
return $default(_that.localId,_that.serverId,_that.visitLocalId,_that.visitServerId,_that.customerId,_that.customerCode,_that.customerName,_that.salesAgentId,_that.status,_that.itemGroups,_that.notes,_that.createdAt,_that.updatedAt,_that.submittedAt,_that.approvedAt,_that.syncState,_that.syncError,_that.lastSyncedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ShelfShareSession extends ShelfShareSession {
  const _ShelfShareSession({required this.localId, this.serverId, required this.visitLocalId, this.visitServerId, required this.customerId, required this.customerCode, required this.customerName, required this.salesAgentId, required this.status, required final  List<ShelfShareItemGroup> itemGroups, this.notes, required this.createdAt, required this.updatedAt, this.submittedAt, this.approvedAt, required this.syncState, this.syncError, this.lastSyncedAt}): _itemGroups = itemGroups,super._();
  

/// Local UUID for offline-first
@override final  String localId;
/// Server ID (null until synced)
@override final  int? serverId;
/// Visit context
@override final  String visitLocalId;
@override final  int? visitServerId;
/// Customer/outlet info
@override final  int customerId;
@override final  String customerCode;
@override final  String customerName;
/// Agent info
@override final  int salesAgentId;
/// Session status
@override final  ShelfShareStatus status;
/// Item groups with brand entries
 final  List<ShelfShareItemGroup> _itemGroups;
/// Item groups with brand entries
@override List<ShelfShareItemGroup> get itemGroups {
  if (_itemGroups is EqualUnmodifiableListView) return _itemGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemGroups);
}

/// Notes
@override final  String? notes;
/// Timestamps
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? submittedAt;
@override final  DateTime? approvedAt;
/// Sync state
@override final  SyncState syncState;
@override final  String? syncError;
@override final  DateTime? lastSyncedAt;

/// Create a copy of ShelfShareSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelfShareSessionCopyWith<_ShelfShareSession> get copyWith => __$ShelfShareSessionCopyWithImpl<_ShelfShareSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShelfShareSession&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.visitLocalId, visitLocalId) || other.visitLocalId == visitLocalId)&&(identical(other.visitServerId, visitServerId) || other.visitServerId == visitServerId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerCode, customerCode) || other.customerCode == customerCode)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.salesAgentId, salesAgentId) || other.salesAgentId == salesAgentId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._itemGroups, _itemGroups)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}


@override
int get hashCode => Object.hash(runtimeType,localId,serverId,visitLocalId,visitServerId,customerId,customerCode,customerName,salesAgentId,status,const DeepCollectionEquality().hash(_itemGroups),notes,createdAt,updatedAt,submittedAt,approvedAt,syncState,syncError,lastSyncedAt);

@override
String toString() {
  return 'ShelfShareSession(localId: $localId, serverId: $serverId, visitLocalId: $visitLocalId, visitServerId: $visitServerId, customerId: $customerId, customerCode: $customerCode, customerName: $customerName, salesAgentId: $salesAgentId, status: $status, itemGroups: $itemGroups, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, submittedAt: $submittedAt, approvedAt: $approvedAt, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class _$ShelfShareSessionCopyWith<$Res> implements $ShelfShareSessionCopyWith<$Res> {
  factory _$ShelfShareSessionCopyWith(_ShelfShareSession value, $Res Function(_ShelfShareSession) _then) = __$ShelfShareSessionCopyWithImpl;
@override @useResult
$Res call({
 String localId, int? serverId, String visitLocalId, int? visitServerId, int customerId, String customerCode, String customerName, int salesAgentId, ShelfShareStatus status, List<ShelfShareItemGroup> itemGroups, String? notes, DateTime createdAt, DateTime updatedAt, DateTime? submittedAt, DateTime? approvedAt, SyncState syncState, String? syncError, DateTime? lastSyncedAt
});




}
/// @nodoc
class __$ShelfShareSessionCopyWithImpl<$Res>
    implements _$ShelfShareSessionCopyWith<$Res> {
  __$ShelfShareSessionCopyWithImpl(this._self, this._then);

  final _ShelfShareSession _self;
  final $Res Function(_ShelfShareSession) _then;

/// Create a copy of ShelfShareSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? serverId = freezed,Object? visitLocalId = null,Object? visitServerId = freezed,Object? customerId = null,Object? customerCode = null,Object? customerName = null,Object? salesAgentId = null,Object? status = null,Object? itemGroups = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? submittedAt = freezed,Object? approvedAt = freezed,Object? syncState = null,Object? syncError = freezed,Object? lastSyncedAt = freezed,}) {
  return _then(_ShelfShareSession(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,visitLocalId: null == visitLocalId ? _self.visitLocalId : visitLocalId // ignore: cast_nullable_to_non_nullable
as String,visitServerId: freezed == visitServerId ? _self.visitServerId : visitServerId // ignore: cast_nullable_to_non_nullable
as int?,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,customerCode: null == customerCode ? _self.customerCode : customerCode // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,salesAgentId: null == salesAgentId ? _self.salesAgentId : salesAgentId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShelfShareStatus,itemGroups: null == itemGroups ? _self._itemGroups : itemGroups // ignore: cast_nullable_to_non_nullable
as List<ShelfShareItemGroup>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$ShelfShareItemGroup {

/// The item group ID (references ItemGroup entity)
 int get itemGroupId;/// The item group name (denormalized for display)
 String get itemGroupName;/// Brand entries for this item group
 List<ShelfShareBrandEntry> get brandEntries;
/// Create a copy of ShelfShareItemGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfShareItemGroupCopyWith<ShelfShareItemGroup> get copyWith => _$ShelfShareItemGroupCopyWithImpl<ShelfShareItemGroup>(this as ShelfShareItemGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShelfShareItemGroup&&(identical(other.itemGroupId, itemGroupId) || other.itemGroupId == itemGroupId)&&(identical(other.itemGroupName, itemGroupName) || other.itemGroupName == itemGroupName)&&const DeepCollectionEquality().equals(other.brandEntries, brandEntries));
}


@override
int get hashCode => Object.hash(runtimeType,itemGroupId,itemGroupName,const DeepCollectionEquality().hash(brandEntries));

@override
String toString() {
  return 'ShelfShareItemGroup(itemGroupId: $itemGroupId, itemGroupName: $itemGroupName, brandEntries: $brandEntries)';
}


}

/// @nodoc
abstract mixin class $ShelfShareItemGroupCopyWith<$Res>  {
  factory $ShelfShareItemGroupCopyWith(ShelfShareItemGroup value, $Res Function(ShelfShareItemGroup) _then) = _$ShelfShareItemGroupCopyWithImpl;
@useResult
$Res call({
 int itemGroupId, String itemGroupName, List<ShelfShareBrandEntry> brandEntries
});




}
/// @nodoc
class _$ShelfShareItemGroupCopyWithImpl<$Res>
    implements $ShelfShareItemGroupCopyWith<$Res> {
  _$ShelfShareItemGroupCopyWithImpl(this._self, this._then);

  final ShelfShareItemGroup _self;
  final $Res Function(ShelfShareItemGroup) _then;

/// Create a copy of ShelfShareItemGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemGroupId = null,Object? itemGroupName = null,Object? brandEntries = null,}) {
  return _then(_self.copyWith(
itemGroupId: null == itemGroupId ? _self.itemGroupId : itemGroupId // ignore: cast_nullable_to_non_nullable
as int,itemGroupName: null == itemGroupName ? _self.itemGroupName : itemGroupName // ignore: cast_nullable_to_non_nullable
as String,brandEntries: null == brandEntries ? _self.brandEntries : brandEntries // ignore: cast_nullable_to_non_nullable
as List<ShelfShareBrandEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [ShelfShareItemGroup].
extension ShelfShareItemGroupPatterns on ShelfShareItemGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShelfShareItemGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShelfShareItemGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShelfShareItemGroup value)  $default,){
final _that = this;
switch (_that) {
case _ShelfShareItemGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShelfShareItemGroup value)?  $default,){
final _that = this;
switch (_that) {
case _ShelfShareItemGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemGroupId,  String itemGroupName,  List<ShelfShareBrandEntry> brandEntries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShelfShareItemGroup() when $default != null:
return $default(_that.itemGroupId,_that.itemGroupName,_that.brandEntries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemGroupId,  String itemGroupName,  List<ShelfShareBrandEntry> brandEntries)  $default,) {final _that = this;
switch (_that) {
case _ShelfShareItemGroup():
return $default(_that.itemGroupId,_that.itemGroupName,_that.brandEntries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemGroupId,  String itemGroupName,  List<ShelfShareBrandEntry> brandEntries)?  $default,) {final _that = this;
switch (_that) {
case _ShelfShareItemGroup() when $default != null:
return $default(_that.itemGroupId,_that.itemGroupName,_that.brandEntries);case _:
  return null;

}
}

}

/// @nodoc


class _ShelfShareItemGroup extends ShelfShareItemGroup {
  const _ShelfShareItemGroup({required this.itemGroupId, required this.itemGroupName, required final  List<ShelfShareBrandEntry> brandEntries}): _brandEntries = brandEntries,super._();
  

/// The item group ID (references ItemGroup entity)
@override final  int itemGroupId;
/// The item group name (denormalized for display)
@override final  String itemGroupName;
/// Brand entries for this item group
 final  List<ShelfShareBrandEntry> _brandEntries;
/// Brand entries for this item group
@override List<ShelfShareBrandEntry> get brandEntries {
  if (_brandEntries is EqualUnmodifiableListView) return _brandEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brandEntries);
}


/// Create a copy of ShelfShareItemGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelfShareItemGroupCopyWith<_ShelfShareItemGroup> get copyWith => __$ShelfShareItemGroupCopyWithImpl<_ShelfShareItemGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShelfShareItemGroup&&(identical(other.itemGroupId, itemGroupId) || other.itemGroupId == itemGroupId)&&(identical(other.itemGroupName, itemGroupName) || other.itemGroupName == itemGroupName)&&const DeepCollectionEquality().equals(other._brandEntries, _brandEntries));
}


@override
int get hashCode => Object.hash(runtimeType,itemGroupId,itemGroupName,const DeepCollectionEquality().hash(_brandEntries));

@override
String toString() {
  return 'ShelfShareItemGroup(itemGroupId: $itemGroupId, itemGroupName: $itemGroupName, brandEntries: $brandEntries)';
}


}

/// @nodoc
abstract mixin class _$ShelfShareItemGroupCopyWith<$Res> implements $ShelfShareItemGroupCopyWith<$Res> {
  factory _$ShelfShareItemGroupCopyWith(_ShelfShareItemGroup value, $Res Function(_ShelfShareItemGroup) _then) = __$ShelfShareItemGroupCopyWithImpl;
@override @useResult
$Res call({
 int itemGroupId, String itemGroupName, List<ShelfShareBrandEntry> brandEntries
});




}
/// @nodoc
class __$ShelfShareItemGroupCopyWithImpl<$Res>
    implements _$ShelfShareItemGroupCopyWith<$Res> {
  __$ShelfShareItemGroupCopyWithImpl(this._self, this._then);

  final _ShelfShareItemGroup _self;
  final $Res Function(_ShelfShareItemGroup) _then;

/// Create a copy of ShelfShareItemGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemGroupId = null,Object? itemGroupName = null,Object? brandEntries = null,}) {
  return _then(_ShelfShareItemGroup(
itemGroupId: null == itemGroupId ? _self.itemGroupId : itemGroupId // ignore: cast_nullable_to_non_nullable
as int,itemGroupName: null == itemGroupName ? _self.itemGroupName : itemGroupName // ignore: cast_nullable_to_non_nullable
as String,brandEntries: null == brandEntries ? _self._brandEntries : brandEntries // ignore: cast_nullable_to_non_nullable
as List<ShelfShareBrandEntry>,
  ));
}


}

/// @nodoc
mixin _$ShelfShareBrandEntry {

/// Brand reference
 int get brandId; String get brandName;/// Number of facings on shelf
 int get facings;/// Optional notes
 String? get notes;
/// Create a copy of ShelfShareBrandEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfShareBrandEntryCopyWith<ShelfShareBrandEntry> get copyWith => _$ShelfShareBrandEntryCopyWithImpl<ShelfShareBrandEntry>(this as ShelfShareBrandEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShelfShareBrandEntry&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.facings, facings) || other.facings == facings)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,brandId,brandName,facings,notes);

@override
String toString() {
  return 'ShelfShareBrandEntry(brandId: $brandId, brandName: $brandName, facings: $facings, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $ShelfShareBrandEntryCopyWith<$Res>  {
  factory $ShelfShareBrandEntryCopyWith(ShelfShareBrandEntry value, $Res Function(ShelfShareBrandEntry) _then) = _$ShelfShareBrandEntryCopyWithImpl;
@useResult
$Res call({
 int brandId, String brandName, int facings, String? notes
});




}
/// @nodoc
class _$ShelfShareBrandEntryCopyWithImpl<$Res>
    implements $ShelfShareBrandEntryCopyWith<$Res> {
  _$ShelfShareBrandEntryCopyWithImpl(this._self, this._then);

  final ShelfShareBrandEntry _self;
  final $Res Function(ShelfShareBrandEntry) _then;

/// Create a copy of ShelfShareBrandEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brandId = null,Object? brandName = null,Object? facings = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,facings: null == facings ? _self.facings : facings // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShelfShareBrandEntry].
extension ShelfShareBrandEntryPatterns on ShelfShareBrandEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShelfShareBrandEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShelfShareBrandEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShelfShareBrandEntry value)  $default,){
final _that = this;
switch (_that) {
case _ShelfShareBrandEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShelfShareBrandEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ShelfShareBrandEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int brandId,  String brandName,  int facings,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShelfShareBrandEntry() when $default != null:
return $default(_that.brandId,_that.brandName,_that.facings,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int brandId,  String brandName,  int facings,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _ShelfShareBrandEntry():
return $default(_that.brandId,_that.brandName,_that.facings,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int brandId,  String brandName,  int facings,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _ShelfShareBrandEntry() when $default != null:
return $default(_that.brandId,_that.brandName,_that.facings,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _ShelfShareBrandEntry extends ShelfShareBrandEntry {
  const _ShelfShareBrandEntry({required this.brandId, required this.brandName, required this.facings, this.notes}): super._();
  

/// Brand reference
@override final  int brandId;
@override final  String brandName;
/// Number of facings on shelf
@override final  int facings;
/// Optional notes
@override final  String? notes;

/// Create a copy of ShelfShareBrandEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelfShareBrandEntryCopyWith<_ShelfShareBrandEntry> get copyWith => __$ShelfShareBrandEntryCopyWithImpl<_ShelfShareBrandEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShelfShareBrandEntry&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.facings, facings) || other.facings == facings)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,brandId,brandName,facings,notes);

@override
String toString() {
  return 'ShelfShareBrandEntry(brandId: $brandId, brandName: $brandName, facings: $facings, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ShelfShareBrandEntryCopyWith<$Res> implements $ShelfShareBrandEntryCopyWith<$Res> {
  factory _$ShelfShareBrandEntryCopyWith(_ShelfShareBrandEntry value, $Res Function(_ShelfShareBrandEntry) _then) = __$ShelfShareBrandEntryCopyWithImpl;
@override @useResult
$Res call({
 int brandId, String brandName, int facings, String? notes
});




}
/// @nodoc
class __$ShelfShareBrandEntryCopyWithImpl<$Res>
    implements _$ShelfShareBrandEntryCopyWith<$Res> {
  __$ShelfShareBrandEntryCopyWithImpl(this._self, this._then);

  final _ShelfShareBrandEntry _self;
  final $Res Function(_ShelfShareBrandEntry) _then;

/// Create a copy of ShelfShareBrandEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? brandId = null,Object? brandName = null,Object? facings = null,Object? notes = freezed,}) {
  return _then(_ShelfShareBrandEntry(
brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,facings: null == facings ? _self.facings : facings // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
