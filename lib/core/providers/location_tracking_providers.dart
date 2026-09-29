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

/// Polls (every 5s, same cadence as [locationPermissionStatusProvider])
/// whether "Full screen intents" access is granted — Android 14+ only,
/// always `true` on older Android and iOS (see
/// `BackgroundGeolocationService.isFullScreenIntentPermissionGranted`).
/// Backs the mandatory gate to `FullScreenIntentPermissionScreen`: without
/// this permission, the native reboot reminder
/// (`TrackingReminderScheduler`) silently downgrades from a full-screen
/// alarm to an easily-missed heads-up notification.
final fullScreenIntentPermissionGrantedProvider = StreamProvider<bool>((
  ref,
) async* {
  final service = ref.watch(backgroundGeolocationServiceProvider);
  yield await service.isFullScreenIntentPermissionGranted();
  await for (final _ in Stream.periodic(const Duration(seconds: 5))) {
    yield await service.isFullScreenIntentPermissionGranted();
  }
});

/// Location tracking state — just the last permission-request error, if
/// any. [currentPosition]/continuous tracking fields were removed with the
/// rest of this controller's dead tracking methods (see the "Phase 3"
/// plan, Stage 4) — nothing has read tracking state from here since
/// app_bar.dart was switched onto activeVisitProvider instead.
class LocationTrackingState {
  final String? error;

  const LocationTrackingState({this.error});

  LocationTrackingState copyWith({String? error}) {
    return LocationTrackingState(error: error ?? this.error);
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
}

/// Provider for location tracking controller
final locationTrackingControllerProvider =
    StateNotifierProvider<LocationTrackingController, LocationTrackingState>((
      ref,
    ) {
      final locationService = ref.watch(locationServiceProvider);
      return LocationTrackingController(locationService);
    });
