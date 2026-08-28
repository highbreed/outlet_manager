import 'package:dio/dio.dart';

import '../../domain/entities/location_ping.dart';

/// Remote data source for sending location pings to the server.
class LocationPingRemoteDataSource {
  final Dio _dio;

  LocationPingRemoteDataSource(this._dio);

  /// Send a location ping to the server.
  ///
  /// Endpoint: POST /api/v1/visits/location/ping
  Future<LocationPingResponse> sendPing(LocationPing ping) async {
    final response = await _dio.post(
      '/visits/location/ping',
      data: {
        'latitude': ping.latitude,
        'longitude': ping.longitude,
        'accuracy_meters': ping.accuracyMeters,
        if (ping.altitudeMeters != null) 'altitude_meters': ping.altitudeMeters,
        if (ping.speedMps != null) 'speed_mps': ping.speedMps,
        if (ping.headingDegrees != null) 'heading_degrees': ping.headingDegrees,
        if (ping.batteryLevel != null) 'battery_level': ping.batteryLevel,
        if (ping.isCharging != null) 'is_charging': ping.isCharging,
        if (ping.networkType != null) 'network_type': ping.networkType,
        'ping_source': _pingSourceToString(ping.pingSource),
        'recorded_at': ping.recordedAt.toUtc().toIso8601String(),
        'device_ping_id': ping.localId,
      },
    );

    final data = response.data as Map<String, dynamic>;

    return LocationPingResponse(
      success: data['success'] as bool? ?? true,
      pingId: data['ping_id'] as int,
      nextPingSeconds: data['next_ping_seconds'] as int?,
      serverTime: DateTime.parse(data['server_time'] as String),
      isDuplicate: data['is_duplicate'] as bool? ?? false,
    );
  }

  String _pingSourceToString(PingSource source) {
    switch (source) {
      case PingSource.foreground:
        return 'foreground';
      case PingSource.background:
        return 'background';
      case PingSource.geofenceEvent:
        return 'geofence_event';
      case PingSource.manual:
        return 'manual';
    }
  }
}
