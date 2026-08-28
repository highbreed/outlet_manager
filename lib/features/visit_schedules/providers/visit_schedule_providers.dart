import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../auth/auth.dart';
import '../data/datasources/visit_schedule_local_datasource.dart';
import '../data/datasources/visit_schedule_remote_datasource.dart';
import '../data/repositories/visit_schedule_repository_impl.dart';
import '../domain/entities/visit_schedule.dart';
import '../domain/repositories/visit_schedule_repository.dart';
import '../domain/usecases/get_all_schedules_usecase.dart';
import '../domain/usecases/get_schedules_for_day_usecase.dart';
import '../domain/usecases/sync_schedules_usecase.dart';

part 'visit_schedule_providers.g.dart';

// ============================================================================
// Data Sources
// ============================================================================

@riverpod
VisitScheduleLocalDataSource visitScheduleLocalDataSource(Ref ref) {
  return VisitScheduleLocalDataSourceImpl();
}

@riverpod
VisitScheduleRemoteDataSource visitScheduleRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return VisitScheduleRemoteDataSourceImpl(dio: dio);
}

// ============================================================================
// Repository
// ============================================================================

@riverpod
VisitScheduleRepository visitScheduleRepository(Ref ref) {
  final user = ref.watch(currentUserProvider);
  final agentId = user?.id.toString() ?? '';

  return VisitScheduleRepositoryImpl(
    localDataSource: ref.watch(visitScheduleLocalDataSourceProvider),
    remoteDataSource: ref.watch(visitScheduleRemoteDataSourceProvider),
    currentAgentId: agentId,
  );
}

// ============================================================================
// Use Cases
// ============================================================================

@riverpod
GetAllSchedulesUseCase getAllSchedulesUseCase(Ref ref) {
  return GetAllSchedulesUseCase(ref.watch(visitScheduleRepositoryProvider));
}

@riverpod
GetSchedulesForDayUseCase getSchedulesForDayUseCase(Ref ref) {
  return GetSchedulesForDayUseCase(ref.watch(visitScheduleRepositoryProvider));
}

@riverpod
SyncSchedulesUseCase syncSchedulesUseCase(Ref ref) {
  return SyncSchedulesUseCase(ref.watch(visitScheduleRepositoryProvider));
}

// ============================================================================
// State Providers
// ============================================================================

/// Provides all visit schedules, grouped by day of week
@riverpod
class AllSchedulesNotifier extends _$AllSchedulesNotifier {
  @override
  Future<List<VisitSchedule>> build() async {
    final repository = ref.watch(visitScheduleRepositoryProvider);

    // First, try to load from local cache
    final result = await repository.getAllSchedules();
    final cachedSchedules = result.fold(
      (failure) => <VisitSchedule>[],
      (schedules) => schedules,
    );

    // If cache is empty, sync from backend immediately
    if (cachedSchedules.isEmpty) {
      final syncResult = await repository.syncSchedules();
      return syncResult.fold(
        (failure) => throw Exception(failure.displayMessage),
        (_) async {
          // After sync, load from cache
          final freshResult = await repository.getAllSchedules();
          return freshResult.fold(
            (f) => throw Exception(f.displayMessage),
            (schedules) => schedules,
          );
        },
      );
    }

    // Return cached data, but also trigger background sync if stale
    _syncIfStale(repository);

    return cachedSchedules;
  }

  /// Sync in background if last sync was more than 15 minutes ago.
  ///
  /// Sync Strategy:
  /// 1. On first load: Sync immediately if cache is empty
  /// 2. On screen open: Screen triggers sync every time it opens
  /// 3. On app resume: Screen triggers sync when app returns to foreground
  /// 4. Background: Auto-sync if data is >15 min stale
  /// 5. Manual: User can pull-to-refresh or tap sync button
  Future<void> _syncIfStale(VisitScheduleRepository repository) async {
    final lastSync = await repository.getLastSyncTime();
    const staleThreshold = Duration(minutes: 15);

    if (lastSync == null ||
        DateTime.now().difference(lastSync) > staleThreshold) {
      // Sync in background without blocking UI
      repository.syncSchedules().then((result) {
        result.fold(
          (_) {}, // Ignore errors on background sync
          (_) => ref.invalidateSelf(), // Refresh on success
        );
      });
    }
  }

  /// Refresh schedules from backend
  Future<void> refresh() async {
    state = const AsyncValue.loading();

    final syncUseCase = ref.read(syncSchedulesUseCaseProvider);
    final syncResult = await syncUseCase.call();

    await syncResult.fold(
      (failure) async {
        // Sync failed, try to load from cache
        final repository = ref.read(visitScheduleRepositoryProvider);
        final result = await repository.getAllSchedules();
        state = result.fold(
          (f) => AsyncValue.error(f.displayMessage, StackTrace.current),
          (schedules) => AsyncValue.data(schedules),
        );
      },
      (_) async {
        // Sync succeeded, load fresh data
        final repository = ref.read(visitScheduleRepositoryProvider);
        final result = await repository.getAllSchedules();
        state = result.fold(
          (f) => AsyncValue.error(f.displayMessage, StackTrace.current),
          (schedules) => AsyncValue.data(schedules),
        );
      },
    );
  }
}

/// Provides schedules for a specific day
@riverpod
Future<List<VisitSchedule>> schedulesForDay(Ref ref, int dayOfWeek) async {
  final repository = ref.watch(visitScheduleRepositoryProvider);
  final result = await repository.getSchedulesForDay(dayOfWeek);
  return result.fold(
    (failure) => throw Exception(failure.displayMessage),
    (schedules) => schedules,
  );
}

/// Provides today's schedules
@riverpod
Future<List<VisitSchedule>> todaysSchedules(Ref ref) async {
  // Convert Flutter weekday (1=Monday, 7=Sunday) to our format (0=Monday, 6=Sunday)
  final todayDayOfWeek = DateTime.now().weekday - 1;
  return ref.watch(schedulesForDayProvider(todayDayOfWeek).future);
}

/// Provides schedules grouped by day of week
@riverpod
Map<int, List<VisitSchedule>> schedulesGroupedByDay(Ref ref) {
  final schedulesAsync = ref.watch(allSchedulesNotifierProvider);
  return schedulesAsync.whenOrNull(
        data: (schedules) => schedules.groupByDayOfWeek(),
      ) ??
      {};
}

/// Provides schedule counts per day
@riverpod
Map<int, int> scheduleCountsByDay(Ref ref) {
  final grouped = ref.watch(schedulesGroupedByDayProvider);
  return grouped.map((day, schedules) => MapEntry(day, schedules.length));
}

/// Provides total outlet count for the week
@riverpod
int weeklyOutletCount(Ref ref) {
  final counts = ref.watch(scheduleCountsByDayProvider);
  return counts.values.fold(0, (sum, count) => sum + count);
}

/// Stream provider for watching schedules
@riverpod
Stream<List<VisitSchedule>> watchAllSchedules(Ref ref) {
  final repository = ref.watch(visitScheduleRepositoryProvider);
  return repository.watchAllSchedules();
}

/// Stream provider for watching schedules for a specific day
@riverpod
Stream<List<VisitSchedule>> watchSchedulesForDay(Ref ref, int dayOfWeek) {
  final repository = ref.watch(visitScheduleRepositoryProvider);
  return repository.watchSchedulesForDay(dayOfWeek);
}

// ============================================================================
// Sync Controller
// ============================================================================

/// Manages schedule sync state
@riverpod
class ScheduleSyncController extends _$ScheduleSyncController {
  @override
  AsyncValue<DateTime?> build() {
    // Load last sync time
    _loadLastSyncTime();
    return const AsyncValue.data(null);
  }

  Future<void> _loadLastSyncTime() async {
    final repository = ref.read(visitScheduleRepositoryProvider);
    final lastSync = await repository.getLastSyncTime();
    state = AsyncValue.data(lastSync);
  }

  /// Sync schedules from backend
  Future<bool> sync() async {
    state = const AsyncValue.loading();

    final syncUseCase = ref.read(syncSchedulesUseCaseProvider);
    final result = await syncUseCase.call();

    return result.fold(
      (failure) {
        state = AsyncValue.error(failure.displayMessage, StackTrace.current);
        return false;
      },
      (_) {
        state = AsyncValue.data(DateTime.now());
        // Invalidate schedule providers to refresh
        ref.invalidate(allSchedulesNotifierProvider);
        return true;
      },
    );
  }
}
