import 'dart:developer' as dev;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/location/location_data.dart';
import '../../../core/network/failures.dart';
import '../../../core/providers/location_providers.dart';
import '../domain/entities/clock_in_session.dart';
import '../domain/usecases/validate_location_usecase.dart';
import 'clock_in_providers.dart';

part 'clock_in_controller.g.dart';

/// Validation result for clock-in
class ClockInValidation {
  final bool canClockIn;
  final double? distanceToOutlet;
  final double? currentAccuracy;
  final String? errorMessage;
  final List<String> warnings;

  const ClockInValidation({
    required this.canClockIn,
    this.distanceToOutlet,
    this.currentAccuracy,
    this.errorMessage,
    this.warnings = const [],
  });

  factory ClockInValidation.success({
    required double distance,
    required double accuracy,
    List<String> warnings = const [],
  }) {
    return ClockInValidation(
      canClockIn: true,
      distanceToOutlet: distance,
      currentAccuracy: accuracy,
      warnings: warnings,
    );
  }

  factory ClockInValidation.failure(String error) {
    return ClockInValidation(canClockIn: false, errorMessage: error);
  }
}

/// State for clock-in controller
sealed class ClockInState {
  const ClockInState();
}

class ClockInInitial extends ClockInState {
  const ClockInInitial();
}

class ClockInLoading extends ClockInState {
  final String message;
  const ClockInLoading([this.message = 'Processing...']);
}

class ClockInSuccess extends ClockInState {
  final ClockInSession session;
  const ClockInSuccess(this.session);
}

class ClockInError extends ClockInState {
  final Failure failure;
  const ClockInError(this.failure);
}

class ClockOutSuccess extends ClockInState {
  const ClockOutSuccess();
}

/// Controller for clock-in/out operations
@riverpod
class ClockInController extends _$ClockInController {
  @override
  ClockInState build() {
    return const ClockInInitial();
  }

  /// Validate if user can clock in at an outlet
  Future<ClockInValidation> validateClockIn({
    required double outletLatitude,
    required double outletLongitude,
    required double geofenceRadius,
    bool isDeviation = false,
    void Function(LocationData location)? onLocationUpdate,
  }) async {
    try {
      // Get current location (streams for up to 20s, keeping the best fix)
      final locationService = ref.read(locationServiceProvider);
      final currentLocation = await locationService.getCurrentLocation(
        timeout: const Duration(seconds: 20),
        onUpdate: onLocationUpdate,
      );

      // Check GPS accuracy (must be <= 200m)
      if (currentLocation.accuracy > 200.0) {
        return ClockInValidation.failure(
          'GPS accuracy too low (${currentLocation.accuracy.toStringAsFixed(0)}m). '
          'Please wait for better signal or move to an open area.',
        );
      }

      // Calculate distance to outlet
      final validateLocation = ValidateLocationUseCase();
      final distance = validateLocation(
        currentLat: currentLocation.latitude,
        currentLon: currentLocation.longitude,
        centerLat: outletLatitude,
        centerLon: outletLongitude,
        radiusMeters: geofenceRadius,
      );

      // Check if within geofence (50m + 10m buffer) — skipped for approved overrides
      final maxRadius = geofenceRadius + 10.0; // 10m buffer
      if (!isDeviation && distance > maxRadius) {
        return ClockInValidation.failure(
          'You are ${distance.toStringAsFixed(0)}m from the outlet. '
          'Please move within ${geofenceRadius.toStringAsFixed(0)}m to clock in.',
        );
      }

      // Check for existing active session
      final repository = await ref.read(clockInRepositoryProvider.future);
      final activeSessionResult = await repository.getActiveSession();
      final hasActiveSession = activeSessionResult.fold(
        (failure) => false,
        (session) => session != null,
      );
      if (hasActiveSession) {
        return ClockInValidation.failure(
          'You are already clocked in at another outlet.',
        );
      }

      // Build warnings
      final warnings = <String>[];
      if (currentLocation.accuracy > 120.0) {
        warnings.add(
          'GPS accuracy is moderate. Consider waiting for better signal.',
        );
      }
      if (distance > geofenceRadius * 0.8) {
        warnings.add('You are near the edge of the geofence area.');
      }

      return ClockInValidation.success(
        distance: distance,
        accuracy: currentLocation.accuracy,
        warnings: warnings,
      );
    } catch (e) {
      dev.log('Validation failed: $e', name: 'ClockInController');
      return ClockInValidation.failure('Validation failed: ${e.toString()}');
    }
  }

  /// Clock in at an outlet
  Future<void> clockIn({
    required String outletId,
    required String outletName,
    required String outletCode,
    required bool isDeviation,
    String? routeId,
    required int allocatedMinutes,
  }) async {
    state = const ClockInLoading('Clocking in...');

    try {
      // Get current location
      final locationService = ref.read(locationServiceProvider);
      final currentLocation = await locationService.getCurrentLocation();

      // Call repository
      final repository = await ref.read(clockInRepositoryProvider.future);
      final result = await repository.clockIn(
        outletId: outletId,
        outletName: outletName,
        outletCode: outletCode,
        isDeviation: isDeviation,
        routeId: routeId,
        latitude: currentLocation.latitude,
        longitude: currentLocation.longitude,
        accuracy: currentLocation.accuracy,
        allocatedMinutes: allocatedMinutes,
      );

      result.fold((failure) => state = ClockInError(failure), (session) {
        state = ClockInSuccess(session);
        dev.log(
          'Clocked in successfully at $outletName',
          name: 'ClockInController',
        );
      });
    } catch (e, stack) {
      dev.log(
        'Clock in failed: $e',
        name: 'ClockInController',
        error: e,
        stackTrace: stack,
      );
      state = ClockInError(
        UnknownFailure(
          message: 'Clock in failed: ${e.toString()}',
          originalError: e,
        ),
      );
    }
  }

  /// Clock out from current session
  Future<void> clockOut({
    required String sessionId,
    required double transportExpense,
    required String routeCovered,
    required bool hasOrder,
  }) async {
    state = const ClockInLoading('Clocking out...');

    try {
      // Get current location
      final locationService = ref.read(locationServiceProvider);
      final currentLocation = await locationService.getCurrentLocation();

      // Call repository
      final repository = await ref.read(clockInRepositoryProvider.future);
      final result = await repository.clockOut(
        sessionId: sessionId,
        transportExpense: transportExpense,
        routeCovered: routeCovered,
        hasOrder: hasOrder,
        latitude: currentLocation.latitude,
        longitude: currentLocation.longitude,
        accuracy: currentLocation.accuracy,
      );

      result.fold((failure) => state = ClockInError(failure), (_) {
        state = const ClockOutSuccess();
        dev.log('Clocked out successfully', name: 'ClockInController');
      });
    } catch (e, stack) {
      dev.log(
        'Clock out failed: $e',
        name: 'ClockInController',
        error: e,
        stackTrace: stack,
      );
      state = ClockInError(
        UnknownFailure(
          message: 'Clock out failed: ${e.toString()}',
          originalError: e,
        ),
      );
    }
  }

  /// Reset controller state
  void reset() {
    state = const ClockInInitial();
  }
}
