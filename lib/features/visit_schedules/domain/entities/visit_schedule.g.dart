// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VisitSchedule _$VisitScheduleFromJson(Map<String, dynamic> json) =>
    _VisitSchedule(
      serverId: json['serverId'] as String,
      salesAgentServerId: json['salesAgentServerId'] as String,
      outletId: json['outletId'] as String,
      outletCode: json['outletCode'] as String,
      outletName: json['outletName'] as String,
      outletLatitude: (json['outletLatitude'] as num).toDouble(),
      outletLongitude: (json['outletLongitude'] as num).toDouble(),
      outletAddress: json['outletAddress'] as String?,
      dayOfWeek: (json['dayOfWeek'] as num).toInt(),
      scheduledClockIn: json['scheduledClockIn'] as String?,
      scheduledClockOut: json['scheduledClockOut'] as String?,
      visitOrder: (json['visitOrder'] as num).toInt(),
      visitPriority: (json['visitPriority'] as num?)?.toInt() ?? 2,
      allocatedMinutes: (json['allocatedMinutes'] as num).toInt(),
      effectiveFrom: DateTime.parse(json['effectiveFrom'] as String),
      effectiveTo: json['effectiveTo'] == null
          ? null
          : DateTime.parse(json['effectiveTo'] as String),
      isActive: json['isActive'] as bool? ?? true,
      lastSyncedAt: json['lastSyncedAt'] == null
          ? null
          : DateTime.parse(json['lastSyncedAt'] as String),
    );

Map<String, dynamic> _$VisitScheduleToJson(_VisitSchedule instance) =>
    <String, dynamic>{
      'serverId': instance.serverId,
      'salesAgentServerId': instance.salesAgentServerId,
      'outletId': instance.outletId,
      'outletCode': instance.outletCode,
      'outletName': instance.outletName,
      'outletLatitude': instance.outletLatitude,
      'outletLongitude': instance.outletLongitude,
      'outletAddress': instance.outletAddress,
      'dayOfWeek': instance.dayOfWeek,
      'scheduledClockIn': instance.scheduledClockIn,
      'scheduledClockOut': instance.scheduledClockOut,
      'visitOrder': instance.visitOrder,
      'visitPriority': instance.visitPriority,
      'allocatedMinutes': instance.allocatedMinutes,
      'effectiveFrom': instance.effectiveFrom.toIso8601String(),
      'effectiveTo': instance.effectiveTo?.toIso8601String(),
      'isActive': instance.isActive,
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
    };
