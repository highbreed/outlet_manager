import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../repositories/clock_in_repository.dart';

/// Use case for clocking out from an outlet
class ClockOutOutletUseCase {
  final ClockInRepository _repository;

  ClockOutOutletUseCase(this._repository);

  /// Execute clock out
  /// Captures exit data and ends session
  Future<Either<Failure, void>> call({
    required String sessionId,
    required double transportExpense,
    required String routeCovered,
    required bool hasOrder,
    required double latitude,
    required double longitude,
    required double accuracy,
  }) async {
    // Validate transport expense (non-negative)
    if (transportExpense < 0) {
      return Left(
        ValidationFailure(
          message: 'Transport expense cannot be negative',
          fieldErrors: {
            'transportExpense': ['Must be a positive value'],
          },
        ),
      );
    }

    // Validate route covered is provided
    if (routeCovered.trim().isEmpty) {
      return Left(
        ValidationFailure(
          message: 'Route covered information is required',
          fieldErrors: {
            'routeCovered': ['This field is required'],
          },
        ),
      );
    }

    // Validate accuracy
    if (accuracy > 200.0) {
      return Left(
        ValidationFailure(
          message: 'GPS accuracy too low for clock out',
          fieldErrors: {
            'accuracy': ['GPS accuracy must be less than 200 meters'],
          },
        ),
      );
    }

    // Call repository to end session
    return await _repository.clockOut(
      sessionId: sessionId,
      transportExpense: transportExpense,
      routeCovered: routeCovered,
      hasOrder: hasOrder,
      latitude: latitude,
      longitude: longitude,
      accuracy: accuracy,
    );
  }
}
