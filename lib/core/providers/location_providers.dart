import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/isar_database.dart';
import '../location/geofence_manager.dart';
import '../location/location_service.dart';
import 'notification_providers.dart';

/// Provides the LocationService instance
final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

/// Provides the GeofenceManager instance
final geofenceManagerProvider = Provider<GeofenceManager>((ref) {
  // This will throw until initialized
  throw UnimplementedError(
    'GeofenceManager must be initialized with Isar instance and NotificationService',
  );
});

/// Async geofence manager provider that waits for database and notifications
final asyncGeofenceManagerProvider = FutureProvider<GeofenceManager>((
  ref,
) async {
  final isar = await IsarDatabase.getInstance();
  final locationService = ref.watch(locationServiceProvider);
  final notificationService = await ref.watch(
    initializedNotificationServiceProvider.future,
  );

  return GeofenceManager(
    locationService: locationService,
    isar: isar,
    notificationService: notificationService,
  );
});

/// Stream of current location (when tracking is active)
final locationStreamProvider = StreamProvider.autoDispose((ref) {
  final locationService = ref.watch(locationServiceProvider);
  return locationService.locationStream; // Returns LocationData
});
