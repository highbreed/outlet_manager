// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelf_share_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShelfShareSession {
  /// Local UUID for offline-first
  String get localId => throw _privateConstructorUsedError;

  /// Server ID (null until synced)
  int? get serverId => throw _privateConstructorUsedError;

  /// Visit context
  String get visitLocalId => throw _privateConstructorUsedError;
  int? get visitServerId => throw _privateConstructorUsedError;

  /// Customer/outlet info
  int get customerId => throw _privateConstructorUsedError;
  String get customerCode => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;

  /// Agent info
  int get salesAgentId => throw _privateConstructorUsedError;

  /// Session status
  ShelfShareStatus get status => throw _privateConstructorUsedError;

  /// Item groups with brand entries
  List<ShelfShareItemGroup> get itemGroups =>
      throw _privateConstructorUsedError;

  /// Notes
  String? get notes => throw _privateConstructorUsedError;

  /// Timestamps
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get submittedAt => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;

  /// Sync state
  SyncState get syncState => throw _privateConstructorUsedError;
  String? get syncError => throw _privateConstructorUsedError;
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;

  /// Create a copy of ShelfShareSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelfShareSessionCopyWith<ShelfShareSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelfShareSessionCopyWith<$Res> {
  factory $ShelfShareSessionCopyWith(
    ShelfShareSession value,
    $Res Function(ShelfShareSession) then,
  ) = _$ShelfShareSessionCopyWithImpl<$Res, ShelfShareSession>;
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
    ShelfShareStatus status,
    List<ShelfShareItemGroup> itemGroups,
    String? notes,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? submittedAt,
    DateTime? approvedAt,
    SyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
  });
}

/// @nodoc
class _$ShelfShareSessionCopyWithImpl<$Res, $Val extends ShelfShareSession>
    implements $ShelfShareSessionCopyWith<$Res> {
  _$ShelfShareSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShelfShareSession
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
    Object? itemGroups = null,
    Object? notes = freezed,
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
                      as ShelfShareStatus,
            itemGroups: null == itemGroups
                ? _value.itemGroups
                : itemGroups // ignore: cast_nullable_to_non_nullable
                      as List<ShelfShareItemGroup>,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
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
                      as SyncState,
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
abstract class _$$ShelfShareSessionImplCopyWith<$Res>
    implements $ShelfShareSessionCopyWith<$Res> {
  factory _$$ShelfShareSessionImplCopyWith(
    _$ShelfShareSessionImpl value,
    $Res Function(_$ShelfShareSessionImpl) then,
  ) = __$$ShelfShareSessionImplCopyWithImpl<$Res>;
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
    ShelfShareStatus status,
    List<ShelfShareItemGroup> itemGroups,
    String? notes,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? submittedAt,
    DateTime? approvedAt,
    SyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
  });
}

/// @nodoc
class __$$ShelfShareSessionImplCopyWithImpl<$Res>
    extends _$ShelfShareSessionCopyWithImpl<$Res, _$ShelfShareSessionImpl>
    implements _$$ShelfShareSessionImplCopyWith<$Res> {
  __$$ShelfShareSessionImplCopyWithImpl(
    _$ShelfShareSessionImpl _value,
    $Res Function(_$ShelfShareSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShelfShareSession
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
    Object? itemGroups = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? submittedAt = freezed,
    Object? approvedAt = freezed,
    Object? syncState = null,
    Object? syncError = freezed,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(
      _$ShelfShareSessionImpl(
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
                  as ShelfShareStatus,
        itemGroups: null == itemGroups
            ? _value._itemGroups
            : itemGroups // ignore: cast_nullable_to_non_nullable
                  as List<ShelfShareItemGroup>,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
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
                  as SyncState,
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

class _$ShelfShareSessionImpl extends _ShelfShareSession {
  const _$ShelfShareSessionImpl({
    required this.localId,
    this.serverId,
    required this.visitLocalId,
    this.visitServerId,
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    required this.salesAgentId,
    required this.status,
    required final List<ShelfShareItemGroup> itemGroups,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.submittedAt,
    this.approvedAt,
    required this.syncState,
    this.syncError,
    this.lastSyncedAt,
  }) : _itemGroups = itemGroups,
       super._();

  /// Local UUID for offline-first
  @override
  final String localId;

  /// Server ID (null until synced)
  @override
  final int? serverId;

  /// Visit context
  @override
  final String visitLocalId;
  @override
  final int? visitServerId;

  /// Customer/outlet info
  @override
  final int customerId;
  @override
  final String customerCode;
  @override
  final String customerName;

  /// Agent info
  @override
  final int salesAgentId;

  /// Session status
  @override
  final ShelfShareStatus status;

  /// Item groups with brand entries
  final List<ShelfShareItemGroup> _itemGroups;

  /// Item groups with brand entries
  @override
  List<ShelfShareItemGroup> get itemGroups {
    if (_itemGroups is EqualUnmodifiableListView) return _itemGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemGroups);
  }

  /// Notes
  @override
  final String? notes;

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
  final SyncState syncState;
  @override
  final String? syncError;
  @override
  final DateTime? lastSyncedAt;

  @override
  String toString() {
    return 'ShelfShareSession(localId: $localId, serverId: $serverId, visitLocalId: $visitLocalId, visitServerId: $visitServerId, customerId: $customerId, customerCode: $customerCode, customerName: $customerName, salesAgentId: $salesAgentId, status: $status, itemGroups: $itemGroups, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, submittedAt: $submittedAt, approvedAt: $approvedAt, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelfShareSessionImpl &&
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
            const DeepCollectionEquality().equals(
              other._itemGroups,
              _itemGroups,
            ) &&
            (identical(other.notes, notes) || other.notes == notes) &&
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
    const DeepCollectionEquality().hash(_itemGroups),
    notes,
    createdAt,
    updatedAt,
    submittedAt,
    approvedAt,
    syncState,
    syncError,
    lastSyncedAt,
  );

  /// Create a copy of ShelfShareSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelfShareSessionImplCopyWith<_$ShelfShareSessionImpl> get copyWith =>
      __$$ShelfShareSessionImplCopyWithImpl<_$ShelfShareSessionImpl>(
        this,
        _$identity,
      );
}

abstract class _ShelfShareSession extends ShelfShareSession {
  const factory _ShelfShareSession({
    required final String localId,
    final int? serverId,
    required final String visitLocalId,
    final int? visitServerId,
    required final int customerId,
    required final String customerCode,
    required final String customerName,
    required final int salesAgentId,
    required final ShelfShareStatus status,
    required final List<ShelfShareItemGroup> itemGroups,
    final String? notes,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? submittedAt,
    final DateTime? approvedAt,
    required final SyncState syncState,
    final String? syncError,
    final DateTime? lastSyncedAt,
  }) = _$ShelfShareSessionImpl;
  const _ShelfShareSession._() : super._();

  /// Local UUID for offline-first
  @override
  String get localId;

  /// Server ID (null until synced)
  @override
  int? get serverId;

  /// Visit context
  @override
  String get visitLocalId;
  @override
  int? get visitServerId;

  /// Customer/outlet info
  @override
  int get customerId;
  @override
  String get customerCode;
  @override
  String get customerName;

  /// Agent info
  @override
  int get salesAgentId;

  /// Session status
  @override
  ShelfShareStatus get status;

  /// Item groups with brand entries
  @override
  List<ShelfShareItemGroup> get itemGroups;

  /// Notes
  @override
  String? get notes;

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
  SyncState get syncState;
  @override
  String? get syncError;
  @override
  DateTime? get lastSyncedAt;

  /// Create a copy of ShelfShareSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelfShareSessionImplCopyWith<_$ShelfShareSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShelfShareItemGroup {
  /// The item group ID (references ItemGroup entity)
  int get itemGroupId => throw _privateConstructorUsedError;

  /// The item group name (denormalized for display)
  String get itemGroupName => throw _privateConstructorUsedError;

  /// Brand entries for this item group
  List<ShelfShareBrandEntry> get brandEntries =>
      throw _privateConstructorUsedError;

  /// Create a copy of ShelfShareItemGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelfShareItemGroupCopyWith<ShelfShareItemGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelfShareItemGroupCopyWith<$Res> {
  factory $ShelfShareItemGroupCopyWith(
    ShelfShareItemGroup value,
    $Res Function(ShelfShareItemGroup) then,
  ) = _$ShelfShareItemGroupCopyWithImpl<$Res, ShelfShareItemGroup>;
  @useResult
  $Res call({
    int itemGroupId,
    String itemGroupName,
    List<ShelfShareBrandEntry> brandEntries,
  });
}

/// @nodoc
class _$ShelfShareItemGroupCopyWithImpl<$Res, $Val extends ShelfShareItemGroup>
    implements $ShelfShareItemGroupCopyWith<$Res> {
  _$ShelfShareItemGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShelfShareItemGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemGroupId = null,
    Object? itemGroupName = null,
    Object? brandEntries = null,
  }) {
    return _then(
      _value.copyWith(
            itemGroupId: null == itemGroupId
                ? _value.itemGroupId
                : itemGroupId // ignore: cast_nullable_to_non_nullable
                      as int,
            itemGroupName: null == itemGroupName
                ? _value.itemGroupName
                : itemGroupName // ignore: cast_nullable_to_non_nullable
                      as String,
            brandEntries: null == brandEntries
                ? _value.brandEntries
                : brandEntries // ignore: cast_nullable_to_non_nullable
                      as List<ShelfShareBrandEntry>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShelfShareItemGroupImplCopyWith<$Res>
    implements $ShelfShareItemGroupCopyWith<$Res> {
  factory _$$ShelfShareItemGroupImplCopyWith(
    _$ShelfShareItemGroupImpl value,
    $Res Function(_$ShelfShareItemGroupImpl) then,
  ) = __$$ShelfShareItemGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int itemGroupId,
    String itemGroupName,
    List<ShelfShareBrandEntry> brandEntries,
  });
}

/// @nodoc
class __$$ShelfShareItemGroupImplCopyWithImpl<$Res>
    extends _$ShelfShareItemGroupCopyWithImpl<$Res, _$ShelfShareItemGroupImpl>
    implements _$$ShelfShareItemGroupImplCopyWith<$Res> {
  __$$ShelfShareItemGroupImplCopyWithImpl(
    _$ShelfShareItemGroupImpl _value,
    $Res Function(_$ShelfShareItemGroupImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShelfShareItemGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemGroupId = null,
    Object? itemGroupName = null,
    Object? brandEntries = null,
  }) {
    return _then(
      _$ShelfShareItemGroupImpl(
        itemGroupId: null == itemGroupId
            ? _value.itemGroupId
            : itemGroupId // ignore: cast_nullable_to_non_nullable
                  as int,
        itemGroupName: null == itemGroupName
            ? _value.itemGroupName
            : itemGroupName // ignore: cast_nullable_to_non_nullable
                  as String,
        brandEntries: null == brandEntries
            ? _value._brandEntries
            : brandEntries // ignore: cast_nullable_to_non_nullable
                  as List<ShelfShareBrandEntry>,
      ),
    );
  }
}

/// @nodoc

class _$ShelfShareItemGroupImpl extends _ShelfShareItemGroup {
  const _$ShelfShareItemGroupImpl({
    required this.itemGroupId,
    required this.itemGroupName,
    required final List<ShelfShareBrandEntry> brandEntries,
  }) : _brandEntries = brandEntries,
       super._();

  /// The item group ID (references ItemGroup entity)
  @override
  final int itemGroupId;

  /// The item group name (denormalized for display)
  @override
  final String itemGroupName;

  /// Brand entries for this item group
  final List<ShelfShareBrandEntry> _brandEntries;

  /// Brand entries for this item group
  @override
  List<ShelfShareBrandEntry> get brandEntries {
    if (_brandEntries is EqualUnmodifiableListView) return _brandEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brandEntries);
  }

  @override
  String toString() {
    return 'ShelfShareItemGroup(itemGroupId: $itemGroupId, itemGroupName: $itemGroupName, brandEntries: $brandEntries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelfShareItemGroupImpl &&
            (identical(other.itemGroupId, itemGroupId) ||
                other.itemGroupId == itemGroupId) &&
            (identical(other.itemGroupName, itemGroupName) ||
                other.itemGroupName == itemGroupName) &&
            const DeepCollectionEquality().equals(
              other._brandEntries,
              _brandEntries,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    itemGroupId,
    itemGroupName,
    const DeepCollectionEquality().hash(_brandEntries),
  );

  /// Create a copy of ShelfShareItemGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelfShareItemGroupImplCopyWith<_$ShelfShareItemGroupImpl> get copyWith =>
      __$$ShelfShareItemGroupImplCopyWithImpl<_$ShelfShareItemGroupImpl>(
        this,
        _$identity,
      );
}

abstract class _ShelfShareItemGroup extends ShelfShareItemGroup {
  const factory _ShelfShareItemGroup({
    required final int itemGroupId,
    required final String itemGroupName,
    required final List<ShelfShareBrandEntry> brandEntries,
  }) = _$ShelfShareItemGroupImpl;
  const _ShelfShareItemGroup._() : super._();

  /// The item group ID (references ItemGroup entity)
  @override
  int get itemGroupId;

  /// The item group name (denormalized for display)
  @override
  String get itemGroupName;

  /// Brand entries for this item group
  @override
  List<ShelfShareBrandEntry> get brandEntries;

  /// Create a copy of ShelfShareItemGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelfShareItemGroupImplCopyWith<_$ShelfShareItemGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShelfShareBrandEntry {
  /// Brand reference
  int get brandId => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;

  /// Number of facings on shelf
  int get facings => throw _privateConstructorUsedError;

  /// Optional notes
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of ShelfShareBrandEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShelfShareBrandEntryCopyWith<ShelfShareBrandEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelfShareBrandEntryCopyWith<$Res> {
  factory $ShelfShareBrandEntryCopyWith(
    ShelfShareBrandEntry value,
    $Res Function(ShelfShareBrandEntry) then,
  ) = _$ShelfShareBrandEntryCopyWithImpl<$Res, ShelfShareBrandEntry>;
  @useResult
  $Res call({int brandId, String brandName, int facings, String? notes});
}

/// @nodoc
class _$ShelfShareBrandEntryCopyWithImpl<
  $Res,
  $Val extends ShelfShareBrandEntry
>
    implements $ShelfShareBrandEntryCopyWith<$Res> {
  _$ShelfShareBrandEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShelfShareBrandEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = null,
    Object? brandName = null,
    Object? facings = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            brandId: null == brandId
                ? _value.brandId
                : brandId // ignore: cast_nullable_to_non_nullable
                      as int,
            brandName: null == brandName
                ? _value.brandName
                : brandName // ignore: cast_nullable_to_non_nullable
                      as String,
            facings: null == facings
                ? _value.facings
                : facings // ignore: cast_nullable_to_non_nullable
                      as int,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShelfShareBrandEntryImplCopyWith<$Res>
    implements $ShelfShareBrandEntryCopyWith<$Res> {
  factory _$$ShelfShareBrandEntryImplCopyWith(
    _$ShelfShareBrandEntryImpl value,
    $Res Function(_$ShelfShareBrandEntryImpl) then,
  ) = __$$ShelfShareBrandEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int brandId, String brandName, int facings, String? notes});
}

/// @nodoc
class __$$ShelfShareBrandEntryImplCopyWithImpl<$Res>
    extends _$ShelfShareBrandEntryCopyWithImpl<$Res, _$ShelfShareBrandEntryImpl>
    implements _$$ShelfShareBrandEntryImplCopyWith<$Res> {
  __$$ShelfShareBrandEntryImplCopyWithImpl(
    _$ShelfShareBrandEntryImpl _value,
    $Res Function(_$ShelfShareBrandEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShelfShareBrandEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandId = null,
    Object? brandName = null,
    Object? facings = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$ShelfShareBrandEntryImpl(
        brandId: null == brandId
            ? _value.brandId
            : brandId // ignore: cast_nullable_to_non_nullable
                  as int,
        brandName: null == brandName
            ? _value.brandName
            : brandName // ignore: cast_nullable_to_non_nullable
                  as String,
        facings: null == facings
            ? _value.facings
            : facings // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ShelfShareBrandEntryImpl extends _ShelfShareBrandEntry {
  const _$ShelfShareBrandEntryImpl({
    required this.brandId,
    required this.brandName,
    required this.facings,
    this.notes,
  }) : super._();

  /// Brand reference
  @override
  final int brandId;
  @override
  final String brandName;

  /// Number of facings on shelf
  @override
  final int facings;

  /// Optional notes
  @override
  final String? notes;

  @override
  String toString() {
    return 'ShelfShareBrandEntry(brandId: $brandId, brandName: $brandName, facings: $facings, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShelfShareBrandEntryImpl &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.facings, facings) || other.facings == facings) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, brandId, brandName, facings, notes);

  /// Create a copy of ShelfShareBrandEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShelfShareBrandEntryImplCopyWith<_$ShelfShareBrandEntryImpl>
  get copyWith =>
      __$$ShelfShareBrandEntryImplCopyWithImpl<_$ShelfShareBrandEntryImpl>(
        this,
        _$identity,
      );
}

abstract class _ShelfShareBrandEntry extends ShelfShareBrandEntry {
  const factory _ShelfShareBrandEntry({
    required final int brandId,
    required final String brandName,
    required final int facings,
    final String? notes,
  }) = _$ShelfShareBrandEntryImpl;
  const _ShelfShareBrandEntry._() : super._();

  /// Brand reference
  @override
  int get brandId;
  @override
  String get brandName;

  /// Number of facings on shelf
  @override
  int get facings;

  /// Optional notes
  @override
  String? get notes;

  /// Create a copy of ShelfShareBrandEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShelfShareBrandEntryImplCopyWith<_$ShelfShareBrandEntryImpl>
  get copyWith => throw _privateConstructorUsedError;
}
