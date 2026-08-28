import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:isar_community/isar.dart';
import 'package:uuid/uuid.dart';

import '../database/models/sync_operation_model.dart';

/// Service for managing sync operations with dependency resolution,
/// exponential backoff, and idempotency guarantees
class SyncService {
  final Isar isar;
  final Uuid _uuid = const Uuid();

  SyncService(this.isar);

  /// Create a new sync operation
  Future<SyncOperationModel> createOperation({
    required SyncOperationType type,
    required String entityType,
    required String entityId,
    required Map<String, dynamic> data,
    required int priority,
    List<String>? dependsOn,
  }) async {
    final clientOperationId = _uuid.v4();
    final payloadHash = _computeHash(data);

    // Check for duplicate operations (same hash)
    final existing = await isar.syncOperationModels
        .filter()
        .payloadHashEqualTo(payloadHash)
        .and()
        .statusEqualTo(SyncStatus.synced)
        .or()
        .statusEqualTo(SyncStatus.syncing)
        .findFirst();

    if (existing != null) {
      // Return existing operation to prevent duplicate
      return existing;
    }

    final operation = SyncOperationModel()
      ..clientOperationId = clientOperationId
      ..payloadHash = payloadHash
      ..type = type
      ..entityType = entityType
      ..entityId = entityId
      ..dataJson = jsonEncode(data)
      ..priority = priority
      ..timestamp = DateTime.now()
      ..retryCount = 0
      ..dependsOnJson = jsonEncode(dependsOn ?? [])
      ..status = SyncStatus.pending
      ..nextRetryAt = null
      ..errorMessage = null
      ..lastAttemptAt = null;

    await isar.writeTxn(() async {
      await isar.syncOperationModels.put(operation);
    });

    return operation;
  }

  /// Get next operation to sync (respects priority and dependencies)
  Future<SyncOperationModel?> getNextOperation() async {
    // Get all pending operations sorted by priority (ascending = higher priority)
    final pendingOps = await isar.syncOperationModels
        .filter()
        .statusEqualTo(SyncStatus.pending)
        .or()
        .statusEqualTo(SyncStatus.failed)
        .sortByPriority()
        .findAll();

    // Find first operation with no blocking dependencies
    for (final op in pendingOps) {
      // Check if it's time to retry (if nextRetryAt is set)
      if (op.nextRetryAt != null && op.nextRetryAt!.isAfter(DateTime.now())) {
        continue; // Not ready to retry yet
      }

      final dependsOn = (jsonDecode(op.dependsOnJson) as List).cast<String>();

      if (dependsOn.isEmpty) {
        return op; // No dependencies, ready to sync
      }

      // Check if all dependencies are synced
      bool allDependenciesMet = true;
      for (final dependencyId in dependsOn) {
        final dependency = await isar.syncOperationModels
            .filter()
            .clientOperationIdEqualTo(dependencyId)
            .findFirst();

        if (dependency == null || dependency.status != SyncStatus.synced) {
          allDependenciesMet = false;
          break;
        }
      }

      if (allDependenciesMet) {
        return op;
      } else {
        // Mark as blocked
        await isar.writeTxn(() async {
          op.status = SyncStatus.blocked;
          await isar.syncOperationModels.put(op);
        });
      }
    }

    return null; // No operations ready to sync
  }

  /// Mark operation as syncing
  Future<void> markSyncing(SyncOperationModel operation) async {
    await isar.writeTxn(() async {
      operation.status = SyncStatus.syncing;
      operation.lastAttemptAt = DateTime.now();
      await isar.syncOperationModels.put(operation);
    });
  }

  /// Mark operation as successfully synced
  Future<void> markSynced(SyncOperationModel operation) async {
    await isar.writeTxn(() async {
      operation.status = SyncStatus.synced;
      await isar.syncOperationModels.put(operation);
    });
  }

  /// Mark operation as failed with exponential backoff
  Future<void> markFailed(
    SyncOperationModel operation,
    String errorMessage,
  ) async {
    await isar.writeTxn(() async {
      operation.status = SyncStatus.failed;
      operation.errorMessage = errorMessage;
      operation.retryCount++;

      // Exponential backoff: 1m, 2m, 5m, 15m, 30m, 1h, 2h, 4h, 8h, 12h, 24h
      final backoffMinutes = _calculateBackoff(operation.retryCount);
      operation.nextRetryAt = DateTime.now().add(
        Duration(minutes: backoffMinutes),
      );

      // Flag as "needs attention" after 5 failures (but keep retrying)
      if (operation.retryCount >= 5) {
        operation.status = SyncStatus.needsAttention;
      }

      await isar.syncOperationModels.put(operation);
    });
  }

  /// Get all operations needing attention
  Future<List<SyncOperationModel>> getOperationsNeedingAttention() async {
    return await isar.syncOperationModels
        .filter()
        .statusEqualTo(SyncStatus.needsAttention)
        .sortByTimestamp()
        .findAll();
  }

  /// Get all pending sync operations
  Future<List<SyncOperationModel>> getPendingOperations() async {
    return await isar.syncOperationModels
        .filter()
        .not()
        .statusEqualTo(SyncStatus.synced)
        .sortByPriority()
        .findAll();
  }

  /// Retry a specific operation (reset backoff)
  Future<void> retryOperation(SyncOperationModel operation) async {
    await isar.writeTxn(() async {
      operation.status = SyncStatus.pending;
      operation.nextRetryAt = null;
      operation.errorMessage = null;
      await isar.syncOperationModels.put(operation);
    });
  }

  /// Retry all operations needing attention
  Future<void> retryAll() async {
    final operations = await getOperationsNeedingAttention();
    for (final op in operations) {
      await retryOperation(op);
    }
  }

  /// Clear all synced operations (cleanup)
  Future<void> clearSyncedOperations() async {
    await isar.writeTxn(() async {
      await isar.syncOperationModels
          .filter()
          .statusEqualTo(SyncStatus.synced)
          .deleteAll();
    });
  }

  /// Compute SHA256 hash of payload for duplicate detection
  String _computeHash(Map<String, dynamic> data) {
    final canonical = jsonEncode(data);
    final bytes = utf8.encode(canonical);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  /// Calculate exponential backoff in minutes
  int _calculateBackoff(int retryCount) {
    const backoffSchedule = [
      1, // 1 minute
      2, // 2 minutes
      5, // 5 minutes
      15, // 15 minutes
      30, // 30 minutes
      60, // 1 hour
      120, // 2 hours
      240, // 4 hours
      480, // 8 hours
      720, // 12 hours
      1440, // 24 hours
    ];

    if (retryCount <= 0) return 1;
    if (retryCount > backoffSchedule.length) {
      return backoffSchedule.last; // Max 24 hours
    }

    return backoffSchedule[retryCount - 1];
  }
}
