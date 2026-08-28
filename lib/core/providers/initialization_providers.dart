import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../initialization/initialization.dart';

/// Provider for the app initialization service
final appInitializationServiceProvider = Provider<AppInitializationService>((
  ref,
) {
  return AppInitializationService();
});

/// FutureProvider that performs app initialization
/// This should be watched on app startup
final appInitializationProvider = FutureProvider<InitializationResult>((
  ref,
) async {
  final service = ref.watch(appInitializationServiceProvider);
  // Pass the ref as Ref instead of WidgetRef since we're in a FutureProvider
  return await service.initializeWithRef(ref);
});

/// Provider to check if app is fully initialized
final isAppInitializedProvider = Provider<bool>((ref) {
  final initResult = ref.watch(appInitializationProvider);
  return initResult.maybeWhen(
    data: (result) => result.success,
    orElse: () => false,
  );
});

/// Provider to get service status
final serviceStatusProvider = Provider<Map<String, bool>>((ref) {
  final initResult = ref.watch(appInitializationProvider);
  return initResult.maybeWhen(
    data: (result) => result.serviceStatus,
    orElse: () => {},
  );
});
