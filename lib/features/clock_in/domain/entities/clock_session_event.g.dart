// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_session_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClockSessionEventImpl _$$ClockSessionEventImplFromJson(
  Map<String, dynamic> json,
) => _$ClockSessionEventImpl(
  id: json['id'] as String,
  sessionId: json['sessionId'] as String,
  type: $enumDecode(_$ClockSessionEventTypeEnumMap, json['type']),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  accuracy: (json['accuracy'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$ClockSessionEventImplToJson(
  _$ClockSessionEventImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sessionId': instance.sessionId,
  'type': _$ClockSessionEventTypeEnumMap[instance.type]!,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'accuracy': instance.accuracy,
  'timestamp': instance.timestamp.toIso8601String(),
  'metadata': instance.metadata,
};

const _$ClockSessionEventTypeEnumMap = {
  ClockSessionEventType.clockIn: 'clockIn',
  ClockSessionEventType.firstOutsideReading: 'firstOutsideReading',
  ClockSessionEventType.geofenceExitConfirmed: 'geofenceExitConfirmed',
  ClockSessionEventType.notificationSent: 'notificationSent',
  ClockSessionEventType.firstInsideReading: 'firstInsideReading',
  ClockSessionEventType.geofenceReentryConfirmed: 'geofenceReentryConfirmed',
  ClockSessionEventType.autoClockOut: 'autoClockOut',
  ClockSessionEventType.manualClockOut: 'manualClockOut',
  ClockSessionEventType.accuracyImproved: 'accuracyImproved',
  ClockSessionEventType.accuracyDegraded: 'accuracyDegraded',
  ClockSessionEventType.pollingIntervalChanged: 'pollingIntervalChanged',
};
