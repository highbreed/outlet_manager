import 'package:isar_community/isar.dart';
import 'warehouse_model.dart';

part 'stock_take_session_model.g.dart';

/// Session status values (aligned with backend)
enum StockTakeStatus {
  active, // Backend: in_progress
  paused,
  completed,
  cancelled,
}

/// Sync state for offline operations
enum SyncState {
  pending, // Not yet synced to server
  syncing, // Currently syncing
  synced, // Successfully synced
  failed, // Sync failed
}

/// Stock take session for counting inventory at a customer outlet
@collection
class StockTakeSessionModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String localId; // UUID

  @Index()
  int? serverId; // Backend session ID

  @Index()
  late String visitLocalId; // FK to OutletVisit
  int? visitServerId;

  @Index()
  late int customerId; // Customer ID

  late String outletCode;
  late String outletName;

  @Index()
  late int warehouseId; // Warehouse being counted

  late String warehouseName;

  @Enumerated(EnumType.name)
  late WarehouseType warehouseType;

  late int salesAgentId; // Agent who created session

  late DateTime startedAt;
  DateTime? pausedAt;
  DateTime? lastPausedAt;
  DateTime? resumedAt;
  DateTime? lastResumedAt;
  DateTime? completedAt;
  DateTime? cancelledAt;
  String? cancelReason;

  @Index()
  @Enumerated(EnumType.name)
  late StockTakeStatus status; // active, paused, completed, cancelled

  late int totalProducts; // Count of unique products
  late int totalSerials; // Count of all serial numbers

  String? notes;
  String? sapStockTakeCode; // SAP stock take reference

  @Index()
  @Enumerated(EnumType.name)
  late SyncState syncState; // pending, syncing, synced, failed

  String? syncError;
  DateTime? lastSyncedAt;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  StockTakeSessionModel();

  /// Create new local session
  factory StockTakeSessionModel.create({
    required String localId,
    required String visitLocalId,
    int? visitServerId,
    required int customerId,
    required String outletCode,
    required String outletName,
    required int warehouseId,
    required String warehouseName,
    required WarehouseType warehouseType,
    required int salesAgentId,
    String? notes,
  }) {
    final now = DateTime.now();
    return StockTakeSessionModel()
      ..localId = localId
      ..visitLocalId = visitLocalId
      ..visitServerId = visitServerId
      ..customerId = customerId
      ..outletCode = outletCode
      ..outletName = outletName
      ..warehouseId = warehouseId
      ..warehouseName = warehouseName
      ..warehouseType = warehouseType
      ..salesAgentId = salesAgentId
      ..startedAt = now
      ..status = StockTakeStatus.active
      ..totalProducts = 0
      ..totalSerials = 0
      ..notes = notes
      ..syncState = SyncState.pending
      ..createdAt = now
      ..updatedAt = now;
  }

  /// Create from API response
  factory StockTakeSessionModel.fromJson(Map<String, dynamic> json) {
    final now = DateTime.now();

    // Handle nested warehouse object
    final warehouse = json['warehouse'] as Map<String, dynamic>?;
    final warehouseName =
        warehouse?['warehouse_name'] as String? ??
        json['warehouse_name'] as String? ??
        '';
    final warehouseTypeStr =
        warehouse?['warehouse_type'] as String? ??
        json['warehouse_type'] as String?;
    final warehouseCode = warehouse?['warehouse_code'] as String? ?? '';

    return StockTakeSessionModel()
      ..serverId = json['id'] as int
      ..localId = json['device_session_id'] as String? ?? 'remote_${json['id']}'
      ..visitLocalId =
          json['visit_local_id'] as String? ??
          'remote_visit_${json['outlet_visit_id'] ?? 0}'
      ..visitServerId = json['outlet_visit_id'] as int?
      ..customerId = json['customer_id'] as int
      ..outletCode = json['outlet_code'] as String? ?? warehouseCode
      ..outletName = json['outlet_name'] as String? ?? ''
      ..warehouseId = json['warehouse_id'] as int
      ..warehouseName = warehouseName
      ..warehouseType = warehouseTypeStr != null
          ? _parseWarehouseType(warehouseTypeStr)
          : WarehouseType.display
      ..salesAgentId = json['sales_agent_id'] as int? ?? 0
      ..startedAt = json['started_at'] != null
          ? DateTime.parse(json['started_at'] as String)
          : now
      ..pausedAt = json['paused_at'] != null
          ? DateTime.parse(json['paused_at'] as String)
          : null
      ..resumedAt = json['resumed_at'] != null
          ? DateTime.parse(json['resumed_at'] as String)
          : null
      ..completedAt = json['ended_at'] != null
          ? DateTime.parse(json['ended_at'] as String)
          : null
      ..status = _parseStatus(json['status'] as String? ?? 'in_progress')
      ..totalProducts = json['total_products_counted'] as int? ?? 0
      ..totalSerials = json['total_serials_scanned'] as int? ?? 0
      ..notes = json['notes'] as String?
      ..sapStockTakeCode = json['sap_stock_take_code'] as String?
      ..syncState = SyncState.synced
      ..lastSyncedAt = now
      ..createdAt = json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : now
      ..updatedAt = json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : now;
  }

  /// Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      if (serverId != null) 'id': serverId,
      'local_id': localId,
      'customer_id': customerId,
      'outlet_visit_id': visitServerId,
      'warehouse_id': warehouseId,
      'notes': notes,
    };
  }

  /// Parse backend status to mobile enum
  static StockTakeStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'in_progress':
        return StockTakeStatus.active;
      case 'paused':
        return StockTakeStatus.paused;
      case 'completed':
        return StockTakeStatus.completed;
      case 'cancelled':
        return StockTakeStatus.cancelled;
      default:
        return StockTakeStatus.active;
    }
  }

  /// Parse warehouse type from backend string
  static WarehouseType _parseWarehouseType(String type) {
    switch (type.toLowerCase()) {
      case 'display':
        return WarehouseType.display;
      case 'back_store':
      case 'backstore':
        return WarehouseType.backStore;
      default:
        return WarehouseType.display;
    }
  }

  /// Convert mobile status to backend string
  String get statusString {
    switch (status) {
      case StockTakeStatus.active:
        return 'in_progress';
      case StockTakeStatus.paused:
        return 'paused';
      case StockTakeStatus.completed:
        return 'completed';
      case StockTakeStatus.cancelled:
        return 'cancelled';
    }
  }

  bool get isActive => status == StockTakeStatus.active;
  bool get isPaused => status == StockTakeStatus.paused;
  bool get isCompleted => status == StockTakeStatus.completed;
  bool get isCancelled => status == StockTakeStatus.cancelled;
  bool get canAddItems => isActive || isPaused;
  bool get canSyncToServer => visitServerId != null;
}
