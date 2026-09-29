// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_in_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClockInSession _$ClockInSessionFromJson(Map<String, dynamic> json) =>
    _ClockInSession(
      id: json['id'] as String,
      outletId: json['outletId'] as String,
      outletName: json['outletName'] as String,
      outletCode: json['outletCode'] as String,
      isDeviation: json['isDeviation'] as bool,
      routeId: json['routeId'] as String?,
      clockedInAt: DateTime.parse(json['clockedInAt'] as String),
      clockInLatitude: (json['clockInLatitude'] as num).toDouble(),
      clockInLongitude: (json['clockInLongitude'] as num).toDouble(),
      clockInAccuracy: (json['clockInAccuracy'] as num).toDouble(),
      allocatedMinutes: (json['allocatedMinutes'] as num).toInt(),
      status: $enumDecode(_$ClockInStatusEnumMap, json['status']),
      geofenceRadiusMeters:
          (json['geofenceRadiusMeters'] as num?)?.toDouble() ?? 200.0,
      autoClockoutGraceMinutes:
          (json['autoClockoutGraceMinutes'] as num?)?.toInt() ?? 10,
      firstOutsideReadingAt: json['firstOutsideReadingAt'] == null
          ? null
          : DateTime.parse(json['firstOutsideReadingAt'] as String),
      confirmedExitAt: json['confirmedExitAt'] == null
          ? null
          : DateTime.parse(json['confirmedExitAt'] as String),
      consecutiveOutsideReadings:
          (json['consecutiveOutsideReadings'] as num?)?.toInt() ?? 0,
      consecutiveInsideReadings:
          (json['consecutiveInsideReadings'] as num?)?.toInt() ?? 0,
      clockedOutAt: json['clockedOutAt'] == null
          ? null
          : DateTime.parse(json['clockedOutAt'] as String),
      clockOutLatitude: (json['clockOutLatitude'] as num?)?.toDouble(),
      clockOutLongitude: (json['clockOutLongitude'] as num?)?.toDouble(),
      clockOutAccuracy: (json['clockOutAccuracy'] as num?)?.toDouble(),
      transportExpense: (json['transportExpense'] as num?)?.toDouble(),
      routeCovered: json['routeCovered'] as String?,
      hasOrder: json['hasOrder'] as bool?,
      clockOutReason: $enumDecodeNullable(
        _$ClockOutReasonEnumMap,
        json['clockOutReason'],
      ),
      syncState:
          $enumDecodeNullable(_$SyncStateEnumMap, json['syncState']) ??
          SyncState.localOnly,
    );

Map<String, dynamic> _$ClockInSessionToJson(
  _ClockInSession instance,
) => <String, dynamic>{
  'id': instance.id,
  'outletId': instance.outletId,
  'outletName': instance.outletName,
  'outletCode': instance.outletCode,
  'isDeviation': instance.isDeviation,
  'routeId': instance.routeId,
  'clockedInAt': instance.clockedInAt.toIso8601String(),
  'clockInLatitude': instance.clockInLatitude,
  'clockInLongitude': instance.clockInLongitude,
  'clockInAccuracy': instance.clockInAccuracy,
  'allocatedMinutes': instance.allocatedMinutes,
  'status': _$ClockInStatusEnumMap[instance.status]!,
  'geofenceRadiusMeters': instance.geofenceRadiusMeters,
  'autoClockoutGraceMinutes': instance.autoClockoutGraceMinutes,
  'firstOutsideReadingAt': instance.firstOutsideReadingAt?.toIso8601String(),
  'confirmedExitAt': instance.confirmedExitAt?.toIso8601String(),
  'consecutiveOutsideReadings': instance.consecutiveOutsideReadings,
  'consecutiveInsideReadings': instance.consecutiveInsideReadings,
  'clockedOutAt': instance.clockedOutAt?.toIso8601String(),
  'clockOutLatitude': instance.clockOutLatitude,
  'clockOutLongitude': instance.clockOutLongitude,
  'clockOutAccuracy': instance.clockOutAccuracy,
  'transportExpense': instance.transportExpense,
  'routeCovered': instance.routeCovered,
  'hasOrder': instance.hasOrder,
  'clockOutReason': _$ClockOutReasonEnumMap[instance.clockOutReason],
  'syncState': _$SyncStateEnumMap[instance.syncState]!,
};

const _$ClockInStatusEnumMap = {
  ClockInStatus.active: 'active',
  ClockInStatus.completed: 'completed',
  ClockInStatus.autoClockOut: 'autoClockOut',
};

const _$ClockOutReasonEnumMap = {
  ClockOutReason.manual: 'manual',
  ClockOutReason.geofenceExit: 'geofenceExit',
  ClockOutReason.forcedTimeout: 'forcedTimeout',
  ClockOutReason.serverAutoClose: 'serverAutoClose',
  ClockOutReason.routeDeactivation: 'routeDeactivation',
};

const _$SyncStateEnumMap = {
  SyncState.localOnly: 'localOnly',
  SyncState.syncing: 'syncing',
  SyncState.synced: 'synced',
  SyncState.syncFailed: 'syncFailed',
  SyncState.needsAttention: 'needsAttention',
};
