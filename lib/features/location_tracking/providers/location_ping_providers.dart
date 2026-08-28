import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/providers/location_providers.dart';
import '../data/datasources/location_ping_local_datasource.dart';
import '../data/datasources/location_ping_remote_datasource.dart';
import '../data/repositories/location_ping_repository_impl.dart';
import '../domain/entities/location_ping.dart';
import '../domain/repositories/location_ping_repository.dart';
import '../services/location_ping_service.dart';

part 'location_ping_providers.g.dart';

// === Data Sources ===

@riverpod
LocationPingRemoteDataSource locationPingRemoteDataSource(
  LocationPingRemoteDataSourceRef ref,
) {
  final dio = ref.watch(dioProvider);
  return LocationPingRemoteDataSource(dio);
}

@riverpod
LocationPingLocalDataSource locationPingLocalDataSource(
  LocationPingLocalDataSourceRef ref,
) {
  return LocationPingLocalDataSource();
}

// === Repository ===

@riverpod
LocationPingRepository locationPingRepository(LocationPingRepositoryRef ref) {
  return LocationPingRepositoryImpl(
    remoteDataSource: ref.watch(locationPingRemoteDataSourceProvider),
    localDataSource: ref.watch(locationPingLocalDataSourceProvider),
  );
}

// === Service ===

/// `keepAlive: true` — deliberately NOT autoDispose. This service owns the
/// 5-minute heartbeat/significant-change/pending-sync `Timer`s started by
/// `startForegroundTracking()`. Nothing in the app ever `ref.watch`/`listen`s
/// this provider (`_AppLifecycleHandler` in `main.dart` only `ref.read`s
/// it), and `ref.read` doesn't count as a subscription — so as a plain
/// autoDispose provider it was being torn down (and its `ref.onDispose`
/// hook cancelling every timer) almost immediately after each app-resume
/// call to `startTracking()`, well before the first 5-minute heartbeat
/// could fire. Same class of bug `DayStatusPoll` was fixed for; same fix.
@Riverpod(keepAlive: true)
LocationPingService locationPingService(LocationPingServiceRef ref) {
  final locationService = ref.watch(locationServiceProvider);
  final repository = ref.watch(locationPingRepositoryProvider);

  final service = LocationPingService(
    locationService: locationService,
    repository: repository,
  );

  // Dispose when provider is disposed
  ref.onDispose(() => service.dispose());

  return service;
}

// === Controller ===

/// Controller for managing location ping tracking state.
///
/// `keepAlive: true` for the same reason as [locationPingService] above —
/// without it, `isTracking`/`trackingMode` reset to their initial values
/// every time the controller gets recreated, out of sync with whatever the
/// (also now keep-alive) service is actually doing.
@Riverpod(keepAlive: true)
class LocationPingController extends _$LocationPingController {
  @override
  LocationPingState build() {
    return const LocationPingState();
  }

  /// Start foreground tracking when app becomes active.
  void startTracking({TrackingMode mode = TrackingMode.normal}) {
    final service = ref.read(locationPingServiceProvider);
    service.startForegroundTracking(mode: mode);

    state = state.copyWith(isTracking: true, trackingMode: mode);
  }

  /// Stop foreground tracking when app goes to background.
  void stopTracking() {
    final service = ref.read(locationPingServiceProvider);
    service.stopForegroundTracking();

    state = state.copyWith(isTracking: false);
  }

  /// Switch tracking mode (e.g., entering/exiting a visit).
  void setTrackingMode(TrackingMode mode) {
    final service = ref.read(locationPingServiceProvider);
    service.setTrackingMode(mode);

    state = state.copyWith(trackingMode: mode);
  }

  /// Enter high-precision mode (for active visits/navigation).
  void enterHighPrecisionMode() => setTrackingMode(TrackingMode.highPrecision);

  /// Exit high-precision mode, return to normal.
  void exitHighPrecisionMode() => setTrackingMode(TrackingMode.normal);

  /// Enter low-power mode (off-duty).
  void enterLowPowerMode() => setTrackingMode(TrackingMode.lowPower);

  /// Send a manual ping.
  Future<void> sendManualPing() async {
    state = state.copyWith(isSending: true);

    try {
      final service = ref.read(locationPingServiceProvider);
      await service.sendManualPing();

      final lastPing = await service.getLastPing();
      state = state.copyWith(isSending: false, lastPing: lastPing);
    } catch (e) {
      state = state.copyWith(isSending: false, error: e.toString());
    }
  }

  /// Sync all pending pings.
  Future<SyncResult> syncPending() async {
    state = state.copyWith(isSyncing: true);

    try {
      final service = ref.read(locationPingServiceProvider);
      final result = await service.syncPendingPings();

      final stats = await service.getStats();
      state = state.copyWith(
        isSyncing: false,
        pendingCount: stats[LocationPingSyncState.pending] ?? 0,
      );

      return result;
    } catch (e) {
      state = state.copyWith(isSyncing: false, error: e.toString());
      return const SyncResult(total: 0, synced: 0, failed: 0);
    }
  }

  /// Refresh stats.
  Future<void> refreshStats() async {
    final service = ref.read(locationPingServiceProvider);
    final stats = await service.getStats();
    final lastPing = await service.getLastPing();

    state = state.copyWith(
      pendingCount: stats[LocationPingSyncState.pending] ?? 0,
      lastPing: lastPing,
    );
  }

  /// Clean up old pings.
  Future<int> cleanup() async {
    final service = ref.read(locationPingServiceProvider);
    return service.cleanup();
  }

  /// Clear error state.
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// State for location ping tracking.
class LocationPingState {
  final bool isTracking;
  final TrackingMode trackingMode;
  final bool isSending;
  final bool isSyncing;
  final int pendingCount;
  final LocationPing? lastPing;
  final String? error;

  const LocationPingState({
    this.isTracking = false,
    this.trackingMode = TrackingMode.normal,
    this.isSending = false,
    this.isSyncing = false,
    this.pendingCount = 0,
    this.lastPing,
    this.error,
  });

  LocationPingState copyWith({
    bool? isTracking,
    TrackingMode? trackingMode,
    bool? isSending,
    bool? isSyncing,
    int? pendingCount,
    LocationPing? lastPing,
    String? error,
  }) {
    return LocationPingState(
      isTracking: isTracking ?? this.isTracking,
      trackingMode: trackingMode ?? this.trackingMode,
      isSending: isSending ?? this.isSending,
      isSyncing: isSyncing ?? this.isSyncing,
      pendingCount: pendingCount ?? this.pendingCount,
      lastPing: lastPing ?? this.lastPing,
      error: error,
    );
  }
}

// === Convenience Providers ===

/// Whether tracking is currently active.
@riverpod
bool isLocationTrackingActive(IsLocationTrackingActiveRef ref) {
  return ref.watch(
    locationPingControllerProvider.select((state) => state.isTracking),
  );
}

/// Current tracking mode.
@riverpod
TrackingMode currentTrackingMode(CurrentTrackingModeRef ref) {
  return ref.watch(
    locationPingControllerProvider.select((state) => state.trackingMode),
  );
}

/// Number of pending pings waiting to sync.
@riverpod
int pendingPingCount(PendingPingCountRef ref) {
  return ref.watch(
    locationPingControllerProvider.select((state) => state.pendingCount),
  );
}

/// Last ping info.
@riverpod
LocationPing? lastLocationPing(LastLocationPingRef ref) {
  return ref.watch(
    locationPingControllerProvider.select((state) => state.lastPing),
  );
}
