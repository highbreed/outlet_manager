import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../location/location_data.dart';
import '../location/location_service.dart';
import 'location_providers.dart';

/// Provider for location permission status
final locationPermissionStatusProvider =
    StreamProvider<LocationPermissionStatus>((ref) async* {
      // Initial check
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        yield LocationPermissionStatus.denied; // Service disabled
        return;
      }

      var permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        yield LocationPermissionStatus.denied;
      } else if (permission == LocationPermission.deniedForever) {
        yield LocationPermissionStatus.deniedForever;
      } else if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        yield LocationPermissionStatus.granted;
      } else {
        yield LocationPermissionStatus.notDetermined;
      }

      // Listen for changes (poll every 5 seconds)
      await for (final _ in Stream.periodic(const Duration(seconds: 5))) {
        final enabled = await Geolocator.isLocationServiceEnabled();
        if (!enabled) {
          yield LocationPermissionStatus.denied; // Service disabled
          continue;
        }

        permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          yield LocationPermissionStatus.denied;
        } else if (permission == LocationPermission.deniedForever) {
          yield LocationPermissionStatus.deniedForever;
        } else if (permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always) {
          yield LocationPermissionStatus.granted;
        } else {
          yield LocationPermissionStatus.notDetermined;
        }
      }
    });

/// Location tracking state
class LocationTrackingState {
  final bool isTracking;
  final LocationData? currentPosition;
  final String? error;

  const LocationTrackingState({
    this.isTracking = false,
    this.currentPosition,
    this.error,
  });

  // Alias for compatibility
  LocationData? get currentLocation => currentPosition;

  LocationTrackingState copyWith({
    bool? isTracking,
    LocationData? currentPosition,
    String? error,
  }) {
    return LocationTrackingState(
      isTracking: isTracking ?? this.isTracking,
      currentPosition: currentPosition ?? this.currentPosition,
      error: error ?? this.error,
    );
  }
}

/// Location tracking controller
class LocationTrackingController extends StateNotifier<LocationTrackingState> {
  final LocationService _locationService;

  LocationTrackingController(this._locationService)
    : super(const LocationTrackingState());

  /// Check current permission status
  Future<LocationPermissionStatus> checkPermission() async {
    return await _locationService.checkPermission();
  }

  /// Request location permission
  Future<LocationPermissionStatus> requestPermission() async {
    try {
      return await _locationService.requestPermission();
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  /// Open app settings
  Future<bool> openAppSettings() async {
    return await _locationService.openAppSettings();
  }

  /// Open location settings
  Future<bool> openLocationSettings() async {
    return await _locationService.openLocationSettings();
  }

  Future<void> startTracking() async {
    try {
      state = state.copyWith(isTracking: true, error: null);
      await _locationService.startTracking();

      // Listen to position updates
      _locationService.locationStream.listen(
        (locationData) {
          state = state.copyWith(currentPosition: locationData);
        },
        onError: (error) {
          state = state.copyWith(error: error.toString());
        },
      );
    } catch (e) {
      state = state.copyWith(isTracking: false, error: e.toString());
    }
  }

  Future<void> stopTracking() async {
    try {
      await _locationService.stopTracking();
      state = state.copyWith(isTracking: false);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<LocationData?> getCurrentPosition() async {
    try {
      final location = await _locationService.getCurrentLocation();
      state = state.copyWith(currentPosition: location);
      return location;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return null;
    }
  }
}

/// Provider for location tracking controller
final locationTrackingControllerProvider =
    StateNotifierProvider<LocationTrackingController, LocationTrackingState>((
      ref,
    ) {
      final locationService = ref.watch(locationServiceProvider);
      return LocationTrackingController(locationService);
    });
