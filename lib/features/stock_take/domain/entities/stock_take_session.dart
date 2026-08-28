import 'package:freezed_annotation/freezed_annotation.dart';
import 'warehouse.dart';

part 'stock_take_session.freezed.dart';

/// Session status enumeration
enum StockTakeStatus { active, paused, completed, cancelled }

/// Sync state for offline operations
enum SyncState { pending, syncing, synced, failed }

/// Domain entity for stock take session
@freezed
class StockTakeSession with _$StockTakeSession {
  const factory StockTakeSession({
    required String localId,
    int? serverId,
    required String visitLocalId,
    int? visitServerId,
    required int customerId,
    required String outletCode,
    required String outletName,
    required int warehouseId,
    required String warehouseName,
    required WarehouseType warehouseType,
    required int salesAgentId,
    required DateTime startedAt,
    DateTime? pausedAt,
    DateTime? resumedAt,
    DateTime? completedAt,
    required StockTakeStatus status,
    required int totalProducts,
    required int totalSerials,
    String? notes,
    String? sapStockTakeCode,
    required SyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StockTakeSession;

  const StockTakeSession._();

  bool get isActive => status == StockTakeStatus.active;
  bool get isPaused => status == StockTakeStatus.paused;
  bool get isCompleted => status == StockTakeStatus.completed;
  bool get isCancelled => status == StockTakeStatus.cancelled;
  bool get canAddItems => isActive || isPaused;
  bool get canSyncToServer => visitServerId != null;
  bool get isSynced => syncState == SyncState.synced;
  bool get hasSyncError => syncState == SyncState.failed;

  String get statusDisplayName {
    switch (status) {
      case StockTakeStatus.active:
        return 'Active';
      case StockTakeStatus.paused:
        return 'Paused';
      case StockTakeStatus.completed:
        return 'Completed';
      case StockTakeStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get warehouseTypeDisplayName {
    switch (warehouseType) {
      case WarehouseType.display:
        return 'Display Warehouse';
      case WarehouseType.backStore:
        return 'Back Store';
    }
  }

  Duration? get duration {
    final end = completedAt ?? DateTime.now();
    return end.difference(startedAt);
  }
}
