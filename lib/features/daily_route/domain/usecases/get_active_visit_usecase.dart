import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/outlet_visit.dart';
import '../repositories/outlet_visit_repository.dart';

/// Use case for getting the currently active visit.
///
/// Returns the visit that the agent is currently clocked into (if any).
/// Used for displaying active session UI and preventing multiple clock-ins.
class GetActiveVisitUseCase {
  final OutletVisitRepository _repository;

  GetActiveVisitUseCase(this._repository);

  /// Get the currently active visit.
  ///
  /// Returns [OutletVisit] if clocked in, or null if no active visit.
  Future<Either<Failure, OutletVisit?>> call() async {
    return _repository.getActiveVisit();
  }
}
