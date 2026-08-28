import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/providers/sync_providers.dart';
import '../data/datasources/clock_in_local_datasource.dart';
import '../data/datasources/clock_in_remote_datasource.dart';
import '../data/repositories/clock_in_repository_impl.dart';
import '../domain/entities/clock_in_session.dart';
import '../domain/repositories/clock_in_repository.dart';

part 'clock_in_providers.g.dart';

/// Provider for the local data source
@riverpod
ClockInLocalDataSource clockInLocalDataSource(Ref ref) {
  return ClockInLocalDataSource();
}

/// Provider for the remote data source
@riverpod
ClockInRemoteDataSource clockInRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ClockInRemoteDataSource(dio: dio);
}

/// Provider for the repository (async because it depends on sync service)
@riverpod
Future<ClockInRepository> clockInRepository(Ref ref) async {
  final localDataSource = ref.watch(clockInLocalDataSourceProvider);
  final remoteDataSource = ref.watch(clockInRemoteDataSourceProvider);
  final syncService = await ref.watch(asyncSyncServiceProvider.future);

  return ClockInRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
    syncService: syncService,
  );
}

/// Stream provider for the active session
@riverpod
Stream<ClockInSession?> activeSession(Ref ref) async* {
  final repository = await ref.watch(clockInRepositoryProvider.future);
  yield* repository.watchActiveSession();
}

/// Provider to check if user is currently clocked in
@riverpod
bool isClockIn(Ref ref) {
  final activeSession = ref.watch(activeSessionProvider);
  return activeSession.maybeWhen(
    data: (session) => session != null,
    orElse: () => false,
  );
}

/// Provider for elapsed time since clock-in (updates every second)
@riverpod
Duration elapsedTime(Ref ref) {
  final activeSession = ref.watch(activeSessionProvider);
  return activeSession.maybeWhen(
    data: (session) {
      if (session == null) return Duration.zero;
      return DateTime.now().difference(session.clockedInAt);
    },
    orElse: () => Duration.zero,
  );
}

/// Provider for remaining time (allocated - elapsed)
@riverpod
Duration remainingTime(Ref ref) {
  final activeSession = ref.watch(activeSessionProvider);
  return activeSession.maybeWhen(
    data: (session) {
      if (session == null) return Duration.zero;
      final allocated = Duration(minutes: session.allocatedMinutes);
      final elapsed = DateTime.now().difference(session.clockedInAt);
      final remaining = allocated - elapsed;
      return remaining.isNegative ? Duration.zero : remaining;
    },
    orElse: () => Duration.zero,
  );
}

/// Provider for time exceeded status
@riverpod
bool isTimeExceeded(Ref ref) {
  final remaining = ref.watch(remainingTimeProvider);
  return remaining == Duration.zero;
}
