import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/location_ping.dart';

/// Repository interface for location ping operations.
abstract class LocationPingRepository {
  /// Send ping to server immediately.
  /// Returns [LocationPingResponse] on success or [Failure] on error.
  Future<Either<Failure, LocationPingResponse>> sendPing(LocationPing ping);

  /// Save ping locally for later sync (when offline).
  Future<void> savePingLocally(LocationPing ping);

  /// Get all unsent pings that need to be synced.
  Future<List<LocationPing>> getPendingPings();

  /// Mark ping as synced with server ID.
  Future<void> markPingSynced(String localId, int serverId);

  /// Mark ping as failed.
  Future<void> markPingFailed(String localId);

  /// Clean up old synced pings to save storage.
  /// Default retention is 7 days.
  Future<int> cleanupOldPings({Duration retention = const Duration(days: 7)});

  /// Get the most recent ping for display purposes.
  Future<LocationPing?> getLastPing();

  /// Get ping count by sync state (for debug/stats).
  Future<Map<LocationPingSyncState, int>> getPingStats();
}
