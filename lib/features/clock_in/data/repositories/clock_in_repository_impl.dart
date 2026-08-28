import 'dart:developer' as dev;

import 'package:fpdart/fpdart.dart';

import '../../../../core/database/models/sync_operation_model.dart';
import '../../../../core/network/failures.dart';
import '../../../../core/sync/sync_service.dart';
import '../../domain/entities/clock_in_session.dart';
import '../../domain/entities/clock_session_event.dart';
import '../../domain/repositories/clock_in_repository.dart';
import '../datasources/clock_in_local_datasource.dart';
import '../datasources/clock_in_remote_datasource.dart';
import '../models/clock_in_session_mapper.dart';
import '../models/clock_session_event_mapper.dart';

/// Implementation of ClockInRepository with local-first approach
///
/// Strategy:
/// 1. Always save to local database first
/// 2. Queue sync operation for background processing
/// 3. Return local data immediately for responsive UI
/// 4. Sync service handles retries and conflict resolution
class ClockInRepositoryImpl implements ClockInRepository {
  final ClockInLocalDataSource _localDataSource;
  final ClockInRemoteDataSource _remoteDataSource;
  final SyncService _syncService;
  final ClockInSessionMapper _sessionMapper;
  final ClockSessionEventMapper _eventMapper;

  ClockInRepositoryImpl({
    required ClockInLocalDataSource localDataSource,
    required ClockInRemoteDataSource remoteDataSource,
    required SyncService syncService,
    ClockInSessionMapper? sessionMapper,
    ClockSessionEventMapper? eventMapper,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource,
       _syncService = syncService,
       _sessionMapper = sessionMapper ?? const ClockInSessionMapper(),
       _eventMapper = eventMapper ?? const ClockSessionEventMapper();

  @override
  Future<Either<Failure, ClockInSession>> clockIn({
    required String outletId,
    required String outletName,
    required String outletCode,
    required bool isDeviation,
    String? routeId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required int allocatedMinutes,
  }) async {
    try {
      // Check for existing active session
      final existingSession = await _localDataSource.getActiveSession();
      if (existingSession != null) {
        return Left(
          ConflictFailure.duplicateEntry(
            field: 'session',
            message: 'Already clocked in at ${existingSession.outletName}',
          ),
        );
      }

      // Create new session
      final session = _sessionMapper.createNewSession(
        outletId: outletId,
        outletName: outletName,
        outletCode: outletCode,
        isDeviation: isDeviation,
        routeId: routeId,
        latitude: latitude,
        longitude: longitude,
        accuracy: accuracy,
        allocatedMinutes: allocatedMinutes,
      );

      // Save locally first
      await _localDataSource.saveSession(session);

      // Log clock-in event
      final clockInEvent = _eventMapper.createEvent(
        sessionId: session.id,
        type: ClockSessionEventType.clockIn,
        latitude: latitude,
        longitude: longitude,
        accuracy: accuracy,
        metadata: {
          'outlet_id': outletId,
          'outlet_name': outletName,
          'is_deviation': isDeviation,
        },
      );
      await _localDataSource.saveEvent(clockInEvent);

      // Queue sync operation (high priority)
      await _syncService.createOperation(
        type: SyncOperationType.createClockSession,
        entityType: 'clock_in_session',
        entityId: session.id,
        data: session.toApiJson(),
        priority: 1, // Highest priority
      );

      dev.log('Clocked in at $outletName (${session.id})', name: 'ClockIn');
      return Right(session);
    } catch (e, stack) {
      dev.log(
        'Clock in failed: $e',
        name: 'ClockIn',
        error: e,
        stackTrace: stack,
      );
      return Left(
        UnknownFailure(
          message: 'Failed to clock in: ${e.toString()}',
          originalError: e,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> clockOut({
    required String sessionId,
    required double transportExpense,
    required String routeCovered,
    required bool hasOrder,
    required double latitude,
    required double longitude,
    required double accuracy,
  }) async {
    try {
      // Get current session
      final session = await _localDataSource.getSessionById(sessionId);
      if (session == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'ClockInSession',
            resourceId: sessionId,
          ),
        );
      }

      if (session.status != ClockInStatus.active) {
        return Left(
          ValidationFailure(
            message: 'Session is not active',
            fieldErrors: {
              'status': ['Session already ended'],
            },
          ),
        );
      }

      // Update session with clock-out details
      final updatedSession = session.copyWith(
        status: ClockInStatus.completed,
        clockedOutAt: DateTime.now(),
        clockOutLatitude: latitude,
        clockOutLongitude: longitude,
        clockOutAccuracy: accuracy,
        transportExpense: transportExpense,
        routeCovered: routeCovered,
        hasOrder: hasOrder,
        clockOutReason: ClockOutReason.manual,
        syncState: SyncState.localOnly,
      );

      // Save locally
      await _localDataSource.updateSession(updatedSession);

      // Log clock-out event
      final clockOutEvent = _eventMapper.createEvent(
        sessionId: sessionId,
        type: ClockSessionEventType.manualClockOut,
        latitude: latitude,
        longitude: longitude,
        accuracy: accuracy,
        metadata: {
          'transport_expense': transportExpense,
          'route_covered': routeCovered,
          'has_order': hasOrder,
        },
      );
      await _localDataSource.saveEvent(clockOutEvent);

      // Queue sync operation
      await _syncService.createOperation(
        type: SyncOperationType.updateClockSession,
        entityType: 'clock_in_session',
        entityId: sessionId,
        data: updatedSession.toApiJson(),
        priority: 1,
      );

      dev.log('Clocked out from ${session.outletName}', name: 'ClockIn');
      return const Right(null);
    } catch (e, stack) {
      dev.log(
        'Clock out failed: $e',
        name: 'ClockIn',
        error: e,
        stackTrace: stack,
      );
      return Left(
        UnknownFailure(
          message: 'Failed to clock out: ${e.toString()}',
          originalError: e,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> autoClockOut({
    required String sessionId,
    required ClockOutReason reason,
    required double latitude,
    required double longitude,
    required double accuracy,
  }) async {
    try {
      // Get current session
      final session = await _localDataSource.getSessionById(sessionId);
      if (session == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'ClockInSession',
            resourceId: sessionId,
          ),
        );
      }

      if (session.status != ClockInStatus.active) {
        // Already clocked out, nothing to do
        return const Right(null);
      }

      // Update session with auto clock-out details
      final updatedSession = session.copyWith(
        status: ClockInStatus.autoClockOut,
        clockedOutAt: DateTime.now(),
        clockOutLatitude: latitude,
        clockOutLongitude: longitude,
        clockOutAccuracy: accuracy,
        clockOutReason: reason,
        syncState: SyncState.localOnly,
      );

      // Save locally
      await _localDataSource.updateSession(updatedSession);

      // Log auto clock-out event
      final autoClockOutEvent = _eventMapper.createEvent(
        sessionId: sessionId,
        type: ClockSessionEventType.autoClockOut,
        latitude: latitude,
        longitude: longitude,
        accuracy: accuracy,
        metadata: {'reason': reason.name},
      );
      await _localDataSource.saveEvent(autoClockOutEvent);

      // Queue sync operation
      await _syncService.createOperation(
        type: SyncOperationType.updateClockSession,
        entityType: 'clock_in_session',
        entityId: sessionId,
        data: {
          ...updatedSession.toApiJson(),
          'auto_clock_out_reason': reason.name,
        },
        priority: 1,
      );

      dev.log(
        'Auto clocked out from ${session.outletName} (reason: ${reason.name})',
        name: 'ClockIn',
      );
      return const Right(null);
    } catch (e, stack) {
      dev.log(
        'Auto clock out failed: $e',
        name: 'ClockIn',
        error: e,
        stackTrace: stack,
      );
      return Left(
        UnknownFailure(
          message: 'Failed to auto clock out: ${e.toString()}',
          originalError: e,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ClockInSession?>> getActiveSession() async {
    try {
      final session = await _localDataSource.getActiveSession();
      return Right(session);
    } catch (e) {
      return Left(
        UnknownFailure(
          message: 'Failed to get active session',
          originalError: e,
        ),
      );
    }
  }

  @override
  Stream<ClockInSession?> watchActiveSession() {
    return _localDataSource.watchActiveSession();
  }

  @override
  Future<Either<Failure, List<ClockInSession>>> getSessionHistory({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final sessions = await _localDataSource.getSessionHistory(
        startDate: startDate,
        endDate: endDate,
      );
      return Right(sessions);
    } catch (e) {
      return Left(
        UnknownFailure(
          message: 'Failed to get session history',
          originalError: e,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateSessionLocation({
    required String sessionId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required bool isInsideGeofence,
  }) async {
    try {
      final session = await _localDataSource.getSessionById(sessionId);
      if (session == null) {
        return Left(
          NotFoundFailure(
            resourceType: 'ClockInSession',
            resourceId: sessionId,
          ),
        );
      }

      // Update geofence tracking data based on location
      final now = DateTime.now();
      int consecutiveOutsideReadings = session.consecutiveOutsideReadings;
      int consecutiveInsideReadings = session.consecutiveInsideReadings;
      DateTime? firstOutsideReadingAt = session.firstOutsideReadingAt;
      DateTime? confirmedExitAt = session.confirmedExitAt;

      if (!isInsideGeofence) {
        consecutiveOutsideReadings++;
        consecutiveInsideReadings = 0;
        firstOutsideReadingAt ??= now;
      } else {
        consecutiveInsideReadings++;
        consecutiveOutsideReadings = 0;
        firstOutsideReadingAt = null;
        confirmedExitAt = null;
      }

      // Update session with tracking data
      final updatedSession = session.copyWith(
        consecutiveOutsideReadings: consecutiveOutsideReadings,
        consecutiveInsideReadings: consecutiveInsideReadings,
        firstOutsideReadingAt: firstOutsideReadingAt,
        confirmedExitAt: confirmedExitAt,
      );

      await _localDataSource.updateSession(updatedSession);
      return const Right(null);
    } catch (e) {
      return Left(
        UnknownFailure(
          message: 'Failed to update session location',
          originalError: e,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, int>> syncPendingSessions() async {
    try {
      final pendingSessions = await _localDataSource.getPendingSyncSessions();
      int syncedCount = 0;

      for (final session in pendingSessions) {
        // Update sync state to syncing
        await _localDataSource.updateSyncState(session.id, SyncState.syncing);

        // Attempt sync
        final result = await _remoteDataSource.syncSession(session);

        result.fold(
          (failure) async {
            // Mark as failed
            await _localDataSource.updateSyncState(
              session.id,
              SyncState.syncFailed,
            );
            dev.log(
              'Sync failed for session ${session.id}: ${failure.message}',
              name: 'ClockIn',
            );
          },
          (data) async {
            // Mark as synced
            await _localDataSource.updateSyncState(
              session.id,
              SyncState.synced,
            );
            syncedCount++;
            dev.log(
              'Session ${session.id} synced successfully',
              name: 'ClockIn',
            );
          },
        );
      }

      return Right(syncedCount);
    } catch (e) {
      return Left(
        UnknownFailure(
          message: 'Failed to sync pending sessions',
          originalError: e,
        ),
      );
    }
  }

  /// Log a session event
  Future<void> logEvent({
    required String sessionId,
    required ClockSessionEventType type,
    required double latitude,
    required double longitude,
    required double accuracy,
    Map<String, dynamic>? metadata,
  }) async {
    final event = _eventMapper.createEvent(
      sessionId: sessionId,
      type: type,
      latitude: latitude,
      longitude: longitude,
      accuracy: accuracy,
      metadata: metadata,
    );
    await _localDataSource.saveEvent(event);
  }

  /// Get events for a session
  Future<List<ClockSessionEvent>> getSessionEvents(String sessionId) async {
    return await _localDataSource.getSessionEvents(sessionId);
  }

  /// Watch events for a session
  Stream<List<ClockSessionEvent>> watchSessionEvents(String sessionId) {
    return _localDataSource.watchSessionEvents(sessionId);
  }
}
