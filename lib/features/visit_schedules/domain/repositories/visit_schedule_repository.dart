import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/visit_schedule.dart';

/// Repository interface for visit schedule operations.
///
/// Provides read-only access to agent's assigned visit schedules.
/// Schedules are created/modified by admins via web interface.
abstract class VisitScheduleRepository {
  /// Gets all schedules for the current agent.
  ///
  /// Returns schedules for all days of the week.
  /// Use [VisitScheduleListX.groupByDayOfWeek] to organize by day.
  Future<Either<Failure, List<VisitSchedule>>> getAllSchedules();

  /// Gets schedules for a specific day of the week.
  ///
  /// [dayOfWeek] is 0-indexed: 0=Monday, 6=Sunday.
  /// Results are sorted by [VisitSchedule.visitOrder].
  Future<Either<Failure, List<VisitSchedule>>> getSchedulesForDay(
    int dayOfWeek,
  );

  /// Gets schedules for today.
  ///
  /// Convenience method that determines today's day of week
  /// and returns active schedules for that day.
  Future<Either<Failure, List<VisitSchedule>>> getTodaysSchedules();

  /// Watches schedules for a specific day.
  ///
  /// Emits new list whenever local data changes.
  Stream<List<VisitSchedule>> watchSchedulesForDay(int dayOfWeek);

  /// Watches all schedules.
  ///
  /// Emits new list whenever local data changes.
  Stream<List<VisitSchedule>> watchAllSchedules();

  /// Syncs schedules from the backend.
  ///
  /// Fetches the agent's week schedule from the server
  /// and updates local storage.
  ///
  /// Returns failure if sync fails (e.g., network error).
  Future<Either<Failure, void>> syncSchedules();

  /// Gets the count of outlets for each day of the week.
  ///
  /// Returns a map where key is dayOfWeek (0-6) and value is outlet count.
  Future<Either<Failure, Map<int, int>>> getScheduleCountsByDay();

  /// Gets the last sync timestamp.
  Future<DateTime?> getLastSyncTime();
}
