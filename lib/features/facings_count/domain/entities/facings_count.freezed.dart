// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facings_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FacingsCount {
  /// Local UUID for offline-first
  String get localId => throw _privateConstructorUsedError;

  /// Server ID (null until synced)
  int? get serverId => throw _privateConstructorUsedError;

  /// Visit context (clock-in traceability)
  String get visitLocalId => throw _privateConstructorUsedError;
  int? get visitServerId => throw _privateConstructorUsedError;

  /// Customer/outlet info (not echoed back by the API — kept locally)
  int get customerId => throw _privateConstructorUsedError;
  String get customerCode => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;

  /// Agent info ("my user ID")
  int get salesAgentId => throw _privateConstructorUsedError;

  /// Count status
  FacingsCountStatus get status => throw _privateConstructorUsedError;

  /// Item groups with facing counts
  List<FacingsCountItem> get items => throw _privateConstructorUsedError;

  /// Timestamps
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get submittedAt => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;

  /// Sync state
  FacingsSyncState get syncState => throw _privateConstructorUsedError;
  String? get syncError => throw _privateConstructorUsedError;
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;

  /// Create a copy of FacingsCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacingsCountCopyWith<FacingsCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacingsCountCopyWith<$Res> {
  factory $FacingsCountCopyWith(
    FacingsCount value,
    $Res Function(FacingsCount) then,
  ) = _$FacingsCountCopyWithImpl<$Res, FacingsCount>;
  @useResult
  $Res call({
    String localId,
    int? serverId,
    String visitLocalId,
    int? visitServerId,
    int customerId,
    String customerCode,
    String customerName,
    int salesAgentId,
    FacingsCountStatus status,
    List<FacingsCountItem> items,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? submittedAt,
    DateTime? approvedAt,
    FacingsSyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
  });
}

/// @nodoc
class _$FacingsCountCopyWithImpl<$Res, $Val extends FacingsCount>
    implements $FacingsCountCopyWith<$Res> {
  _$FacingsCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacingsCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? visitLocalId = null,
    Object? visitServerId = freezed,
    Object? customerId = null,
    Object? customerCode = null,
    Object? customerName = null,
    Object? salesAgentId = null,
    Object? status = null,
    Object? items = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? submittedAt = freezed,
    Object? approvedAt = freezed,
    Object? syncState = null,
    Object? syncError = freezed,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            localId: null == localId
                ? _value.localId
                : localId // ignore: cast_nullable_to_non_nullable
                      as String,
            serverId: freezed == serverId
                ? _value.serverId
                : serverId // ignore: cast_nullable_to_non_nullable
                      as int?,
            visitLocalId: null == visitLocalId
                ? _value.visitLocalId
                : visitLocalId // ignore: cast_nullable_to_non_nullable
                      as String,
            visitServerId: freezed == visitServerId
                ? _value.visitServerId
                : visitServerId // ignore: cast_nullable_to_non_nullable
                      as int?,
            customerId: null == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as int,
            customerCode: null == customerCode
                ? _value.customerCode
                : customerCode // ignore: cast_nullable_to_non_nullable
                      as String,
            customerName: null == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String,
            salesAgentId: null == salesAgentId
                ? _value.salesAgentId
                : salesAgentId // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as FacingsCountStatus,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<FacingsCountItem>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            submittedAt: freezed == submittedAt
                ? _value.submittedAt
                : submittedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            approvedAt: freezed == approvedAt
                ? _value.approvedAt
                : approvedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            syncState: null == syncState
                ? _value.syncState
                : syncState // ignore: cast_nullable_to_non_nullable
                      as FacingsSyncState,
            syncError: freezed == syncError
                ? _value.syncError
                : syncError // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastSyncedAt: freezed == lastSyncedAt
                ? _value.lastSyncedAt
                : lastSyncedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FacingsCountImplCopyWith<$Res>
    implements $FacingsCountCopyWith<$Res> {
  factory _$$FacingsCountImplCopyWith(
    _$FacingsCountImpl value,
    $Res Function(_$FacingsCountImpl) then,
  ) = __$$FacingsCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String localId,
    int? serverId,
    String visitLocalId,
    int? visitServerId,
    int customerId,
    String customerCode,
    String customerName,
    int salesAgentId,
    FacingsCountStatus status,
    List<FacingsCountItem> items,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? submittedAt,
    DateTime? approvedAt,
    FacingsSyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
  });
}

/// @nodoc
class __$$FacingsCountImplCopyWithImpl<$Res>
    extends _$FacingsCountCopyWithImpl<$Res, _$FacingsCountImpl>
    implements _$$FacingsCountImplCopyWith<$Res> {
  __$$FacingsCountImplCopyWithImpl(
    _$FacingsCountImpl _value,
    $Res Function(_$FacingsCountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FacingsCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? visitLocalId = null,
    Object? visitServerId = freezed,
    Object? customerId = null,
    Object? customerCode = null,
    Object? customerName = null,
    Object? salesAgentId = null,
    Object? status = null,
    Object? items = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? submittedAt = freezed,
    Object? approvedAt = freezed,
    Object? syncState = null,
    Object? syncError = freezed,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(
      _$FacingsCountImpl(
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        serverId: freezed == serverId
            ? _value.serverId
            : serverId // ignore: cast_nullable_to_non_nullable
                  as int?,
        visitLocalId: null == visitLocalId
            ? _value.visitLocalId
            : visitLocalId // ignore: cast_nullable_to_non_nullable
                  as String,
        visitServerId: freezed == visitServerId
            ? _value.visitServerId
            : visitServerId // ignore: cast_nullable_to_non_nullable
                  as int?,
        customerId: null == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as int,
        customerCode: null == customerCode
            ? _value.customerCode
            : customerCode // ignore: cast_nullable_to_non_nullable
                  as String,
        customerName: null == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String,
        salesAgentId: null == salesAgentId
            ? _value.salesAgentId
            : salesAgentId // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FacingsCountStatus,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<FacingsCountItem>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        submittedAt: freezed == submittedAt
            ? _value.submittedAt
            : submittedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        approvedAt: freezed == approvedAt
            ? _value.approvedAt
            : approvedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        syncState: null == syncState
            ? _value.syncState
            : syncState // ignore: cast_nullable_to_non_nullable
                  as FacingsSyncState,
        syncError: freezed == syncError
            ? _value.syncError
            : syncError // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastSyncedAt: freezed == lastSyncedAt
            ? _value.lastSyncedAt
            : lastSyncedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$FacingsCountImpl extends _FacingsCount {
  const _$FacingsCountImpl({
    required this.localId,
    this.serverId,
    required this.visitLocalId,
    this.visitServerId,
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    required this.salesAgentId,
    required this.status,
    required final List<FacingsCountItem> items,
    required this.createdAt,
    required this.updatedAt,
    this.submittedAt,
    this.approvedAt,
    required this.syncState,
    this.syncError,
    this.lastSyncedAt,
  }) : _items = items,
       super._();

  /// Local UUID for offline-first
  @override
  final String localId;

  /// Server ID (null until synced)
  @override
  final int? serverId;

  /// Visit context (clock-in traceability)
  @override
  final String visitLocalId;
  @override
  final int? visitServerId;

  /// Customer/outlet info (not echoed back by the API — kept locally)
  @override
  final int customerId;
  @override
  final String customerCode;
  @override
  final String customerName;

  /// Agent info ("my user ID")
  @override
  final int salesAgentId;

  /// Count status
  @override
  final FacingsCountStatus status;

  /// Item groups with facing counts
  final List<FacingsCountItem> _items;

  /// Item groups with facing counts
  @override
  List<FacingsCountItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Timestamps
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? submittedAt;
  @override
  final DateTime? approvedAt;

  /// Sync state
  @override
  final FacingsSyncState syncState;
  @override
  final String? syncError;
  @override
  final DateTime? lastSyncedAt;

  @override
  String toString() {
    return 'FacingsCount(localId: $localId, serverId: $serverId, visitLocalId: $visitLocalId, visitServerId: $visitServerId, customerId: $customerId, customerCode: $customerCode, customerName: $customerName, salesAgentId: $salesAgentId, status: $status, items: $items, createdAt: $createdAt, updatedAt: $updatedAt, submittedAt: $submittedAt, approvedAt: $approvedAt, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacingsCountImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.visitLocalId, visitLocalId) ||
                other.visitLocalId == visitLocalId) &&
            (identical(other.visitServerId, visitServerId) ||
                other.visitServerId == visitServerId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.salesAgentId, salesAgentId) ||
                other.salesAgentId == salesAgentId) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState) &&
            (identical(other.syncError, syncError) ||
                other.syncError == syncError) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    localId,
    serverId,
    visitLocalId,
    visitServerId,
    customerId,
    customerCode,
    customerName,
    salesAgentId,
    status,
    const DeepCollectionEquality().hash(_items),
    createdAt,
    updatedAt,
    submittedAt,
    approvedAt,
    syncState,
    syncError,
    lastSyncedAt,
  );

  /// Create a copy of FacingsCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacingsCountImplCopyWith<_$FacingsCountImpl> get copyWith =>
      __$$FacingsCountImplCopyWithImpl<_$FacingsCountImpl>(this, _$identity);
}

abstract class _FacingsCount extends FacingsCount {
  const factory _FacingsCount({
    required final String localId,
    final int? serverId,
    required final String visitLocalId,
    final int? visitServerId,
    required final int customerId,
    required final String customerCode,
    required final String customerName,
    required final int salesAgentId,
    required final FacingsCountStatus status,
    required final List<FacingsCountItem> items,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? submittedAt,
    final DateTime? approvedAt,
    required final FacingsSyncState syncState,
    final String? syncError,
    final DateTime? lastSyncedAt,
  }) = _$FacingsCountImpl;
  const _FacingsCount._() : super._();

  /// Local UUID for offline-first
  @override
  String get localId;

  /// Server ID (null until synced)
  @override
  int? get serverId;

  /// Visit context (clock-in traceability)
  @override
  String get visitLocalId;
  @override
  int? get visitServerId;

  /// Customer/outlet info (not echoed back by the API — kept locally)
  @override
  int get customerId;
  @override
  String get customerCode;
  @override
  String get customerName;

  /// Agent info ("my user ID")
  @override
  int get salesAgentId;

  /// Count status
  @override
  FacingsCountStatus get status;

  /// Item groups with facing counts
  @override
  List<FacingsCountItem> get items;

  /// Timestamps
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get submittedAt;
  @override
  DateTime? get approvedAt;

  /// Sync state
  @override
  FacingsSyncState get syncState;
  @override
  String? get syncError;
  @override
  DateTime? get lastSyncedAt;

  /// Create a copy of FacingsCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacingsCountImplCopyWith<_$FacingsCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FacingsCountItem {
  int get itemGroupId => throw _privateConstructorUsedError;
  String get itemGroupCode => throw _privateConstructorUsedError;
  String get itemGroupName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Create a copy of FacingsCountItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FacingsCountItemCopyWith<FacingsCountItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacingsCountItemCopyWith<$Res> {
  factory $FacingsCountItemCopyWith(
    FacingsCountItem value,
    $Res Function(FacingsCountItem) then,
  ) = _$FacingsCountItemCopyWithImpl<$Res, FacingsCountItem>;
  @useResult
  $Res call({
    int itemGroupId,
    String itemGroupCode,
    String itemGroupName,
    int quantity,
  });
}

/// @nodoc
class _$FacingsCountItemCopyWithImpl<$Res, $Val extends FacingsCountItem>
    implements $FacingsCountItemCopyWith<$Res> {
  _$FacingsCountItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FacingsCountItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemGroupId = null,
    Object? itemGroupCode = null,
    Object? itemGroupName = null,
    Object? quantity = null,
  }) {
    return _then(
      _value.copyWith(
            itemGroupId: null == itemGroupId
                ? _value.itemGroupId
                : itemGroupId // ignore: cast_nullable_to_non_nullable
                      as int,
            itemGroupCode: null == itemGroupCode
                ? _value.itemGroupCode
                : itemGroupCode // ignore: cast_nullable_to_non_nullable
                      as String,
            itemGroupName: null == itemGroupName
                ? _value.itemGroupName
                : itemGroupName // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FacingsCountItemImplCopyWith<$Res>
    implements $FacingsCountItemCopyWith<$Res> {
  factory _$$FacingsCountItemImplCopyWith(
    _$FacingsCountItemImpl value,
    $Res Function(_$FacingsCountItemImpl) then,
  ) = __$$FacingsCountItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int itemGroupId,
    String itemGroupCode,
    String itemGroupName,
    int quantity,
  });
}

/// @nodoc
class __$$FacingsCountItemImplCopyWithImpl<$Res>
    extends _$FacingsCountItemCopyWithImpl<$Res, _$FacingsCountItemImpl>
    implements _$$FacingsCountItemImplCopyWith<$Res> {
  __$$FacingsCountItemImplCopyWithImpl(
    _$FacingsCountItemImpl _value,
    $Res Function(_$FacingsCountItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FacingsCountItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemGroupId = null,
    Object? itemGroupCode = null,
    Object? itemGroupName = null,
    Object? quantity = null,
  }) {
    return _then(
      _$FacingsCountItemImpl(
        itemGroupId: null == itemGroupId
            ? _value.itemGroupId
            : itemGroupId // ignore: cast_nullable_to_non_nullable
                  as int,
        itemGroupCode: null == itemGroupCode
            ? _value.itemGroupCode
            : itemGroupCode // ignore: cast_nullable_to_non_nullable
                  as String,
        itemGroupName: null == itemGroupName
            ? _value.itemGroupName
            : itemGroupName // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$FacingsCountItemImpl extends _FacingsCountItem {
  const _$FacingsCountItemImpl({
    required this.itemGroupId,
    required this.itemGroupCode,
    required this.itemGroupName,
    required this.quantity,
  }) : super._();

  @override
  final int itemGroupId;
  @override
  final String itemGroupCode;
  @override
  final String itemGroupName;
  @override
  final int quantity;

  @override
  String toString() {
    return 'FacingsCountItem(itemGroupId: $itemGroupId, itemGroupCode: $itemGroupCode, itemGroupName: $itemGroupName, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacingsCountItemImpl &&
            (identical(other.itemGroupId, itemGroupId) ||
                other.itemGroupId == itemGroupId) &&
            (identical(other.itemGroupCode, itemGroupCode) ||
                other.itemGroupCode == itemGroupCode) &&
            (identical(other.itemGroupName, itemGroupName) ||
                other.itemGroupName == itemGroupName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    itemGroupId,
    itemGroupCode,
    itemGroupName,
    quantity,
  );

  /// Create a copy of FacingsCountItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FacingsCountItemImplCopyWith<_$FacingsCountItemImpl> get copyWith =>
      __$$FacingsCountItemImplCopyWithImpl<_$FacingsCountItemImpl>(
        this,
        _$identity,
      );
}

abstract class _FacingsCountItem extends FacingsCountItem {
  const factory _FacingsCountItem({
    required final int itemGroupId,
    required final String itemGroupCode,
    required final String itemGroupName,
    required final int quantity,
  }) = _$FacingsCountItemImpl;
  const _FacingsCountItem._() : super._();

  @override
  int get itemGroupId;
  @override
  String get itemGroupCode;
  @override
  String get itemGroupName;
  @override
  int get quantity;

  /// Create a copy of FacingsCountItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FacingsCountItemImplCopyWith<_$FacingsCountItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
