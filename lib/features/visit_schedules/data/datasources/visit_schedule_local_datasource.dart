import 'package:isar_community/isar.dart';

import '../../../../core/database/isar_database.dart';
import '../models/visit_schedule_model.dart';

/// Local data source for visit schedule operations.
///
/// Uses Isar for local persistence of schedules.
abstract class VisitScheduleLocalDataSource {
  /// Get all schedules
  Future<List<VisitScheduleModel>> getAllSchedules();

  /// Get schedules for a specific day
  Future<List<VisitScheduleModel>> getSchedulesForDay(int dayOfWeek);

  /// Watch all schedules
  Stream<List<VisitScheduleModel>> watchAllSchedules();

  /// Watch schedules for a specific day
  Stream<List<VisitScheduleModel>> watchSchedulesForDay(int dayOfWeek);

  /// Save/update a schedule
  Future<void> saveSchedule(VisitScheduleModel schedule);

  /// Save multiple schedules (replaces all existing)
  Future<void> saveAllSchedules(List<VisitScheduleModel> schedules);

  /// Delete all schedules
  Future<void> clearAllSchedules();

  /// Delete schedules for a specific agent
  Future<void> deleteSchedulesForAgent(String agentId);

  /// Get count of schedules per day
  Future<Map<int, int>> getScheduleCountsByDay();

  /// Get last sync timestamp
  Future<DateTime?> getLastSyncTime();

  /// Update last sync timestamp
  Future<void> setLastSyncTime(DateTime time);
}

/// Implementation of [VisitScheduleLocalDataSource] using Isar.
class VisitScheduleLocalDataSourceImpl implements VisitScheduleLocalDataSource {
  DateTime? _lastSyncTime;

  Future<Isar> get _isar => IsarDatabase.getInstance();

  @override
  Future<List<VisitScheduleModel>> getAllSchedules() async {
    final isar = await _isar;
    return isar.visitScheduleModels
        .where()
        .filter()
        .isActiveEqualTo(true)
        .sortByDayOfWeek()
        .thenByVisitOrder()
        .findAll();
  }

  @override
  Future<List<VisitScheduleModel>> getSchedulesForDay(int dayOfWeek) async {
    final isar = await _isar;
    return isar.visitScheduleModels
        .where()
        .filter()
        .dayOfWeekEqualTo(dayOfWeek)
        .isActiveEqualTo(true)
        .sortByVisitOrder()
        .findAll();
  }

  @override
  Stream<List<VisitScheduleModel>> watchAllSchedules() async* {
    final isar = await _isar;
    yield* isar.visitScheduleModels
        .where()
        .filter()
        .isActiveEqualTo(true)
        .sortByDayOfWeek()
        .thenByVisitOrder()
        .watch(fireImmediately: true);
  }

  @override
  Stream<List<VisitScheduleModel>> watchSchedulesForDay(int dayOfWeek) async* {
    final isar = await _isar;
    yield* isar.visitScheduleModels
        .where()
        .filter()
        .dayOfWeekEqualTo(dayOfWeek)
        .isActiveEqualTo(true)
        .sortByVisitOrder()
        .watch(fireImmediately: true);
  }

  @override
  Future<void> saveSchedule(VisitScheduleModel schedule) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      // Check if exists by serverId
      final existing = await isar.visitScheduleModels
          .where()
          .filter()
          .serverIdEqualTo(schedule.serverId)
          .findFirst();

      if (existing != null) {
        schedule.id = existing.id;
      }

      await isar.visitScheduleModels.put(schedule);
    });
  }

  @override
  Future<void> saveAllSchedules(List<VisitScheduleModel> schedules) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      // Clear existing schedules
      await isar.visitScheduleModels.clear();
      // Save new schedules
      await isar.visitScheduleModels.putAll(schedules);
    });
  }

  @override
  Future<void> clearAllSchedules() async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.visitScheduleModels.clear();
    });
  }

  @override
  Future<void> deleteSchedulesForAgent(String agentId) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.visitScheduleModels
          .where()
          .filter()
          .salesAgentServerIdEqualTo(agentId)
          .deleteAll();
    });
  }

  @override
  Future<Map<int, int>> getScheduleCountsByDay() async {
    final schedules = await getAllSchedules();
    final counts = <int, int>{};

    for (final schedule in schedules) {
      counts[schedule.dayOfWeek] = (counts[schedule.dayOfWeek] ?? 0) + 1;
    }

    return counts;
  }

  @override
  Future<DateTime?> getLastSyncTime() async {
    // Return cached value if available
    if (_lastSyncTime != null) return _lastSyncTime;

    // Otherwise find most recent sync time from any schedule
    final isar = await _isar;
    final latest = await isar.visitScheduleModels
        .where()
        .sortByLastSyncedAtDesc()
        .findFirst();

    _lastSyncTime = latest?.lastSyncedAt;
    return _lastSyncTime;
  }

  @override
  Future<void> setLastSyncTime(DateTime time) async {
    _lastSyncTime = time;
    // The sync time is stored in individual records
  }
}
