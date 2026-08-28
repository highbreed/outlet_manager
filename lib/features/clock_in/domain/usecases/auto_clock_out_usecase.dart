import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/clock_in_session.dart';
import '../repositories/clock_in_repository.dart';

/// Use case for auto clock-out triggered by geofence exit
class AutoClockOutUseCase {
  final ClockInRepository _repository;

  AutoClockOutUseCase(this._repository);

  /// Execute auto clock-out
  /// Called when agent leaves geofence for extended period
  Future<Either<Failure, void>> call({
    required String sessionId,
    required ClockOutReason reason,
    required double latitude,
    required double longitude,
    required double accuracy,
  }) async {
    // Validate reason is auto-related
    if (reason != ClockOutReason.geofenceExit &&
        reason != ClockOutReason.forcedTimeout &&
        reason != ClockOutReason.routeDeactivation &&
        reason != ClockOutReason.serverAutoClose) {
      return Left(
        ValidationFailure(
          message: 'Invalid auto clock-out reason: $reason',
          fieldErrors: {
            'reason': ['Must be an auto clock-out reason'],
          },
        ),
      );
    }

    // Call repository to auto clock out
    return await _repository.autoClockOut(
      sessionId: sessionId,
      reason: reason,
      latitude: latitude,
      longitude: longitude,
      accuracy: accuracy,
    );
  }
}
