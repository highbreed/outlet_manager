import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/clock_in_session.dart';
import '../repositories/clock_in_repository.dart';

/// Use case for retrieving the active clock-in session
class GetActiveSessionUseCase {
  final ClockInRepository _repository;

  GetActiveSessionUseCase(this._repository);

  /// Get the currently active session if any
  Future<Either<Failure, ClockInSession?>> call() async {
    return await _repository.getActiveSession();
  }

  /// Watch active session for real-time updates
  Stream<ClockInSession?> watch() {
    return _repository.watchActiveSession();
  }
}
