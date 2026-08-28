import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../repositories/visit_schedule_repository.dart';

/// Use case to sync visit schedules from the backend.
///
/// Fetches the agent's week schedule from the server
/// and updates local storage.
class SyncSchedulesUseCase {
  final VisitScheduleRepository _repository;

  SyncSchedulesUseCase(this._repository);

  /// Executes the sync.
  ///
  /// Returns success or a failure (e.g., network error).
  Future<Either<Failure, void>> call() {
    return _repository.syncSchedules();
  }

  /// Gets the last time schedules were synced.
  Future<DateTime?> getLastSyncTime() {
    return _repository.getLastSyncTime();
  }
}
