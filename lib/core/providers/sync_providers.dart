import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/isar_database.dart';
import '../sync/sync_service.dart';

/// Provides the SyncService instance
final syncServiceProvider = Provider<SyncService>((ref) {
  // This will throw until database is initialized
  // Use FutureProvider or ProviderScope override for proper initialization
  throw UnimplementedError(
    'SyncService must be initialized with Isar instance',
  );
});

/// Async sync service provider that waits for database
final asyncSyncServiceProvider = FutureProvider<SyncService>((ref) async {
  final isar = await IsarDatabase.getInstance();
  return SyncService(isar);
});
