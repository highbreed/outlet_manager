import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/api_client.dart';
import '../notifications/device_registration_repository.dart';
import '../notifications/fcm_service.dart';
import '../notifications/notification_service.dart';
import '../../features/auth/data/auth_controller.dart';

/// Provider for NotificationService
/// Initialized lazily when first accessed
final notificationServiceProvider = Provider<NotificationService>((ref) {
  final service = NotificationService();

  // Dispose when provider is disposed
  ref.onDispose(() {
    service.dispose();
  });

  return service;
});

/// Async provider that initializes the notification service
/// Use this when you need to ensure the service is initialized
final initializedNotificationServiceProvider =
    FutureProvider<NotificationService>((ref) async {
      final service = ref.watch(notificationServiceProvider);
      await service.initialize();
      return service;
    });

/// Provider to check if notification service is initialized
final notificationServiceInitializedProvider = FutureProvider<bool>((
  ref,
) async {
  await ref.watch(initializedNotificationServiceProvider.future);
  return true;
});

/// Provider for [FcmService].
/// Depends on [notificationServiceProvider] so FCM foreground messages
/// are displayed using the same local-notification pipeline.
final fcmServiceProvider = Provider<FcmService>((ref) {
  return FcmService(
    localNotifications: ref.read(notificationServiceProvider),
  );
});

final deviceRegistrationRepositoryProvider =
    Provider<DeviceRegistrationRepository>((ref) {
  return DeviceRegistrationRepository(dio: ref.watch(dioProvider));
});

/// Initialises [FcmService] (requests permission, fetches token, wires handlers).
/// Await this during app startup after Firebase.initializeApp().
final initializedFcmServiceProvider = FutureProvider<FcmService>((ref) async {
  final service = ref.watch(fcmServiceProvider);
  final deviceRepo = ref.watch(deviceRegistrationRepositoryProvider);
  // Only register token refreshes when the user has an active session.
  service.onTokenRefresh = (token) {
    if (ref.read(isAuthenticatedProvider)) {
      deviceRepo.registerDevice(token);
    }
  };
  await service.initialize();
  return service;
});
