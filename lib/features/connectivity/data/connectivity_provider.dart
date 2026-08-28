import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

/// Connectivity state with additional metadata
enum ConnectivityState {
  /// Device is online (WiFi, mobile data, ethernet)
  online,

  /// Device is offline (no network connection)
  offline,

  /// Connectivity state is unknown or being determined
  unknown,
}

/// Connectivity controller monitors network state changes
@riverpod
class ConnectivityController extends _$ConnectivityController {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  ConnectivityState build() {
    // Check initial connectivity
    _checkConnectivity();

    // Listen for changes
    _subscription = Connectivity().onConnectivityChanged.listen(
      _handleConnectivityChange,
    );

    // Cleanup on dispose
    ref.onDispose(() {
      _subscription?.cancel();
    });

    return ConnectivityState.unknown;
  }

  Future<void> _checkConnectivity() async {
    try {
      final results = await Connectivity().checkConnectivity();
      _handleConnectivityChange(results);
    } catch (e) {
      print('Error checking connectivity: $e');
      state = ConnectivityState.unknown;
    }
  }

  void _handleConnectivityChange(List<ConnectivityResult> results) {
    if (results.isEmpty || results.contains(ConnectivityResult.none)) {
      state = ConnectivityState.offline;
    } else {
      state = ConnectivityState.online;
    }
  }

  /// Force a connectivity check
  Future<void> refresh() => _checkConnectivity();
}

/// Simple boolean provider for checking if online
/// Used by interceptors and UI components
@riverpod
bool isOnline(Ref ref) {
  final connectivity = ref.watch(connectivityControllerProvider);
  // Treat unknown as online (optimistic) to avoid blocking requests
  return connectivity != ConnectivityState.offline;
}

/// Provider that emits only when going offline
/// Useful for showing snackbars/banners
@riverpod
Stream<bool> offlineEvents(Ref ref) async* {
  bool? previousOnline;

  await for (final _ in Stream.periodic(const Duration(milliseconds: 100))) {
    final isCurrentlyOnline = ref.read(isOnlineProvider);

    if (previousOnline != null && previousOnline && !isCurrentlyOnline) {
      yield true; // Just went offline
    }

    previousOnline = isCurrentlyOnline;
  }
}

/// Provider that emits when connectivity is restored (offline -> online)
/// Used to trigger background sync operations
@riverpod
Stream<bool> onlineRestoredEvents(Ref ref) async* {
  bool? previousOnline;

  await for (final _ in Stream.periodic(const Duration(milliseconds: 500))) {
    final isCurrentlyOnline = ref.read(isOnlineProvider);

    // Emit when transitioning from offline to online
    if (previousOnline != null && !previousOnline && isCurrentlyOnline) {
      print('[Connectivity] Network restored - triggering sync');
      yield true;
    }

    previousOnline = isCurrentlyOnline;
  }
}
