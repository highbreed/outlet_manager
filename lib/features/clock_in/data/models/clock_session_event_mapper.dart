import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../../../core/database/models/clock_session_event_model.dart'
    as db_model;
import '../../domain/entities/clock_session_event.dart';

/// Mapper to convert between ClockSessionEvent domain entity and Isar model
class ClockSessionEventMapper {
  const ClockSessionEventMapper();

  /// Convert domain entity to Isar model for storage
  db_model.ClockSessionEventModel toModel(ClockSessionEvent entity) {
    return db_model.ClockSessionEventModel()
      ..sessionId = entity.sessionId
      ..type = _mapTypeToModel(entity.type)
      ..latitude = entity.latitude
      ..longitude = entity.longitude
      ..accuracy = entity.accuracy
      ..timestamp = entity.timestamp
      ..metadataJson = entity.metadata != null
          ? jsonEncode(entity.metadata)
          : null;
  }

  /// Convert Isar model to domain entity
  ClockSessionEvent toEntity(db_model.ClockSessionEventModel model) {
    return ClockSessionEvent(
      id: model.id?.toString() ?? const Uuid().v4(),
      sessionId: model.sessionId,
      type: _mapTypeToEntity(model.type),
      latitude: model.latitude,
      longitude: model.longitude,
      accuracy: model.accuracy,
      timestamp: model.timestamp,
      metadata: model.metadataJson != null
          ? Map<String, dynamic>.from(jsonDecode(model.metadataJson!))
          : null,
    );
  }

  /// Create a new event entity
  ClockSessionEvent createEvent({
    required String sessionId,
    required ClockSessionEventType type,
    required double latitude,
    required double longitude,
    required double accuracy,
    Map<String, dynamic>? metadata,
  }) {
    return ClockSessionEvent(
      id: const Uuid().v4(),
      sessionId: sessionId,
      type: type,
      latitude: latitude,
      longitude: longitude,
      accuracy: accuracy,
      timestamp: DateTime.now(),
      metadata: metadata,
    );
  }

  // Type mapping
  db_model.ClockSessionEventType _mapTypeToModel(ClockSessionEventType type) {
    switch (type) {
      case ClockSessionEventType.clockIn:
        return db_model.ClockSessionEventType.clockIn;
      case ClockSessionEventType.firstOutsideReading:
        return db_model.ClockSessionEventType.firstOutsideReading;
      case ClockSessionEventType.geofenceExitConfirmed:
        return db_model.ClockSessionEventType.geofenceExitConfirmed;
      case ClockSessionEventType.notificationSent:
        return db_model.ClockSessionEventType.notificationSent;
      case ClockSessionEventType.firstInsideReading:
        return db_model.ClockSessionEventType.firstInsideReading;
      case ClockSessionEventType.geofenceReentryConfirmed:
        return db_model.ClockSessionEventType.geofenceReentryConfirmed;
      case ClockSessionEventType.autoClockOut:
        return db_model.ClockSessionEventType.autoClockOut;
      case ClockSessionEventType.manualClockOut:
        return db_model.ClockSessionEventType.manualClockOut;
      case ClockSessionEventType.accuracyImproved:
        return db_model.ClockSessionEventType.accuracyImproved;
      case ClockSessionEventType.accuracyDegraded:
        return db_model.ClockSessionEventType.accuracyDegraded;
      case ClockSessionEventType.pollingIntervalChanged:
        return db_model.ClockSessionEventType.pollingIntervalChanged;
    }
  }

  ClockSessionEventType _mapTypeToEntity(db_model.ClockSessionEventType type) {
    switch (type) {
      case db_model.ClockSessionEventType.clockIn:
        return ClockSessionEventType.clockIn;
      case db_model.ClockSessionEventType.firstOutsideReading:
        return ClockSessionEventType.firstOutsideReading;
      case db_model.ClockSessionEventType.geofenceExitConfirmed:
        return ClockSessionEventType.geofenceExitConfirmed;
      case db_model.ClockSessionEventType.notificationSent:
        return ClockSessionEventType.notificationSent;
      case db_model.ClockSessionEventType.firstInsideReading:
        return ClockSessionEventType.firstInsideReading;
      case db_model.ClockSessionEventType.geofenceReentryConfirmed:
        return ClockSessionEventType.geofenceReentryConfirmed;
      case db_model.ClockSessionEventType.autoClockOut:
        return ClockSessionEventType.autoClockOut;
      case db_model.ClockSessionEventType.manualClockOut:
        return ClockSessionEventType.manualClockOut;
      case db_model.ClockSessionEventType.accuracyImproved:
        return ClockSessionEventType.accuracyImproved;
      case db_model.ClockSessionEventType.accuracyDegraded:
        return ClockSessionEventType.accuracyDegraded;
      case db_model.ClockSessionEventType.pollingIntervalChanged:
        return ClockSessionEventType.pollingIntervalChanged;
    }
  }
}

/// Extension methods for JSON serialization (API communication)
extension ClockSessionEventJson on ClockSessionEvent {
  /// Convert to JSON for API requests
  Map<String, dynamic> toApiJson() {
    return {
      'id': id,
      'session_id': sessionId,
      'type': type.name,
      'latitude': latitude,
      'longitude': longitude,
      'accuracy': accuracy,
      'timestamp': timestamp.toIso8601String(),
      if (metadata != null) 'metadata': metadata,
    };
  }
}
