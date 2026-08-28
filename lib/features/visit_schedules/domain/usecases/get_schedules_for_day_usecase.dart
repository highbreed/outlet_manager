import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/visit_schedule.dart';
import '../repositories/visit_schedule_repository.dart';

/// Use case to get visit schedules for a specific day of the week.
class GetSchedulesForDayUseCase {
  final VisitScheduleRepository _repository;

  GetSchedulesForDayUseCase(this._repository);

  /// Gets schedules for a specific day.
  ///
  /// [dayOfWeek] is 0-indexed: 0=Monday, 6=Sunday.
  Future<Either<Failure, List<VisitSchedule>>> call(int dayOfWeek) {
    assert(dayOfWeek >= 0 && dayOfWeek <= 6, 'dayOfWeek must be 0-6');
    return _repository.getSchedulesForDay(dayOfWeek);
  }

  /// Gets schedules for today.
  Future<Either<Failure, List<VisitSchedule>>> forToday() {
    return _repository.getTodaysSchedules();
  }

  /// Watches schedules for a specific day.
  Stream<List<VisitSchedule>> watch(int dayOfWeek) {
    return _repository.watchSchedulesForDay(dayOfWeek);
  }

  /// Converts Flutter's DateTime.weekday (1=Monday, 7=Sunday)
  /// to our format (0=Monday, 6=Sunday).
  static int fromDateTimeWeekday(int weekday) {
    return weekday - 1;
  }

  /// Gets today's day of week in our format (0=Monday, 6=Sunday).
  static int get todayDayOfWeek => fromDateTimeWeekday(DateTime.now().weekday);
}
