// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_ping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationPing _$LocationPingFromJson(Map<String, dynamic> json) =>
    _LocationPing(
      localId: json['localId'] as String,
      serverId: (json['serverId'] as num?)?.toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      accuracyMeters: (json['accuracyMeters'] as num).toDouble(),
      altitudeMeters: (json['altitudeMeters'] as num?)?.toDouble(),
      speedMps: (json['speedMps'] as num?)?.toDouble(),
      headingDegrees: (json['headingDegrees'] as num?)?.toDouble(),
      batteryLevel: (json['batteryLevel'] as num?)?.toInt(),
      isCharging: json['isCharging'] as bool?,
      networkType: json['networkType'] as String?,
      pingSource: $enumDecode(_$PingSourceEnumMap, json['pingSource']),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      syncedAt: json['syncedAt'] == null
          ? null
          : DateTime.parse(json['syncedAt'] as String),
      nextPingSeconds: (json['nextPingSeconds'] as num?)?.toInt(),
      syncState:
          $enumDecodeNullable(
            _$LocationPingSyncStateEnumMap,
            json['syncState'],
          ) ??
          LocationPingSyncState.pending,
    );

Map<String, dynamic> _$LocationPingToJson(_LocationPing instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'serverId': instance.serverId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracyMeters': instance.accuracyMeters,
      'altitudeMeters': instance.altitudeMeters,
      'speedMps': instance.speedMps,
      'headingDegrees': instance.headingDegrees,
      'batteryLevel': instance.batteryLevel,
      'isCharging': instance.isCharging,
      'networkType': instance.networkType,
      'pingSource': _$PingSourceEnumMap[instance.pingSource]!,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'syncedAt': instance.syncedAt?.toIso8601String(),
      'nextPingSeconds': instance.nextPingSeconds,
      'syncState': _$LocationPingSyncStateEnumMap[instance.syncState]!,
    };

const _$PingSourceEnumMap = {
  PingSource.foreground: 'foreground',
  PingSource.background: 'background',
  PingSource.geofenceEvent: 'geofence_event',
  PingSource.manual: 'manual',
};

const _$LocationPingSyncStateEnumMap = {
  LocationPingSyncState.pending: 'pending',
  LocationPingSyncState.syncing: 'syncing',
  LocationPingSyncState.synced: 'synced',
  LocationPingSyncState.failed: 'failed',
};

_LocationPingResponse _$LocationPingResponseFromJson(
  Map<String, dynamic> json,
) => _LocationPingResponse(
  success: json['success'] as bool,
  pingId: (json['pingId'] as num).toInt(),
  nextPingSeconds: (json['nextPingSeconds'] as num?)?.toInt(),
  serverTime: DateTime.parse(json['serverTime'] as String),
  isDuplicate: json['isDuplicate'] as bool,
);

Map<String, dynamic> _$LocationPingResponseToJson(
  _LocationPingResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'pingId': instance.pingId,
  'nextPingSeconds': instance.nextPingSeconds,
  'serverTime': instance.serverTime.toIso8601String(),
  'isDuplicate': instance.isDuplicate,
};
