// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_take_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StockTakeSession {
  String get localId => throw _privateConstructorUsedError;
  int? get serverId => throw _privateConstructorUsedError;
  String get visitLocalId => throw _privateConstructorUsedError;
  int? get visitServerId => throw _privateConstructorUsedError;
  int get customerId => throw _privateConstructorUsedError;
  String get outletCode => throw _privateConstructorUsedError;
  String get outletName => throw _privateConstructorUsedError;
  int get warehouseId => throw _privateConstructorUsedError;
  String get warehouseName => throw _privateConstructorUsedError;
  WarehouseType get warehouseType => throw _privateConstructorUsedError;
  int get salesAgentId => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get pausedAt => throw _privateConstructorUsedError;
  DateTime? get resumedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  StockTakeStatus get status => throw _privateConstructorUsedError;
  int get totalProducts => throw _privateConstructorUsedError;
  int get totalSerials => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get sapStockTakeCode => throw _privateConstructorUsedError;
  SyncState get syncState => throw _privateConstructorUsedError;
  String? get syncError => throw _privateConstructorUsedError;
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of StockTakeSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockTakeSessionCopyWith<StockTakeSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockTakeSessionCopyWith<$Res> {
  factory $StockTakeSessionCopyWith(
    StockTakeSession value,
    $Res Function(StockTakeSession) then,
  ) = _$StockTakeSessionCopyWithImpl<$Res, StockTakeSession>;
  @useResult
  $Res call({
    String localId,
    int? serverId,
    String visitLocalId,
    int? visitServerId,
    int customerId,
    String outletCode,
    String outletName,
    int warehouseId,
    String warehouseName,
    WarehouseType warehouseType,
    int salesAgentId,
    DateTime startedAt,
    DateTime? pausedAt,
    DateTime? resumedAt,
    DateTime? completedAt,
    StockTakeStatus status,
    int totalProducts,
    int totalSerials,
    String? notes,
    String? sapStockTakeCode,
    SyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$StockTakeSessionCopyWithImpl<$Res, $Val extends StockTakeSession>
    implements $StockTakeSessionCopyWith<$Res> {
  _$StockTakeSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockTakeSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? visitLocalId = null,
    Object? visitServerId = freezed,
    Object? customerId = null,
    Object? outletCode = null,
    Object? outletName = null,
    Object? warehouseId = null,
    Object? warehouseName = null,
    Object? warehouseType = null,
    Object? salesAgentId = null,
    Object? startedAt = null,
    Object? pausedAt = freezed,
    Object? resumedAt = freezed,
    Object? completedAt = freezed,
    Object? status = null,
    Object? totalProducts = null,
    Object? totalSerials = null,
    Object? notes = freezed,
    Object? sapStockTakeCode = freezed,
    Object? syncState = null,
    Object? syncError = freezed,
    Object? lastSyncedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
            outletCode: null == outletCode
                ? _value.outletCode
                : outletCode // ignore: cast_nullable_to_non_nullable
                      as String,
            outletName: null == outletName
                ? _value.outletName
                : outletName // ignore: cast_nullable_to_non_nullable
                      as String,
            warehouseId: null == warehouseId
                ? _value.warehouseId
                : warehouseId // ignore: cast_nullable_to_non_nullable
                      as int,
            warehouseName: null == warehouseName
                ? _value.warehouseName
                : warehouseName // ignore: cast_nullable_to_non_nullable
                      as String,
            warehouseType: null == warehouseType
                ? _value.warehouseType
                : warehouseType // ignore: cast_nullable_to_non_nullable
                      as WarehouseType,
            salesAgentId: null == salesAgentId
                ? _value.salesAgentId
                : salesAgentId // ignore: cast_nullable_to_non_nullable
                      as int,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            pausedAt: freezed == pausedAt
                ? _value.pausedAt
                : pausedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            resumedAt: freezed == resumedAt
                ? _value.resumedAt
                : resumedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as StockTakeStatus,
            totalProducts: null == totalProducts
                ? _value.totalProducts
                : totalProducts // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSerials: null == totalSerials
                ? _value.totalSerials
                : totalSerials // ignore: cast_nullable_to_non_nullable
                      as int,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            sapStockTakeCode: freezed == sapStockTakeCode
                ? _value.sapStockTakeCode
                : sapStockTakeCode // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StockTakeSessionImplCopyWith<$Res>
    implements $StockTakeSessionCopyWith<$Res> {
  factory _$$StockTakeSessionImplCopyWith(
    _$StockTakeSessionImpl value,
    $Res Function(_$StockTakeSessionImpl) then,
  ) = __$$StockTakeSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String localId,
    int? serverId,
    String visitLocalId,
    int? visitServerId,
    int customerId,
    String outletCode,
    String outletName,
    int warehouseId,
    String warehouseName,
    WarehouseType warehouseType,
    int salesAgentId,
    DateTime startedAt,
    DateTime? pausedAt,
    DateTime? resumedAt,
    DateTime? completedAt,
    StockTakeStatus status,
    int totalProducts,
    int totalSerials,
    String? notes,
    String? sapStockTakeCode,
    SyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$StockTakeSessionImplCopyWithImpl<$Res>
    extends _$StockTakeSessionCopyWithImpl<$Res, _$StockTakeSessionImpl>
    implements _$$StockTakeSessionImplCopyWith<$Res> {
  __$$StockTakeSessionImplCopyWithImpl(
    _$StockTakeSessionImpl _value,
    $Res Function(_$StockTakeSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockTakeSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? visitLocalId = null,
    Object? visitServerId = freezed,
    Object? customerId = null,
    Object? outletCode = null,
    Object? outletName = null,
    Object? warehouseId = null,
    Object? warehouseName = null,
    Object? warehouseType = null,
    Object? salesAgentId = null,
    Object? startedAt = null,
    Object? pausedAt = freezed,
    Object? resumedAt = freezed,
    Object? completedAt = freezed,
    Object? status = null,
    Object? totalProducts = null,
    Object? totalSerials = null,
    Object? notes = freezed,
    Object? sapStockTakeCode = freezed,
    Object? syncState = null,
    Object? syncError = freezed,
    Object? lastSyncedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$StockTakeSessionImpl(
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
        outletCode: null == outletCode
            ? _value.outletCode
            : outletCode // ignore: cast_nullable_to_non_nullable
                  as String,
        outletName: null == outletName
            ? _value.outletName
            : outletName // ignore: cast_nullable_to_non_nullable
                  as String,
        warehouseId: null == warehouseId
            ? _value.warehouseId
            : warehouseId // ignore: cast_nullable_to_non_nullable
                  as int,
        warehouseName: null == warehouseName
            ? _value.warehouseName
            : warehouseName // ignore: cast_nullable_to_non_nullable
                  as String,
        warehouseType: null == warehouseType
            ? _value.warehouseType
            : warehouseType // ignore: cast_nullable_to_non_nullable
                  as WarehouseType,
        salesAgentId: null == salesAgentId
            ? _value.salesAgentId
            : salesAgentId // ignore: cast_nullable_to_non_nullable
                  as int,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        pausedAt: freezed == pausedAt
            ? _value.pausedAt
            : pausedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        resumedAt: freezed == resumedAt
            ? _value.resumedAt
            : resumedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as StockTakeStatus,
        totalProducts: null == totalProducts
            ? _value.totalProducts
            : totalProducts // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSerials: null == totalSerials
            ? _value.totalSerials
            : totalSerials // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        sapStockTakeCode: freezed == sapStockTakeCode
            ? _value.sapStockTakeCode
            : sapStockTakeCode // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$StockTakeSessionImpl extends _StockTakeSession {
  const _$StockTakeSessionImpl({
    required this.localId,
    this.serverId,
    required this.visitLocalId,
    this.visitServerId,
    required this.customerId,
    required this.outletCode,
    required this.outletName,
    required this.warehouseId,
    required this.warehouseName,
    required this.warehouseType,
    required this.salesAgentId,
    required this.startedAt,
    this.pausedAt,
    this.resumedAt,
    this.completedAt,
    required this.status,
    required this.totalProducts,
    required this.totalSerials,
    this.notes,
    this.sapStockTakeCode,
    required this.syncState,
    this.syncError,
    this.lastSyncedAt,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  @override
  final String localId;
  @override
  final int? serverId;
  @override
  final String visitLocalId;
  @override
  final int? visitServerId;
  @override
  final int customerId;
  @override
  final String outletCode;
  @override
  final String outletName;
  @override
  final int warehouseId;
  @override
  final String warehouseName;
  @override
  final WarehouseType warehouseType;
  @override
  final int salesAgentId;
  @override
  final DateTime startedAt;
  @override
  final DateTime? pausedAt;
  @override
  final DateTime? resumedAt;
  @override
  final DateTime? completedAt;
  @override
  final StockTakeStatus status;
  @override
  final int totalProducts;
  @override
  final int totalSerials;
  @override
  final String? notes;
  @override
  final String? sapStockTakeCode;
  @override
  final SyncState syncState;
  @override
  final String? syncError;
  @override
  final DateTime? lastSyncedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'StockTakeSession(localId: $localId, serverId: $serverId, visitLocalId: $visitLocalId, visitServerId: $visitServerId, customerId: $customerId, outletCode: $outletCode, outletName: $outletName, warehouseId: $warehouseId, warehouseName: $warehouseName, warehouseType: $warehouseType, salesAgentId: $salesAgentId, startedAt: $startedAt, pausedAt: $pausedAt, resumedAt: $resumedAt, completedAt: $completedAt, status: $status, totalProducts: $totalProducts, totalSerials: $totalSerials, notes: $notes, sapStockTakeCode: $sapStockTakeCode, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockTakeSessionImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.visitLocalId, visitLocalId) ||
                other.visitLocalId == visitLocalId) &&
            (identical(other.visitServerId, visitServerId) ||
                other.visitServerId == visitServerId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.outletCode, outletCode) ||
                other.outletCode == outletCode) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.warehouseType, warehouseType) ||
                other.warehouseType == warehouseType) &&
            (identical(other.salesAgentId, salesAgentId) ||
                other.salesAgentId == salesAgentId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.pausedAt, pausedAt) ||
                other.pausedAt == pausedAt) &&
            (identical(other.resumedAt, resumedAt) ||
                other.resumedAt == resumedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts) &&
            (identical(other.totalSerials, totalSerials) ||
                other.totalSerials == totalSerials) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.sapStockTakeCode, sapStockTakeCode) ||
                other.sapStockTakeCode == sapStockTakeCode) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState) &&
            (identical(other.syncError, syncError) ||
                other.syncError == syncError) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    localId,
    serverId,
    visitLocalId,
    visitServerId,
    customerId,
    outletCode,
    outletName,
    warehouseId,
    warehouseName,
    warehouseType,
    salesAgentId,
    startedAt,
    pausedAt,
    resumedAt,
    completedAt,
    status,
    totalProducts,
    totalSerials,
    notes,
    sapStockTakeCode,
    syncState,
    syncError,
    lastSyncedAt,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of StockTakeSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockTakeSessionImplCopyWith<_$StockTakeSessionImpl> get copyWith =>
      __$$StockTakeSessionImplCopyWithImpl<_$StockTakeSessionImpl>(
        this,
        _$identity,
      );
}

abstract class _StockTakeSession extends StockTakeSession {
  const factory _StockTakeSession({
    required final String localId,
    final int? serverId,
    required final String visitLocalId,
    final int? visitServerId,
    required final int customerId,
    required final String outletCode,
    required final String outletName,
    required final int warehouseId,
    required final String warehouseName,
    required final WarehouseType warehouseType,
    required final int salesAgentId,
    required final DateTime startedAt,
    final DateTime? pausedAt,
    final DateTime? resumedAt,
    final DateTime? completedAt,
    required final StockTakeStatus status,
    required final int totalProducts,
    required final int totalSerials,
    final String? notes,
    final String? sapStockTakeCode,
    required final SyncState syncState,
    final String? syncError,
    final DateTime? lastSyncedAt,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$StockTakeSessionImpl;
  const _StockTakeSession._() : super._();

  @override
  String get localId;
  @override
  int? get serverId;
  @override
  String get visitLocalId;
  @override
  int? get visitServerId;
  @override
  int get customerId;
  @override
  String get outletCode;
  @override
  String get outletName;
  @override
  int get warehouseId;
  @override
  String get warehouseName;
  @override
  WarehouseType get warehouseType;
  @override
  int get salesAgentId;
  @override
  DateTime get startedAt;
  @override
  DateTime? get pausedAt;
  @override
  DateTime? get resumedAt;
  @override
  DateTime? get completedAt;
  @override
  StockTakeStatus get status;
  @override
  int get totalProducts;
  @override
  int get totalSerials;
  @override
  String? get notes;
  @override
  String? get sapStockTakeCode;
  @override
  SyncState get syncState;
  @override
  String? get syncError;
  @override
  DateTime? get lastSyncedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of StockTakeSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockTakeSessionImplCopyWith<_$StockTakeSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
