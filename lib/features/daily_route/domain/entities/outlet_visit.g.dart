// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OutletVisit _$OutletVisitFromJson(Map<String, dynamic> json) => _OutletVisit(
  localId: json['localId'] as String,
  serverId: json['serverId'] as String?,
  dailyRouteLocalId: json['dailyRouteLocalId'] as String,
  dailyRouteServerId: json['dailyRouteServerId'] as String?,
  outletId: json['outletId'] as String,
  outletCode: json['outletCode'] as String,
  outletName: json['outletName'] as String,
  outletLatitude: (json['outletLatitude'] as num).toDouble(),
  outletLongitude: (json['outletLongitude'] as num).toDouble(),
  geofenceRadiusMeters:
      (json['geofenceRadiusMeters'] as num?)?.toDouble() ?? 200.0,
  scheduleServerId: json['scheduleServerId'] as String?,
  visitOrder: (json['visitOrder'] as num).toInt(),
  scheduledClockIn: json['scheduledClockIn'] as String?,
  scheduledClockOut: json['scheduledClockOut'] as String?,
  allocatedMinutes: (json['allocatedMinutes'] as num).toInt(),
  visitPriority: (json['visitPriority'] as num?)?.toInt() ?? 2,
  visitType: $enumDecode(_$VisitTypeEnumMap, json['visitType']),
  status: $enumDecode(_$VisitStatusEnumMap, json['status']),
  actualClockIn: json['actualClockIn'] == null
      ? null
      : DateTime.parse(json['actualClockIn'] as String),
  actualClockOut: json['actualClockOut'] == null
      ? null
      : DateTime.parse(json['actualClockOut'] as String),
  visitDurationMins: (json['visitDurationMins'] as num?)?.toInt(),
  clockInLatitude: (json['clockInLatitude'] as num?)?.toDouble(),
  clockInLongitude: (json['clockInLongitude'] as num?)?.toDouble(),
  clockInAccuracyMeters: (json['clockInAccuracyMeters'] as num?)?.toDouble(),
  clockInDistanceMeters: (json['clockInDistanceMeters'] as num?)?.toDouble(),
  clockOutLatitude: (json['clockOutLatitude'] as num?)?.toDouble(),
  clockOutLongitude: (json['clockOutLongitude'] as num?)?.toDouble(),
  clockOutAccuracyMeters: (json['clockOutAccuracyMeters'] as num?)?.toDouble(),
  clockOutDistanceMeters: (json['clockOutDistanceMeters'] as num?)?.toDouble(),
  geofenceOverride: json['geofenceOverride'] as bool? ?? false,
  overrideRequestId: json['overrideRequestId'] as String?,
  skipReasonId: (json['skipReasonId'] as num?)?.toInt(),
  skipReasonCode: json['skipReasonCode'] as String?,
  skipNotes: json['skipNotes'] as String?,
  clockInNotes: json['clockInNotes'] as String?,
  clockOutNotes: json['clockOutNotes'] as String?,
  visitNotes: json['visitNotes'] as String?,
  syncState:
      $enumDecodeNullable(_$SyncStateEnumMap, json['syncState']) ??
      SyncState.localOnly,
  syncError: json['syncError'] as String?,
  lastSyncedAt: json['lastSyncedAt'] == null
      ? null
      : DateTime.parse(json['lastSyncedAt'] as String),
);

Map<String, dynamic> _$OutletVisitToJson(_OutletVisit instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'serverId': instance.serverId,
      'dailyRouteLocalId': instance.dailyRouteLocalId,
      'dailyRouteServerId': instance.dailyRouteServerId,
      'outletId': instance.outletId,
      'outletCode': instance.outletCode,
      'outletName': instance.outletName,
      'outletLatitude': instance.outletLatitude,
      'outletLongitude': instance.outletLongitude,
      'geofenceRadiusMeters': instance.geofenceRadiusMeters,
      'scheduleServerId': instance.scheduleServerId,
      'visitOrder': instance.visitOrder,
      'scheduledClockIn': instance.scheduledClockIn,
      'scheduledClockOut': instance.scheduledClockOut,
      'allocatedMinutes': instance.allocatedMinutes,
      'visitPriority': instance.visitPriority,
      'visitType': _$VisitTypeEnumMap[instance.visitType]!,
      'status': _$VisitStatusEnumMap[instance.status]!,
      'actualClockIn': instance.actualClockIn?.toIso8601String(),
      'actualClockOut': instance.actualClockOut?.toIso8601String(),
      'visitDurationMins': instance.visitDurationMins,
      'clockInLatitude': instance.clockInLatitude,
      'clockInLongitude': instance.clockInLongitude,
      'clockInAccuracyMeters': instance.clockInAccuracyMeters,
      'clockInDistanceMeters': instance.clockInDistanceMeters,
      'clockOutLatitude': instance.clockOutLatitude,
      'clockOutLongitude': instance.clockOutLongitude,
      'clockOutAccuracyMeters': instance.clockOutAccuracyMeters,
      'clockOutDistanceMeters': instance.clockOutDistanceMeters,
      'geofenceOverride': instance.geofenceOverride,
      'overrideRequestId': instance.overrideRequestId,
      'skipReasonId': instance.skipReasonId,
      'skipReasonCode': instance.skipReasonCode,
      'skipNotes': instance.skipNotes,
      'clockInNotes': instance.clockInNotes,
      'clockOutNotes': instance.clockOutNotes,
      'visitNotes': instance.visitNotes,
      'syncState': _$SyncStateEnumMap[instance.syncState]!,
      'syncError': instance.syncError,
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
    };

const _$VisitTypeEnumMap = {
  VisitType.scheduled: 'scheduled',
  VisitType.adHoc: 'adHoc',
};

const _$VisitStatusEnumMap = {
  VisitStatus.pending: 'pending',
  VisitStatus.inProgress: 'inProgress',
  VisitStatus.completed: 'completed',
  VisitStatus.skipped: 'skipped',
};

const _$SyncStateEnumMap = {
  SyncState.localOnly: 'localOnly',
  SyncState.syncing: 'syncing',
  SyncState.synced: 'synced',
  SyncState.syncFailed: 'syncFailed',
  SyncState.needsAttention: 'needsAttention',
};
