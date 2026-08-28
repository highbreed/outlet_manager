import 'package:isar_community/isar.dart';

part 'sync_operation_model.g.dart';

@collection
class SyncOperationModel {
  Id? id;

  @Index(unique: true)
  late String clientOperationId; // UUID for idempotency

  @Index()
  late String payloadHash; // SHA256 of payload

  @Enumerated(EnumType.name)
  late SyncOperationType type;

  @Index()
  late String entityType;

  late String entityId; // Local ID of entity

  late String dataJson; // Serialized Map<String, dynamic>

  late int priority; // 1 = highest

  @Index()
  late DateTime timestamp;

  late int retryCount;

  DateTime? nextRetryAt;

  late String dependsOnJson; // Serialized List<String> of operation IDs

  @Index()
  @Enumerated(EnumType.name)
  late SyncStatus status;

  String? errorMessage;

  DateTime? lastAttemptAt;
}

enum SyncOperationType {
  createClockSession,
  updateClockSession,
  createOrder,
  updateOrder,
  createComplaint,
  uploadAttachment,
  createStockTake,
  uploadStockTakeSerials,
  completeStockTake,
  syncPrices,
  syncPermissions,
}

enum SyncStatus {
  pending,
  syncing,
  synced,
  failed,
  needsAttention,
  blocked, // Waiting for dependencies
}
