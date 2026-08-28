import 'package:uuid/uuid.dart';

import '../../../../core/database/models/clock_in_session_model.dart'
    as db_model;
import '../../domain/entities/clock_in_session.dart';

/// Mapper to convert between ClockInSession domain entity and Isar model
class ClockInSessionMapper {
  const ClockInSessionMapper();

  /// Convert domain entity to Isar model for storage
  db_model.ClockInSessionModel toModel(ClockInSession entity) {
    return db_model.ClockInSessionModel()
      ..localId = entity.id
      ..outletId = entity.outletId
      ..outletName = entity.outletName
      ..outletCode = entity.outletCode
      ..isDeviation = entity.isDeviation
      ..routeId = entity.routeId
      ..clockedInAt = entity.clockedInAt
      ..clockInLatitude = entity.clockInLatitude
      ..clockInLongitude = entity.clockInLongitude
      ..clockInAccuracy = entity.clockInAccuracy
      ..allocatedMinutes = entity.allocatedMinutes
      ..status = _mapStatusToModel(entity.status)
      ..geofenceRadiusMeters = entity.geofenceRadiusMeters
      ..autoClockoutGraceMinutes = entity.autoClockoutGraceMinutes
      ..firstOutsideReadingAt = entity.firstOutsideReadingAt
      ..confirmedExitAt = entity.confirmedExitAt
      ..consecutiveOutsideReadings = entity.consecutiveOutsideReadings
      ..consecutiveInsideReadings = entity.consecutiveInsideReadings
      ..clockedOutAt = entity.clockedOutAt
      ..clockOutLatitude = entity.clockOutLatitude
      ..clockOutLongitude = entity.clockOutLongitude
      ..clockOutAccuracy = entity.clockOutAccuracy
      ..transportExpense = entity.transportExpense
      ..routeCovered = entity.routeCovered
      ..hasOrder = entity.hasOrder
      ..clockOutReason = _mapClockOutReasonToModel(entity.clockOutReason)
      ..syncState = _mapSyncStateToModel(entity.syncState);
  }

  /// Convert Isar model to domain entity
  ClockInSession toEntity(db_model.ClockInSessionModel model) {
    return ClockInSession(
      id: model.localId,
      outletId: model.outletId,
      outletName: model.outletName,
      outletCode: model.outletCode,
      isDeviation: model.isDeviation,
      routeId: model.routeId,
      clockedInAt: model.clockedInAt,
      clockInLatitude: model.clockInLatitude,
      clockInLongitude: model.clockInLongitude,
      clockInAccuracy: model.clockInAccuracy,
      allocatedMinutes: model.allocatedMinutes,
      status: _mapStatusToEntity(model.status),
      geofenceRadiusMeters: model.geofenceRadiusMeters,
      autoClockoutGraceMinutes: model.autoClockoutGraceMinutes,
      firstOutsideReadingAt: model.firstOutsideReadingAt,
      confirmedExitAt: model.confirmedExitAt,
      consecutiveOutsideReadings: model.consecutiveOutsideReadings,
      consecutiveInsideReadings: model.consecutiveInsideReadings,
      clockedOutAt: model.clockedOutAt,
      clockOutLatitude: model.clockOutLatitude,
      clockOutLongitude: model.clockOutLongitude,
      clockOutAccuracy: model.clockOutAccuracy,
      transportExpense: model.transportExpense,
      routeCovered: model.routeCovered,
      hasOrder: model.hasOrder,
      clockOutReason: _mapClockOutReasonToEntity(model.clockOutReason),
      syncState: _mapSyncStateToEntity(model.syncState),
    );
  }

  /// Create a new session entity with generated UUID
  ClockInSession createNewSession({
    required String outletId,
    required String outletName,
    required String outletCode,
    required bool isDeviation,
    String? routeId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required int allocatedMinutes,
  }) {
    return ClockInSession(
      id: const Uuid().v4(),
      outletId: outletId,
      outletName: outletName,
      outletCode: outletCode,
      isDeviation: isDeviation,
      routeId: routeId,
      clockedInAt: DateTime.now(),
      clockInLatitude: latitude,
      clockInLongitude: longitude,
      clockInAccuracy: accuracy,
      allocatedMinutes: allocatedMinutes,
      status: ClockInStatus.active,
      syncState: SyncState.localOnly,
    );
  }

  // Status mapping
  db_model.ClockInStatus _mapStatusToModel(ClockInStatus status) {
    switch (status) {
      case ClockInStatus.active:
        return db_model.ClockInStatus.active;
      case ClockInStatus.completed:
        return db_model.ClockInStatus.completed;
      case ClockInStatus.autoClockOut:
        return db_model.ClockInStatus.autoClockOut;
    }
  }

  ClockInStatus _mapStatusToEntity(db_model.ClockInStatus status) {
    switch (status) {
      case db_model.ClockInStatus.active:
        return ClockInStatus.active;
      case db_model.ClockInStatus.completed:
        return ClockInStatus.completed;
      case db_model.ClockInStatus.autoClockOut:
        return ClockInStatus.autoClockOut;
    }
  }

  // ClockOutReason mapping
  db_model.ClockOutReason? _mapClockOutReasonToModel(ClockOutReason? reason) {
    if (reason == null) return null;
    switch (reason) {
      case ClockOutReason.manual:
        return db_model.ClockOutReason.manual;
      case ClockOutReason.geofenceExit:
        return db_model.ClockOutReason.geofenceExit;
      case ClockOutReason.forcedTimeout:
        return db_model.ClockOutReason.forcedTimeout;
      case ClockOutReason.serverAutoClose:
        return db_model.ClockOutReason.serverAutoClose;
      case ClockOutReason.routeDeactivation:
        return db_model.ClockOutReason.routeDeactivation;
    }
  }

  ClockOutReason? _mapClockOutReasonToEntity(db_model.ClockOutReason? reason) {
    if (reason == null) return null;
    switch (reason) {
      case db_model.ClockOutReason.manual:
        return ClockOutReason.manual;
      case db_model.ClockOutReason.geofenceExit:
        return ClockOutReason.geofenceExit;
      case db_model.ClockOutReason.forcedTimeout:
        return ClockOutReason.forcedTimeout;
      case db_model.ClockOutReason.serverAutoClose:
        return ClockOutReason.serverAutoClose;
      case db_model.ClockOutReason.routeDeactivation:
        return ClockOutReason.routeDeactivation;
    }
  }

  // SyncState mapping
  db_model.SyncState _mapSyncStateToModel(SyncState state) {
    switch (state) {
      case SyncState.localOnly:
        return db_model.SyncState.localOnly;
      case SyncState.syncing:
        return db_model.SyncState.syncing;
      case SyncState.synced:
        return db_model.SyncState.synced;
      case SyncState.syncFailed:
        return db_model.SyncState.syncFailed;
      case SyncState.needsAttention:
        return db_model.SyncState.needsAttention;
    }
  }

  SyncState _mapSyncStateToEntity(db_model.SyncState state) {
    switch (state) {
      case db_model.SyncState.localOnly:
        return SyncState.localOnly;
      case db_model.SyncState.syncing:
        return SyncState.syncing;
      case db_model.SyncState.synced:
        return SyncState.synced;
      case db_model.SyncState.syncFailed:
        return SyncState.syncFailed;
      case db_model.SyncState.needsAttention:
        return SyncState.needsAttention;
    }
  }
}

/// Extension methods for JSON serialization (API communication)
extension ClockInSessionJson on ClockInSession {
  /// Convert to JSON for API requests
  Map<String, dynamic> toApiJson() {
    return {
      'local_id': id,
      'outlet_id': outletId,
      'outlet_name': outletName,
      'outlet_code': outletCode,
      'is_deviation': isDeviation,
      'route_id': routeId,
      'clocked_in_at': clockedInAt.toIso8601String(),
      'clock_in_latitude': clockInLatitude,
      'clock_in_longitude': clockInLongitude,
      'clock_in_accuracy': clockInAccuracy,
      'allocated_minutes': allocatedMinutes,
      'status': status.name,
      'geofence_radius_meters': geofenceRadiusMeters,
      'auto_clockout_grace_minutes': autoClockoutGraceMinutes,
      if (clockedOutAt != null)
        'clocked_out_at': clockedOutAt!.toIso8601String(),
      if (clockOutLatitude != null) 'clock_out_latitude': clockOutLatitude,
      if (clockOutLongitude != null) 'clock_out_longitude': clockOutLongitude,
      if (clockOutAccuracy != null) 'clock_out_accuracy': clockOutAccuracy,
      if (transportExpense != null) 'transport_expense': transportExpense,
      if (routeCovered != null) 'route_covered': routeCovered,
      if (hasOrder != null) 'has_order': hasOrder,
      if (clockOutReason != null) 'clock_out_reason': clockOutReason!.name,
    };
  }
}
