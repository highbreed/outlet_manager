// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_ping_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationPingRemoteDataSourceHash() =>
    r'2843f0b4750bdbb9cd9e85845abdd01df1bc46ed';

/// See also [locationPingRemoteDataSource].
@ProviderFor(locationPingRemoteDataSource)
final locationPingRemoteDataSourceProvider =
    AutoDisposeProvider<LocationPingRemoteDataSource>.internal(
      locationPingRemoteDataSource,
      name: r'locationPingRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationPingRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationPingRemoteDataSourceRef =
    AutoDisposeProviderRef<LocationPingRemoteDataSource>;
String _$locationPingLocalDataSourceHash() =>
    r'c362d3ac79dd5ccf4da5a93c205e3faeba863eeb';

/// See also [locationPingLocalDataSource].
@ProviderFor(locationPingLocalDataSource)
final locationPingLocalDataSourceProvider =
    AutoDisposeProvider<LocationPingLocalDataSource>.internal(
      locationPingLocalDataSource,
      name: r'locationPingLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationPingLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationPingLocalDataSourceRef =
    AutoDisposeProviderRef<LocationPingLocalDataSource>;
String _$locationPingRepositoryHash() =>
    r'ee82bdf872dc46840803e2ce2b8f76fb0dd4d832';

/// See also [locationPingRepository].
@ProviderFor(locationPingRepository)
final locationPingRepositoryProvider =
    AutoDisposeProvider<LocationPingRepository>.internal(
      locationPingRepository,
      name: r'locationPingRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationPingRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationPingRepositoryRef =
    AutoDisposeProviderRef<LocationPingRepository>;
String _$locationPingServiceHash() =>
    r'3af604d89f0046fe0b0d33f7d3c887b090e02c9d';

/// `keepAlive: true` — deliberately NOT autoDispose. This service owns the
/// 5-minute heartbeat/significant-change/pending-sync `Timer`s started by
/// `startForegroundTracking()`. Nothing in the app ever `ref.watch`/`listen`s
/// this provider (`_AppLifecycleHandler` in `main.dart` only `ref.read`s
/// it), and `ref.read` doesn't count as a subscription — so as a plain
/// autoDispose provider it was being torn down (and its `ref.onDispose`
/// hook cancelling every timer) almost immediately after each app-resume
/// call to `startTracking()`, well before the first 5-minute heartbeat
/// could fire. Same class of bug `DayStatusPoll` was fixed for; same fix.
///
/// Copied from [locationPingService].
@ProviderFor(locationPingService)
final locationPingServiceProvider = Provider<LocationPingService>.internal(
  locationPingService,
  name: r'locationPingServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationPingServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocationPingServiceRef = ProviderRef<LocationPingService>;
String _$isLocationTrackingActiveHash() =>
    r'bbfe2bfb7349e78b30d2d2eadb0a416efa91e87a';

/// Whether tracking is currently active.
///
/// Copied from [isLocationTrackingActive].
@ProviderFor(isLocationTrackingActive)
final isLocationTrackingActiveProvider = AutoDisposeProvider<bool>.internal(
  isLocationTrackingActive,
  name: r'isLocationTrackingActiveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isLocationTrackingActiveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsLocationTrackingActiveRef = AutoDisposeProviderRef<bool>;
String _$currentTrackingModeHash() =>
    r'9381d1c19add099c62f1b00fa56ad9e0cf1ceba3';

/// Current tracking mode.
///
/// Copied from [currentTrackingMode].
@ProviderFor(currentTrackingMode)
final currentTrackingModeProvider = AutoDisposeProvider<TrackingMode>.internal(
  currentTrackingMode,
  name: r'currentTrackingModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentTrackingModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentTrackingModeRef = AutoDisposeProviderRef<TrackingMode>;
String _$pendingPingCountHash() => r'912a78cce20f73c277ea98239d3cc5f7197a102e';

/// Number of pending pings waiting to sync.
///
/// Copied from [pendingPingCount].
@ProviderFor(pendingPingCount)
final pendingPingCountProvider = AutoDisposeProvider<int>.internal(
  pendingPingCount,
  name: r'pendingPingCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingPingCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingPingCountRef = AutoDisposeProviderRef<int>;
String _$lastLocationPingHash() => r'f728cf66735decc80df24b859b69087075f46f53';

/// Last ping info.
///
/// Copied from [lastLocationPing].
@ProviderFor(lastLocationPing)
final lastLocationPingProvider = AutoDisposeProvider<LocationPing?>.internal(
  lastLocationPing,
  name: r'lastLocationPingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lastLocationPingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LastLocationPingRef = AutoDisposeProviderRef<LocationPing?>;
String _$locationPingControllerHash() =>
    r'10edc17073dbbc748923c2706a89b37d9080483a';

/// Controller for managing location ping tracking state.
///
/// `keepAlive: true` for the same reason as [locationPingService] above —
/// without it, `isTracking`/`trackingMode` reset to their initial values
/// every time the controller gets recreated, out of sync with whatever the
/// (also now keep-alive) service is actually doing.
///
/// Copied from [LocationPingController].
@ProviderFor(LocationPingController)
final locationPingControllerProvider =
    NotifierProvider<LocationPingController, LocationPingState>.internal(
      LocationPingController.new,
      name: r'locationPingControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationPingControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LocationPingController = Notifier<LocationPingState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
