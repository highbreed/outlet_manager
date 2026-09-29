import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../location/background_geolocation_service.dart';
import '../location/location_service.dart';

/// Provides the LocationService instance
final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

/// Provides the `flutter_background_geolocation`-based tracking engine —
/// the replacement for the old native Kotlin engine (deleted, see the
/// "Phase 3" plan). Started on clock-in, stopped on clock-out; see
/// `ClockInNotifier`/`ClockOutNotifier` in `daily_route_providers.dart`.
final backgroundGeolocationServiceProvider =
    Provider<BackgroundGeolocationService>((ref) {
      return BackgroundGeolocationService();
    });
