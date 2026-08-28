import 'package:isar_community/isar.dart';

import '../models/shelf_share_session_model.dart';

/// Local data source for Shelf Share using Isar
class ShelfShareLocalDataSource {
  final Isar _isar;

  const ShelfShareLocalDataSource(this._isar);

  // ============================================================================
  // Session CRUD
  // ============================================================================

  /// Create a new session
  Future<ShelfShareSessionModel> createSession(
    ShelfShareSessionModel session,
  ) async {
    await _isar.writeTxn(() async {
      await _isar.shelfShareSessionModels.put(session);
    });
    print('[ShelfShareLocalDS] Created session: ${session.localId}');
    return session;
  }

  /// Get session by local ID
  Future<ShelfShareSessionModel?> getSessionByLocalId(String localId) async {
    return await _isar.shelfShareSessionModels
        .filter()
        .localIdEqualTo(localId)
        .findFirst();
  }

  /// Get session by server ID
  Future<ShelfShareSessionModel?> getSessionByServerId(int serverId) async {
    return await _isar.shelfShareSessionModels
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();
  }

  /// Get active (in-progress) session for a customer
  Future<ShelfShareSessionModel?> getActiveSession(int customerId) async {
    return await _isar.shelfShareSessionModels
        .filter()
        .customerIdEqualTo(customerId)
        .statusEqualTo(ShelfShareModelStatus.inProgress)
        .findFirst();
  }

  /// Get all sessions for a customer
  Future<List<ShelfShareSessionModel>> getCustomerSessions(
    int customerId,
  ) async {
    return await _isar.shelfShareSessionModels
        .filter()
        .customerIdEqualTo(customerId)
        .sortByCreatedAtDesc()
        .findAll();
  }

  /// Get sessions by visit local ID
  Future<ShelfShareSessionModel?> getSessionByVisitLocalId(
    String visitLocalId,
  ) async {
    return await _isar.shelfShareSessionModels
        .filter()
        .visitLocalIdEqualTo(visitLocalId)
        .findFirst();
  }

  /// Get completed sessions for a customer
  Future<List<ShelfShareSessionModel>> getCompletedSessions(
    int customerId,
  ) async {
    return await _isar.shelfShareSessionModels
        .filter()
        .customerIdEqualTo(customerId)
        .group(
          (q) => q
              .statusEqualTo(ShelfShareModelStatus.submitted)
              .or()
              .statusEqualTo(ShelfShareModelStatus.approved)
              .or()
              .statusEqualTo(ShelfShareModelStatus.rejected),
        )
        .sortByCreatedAtDesc()
        .findAll();
  }

  /// Update a session
  Future<ShelfShareSessionModel> updateSession(
    ShelfShareSessionModel session,
  ) async {
    session.updatedAt = DateTime.now();
    await _isar.writeTxn(() async {
      await _isar.shelfShareSessionModels.put(session);
    });
    print('[ShelfShareLocalDS] Updated session: ${session.localId}');
    return session;
  }

  /// Delete a session
  Future<void> deleteSession(String localId) async {
    final session = await getSessionByLocalId(localId);
    if (session != null) {
      await _isar.writeTxn(() async {
        await _isar.shelfShareSessionModels.delete(session.id);
      });
      print('[ShelfShareLocalDS] Deleted session: $localId');
    }
  }

  /// Get all pending sync sessions
  Future<List<ShelfShareSessionModel>> getPendingSyncSessions() async {
    return await _isar.shelfShareSessionModels
        .filter()
        .syncStateEqualTo(ShelfShareSyncState.pending)
        .findAll();
  }

  /// Get count of sessions
  Future<int> getSessionCount() async {
    return await _isar.shelfShareSessionModels.count();
  }
}
