import 'package:isar_community/isar.dart';
import '../models/models.dart';

/// Local data source for stock take using Isar
class StockTakeLocalDataSource {
  final Isar _isar;

  const StockTakeLocalDataSource(this._isar);

  // ============================================================================
  // Agent Brands
  // ============================================================================

  /// Get agent brands from cache
  Future<AgentBrandModel?> getAgentBrands(int agentId) async {
    return await _isar.agentBrandModels
        .filter()
        .agentIdEqualTo(agentId)
        .findFirst();
  }

  /// Cache agent brands
  Future<void> cacheAgentBrands(AgentBrandModel model) async {
    await _isar.writeTxn(() async {
      await _isar.agentBrandModels.put(model);
    });
  }

  // ============================================================================
  // Warehouses
  // ============================================================================

  /// Get warehouses for a customer from cache
  Future<List<WarehouseModel>> getCustomerWarehouses(int customerId) async {
    // For now, return all active warehouses (customer filtering done by backend)
    return await _isar.warehouseModels.filter().isActiveEqualTo(true).findAll();
  }

  /// Get warehouse by server ID
  Future<WarehouseModel?> getWarehouseByServerId(int serverId) async {
    return await _isar.warehouseModels
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();
  }

  /// Cache warehouses
  Future<void> cacheWarehouses(List<WarehouseModel> warehouses) async {
    await _isar.writeTxn(() async {
      await _isar.warehouseModels.putAll(warehouses);
    });
  }

  // ============================================================================
  // Sessions
  // ============================================================================

  /// Create new session
  Future<StockTakeSessionModel> createSession(
    StockTakeSessionModel session,
  ) async {
    await _isar.writeTxn(() async {
      await _isar.stockTakeSessionModels.put(session);
    });
    return session;
  }

  /// Get session by local ID
  Future<StockTakeSessionModel?> getSessionByLocalId(String localId) async {
    return await _isar.stockTakeSessionModels
        .filter()
        .localIdEqualTo(localId)
        .findFirst();
  }

  /// Get session by server ID
  Future<StockTakeSessionModel?> getSessionByServerId(int serverId) async {
    return await _isar.stockTakeSessionModels
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();
  }

  /// Get active sessions for customer, scoped to the given sales agent
  /// so one agent can never see or resume another agent's session on a
  /// shared device. Deliberately NOT scoped to a specific visit: a session
  /// from an earlier visit/day for the same customer is still shown (and
  /// resumable) rather than hidden or auto-cancelled — visitLocalId has
  /// more than one generation scheme across this codebase and has proven
  /// unreliable to match on, which previously caused legitimate sessions
  /// to disappear.
  Future<List<StockTakeSessionModel>> getActiveSessions(
    int customerId,
    int salesAgentId,
  ) async {
    return await _isar.stockTakeSessionModels
        .filter()
        .customerIdEqualTo(customerId)
        .salesAgentIdEqualTo(salesAgentId)
        .group(
          (q) => q
              .statusEqualTo(StockTakeStatus.active)
              .or()
              .statusEqualTo(StockTakeStatus.paused),
        )
        .findAll();
  }

  /// Get all active sessions (any customer) for the given sales agent
  /// Used to find resumable sessions after logout/login
  Future<List<StockTakeSessionModel>> getAllActiveSessions(
    int salesAgentId,
  ) async {
    return await _isar.stockTakeSessionModels
        .filter()
        .salesAgentIdEqualTo(salesAgentId)
        .group(
          (q) => q
              .statusEqualTo(StockTakeStatus.active)
              .or()
              .statusEqualTo(StockTakeStatus.paused),
        )
        .sortByUpdatedAtDesc()
        .findAll();
  }

  /// Get all sessions for customer
  Future<List<StockTakeSessionModel>> getCustomerSessions(
    int customerId,
  ) async {
    return await _isar.stockTakeSessionModels
        .filter()
        .customerIdEqualTo(customerId)
        .sortByStartedAtDesc()
        .findAll();
  }

  /// Get completed sessions for customer within a date range
  Future<List<StockTakeSessionModel>> getCompletedSessions(
    int customerId, {
    DateTime? since,
  }) async {
    var query = _isar.stockTakeSessionModels
        .filter()
        .customerIdEqualTo(customerId)
        .group(
          (q) => q
              .statusEqualTo(StockTakeStatus.completed)
              .or()
              .statusEqualTo(StockTakeStatus.cancelled),
        );

    if (since != null) {
      query = query.startedAtGreaterThan(since);
    }

    return await query.sortByStartedAtDesc().findAll();
  }

  /// Update session
  Future<StockTakeSessionModel> updateSession(
    StockTakeSessionModel session,
  ) async {
    final updated = session..updatedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.stockTakeSessionModels.put(updated);
    });

    return updated;
  }

  /// Delete session
  Future<void> deleteSession(String localId) async {
    final session = await getSessionByLocalId(localId);
    if (session != null) {
      await _isar.writeTxn(() async {
        await _isar.stockTakeSessionModels.delete(session.id);

        // Delete associated items and serials
        final items = await getSessionItems(localId);
        for (final item in items) {
          await deleteItem(item.localId);
        }
      });
    }
  }

  // ============================================================================
  // Items
  // ============================================================================

  /// Create new item
  Future<StockTakeItemModel> createItem(StockTakeItemModel item) async {
    await _isar.writeTxn(() async {
      await _isar.stockTakeItemModels.put(item);

      // Update session total products
      await _incrementSessionProductCount(item.sessionLocalId);
    });
    return item;
  }

  /// Get item by local ID
  Future<StockTakeItemModel?> getItemByLocalId(String localId) async {
    return await _isar.stockTakeItemModels
        .filter()
        .localIdEqualTo(localId)
        .findFirst();
  }

  /// Get item by server ID
  Future<StockTakeItemModel?> getItemByServerId(int serverId) async {
    return await _isar.stockTakeItemModels
        .filter()
        .serverIdEqualTo(serverId)
        .findFirst();
  }

  /// Get all items for a session
  Future<List<StockTakeItemModel>> getSessionItems(
    String sessionLocalId,
  ) async {
    return await _isar.stockTakeItemModels
        .filter()
        .sessionLocalIdEqualTo(sessionLocalId)
        .sortByStartedAt()
        .findAll();
  }

  /// Update item
  Future<StockTakeItemModel> updateItem(StockTakeItemModel item) async {
    final updated = item..updatedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.stockTakeItemModels.put(updated);
    });

    return updated;
  }

  /// Delete item
  Future<void> deleteItem(String localId) async {
    final item = await getItemByLocalId(localId);
    if (item != null) {
      await _isar.writeTxn(() async {
        await _isar.stockTakeItemModels.delete(item.id);

        // Delete associated serials
        final serials = await getItemSerials(localId);
        for (final serial in serials) {
          await _isar.serialNumberEntryModels.delete(serial.id);
        }

        // Update session total products
        await _decrementSessionProductCount(item.sessionLocalId);
      });
    }
  }

  // ============================================================================
  // Serial Numbers
  // ============================================================================

  /// Create new serial entry
  Future<SerialNumberEntryModel> createSerial(
    SerialNumberEntryModel serial,
  ) async {
    await _isar.writeTxn(() async {
      await _isar.serialNumberEntryModels.put(serial);

      // Update item serial count
      await _incrementItemSerialCount(serial.itemLocalId);

      // Update session total serials
      await _incrementSessionSerialCount(serial.sessionLocalId);
    });
    return serial;
  }

  /// Get serial by local ID
  Future<SerialNumberEntryModel?> getSerialByLocalId(String localId) async {
    return await _isar.serialNumberEntryModels
        .filter()
        .localIdEqualTo(localId)
        .findFirst();
  }

  /// Get all serials for an item
  Future<List<SerialNumberEntryModel>> getItemSerials(
    String itemLocalId,
  ) async {
    return await _isar.serialNumberEntryModels
        .filter()
        .itemLocalIdEqualTo(itemLocalId)
        .sortByScannedAt()
        .findAll();
  }

  /// Check if serial exists in session (case-insensitive)
  Future<SerialNumberEntryModel?> findSerialInSession({
    required String sessionLocalId,
    required String serialNumberNorm,
  }) async {
    return await _isar.serialNumberEntryModels
        .filter()
        .sessionLocalIdEqualTo(sessionLocalId)
        .serialNumberNormEqualTo(serialNumberNorm)
        .findFirst();
  }

  /// Update serial
  Future<SerialNumberEntryModel> updateSerial(
    SerialNumberEntryModel serial,
  ) async {
    await _isar.writeTxn(() async {
      await _isar.serialNumberEntryModels.put(serial);
    });
    return serial;
  }

  /// Delete serial
  Future<void> deleteSerial(String localId) async {
    final serial = await getSerialByLocalId(localId);
    if (serial != null) {
      await _isar.writeTxn(() async {
        await _isar.serialNumberEntryModels.delete(serial.id);

        // Update item serial count
        await _decrementItemSerialCount(serial.itemLocalId);

        // Update session total serials
        await _decrementSessionSerialCount(serial.sessionLocalId);
      });
    }
  }

  /// Batch create serials
  Future<List<SerialNumberEntryModel>> batchCreateSerials(
    List<SerialNumberEntryModel> serials,
  ) async {
    if (serials.isEmpty) return [];

    await _isar.writeTxn(() async {
      await _isar.serialNumberEntryModels.putAll(serials);

      // Group by item and update counts
      final itemCounts = <String, int>{};
      for (final serial in serials) {
        itemCounts[serial.itemLocalId] =
            (itemCounts[serial.itemLocalId] ?? 0) + 1;
      }

      for (final entry in itemCounts.entries) {
        await _incrementItemSerialCount(entry.key, count: entry.value);
      }

      // Update session total serials
      if (serials.isNotEmpty) {
        await _incrementSessionSerialCount(
          serials.first.sessionLocalId,
          count: serials.length,
        );
      }
    });

    return serials;
  }

  // ============================================================================
  // Helper Methods
  // ============================================================================

  Future<void> _incrementSessionProductCount(String sessionLocalId) async {
    final session = await getSessionByLocalId(sessionLocalId);
    if (session != null) {
      session.totalProducts++;
      await _isar.stockTakeSessionModels.put(session);
    }
  }

  Future<void> _decrementSessionProductCount(String sessionLocalId) async {
    final session = await getSessionByLocalId(sessionLocalId);
    if (session != null) {
      session.totalProducts = (session.totalProducts - 1)
          .clamp(0, double.infinity)
          .toInt();
      await _isar.stockTakeSessionModels.put(session);
    }
  }

  Future<void> _incrementSessionSerialCount(
    String sessionLocalId, {
    int count = 1,
  }) async {
    final session = await getSessionByLocalId(sessionLocalId);
    if (session != null) {
      session.totalSerials += count;
      await _isar.stockTakeSessionModels.put(session);
    }
  }

  Future<void> _decrementSessionSerialCount(String sessionLocalId) async {
    final session = await getSessionByLocalId(sessionLocalId);
    if (session != null) {
      session.totalSerials = (session.totalSerials - 1)
          .clamp(0, double.infinity)
          .toInt();
      await _isar.stockTakeSessionModels.put(session);
    }
  }

  Future<void> _incrementItemSerialCount(
    String itemLocalId, {
    int count = 1,
  }) async {
    final item = await getItemByLocalId(itemLocalId);
    if (item != null) {
      item.serialCount += count;
      await _isar.stockTakeItemModels.put(item);
    }
  }

  Future<void> _decrementItemSerialCount(String itemLocalId) async {
    final item = await getItemByLocalId(itemLocalId);
    if (item != null) {
      item.serialCount = (item.serialCount - 1)
          .clamp(0, double.infinity)
          .toInt();
      await _isar.stockTakeItemModels.put(item);
    }
  }
}
