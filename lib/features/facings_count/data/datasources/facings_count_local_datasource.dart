import 'package:isar_community/isar.dart';

import '../models/facings_count_model.dart';

/// Local data source for Horizontal Facings Count using Isar
class FacingsCountLocalDataSource {
  final Isar _isar;

  const FacingsCountLocalDataSource(this._isar);

  /// Create a new draft
  Future<FacingsCountModel> createDraft(FacingsCountModel draft) async {
    await _isar.writeTxn(() async {
      await _isar.facingsCountModels.put(draft);
    });
    print('[FacingsCountLocalDS] Created draft: ${draft.localId}');
    return draft;
  }

  /// Get count by local ID
  Future<FacingsCountModel?> getByLocalId(String localId) async {
    return await _isar.facingsCountModels
        .filter()
        .localIdEqualTo(localId)
        .findFirst();
  }

  /// Get count by server ID
  Future<FacingsCountModel?> getByServerId(int serverId) async {
    return await _isar.facingsCountModels
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();
  }

  /// Get the in-progress draft for a customer (if any)
  Future<FacingsCountModel?> getActiveDraft(int customerId) async {
    return await _isar.facingsCountModels
        .filter()
        .customerIdEqualTo(customerId)
        .statusEqualTo(FacingsCountModelStatus.inProgress)
        .findFirst();
  }

  /// Get counts finalized (submitted, approved or rejected) today by an
  /// agent for a customer
  Future<List<FacingsCountModel>> getTodaySubmitted({
    required int customerId,
    required int salesAgentId,
  }) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await _isar.facingsCountModels
        .filter()
        .customerIdEqualTo(customerId)
        .salesAgentIdEqualTo(salesAgentId)
        .group(
          (q) => q
              .statusEqualTo(FacingsCountModelStatus.submitted)
              .or()
              .statusEqualTo(FacingsCountModelStatus.approved)
              .or()
              .statusEqualTo(FacingsCountModelStatus.rejected),
        )
        .createdAtBetween(startOfDay, endOfDay, includeUpper: false)
        .sortByCreatedAtDesc()
        .findAll();
  }

  /// Update a count
  Future<FacingsCountModel> updateCount(FacingsCountModel count) async {
    count.updatedAt = DateTime.now();
    await _isar.writeTxn(() async {
      await _isar.facingsCountModels.put(count);
    });
    print('[FacingsCountLocalDS] Updated count: ${count.localId}');
    return count;
  }

  /// Delete a draft count
  Future<void> deleteCount(String localId) async {
    final count = await getByLocalId(localId);
    if (count != null) {
      await _isar.writeTxn(() async {
        await _isar.facingsCountModels.delete(count.id);
      });
      print('[FacingsCountLocalDS] Deleted count: $localId');
    }
  }

  /// Get all pending sync counts
  Future<List<FacingsCountModel>> getPendingSyncCounts() async {
    return await _isar.facingsCountModels
        .filter()
        .syncStateEqualTo(FacingsCountSyncState.pending)
        .findAll();
  }
}
