// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isOnlineHash() => r'a0d5142403df05d418cd2a8543ea188796b77ccf';

/// Simple boolean provider for checking if online
/// Used by interceptors and UI components
///
/// Copied from [isOnline].
@ProviderFor(isOnline)
final isOnlineProvider = AutoDisposeProvider<bool>.internal(
  isOnline,
  name: r'isOnlineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isOnlineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsOnlineRef = AutoDisposeProviderRef<bool>;
String _$offlineEventsHash() => r'33d4d47fb0ae5705617cab21d19950b0ebda3a74';

/// Provider that emits only when going offline
/// Useful for showing snackbars/banners
///
/// Copied from [offlineEvents].
@ProviderFor(offlineEvents)
final offlineEventsProvider = AutoDisposeStreamProvider<bool>.internal(
  offlineEvents,
  name: r'offlineEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$offlineEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OfflineEventsRef = AutoDisposeStreamProviderRef<bool>;
String _$onlineRestoredEventsHash() =>
    r'35d7f6c548117efc9b61f299d7bc805c5d99d902';

/// Provider that emits when connectivity is restored (offline -> online)
/// Used to trigger background sync operations
///
/// Copied from [onlineRestoredEvents].
@ProviderFor(onlineRestoredEvents)
final onlineRestoredEventsProvider = AutoDisposeStreamProvider<bool>.internal(
  onlineRestoredEvents,
  name: r'onlineRestoredEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onlineRestoredEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OnlineRestoredEventsRef = AutoDisposeStreamProviderRef<bool>;
String _$connectivityControllerHash() =>
    r'7dbe26540f0134357122da1827c7ea23ca350981';

/// Connectivity controller monitors network state changes
///
/// Copied from [ConnectivityController].
@ProviderFor(ConnectivityController)
final connectivityControllerProvider =
    AutoDisposeNotifierProvider<
      ConnectivityController,
      ConnectivityState
    >.internal(
      ConnectivityController.new,
      name: r'connectivityControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$connectivityControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ConnectivityController = AutoDisposeNotifier<ConnectivityState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
