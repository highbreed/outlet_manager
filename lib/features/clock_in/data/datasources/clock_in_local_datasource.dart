import 'package:isar_community/isar.dart';

import '../../../../core/database/isar_database.dart';
import '../../../../core/database/models/clock_in_session_model.dart'
    as db_model;
import '../../../../core/database/models/clock_session_event_model.dart'
    as event_model;
import '../../domain/entities/clock_in_session.dart' as entity;
import '../../domain/entities/clock_session_event.dart' as event_entity;
import '../models/clock_in_session_mapper.dart';
import '../models/clock_session_event_mapper.dart';

/// Local data source for clock-in operations using Isar database
class ClockInLocalDataSource {
  final ClockInSessionMapper _sessionMapper;
  final ClockSessionEventMapper _eventMapper;

  ClockInLocalDataSource({
    ClockInSessionMapper? sessionMapper,
    ClockSessionEventMapper? eventMapper,
  }) : _sessionMapper = sessionMapper ?? const ClockInSessionMapper(),
       _eventMapper = eventMapper ?? const ClockSessionEventMapper();

  Future<Isar> get _isar async => IsarDatabase.getInstance();

  // ============ Session Operations ============

  /// Save a new clock-in session
  Future<entity.ClockInSession> saveSession(
    entity.ClockInSession session,
  ) async {
    final isar = await _isar;
    final model = _sessionMapper.toModel(session);
    await isar.writeTxn(() async {
      await isar.clockInSessionModels.put(model);
    });
    return session;
  }

  /// Update an existing session
  Future<entity.ClockInSession> updateSession(
    entity.ClockInSession session,
  ) async {
    final isar = await _isar;
    final existingModel = await isar.clockInSessionModels
        .filter()
        .localIdEqualTo(session.id)
        .findFirst();

    if (existingModel == null) {
      throw Exception('Session not found: ${session.id}');
    }

    final model = _sessionMapper.toModel(session)..id = existingModel.id;
    await isar.writeTxn(() async {
      await isar.clockInSessionModels.put(model);
    });
    return session;
  }

  /// Get the currently active session (only one allowed)
  Future<entity.ClockInSession?> getActiveSession() async {
    final isar = await _isar;
    final model = await isar.clockInSessionModels
        .filter()
        .statusEqualTo(db_model.ClockInStatus.active)
        .findFirst();

    return model != null ? _sessionMapper.toEntity(model) : null;
  }

  /// Watch for active session changes
  Stream<entity.ClockInSession?> watchActiveSession() async* {
    final isar = await _isar;
    yield* isar.clockInSessionModels
        .filter()
        .statusEqualTo(db_model.ClockInStatus.active)
        .watch(fireImmediately: true)
        .map(
          (models) =>
              models.isNotEmpty ? _sessionMapper.toEntity(models.first) : null,
        );
  }

  /// Get session by ID
  Future<entity.ClockInSession?> getSessionById(String localId) async {
    final isar = await _isar;
    final model = await isar.clockInSessionModels
        .filter()
        .localIdEqualTo(localId)
        .findFirst();

    return model != null ? _sessionMapper.toEntity(model) : null;
  }

  /// Get sessions for a date range
  Future<List<entity.ClockInSession>> getSessionHistory({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final isar = await _isar;
    final models = await isar.clockInSessionModels
        .filter()
        .clockedInAtBetween(startDate, endDate)
        .sortByClockedInAtDesc()
        .findAll();

    return models.map(_sessionMapper.toEntity).toList();
  }

  /// Get sessions by outlet
  Future<List<entity.ClockInSession>> getSessionsByOutlet(
    String outletId,
  ) async {
    final isar = await _isar;
    final models = await isar.clockInSessionModels
        .filter()
        .outletIdEqualTo(outletId)
        .sortByClockedInAtDesc()
        .findAll();

    return models.map(_sessionMapper.toEntity).toList();
  }

  /// Get sessions pending sync
  Future<List<entity.ClockInSession>> getPendingSyncSessions() async {
    final isar = await _isar;
    final models = await isar.clockInSessionModels
        .filter()
        .syncStateEqualTo(db_model.SyncState.localOnly)
        .or()
        .syncStateEqualTo(db_model.SyncState.syncFailed)
        .findAll();

    return models.map(_sessionMapper.toEntity).toList();
  }

  /// Update sync state of a session
  Future<void> updateSyncState(
    String localId,
    entity.SyncState syncState,
  ) async {
    final isar = await _isar;
    final model = await isar.clockInSessionModels
        .filter()
        .localIdEqualTo(localId)
        .findFirst();

    if (model != null) {
      model.syncState = _mapSyncStateToModel(syncState);
      if (syncState == entity.SyncState.synced) {
        model.syncedAt = DateTime.now();
      }
      await isar.writeTxn(() async {
        await isar.clockInSessionModels.put(model);
      });
    }
  }

  // ============ Event Operations ============

  /// Save a session event
  Future<void> saveEvent(event_entity.ClockSessionEvent event) async {
    final isar = await _isar;
    final model = _eventMapper.toModel(event);
    await isar.writeTxn(() async {
      await isar.clockSessionEventModels.put(model);
    });
  }

  /// Get events for a session
  Future<List<event_entity.ClockSessionEvent>> getSessionEvents(
    String sessionId,
  ) async {
    final isar = await _isar;
    final models = await isar.clockSessionEventModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .sortByTimestamp()
        .findAll();

    return models.map(_eventMapper.toEntity).toList();
  }

  /// Watch events for a session
  Stream<List<event_entity.ClockSessionEvent>> watchSessionEvents(
    String sessionId,
  ) async* {
    final isar = await _isar;
    yield* isar.clockSessionEventModels
        .filter()
        .sessionIdEqualTo(sessionId)
        .sortByTimestamp()
        .watch(fireImmediately: true)
        .map((models) => models.map(_eventMapper.toEntity).toList());
  }

  // ============ Statistics ============

  /// Get today's session count
  Future<int> getTodaySessionCount() async {
    final isar = await _isar;
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await isar.clockInSessionModels
        .filter()
        .clockedInAtBetween(startOfDay, endOfDay)
        .count();
  }

  /// Get total time worked today (in minutes)
  Future<int> getTodayWorkMinutes() async {
    final isar = await _isar;
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final sessions = await isar.clockInSessionModels
        .filter()
        .clockedInAtBetween(startOfDay, endOfDay)
        .findAll();

    int totalMinutes = 0;
    for (final session in sessions) {
      final endTime = session.clockedOutAt ?? DateTime.now();
      totalMinutes += endTime.difference(session.clockedInAt).inMinutes;
    }
    return totalMinutes;
  }

  // ============ Helpers ============

  db_model.SyncState _mapSyncStateToModel(entity.SyncState state) {
    switch (state) {
      case entity.SyncState.localOnly:
        return db_model.SyncState.localOnly;
      case entity.SyncState.syncing:
        return db_model.SyncState.syncing;
      case entity.SyncState.synced:
        return db_model.SyncState.synced;
      case entity.SyncState.syncFailed:
        return db_model.SyncState.syncFailed;
      case entity.SyncState.needsAttention:
        return db_model.SyncState.needsAttention;
    }
  }
}
