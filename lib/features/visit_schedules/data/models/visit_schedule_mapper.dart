import '../../domain/entities/visit_schedule.dart';
import 'visit_schedule_model.dart';

/// Extension to convert VisitScheduleModel to domain entity
extension VisitScheduleModelMapper on VisitScheduleModel {
  /// Converts Isar model to domain entity
  VisitSchedule toEntity() {
    return VisitSchedule(
      serverId: serverId,
      salesAgentServerId: salesAgentServerId,
      outletId: outletId,
      outletCode: outletCode,
      outletName: outletName,
      outletLatitude: outletLatitude,
      outletLongitude: outletLongitude,
      outletAddress: outletAddress,
      dayOfWeek: dayOfWeek,
      scheduledClockIn: scheduledClockIn,
      scheduledClockOut: scheduledClockOut,
      visitOrder: visitOrder,
      visitPriority: visitPriority,
      allocatedMinutes: allocatedMinutes,
      effectiveFrom: effectiveFrom,
      effectiveTo: effectiveTo,
      isActive: isActive,
      lastSyncedAt: lastSyncedAt,
    );
  }
}

/// Extension to convert domain entity to Isar model
extension VisitScheduleEntityMapper on VisitSchedule {
  /// Converts domain entity to Isar model
  VisitScheduleModel toModel({int? isarId}) {
    return VisitScheduleModel()
      ..id = isarId
      ..serverId = serverId
      ..salesAgentServerId = salesAgentServerId
      ..outletId = outletId
      ..outletCode = outletCode
      ..outletName = outletName
      ..outletLatitude = outletLatitude
      ..outletLongitude = outletLongitude
      ..outletAddress = outletAddress
      ..dayOfWeek = dayOfWeek
      ..scheduledClockIn = scheduledClockIn
      ..scheduledClockOut = scheduledClockOut
      ..visitOrder = visitOrder
      ..visitPriority = visitPriority
      ..allocatedMinutes = allocatedMinutes
      ..effectiveFrom = effectiveFrom
      ..effectiveTo = effectiveTo
      ..isActive = isActive
      ..lastSyncedAt = lastSyncedAt;
  }
}

/// Extension to convert list of models to entities
extension VisitScheduleModelListMapper on List<VisitScheduleModel> {
  /// Converts list of Isar models to domain entities
  List<VisitSchedule> toEntities() {
    return map((m) => m.toEntity()).toList();
  }
}
