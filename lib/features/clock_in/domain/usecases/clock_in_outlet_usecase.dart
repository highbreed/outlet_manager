import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/clock_in_session.dart';
import '../repositories/clock_in_repository.dart';

/// Use case for clocking in to an outlet
class ClockInOutletUseCase {
  final ClockInRepository _repository;

  ClockInOutletUseCase(this._repository);

  /// Execute clock in
  /// Validates location and creates new session
  Future<Either<Failure, ClockInSession>> call({
    required String outletId,
    required String outletName,
    required String outletCode,
    required bool isDeviation,
    String? routeId,
    required double latitude,
    required double longitude,
    required double accuracy,
    required int allocatedMinutes,
  }) async {
    // Validate accuracy is acceptable (< 200m)
    if (accuracy > 200.0) {
      return Left(
        ValidationFailure(
          message: 'GPS accuracy too low. Please wait for better signal.',
          fieldErrors: {
            'accuracy': ['GPS accuracy must be less than 200 meters'],
          },
        ),
      );
    }

    // Validate allocated time is reasonable (5 min to 8 hours)
    if (allocatedMinutes < 5 || allocatedMinutes > 480) {
      return Left(
        ValidationFailure(
          message: 'Invalid allocated time: $allocatedMinutes minutes',
          fieldErrors: {
            'allocatedMinutes': ['Must be between 5 and 480 minutes'],
          },
        ),
      );
    }

    // Call repository to create session
    return await _repository.clockIn(
      outletId: outletId,
      outletName: outletName,
      outletCode: outletCode,
      isDeviation: isDeviation,
      routeId: routeId,
      latitude: latitude,
      longitude: longitude,
      accuracy: accuracy,
      allocatedMinutes: allocatedMinutes,
    );
  }
}
