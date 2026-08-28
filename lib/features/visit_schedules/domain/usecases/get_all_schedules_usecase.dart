import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/visit_schedule.dart';
import '../repositories/visit_schedule_repository.dart';

/// Use case to get all visit schedules for the current agent.
///
/// Returns schedules for all days of the week, which can be
/// grouped using [VisitScheduleListX.groupByDayOfWeek].
class GetAllSchedulesUseCase {
  final VisitScheduleRepository _repository;

  GetAllSchedulesUseCase(this._repository);

  /// Executes the use case.
  ///
  /// Returns all schedules or a failure.
  Future<Either<Failure, List<VisitSchedule>>> call() {
    return _repository.getAllSchedules();
  }

  /// Watches all schedules for reactive updates.
  Stream<List<VisitSchedule>> watch() {
    return _repository.watchAllSchedules();
  }
}
