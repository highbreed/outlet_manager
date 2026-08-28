// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geofence_override_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeofenceOverrideRequestImpl _$$GeofenceOverrideRequestImplFromJson(
  Map<String, dynamic> json,
) => _$GeofenceOverrideRequestImpl(
  localId: json['localId'] as String,
  serverId: json['serverId'] as String?,
  outletVisitLocalId: json['outletVisitLocalId'] as String,
  outletVisitServerId: json['outletVisitServerId'] as String?,
  requestedByUserId: json['requestedByUserId'] as String,
  requestedByName: json['requestedByName'] as String?,
  requestedAt: DateTime.parse(json['requestedAt'] as String),
  reason: json['reason'] as String,
  requestLatitude: (json['requestLatitude'] as num).toDouble(),
  requestLongitude: (json['requestLongitude'] as num).toDouble(),
  requestAccuracyMeters: (json['requestAccuracyMeters'] as num).toDouble(),
  distanceFromOutlet: (json['distanceFromOutlet'] as num).toDouble(),
  outletName: json['outletName'] as String?,
  outletCode: json['outletCode'] as String?,
  status: $enumDecode(_$GeofenceOverrideStatusEnumMap, json['status']),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  decidedByUserId: json['decidedByUserId'] as String?,
  decidedByName: json['decidedByName'] as String?,
  decidedAt: json['decidedAt'] == null
      ? null
      : DateTime.parse(json['decidedAt'] as String),
  decisionNotes: json['decisionNotes'] as String?,
  syncState:
      $enumDecodeNullable(_$SyncStateEnumMap, json['syncState']) ??
      SyncState.localOnly,
  syncError: json['syncError'] as String?,
);

Map<String, dynamic> _$$GeofenceOverrideRequestImplToJson(
  _$GeofenceOverrideRequestImpl instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'serverId': instance.serverId,
  'outletVisitLocalId': instance.outletVisitLocalId,
  'outletVisitServerId': instance.outletVisitServerId,
  'requestedByUserId': instance.requestedByUserId,
  'requestedByName': instance.requestedByName,
  'requestedAt': instance.requestedAt.toIso8601String(),
  'reason': instance.reason,
  'requestLatitude': instance.requestLatitude,
  'requestLongitude': instance.requestLongitude,
  'requestAccuracyMeters': instance.requestAccuracyMeters,
  'distanceFromOutlet': instance.distanceFromOutlet,
  'outletName': instance.outletName,
  'outletCode': instance.outletCode,
  'status': _$GeofenceOverrideStatusEnumMap[instance.status]!,
  'expiresAt': instance.expiresAt.toIso8601String(),
  'decidedByUserId': instance.decidedByUserId,
  'decidedByName': instance.decidedByName,
  'decidedAt': instance.decidedAt?.toIso8601String(),
  'decisionNotes': instance.decisionNotes,
  'syncState': _$SyncStateEnumMap[instance.syncState]!,
  'syncError': instance.syncError,
};

const _$GeofenceOverrideStatusEnumMap = {
  GeofenceOverrideStatus.pending: 'pending',
  GeofenceOverrideStatus.approved: 'approved',
  GeofenceOverrideStatus.rejected: 'rejected',
  GeofenceOverrideStatus.expired: 'expired',
};

const _$SyncStateEnumMap = {
  SyncState.localOnly: 'localOnly',
  SyncState.syncing: 'syncing',
  SyncState.synced: 'synced',
  SyncState.syncFailed: 'syncFailed',
  SyncState.needsAttention: 'needsAttention',
};
