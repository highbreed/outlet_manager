// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyRoute _$DailyRouteFromJson(Map<String, dynamic> json) => _DailyRoute(
  localId: json['localId'] as String,
  serverId: json['serverId'] as String?,
  salesAgentId: json['salesAgentId'] as String,
  routeDate: DateTime.parse(json['routeDate'] as String),
  dayOfWeek: (json['dayOfWeek'] as num).toInt(),
  status: $enumDecode(_$DailyRouteStatusEnumMap, json['status']),
  activatedAt: json['activatedAt'] == null
      ? null
      : DateTime.parse(json['activatedAt'] as String),
  firstClockInAt: json['firstClockInAt'] == null
      ? null
      : DateTime.parse(json['firstClockInAt'] as String),
  lastClockOutAt: json['lastClockOutAt'] == null
      ? null
      : DateTime.parse(json['lastClockOutAt'] as String),
  closedAt: json['closedAt'] == null
      ? null
      : DateTime.parse(json['closedAt'] as String),
  totalScheduled: (json['totalScheduled'] as num?)?.toInt() ?? 0,
  completedCount: (json['completedCount'] as num?)?.toInt() ?? 0,
  skippedCount: (json['skippedCount'] as num?)?.toInt() ?? 0,
  inProgressCount: (json['inProgressCount'] as num?)?.toInt() ?? 0,
  totalVisitTimeMins: (json['totalVisitTimeMins'] as num?)?.toInt() ?? 0,
  closingNotes: json['closingNotes'] as String?,
  closedByUserId: json['closedByUserId'] as String?,
  forceClosed: json['forceClosed'] as bool? ?? false,
  forceClosedByUserId: json['forceClosedByUserId'] as String?,
  forceClosedAt: json['forceClosedAt'] == null
      ? null
      : DateTime.parse(json['forceClosedAt'] as String),
  forceCloseReason: json['forceCloseReason'] as String?,
  syncState:
      $enumDecodeNullable(_$SyncStateEnumMap, json['syncState']) ??
      SyncState.localOnly,
  syncError: json['syncError'] as String?,
  lastSyncedAt: json['lastSyncedAt'] == null
      ? null
      : DateTime.parse(json['lastSyncedAt'] as String),
);

Map<String, dynamic> _$DailyRouteToJson(_DailyRoute instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'serverId': instance.serverId,
      'salesAgentId': instance.salesAgentId,
      'routeDate': instance.routeDate.toIso8601String(),
      'dayOfWeek': instance.dayOfWeek,
      'status': _$DailyRouteStatusEnumMap[instance.status]!,
      'activatedAt': instance.activatedAt?.toIso8601String(),
      'firstClockInAt': instance.firstClockInAt?.toIso8601String(),
      'lastClockOutAt': instance.lastClockOutAt?.toIso8601String(),
      'closedAt': instance.closedAt?.toIso8601String(),
      'totalScheduled': instance.totalScheduled,
      'completedCount': instance.completedCount,
      'skippedCount': instance.skippedCount,
      'inProgressCount': instance.inProgressCount,
      'totalVisitTimeMins': instance.totalVisitTimeMins,
      'closingNotes': instance.closingNotes,
      'closedByUserId': instance.closedByUserId,
      'forceClosed': instance.forceClosed,
      'forceClosedByUserId': instance.forceClosedByUserId,
      'forceClosedAt': instance.forceClosedAt?.toIso8601String(),
      'forceCloseReason': instance.forceCloseReason,
      'syncState': _$SyncStateEnumMap[instance.syncState]!,
      'syncError': instance.syncError,
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
    };

const _$DailyRouteStatusEnumMap = {
  DailyRouteStatus.pending: 'pending',
  DailyRouteStatus.activated: 'activated',
  DailyRouteStatus.inProgress: 'inProgress',
  DailyRouteStatus.closed: 'closed',
  DailyRouteStatus.forceClosed: 'forceClosed',
};

const _$SyncStateEnumMap = {
  SyncState.localOnly: 'localOnly',
  SyncState.syncing: 'syncing',
  SyncState.synced: 'synced',
  SyncState.syncFailed: 'syncFailed',
  SyncState.needsAttention: 'needsAttention',
};
