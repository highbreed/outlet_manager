import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/failures.dart';
import '../../../core/providers/location_providers.dart';
import '../../auth/auth.dart';
import '../data/datasources/daily_route_local_datasource.dart';
import '../data/datasources/daily_route_remote_datasource.dart';
import '../data/repositories/daily_route_repository_impl.dart';
import '../data/repositories/outlet_visit_repository_impl.dart';
import '../domain/entities/daily_route.dart';
import '../domain/entities/outlet_visit.dart';
import '../domain/entities/geofence_override_request.dart';
import '../domain/entities/skip_reason.dart';
import '../domain/entities/day_status.dart';
import '../domain/entities/lunch_break.dart';
import '../domain/repositories/daily_route_repository.dart';
import '../domain/repositories/outlet_visit_repository.dart';
import '../domain/usecases/usecases.dart';

part 'daily_route_providers.g.dart';

// ============================================================================
// Data Sources
// ============================================================================

@riverpod
DailyRouteLocalDataSource dailyRouteLocalDataSource(Ref ref) {
  return DailyRouteLocalDataSourceImpl();
}

@riverpod
DailyRouteRemoteDataSource dailyRouteRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return DailyRouteRemoteDataSourceImpl(dio: dio);
}

// ============================================================================
// Repositories
// ============================================================================

@riverpod
DailyRouteRepository dailyRouteRepository(Ref ref) {
  final user = ref.watch(currentUserProvider);
  final agentId = user?.id.toString() ?? '';

  return DailyRouteRepositoryImpl(
    localDataSource: ref.watch(dailyRouteLocalDataSourceProvider),
    remoteDataSource: ref.watch(dailyRouteRemoteDataSourceProvider),
    currentAgentId: agentId,
  );
}

@riverpod
OutletVisitRepository outletVisitRepository(Ref ref) {
  return OutletVisitRepositoryImpl(
    localDataSource: ref.watch(dailyRouteLocalDataSourceProvider),
    remoteDataSource: ref.watch(dailyRouteRemoteDataSourceProvider),
  );
}

// ============================================================================
// Use Cases
// ============================================================================

@riverpod
ActivateRouteUseCase activateRouteUseCase(Ref ref) {
  return ActivateRouteUseCase(ref.watch(dailyRouteRepositoryProvider));
}

@riverpod
GetTodaysRouteUseCase getTodaysRouteUseCase(Ref ref) {
  return GetTodaysRouteUseCase(ref.watch(dailyRouteRepositoryProvider));
}

@riverpod
CloseRouteUseCase closeRouteUseCase(Ref ref) {
  return CloseRouteUseCase(ref.watch(dailyRouteRepositoryProvider));
}

@riverpod
ClockInVisitUseCase clockInVisitUseCase(Ref ref) {
  return ClockInVisitUseCase(ref.watch(outletVisitRepositoryProvider));
}

@riverpod
ClockOutVisitUseCase clockOutVisitUseCase(Ref ref) {
  return ClockOutVisitUseCase(ref.watch(outletVisitRepositoryProvider));
}

@riverpod
SkipVisitUseCase skipVisitUseCase(Ref ref) {
  return SkipVisitUseCase(ref.watch(outletVisitRepositoryProvider));
}

@riverpod
GetActiveVisitUseCase getActiveVisitUseCase(Ref ref) {
  return GetActiveVisitUseCase(ref.watch(outletVisitRepositoryProvider));
}

@riverpod
RequestGeofenceOverrideUseCase requestGeofenceOverrideUseCase(Ref ref) {
  return RequestGeofenceOverrideUseCase(
    ref.watch(outletVisitRepositoryProvider),
  );
}

// ============================================================================
// State Providers - Today's Route
// ============================================================================

/// Fetches and caches skip reasons from API.
/// These are the predefined reasons a user can choose when skipping a visit.
@riverpod
Future<List<SkipReason>> skipReasons(Ref ref) async {
  final remoteDataSource = ref.watch(dailyRouteRemoteDataSourceProvider);
  try {
    final responses = await remoteDataSource.getSkipReasons();
    return responses
        .where((r) => r.isActive)
        .map(
          (r) => SkipReason(
            id: r.id,
            code: r.code,
            label: r.label,
            requiresNotes: r.requiresNotes,
            isActive: r.isActive,
          ),
        )
        .toList();
  } catch (e) {
    // Return default reasons if API fails
    return const [
      SkipReason(id: 1, code: 'CLOSED', label: 'Outlet Closed'),
      SkipReason(id: 2, code: 'NO_ACCESS', label: 'Cannot Access Location'),
      SkipReason(id: 3, code: 'TIME_CONSTRAINT', label: 'Not Enough Time'),
      SkipReason(id: 4, code: 'OTHER', label: 'Other', requiresNotes: true),
    ];
  }
}

/// Fetches and caches today's route with visits.
/// Use `ref.invalidate(todaysRouteProvider)` to refresh.
@riverpod
Future<DailyRouteWithVisits?> todaysRoute(Ref ref) async {
  final useCase = ref.watch(getTodaysRouteUseCaseProvider);
  final result = await useCase.call();
  return result.fold(
    (failure) => throw failure,
    (routeWithVisits) => routeWithVisits,
  );
}

/// Fetches the route to be closed - either an unclosed route or today's route.
/// This is used by the RouteCloseScreen to handle both scenarios:
/// 1. When closing a previous day's unclosed route
/// 2. When closing today's route normally
@riverpod
Future<DailyRouteWithVisits?> routeToClose(Ref ref) async {
  final repository = ref.watch(dailyRouteRepositoryProvider);
  final remoteDataSource = ref.watch(dailyRouteRemoteDataSourceProvider);

  // First check for pending routes from API (these might not be in local DB)
  try {
    final pendingRoutes = await remoteDataSource.getPendingRoutes();
    final previousDateRoutes = pendingRoutes
        .where((r) => r.isPreviousDate())
        .toList();

    if (previousDateRoutes.isNotEmpty) {
      // Found a pending route from previous date
      final pendingRoute = previousDateRoutes.first;

      // Try to get it from repository (checks local DB)
      final routeResult = await repository.getRouteByServerId(
        pendingRoute.id.toString(),
      );
      var route = routeResult.fold((failure) => null, (r) => r);

      if (route == null) {
        // Route NOT in local DB (e.g. fresh install) - fetch from server and save
        final fetchResult = await repository.fetchAndSaveRouteById(
          pendingRoute.id.toString(),
        );
        route = fetchResult.fold((failure) => null, (r) => r);
      }

      if (route != null) {
        // Route exists locally - fetch with visits
        final visitsResult = await repository.getVisitsForRoute(route.localId);
        final visits = visitsResult.fold(
          (failure) => <OutletVisit>[],
          (visitsList) => visitsList,
        );
        return DailyRouteWithVisits(route: route, visits: visits);
      }
    }
  } catch (e) {
    // If pending routes API fails, continue to local check
    print('[routeToClose] Error checking pending routes: $e');
  }

  // Check local database for any unclosed route
  final unclosedResult = await repository.getUnclosedRoute();
  final unclosedRoute = unclosedResult.fold(
    (failure) => null,
    (route) => route,
  );

  // If there's an unclosed route locally, fetch its visits and return
  if (unclosedRoute != null) {
    final visitsResult = await repository.getVisitsForRoute(
      unclosedRoute.localId,
    );
    final visits = visitsResult.fold(
      (failure) => <OutletVisit>[],
      (visitsList) => visitsList,
    );
    return DailyRouteWithVisits(route: unclosedRoute, visits: visits);
  }

  // Otherwise fall back to today's route
  final useCase = ref.watch(getTodaysRouteUseCaseProvider);
  final result = await useCase.call();
  return result.fold(
    (failure) => throw failure,
    (routeWithVisits) => routeWithVisits,
  );
}

/// Fetches pending routes from backend and filters for previous dates.
/// Returns list of routes that need to be closed before a new route can be activated.
@riverpod
Future<List<PendingRouteResponse>> pendingRoutesToClose(Ref ref) async {
  final remoteDataSource = ref.watch(dailyRouteRemoteDataSourceProvider);

  try {
    final pendingRoutes = await remoteDataSource.getPendingRoutes();

    // Filter for routes from previous dates (not today)
    return pendingRoutes.where((route) => route.isPreviousDate()).toList();
  } catch (e) {
    // If API call fails, return empty list (user can still try to activate)
    return [];
  }
}

/// How often [dayStatusProvider] re-polls the server while being watched.
const dayStatusPollInterval = Duration(seconds: 30);

/// Polled snapshot of the agent's day from `GET /visits/routes/day-status`
/// — blocked / not scheduled / not activated / active / at outlet / in
/// transit / completed. This is the single source of truth for "what should
/// Home show right now" *and* for "am I clocked in" everywhere else
/// ([activeVisitProvider] is derived from this); unlike [todaysRouteProvider]
/// (only refreshed after an action this device took), it re-fetches on a
/// timer so server-side changes an admin makes — closing, force-closing, or
/// otherwise altering the agent's route or an outlet visit — get reflected
/// here without the agent doing anything.
///
/// `keepAlive: true` — deliberately NOT autoDispose. The app's bottom nav
/// (`CustomBottomNavBar`) uses `context.go()` per tab, which fully unmounts
/// the previous screen; an autoDispose provider watched only by Home would
/// get torn down on every tab switch, so any screen reached via Tasks/Menu
/// (without Home in the current watch chain) would cold-start this provider
/// and read a synchronous `AsyncLoading` with no cached value — exactly the
/// "shows not clocked in even though I am" bug this provider exists to
/// prevent. Kept alive for the app session so every screen sees the same,
/// already-resolved state instead of racing a fresh network round-trip.
@Riverpod(keepAlive: true)
class DayStatusPoll extends _$DayStatusPoll {
  @override
  Future<DayStatusInfo> build() async {
    final timer = Timer(dayStatusPollInterval, () {
      ref.invalidateSelf();
    });
    ref.onDispose(timer.cancel);

    final remoteDataSource = ref.watch(dailyRouteRemoteDataSourceProvider);
    final response = await remoteDataSource.getDayStatus();
    final info = response.toDomain();

    // Fire-and-forget: `startTracking()`/`stopTracking()` only ever fire
    // from the explicit clock-in/out actions elsewhere, so a fresh install,
    // a logout/login, or the native engine simply never having been seeded
    // on this device would otherwise leave a genuinely active visit
    // untracked until the agent happened to clock out and back in. This is
    // the source of truth this whole provider already exists to poll, so
    // reconciling native tracking against it here — every 30s, self-healing
    // if ever missed — closes that gap without needing a separate hook.
    _reconcileBackgroundTracking(info);

    return info;
  }

  Future<void> _reconcileBackgroundTracking(DayStatusInfo info) async {
    final backgroundService = ref.read(backgroundGeolocationServiceProvider);
    final activeVisit = info.route?.activeVisit;
    final status = await backgroundService.getTrackingStatus();

    if (activeVisit == null) {
      // No visit active per the backend — if native still thinks it's
      // tracking one (e.g. it was force-closed from another device), stop.
      if (status.isTracking) {
        await backgroundService.stopTracking();
      }
      return;
    }

    if (status.isTracking && status.visitId == activeVisit.localId) {
      return; // Already correctly tracking this visit.
    }

    await backgroundService.startTracking(
      visitId: activeVisit.localId,
      outletName: activeVisit.outletName,
      outletLatitude: activeVisit.outletLatitude,
      outletLongitude: activeVisit.outletLongitude,
      geofenceRadiusMeters: activeVisit.geofenceRadiusMeters,
    );
  }
}

/// Provides the current route status.
@riverpod
DailyRouteStatus? routeStatus(Ref ref) {
  final routeAsync = ref.watch(todaysRouteProvider);
  return routeAsync.whenOrNull(
    data: (routeWithVisits) => routeWithVisits?.route.status,
  );
}

/// Provides the list of visits for today's route.
@riverpod
List<OutletVisit> visitList(Ref ref) {
  final routeAsync = ref.watch(todaysRouteProvider);
  return routeAsync.whenOrNull(
        data: (routeWithVisits) => routeWithVisits?.sortedVisits ?? [],
      ) ??
      [];
}

/// Provides the currently active visit (in progress).
///
/// Sourced from [dayStatusPollProvider] first — it refreshes every
/// [dayStatusPollInterval] and after every clock-in/out this device
/// performs, so every screen gated on "am I clocked in" (Products'
/// visit-context cards, Daily Sales, Stock Take's visit-context injection,
/// etc.) sees the same, fresh answer instead of each reading a one-shot
/// [todaysRouteProvider] snapshot that only that specific action refreshed.
/// Falls back to [todaysRouteProvider] only for the brief window before the
/// first poll completes (or if it errors) — never regresses to "not
/// clocked in" on cold start.
@riverpod
OutletVisit? activeVisit(Ref ref) {
  final dayStatus = ref.watch(dayStatusPollProvider).value;
  if (dayStatus != null) {
    return dayStatus.route?.activeVisit;
  }

  final routeAsync = ref.watch(todaysRouteProvider);
  return routeAsync.whenOrNull(
    data: (routeWithVisits) => routeWithVisits?.activeVisit,
  );
}

/// Provides pending visits count.
@riverpod
int pendingVisitsCount(Ref ref) {
  final routeAsync = ref.watch(todaysRouteProvider);
  return routeAsync.whenOrNull(
        data: (routeWithVisits) => routeWithVisits?.pendingVisits.length ?? 0,
      ) ??
      0;
}

/// Provides completed visits count.
@riverpod
int completedVisitsCount(Ref ref) {
  final routeAsync = ref.watch(todaysRouteProvider);
  return routeAsync.whenOrNull(
        data: (routeWithVisits) => routeWithVisits?.completedVisits.length ?? 0,
      ) ??
      0;
}

/// Provides route progress (0.0 to 1.0).
@riverpod
double routeProgress(Ref ref) {
  final routeAsync = ref.watch(todaysRouteProvider);
  return routeAsync.whenOrNull(
        data: (routeWithVisits) => routeWithVisits?.progressPercentage ?? 0.0,
      ) ??
      0.0;
}

/// Whether the route can be closed (all visits resolved).
@riverpod
bool canCloseRoute(Ref ref) {
  final routeAsync = ref.watch(todaysRouteProvider);
  return routeAsync.whenOrNull(
        data: (routeWithVisits) => routeWithVisits?.allVisitsResolved ?? false,
      ) ??
      false;
}

// ============================================================================
// Action Notifiers
// ============================================================================

/// Notifier for route activation action.
@riverpod
class RouteActivationNotifier extends _$RouteActivationNotifier {
  @override
  AsyncValue<DailyRoute?> build() => const AsyncData(null);

  Future<void> activate({DateTime? routeDate}) async {
    state = const AsyncLoading();
    final useCase = ref.read(activateRouteUseCaseProvider);
    final result = await useCase.call(routeDate: routeDate);
    // Field-confirmed (Sentry 150864253, fatal, UnmountedRefException):
    // Riverpod 3.x throws rather than silently no-opping once this
    // provider's been disposed — autoDispose + backgrounding/low-memory
    // during this await is enough to dispose it before the response
    // lands. Must check before touching `state` or calling `ref.invalidate`
    // below, not just before the invalidate calls specifically.
    if (!ref.mounted) return;
    state = result.fold((failure) => AsyncError(failure, StackTrace.current), (
      route,
    ) {
      // Invalidate today's route to refresh
      if (ref.mounted) ref.invalidate(todaysRouteProvider);
      if (ref.mounted) ref.invalidate(dayStatusPollProvider);
      return AsyncData(route);
    });
  }
}

/// Notifier for clock-in action.
@riverpod
class ClockInNotifier extends _$ClockInNotifier {
  @override
  AsyncValue<OutletVisit?> build() => const AsyncData(null);

  Future<void> clockIn({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    String? verificationId,
    String? deviceId,
    String? notes,
  }) async {
    state = const AsyncLoading();
    final useCase = ref.read(clockInVisitUseCaseProvider);
    final result = await useCase.call(
      visitLocalId: visitLocalId,
      latitude: latitude,
      longitude: longitude,
      accuracyMeters: accuracyMeters,
      verificationId: verificationId,
      deviceId: deviceId,
      notes: notes,
    );
    // See RouteActivationNotifier.activate's matching comment — same
    // Riverpod 3.x disposal-race, same fix.
    if (!ref.mounted) return;
    state = result.fold((failure) => AsyncError(failure, StackTrace.current), (
      visit,
    ) {
      // Invalidate today's route to refresh visit list
      if (ref.mounted) ref.invalidate(todaysRouteProvider);
      if (ref.mounted) ref.invalidate(dayStatusPollProvider);
      // Fire-and-forget: best-effort by design (see
      // BackgroundGeolocationService), must not block clock-in on tracking
      // startup succeeding.
      ref
          .read(backgroundGeolocationServiceProvider)
          .startTracking(
            visitId: visit.localId,
            outletName: visit.outletName,
            outletLatitude: visit.outletLatitude,
            outletLongitude: visit.outletLongitude,
            geofenceRadiusMeters: visit.geofenceRadiusMeters,
          );
      return AsyncData(visit);
    });
  }
}

/// Notifier for clock-out action.
@riverpod
class ClockOutNotifier extends _$ClockOutNotifier {
  @override
  AsyncValue<OutletVisit?> build() => const AsyncData(null);

  Future<AsyncValue<OutletVisit?>> clockOut({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    String? notes,
    bool forceClockOut = false,
  }) async {
    state = const AsyncLoading();
    final useCase = ref.read(clockOutVisitUseCaseProvider);
    final result = await useCase.call(
      visitLocalId: visitLocalId,
      latitude: latitude,
      longitude: longitude,
      accuracyMeters: accuracyMeters,
      notes: notes,
      forceClockOut: forceClockOut,
    );
    // See RouteActivationNotifier.activate's matching comment — same
    // Riverpod 3.x disposal-race, same fix. Callers already separately
    // check their own widget's mounted state before acting on the
    // returned AsyncValue, so returning the pre-call state as a no-op
    // signal here is safe.
    if (!ref.mounted) return state;
    final newState = result.fold<AsyncValue<OutletVisit?>>(
      (failure) => AsyncError(failure, StackTrace.current),
      (visit) {
        // Invalidate today's route to refresh visit list
        if (ref.mounted) ref.invalidate(todaysRouteProvider);
        if (ref.mounted) ref.invalidate(dayStatusPollProvider);
        if (ref.mounted) ref.invalidate(routeToCloseProvider);
        // Fire-and-forget: see ClockInNotifier.clockIn for why.
        ref.read(backgroundGeolocationServiceProvider).stopTracking();
        return AsyncData(visit);
      },
    );
    state = newState;
    return newState;
  }
}

/// Notifier for skip visit action.
@riverpod
class SkipVisitNotifier extends _$SkipVisitNotifier {
  @override
  AsyncValue<OutletVisit?> build() => const AsyncData(null);

  Future<void> skip({
    required String visitLocalId,
    required int skipReasonId,
    String? skipNotes,
  }) async {
    state = const AsyncLoading();
    final useCase = ref.read(skipVisitUseCaseProvider);
    final result = await useCase.call(
      visitLocalId: visitLocalId,
      skipReasonId: skipReasonId,
      skipNotes: skipNotes,
    );
    // See RouteActivationNotifier.activate's matching comment — same
    // Riverpod 3.x disposal-race, same fix.
    if (!ref.mounted) return;
    state = result.fold((failure) => AsyncError(failure, StackTrace.current), (
      visit,
    ) {
      // Invalidate today's route to refresh visit list
      if (ref.mounted) ref.invalidate(todaysRouteProvider);
      if (ref.mounted) ref.invalidate(dayStatusPollProvider);
      return AsyncData(visit);
    });
  }
}

/// Notifier for route close action.
@riverpod
class RouteCloseNotifier extends _$RouteCloseNotifier {
  @override
  AsyncValue<DailyRoute?> build() => const AsyncData(null);

  Future<void> close({
    required String routeLocalId,
    String? closingNotes,
    List<SkipVisitParams>? skippedVisits,
  }) async {
    state = const AsyncLoading();
    final useCase = ref.read(closeRouteUseCaseProvider);
    // Bounded: the close button is disabled while this is loading, so any
    // stall here (a local read or the network call that never resolves)
    // used to leave the screen spinning forever with no request ever
    // completing. Every path now resolves to data or an error.
    final Either<Failure, DailyRoute> result;
    try {
      result = await useCase
          .call(
            routeLocalId: routeLocalId,
            closingNotes: closingNotes,
            skippedVisits: skippedVisits,
          )
          .timeout(const Duration(seconds: 30));
    } on TimeoutException {
      if (!ref.mounted) return;
      state = AsyncError(const NetworkFailure.timeout(), StackTrace.current);
      return;
    } catch (e, st) {
      if (!ref.mounted) return;
      state = AsyncError(UnknownFailure(message: e.toString()), st);
      return;
    }
    // See RouteActivationNotifier.activate's matching comment — same
    // Riverpod 3.x disposal-race, same fix.
    if (!ref.mounted) return;
    state = result.fold((failure) => AsyncError(failure, StackTrace.current), (
      route,
    ) {
      // Invalidate route providers to refresh
      if (ref.mounted) ref.invalidate(todaysRouteProvider);
      if (ref.mounted) ref.invalidate(dayStatusPollProvider);
      if (ref.mounted) ref.invalidate(routeToCloseProvider);
      if (ref.mounted) ref.invalidate(pendingRoutesToCloseProvider);
      return AsyncData(route);
    });
  }
}

/// Loads the most recent override for a given visit, regardless of status
/// (pending/approved/rejected/expired). Used by the visit detail screen
/// to show a status banner and to decide whether the clock-in button can
/// bypass the geofence check — a decision consequential enough that a
/// stale local snapshot isn't good enough. The local record is only the
/// starting point; if one exists, this actively re-checks its status
/// with the backend (same "don't trust a possibly-stale cached value for
/// a security-relevant gate" principle already applied to biometric
/// status — see biometricStatusProvider) before returning it, same as
/// GeofenceOverrideNotifier.loadExistingForVisit.
@riverpod
Future<GeofenceOverrideRequest?> overrideForVisit(
  Ref ref,
  String visitLocalId,
) async {
  final repo = ref.read(outletVisitRepositoryProvider);
  final result = await repo.getLatestOverrideForVisit(visitLocalId);
  final existing = result.fold((_) => null, (v) => v);
  if (existing == null) return null;

  final refreshed = await repo.refreshOverrideStatus(existing.localId);
  // Fail open on the freshness check — offline shouldn't hide a perfectly
  // valid locally-cached override; the backend's own clock-in-side
  // validation is the real backstop if this guess is stale.
  return refreshed.fold((_) => existing, (updated) => updated);
}

/// Notifier for geofence override request.
@riverpod
class GeofenceOverrideNotifier extends _$GeofenceOverrideNotifier {
  @override
  AsyncValue<GeofenceOverrideRequest?> build() => const AsyncData(null);

  /// Restore any saved override for [visitLocalId] on screen open, so
  /// state survives app restarts and (for an override approved/rejected
  /// from a different session — e.g. by a supervisor — since this device
  /// last synced) reflects reality rather than a stale local guess.
  ///
  /// Two bugs fixed here, confirmed on-device: this used to call
  /// `getOverrideForVisit`, which only looks up a *pending* override
  /// locally — so once approved (no longer pending), this found nothing,
  /// state stayed null, and the screen showed the "Request Override" form
  /// again even though VisitDetailScreen's own banner (backed by
  /// `getLatestOverrideForVisit`, status-agnostic) was correctly showing
  /// "Override Approved". Switched to the same status-agnostic lookup.
  /// Second, a local record — even found — can itself be stale (the
  /// approval may have happened server-side without a subsequent local
  /// sync); actively re-check with the backend rather than trusting the
  /// local snapshot for a decision this consequential (whether the
  /// geofence check gets bypassed at clock-in).
  Future<void> loadExistingForVisit(String visitLocalId) async {
    final repo = ref.read(outletVisitRepositoryProvider);
    final result = await repo.getLatestOverrideForVisit(visitLocalId);
    // See RouteActivationNotifier.activate's matching comment — same
    // Riverpod 3.x disposal-race, same fix — checked after every await
    // below, not just the first.
    if (!ref.mounted) return;
    final existing = result.fold((_) => null, (v) => v);
    if (existing == null || state.value != null) return;

    state = AsyncData(existing);

    final refreshed = await repo.refreshOverrideStatus(existing.localId);
    if (!ref.mounted) return;
    refreshed.fold(
      // Fail open on the freshness check itself — offline shouldn't wipe
      // out the local value just loaded; the backend's own clock-in-side
      // validation is the real backstop if this guess is stale.
      (_) {},
      (updated) {
        if (state.value?.localId == existing.localId) {
          state = AsyncData(updated);
        }
      },
    );
  }

  Future<void> requestOverride({
    required String visitLocalId,
    required double latitude,
    required double longitude,
    required double accuracyMeters,
    required String reason,
  }) async {
    state = const AsyncLoading();
    final useCase = ref.read(requestGeofenceOverrideUseCaseProvider);
    final result = await useCase.call(
      visitLocalId: visitLocalId,
      latitude: latitude,
      longitude: longitude,
      accuracyMeters: accuracyMeters,
      reason: reason,
    );
    // See RouteActivationNotifier.activate's matching comment — same
    // Riverpod 3.x disposal-race, same fix.
    if (!ref.mounted) return;
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (request) => AsyncData(request),
    );
  }

  Future<void> refreshStatus(String overrideLocalId) async {
    state = const AsyncLoading();
    final repo = ref.read(outletVisitRepositoryProvider);
    final result = await repo.refreshOverrideStatus(overrideLocalId);
    if (!ref.mounted) return;
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (request) => AsyncData(request),
    );
  }

  Future<void> clockInWithOverride({
    required String visitLocalId,
    required String overrideLocalId,
    String? verificationId,
    String? deviceId,
    String? notes,
  }) async {
    state = const AsyncLoading();
    final repo = ref.read(outletVisitRepositoryProvider);
    final result = await repo.clockInWithOverride(
      visitLocalId: visitLocalId,
      overrideLocalId: overrideLocalId,
      verificationId: verificationId,
      deviceId: deviceId,
      notes: notes,
    );
    // See RouteActivationNotifier.activate's matching comment — same
    // Riverpod 3.x disposal-race, same fix.
    if (!ref.mounted) return;
    // This returns OutletVisit, not GeofenceOverrideRequest
    // But we want to clear our state and invalidate route
    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
      (visit) {
        state = const AsyncData(null);
        if (ref.mounted) ref.invalidate(todaysRouteProvider);
        if (ref.mounted) ref.invalidate(dayStatusPollProvider);
        // Fire-and-forget: see ClockInNotifier.clockIn for why.
        ref
            .read(backgroundGeolocationServiceProvider)
            .startTracking(
              visitId: visit.localId,
              outletName: visit.outletName,
              outletLatitude: visit.outletLatitude,
              outletLongitude: visit.outletLongitude,
              geofenceRadiusMeters: visit.geofenceRadiusMeters,
            );
      },
    );
  }
}

// ============================================================================
// Lunch Break
// ============================================================================

/// The agent's lunch-break state for today, sourced from
/// [dayStatusPollProvider] — never decided locally. `null` means
/// day-status hasn't loaded yet; a resolved [LunchBreakState.unavailable]
/// is a distinct, real answer from the backend and must not be confused
/// with "still loading" by defaulting one into the other.
@riverpod
LunchBreak? lunchBreak(Ref ref) {
  return ref.watch(dayStatusPollProvider).value?.lunchBreak;
}

/// Notifier for starting/ending today's lunch break.
///
/// This notifier's own [AsyncValue] only drives the Start/End button's
/// loading/error affordance — the lunch state the UI actually *renders*
/// always comes from [lunchBreakProvider]. Both actions reconcile against
/// a freshly-refetched day-status on every outcome, success or failure:
/// a lost response after a real server-side success (or `/end` losing a
/// race against automatic server-side expiry, returning `NO_LUNCH_BREAK`)
/// must never be shown to the agent as a failure when the backend already
/// has it right. Only a failure that *still* reproduces after reconciling
/// is surfaced as a real error.
@riverpod
class LunchBreakNotifier extends _$LunchBreakNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> start({
    double? latitude,
    double? longitude,
    double? accuracyMeters,
  }) async {
    state = const AsyncLoading();
    final repo = ref.read(dailyRouteRepositoryProvider);
    final result = await repo.startLunchBreak(
      latitude: latitude,
      longitude: longitude,
      accuracyMeters: accuracyMeters,
    );
    // See RouteActivationNotifier.activate's matching comment — same
    // Riverpod 3.x disposal-race, same fix — checked again after the
    // inner reconciliation await below, not just here.
    if (!ref.mounted) return;
    await result.fold(
      (failure) async {
        if (ref.mounted) ref.invalidate(dayStatusPollProvider);
        // The reconciliation fetch itself can fail — e.g. the same
        // network outage that broke the original call — and must not be
        // allowed to escape uncaught: that would leave `state` stuck at
        // AsyncLoading() forever (the button staying permanently
        // disabled), which is worse than just surfacing the original
        // failure. Confirmed live: a real ~40s WiFi drop on the test
        // device reproduced exactly this hang before this try/catch was
        // added.
        try {
          final reconciled = await ref.read(dayStatusPollProvider.future);
          if (!ref.mounted) return;
          state = reconciled.lunchBreak.state == LunchBreakState.onBreak
              ? const AsyncData(null)
              : AsyncError(failure, StackTrace.current);
        } catch (_) {
          if (!ref.mounted) return;
          state = AsyncError(failure, StackTrace.current);
        }
      },
      (_) async {
        if (ref.mounted) ref.invalidate(dayStatusPollProvider);
        state = const AsyncData(null);
      },
    );
  }

  Future<void> end() async {
    state = const AsyncLoading();
    final repo = ref.read(dailyRouteRepositoryProvider);
    final result = await repo.endLunchBreak();
    // See RouteActivationNotifier.activate's matching comment — same
    // Riverpod 3.x disposal-race, same fix — checked again after the
    // inner reconciliation await below, not just here.
    if (!ref.mounted) return;
    await result.fold(
      (failure) async {
        if (ref.mounted) ref.invalidate(dayStatusPollProvider);
        // See start()'s matching try/catch — reconciliation itself can
        // fail and must not hang this notifier forever.
        try {
          final reconciled = await ref.read(dayStatusPollProvider.future);
          if (!ref.mounted) return;
          // Covers a lost-response timeout AND the exact end-vs-expiration
          // race (the contract's own NO_LUNCH_BREAK-on-End case): either
          // way, `used` after reconciling means the break is over, which
          // is what End was trying to achieve.
          state = reconciled.lunchBreak.state == LunchBreakState.used
              ? const AsyncData(null)
              : AsyncError(failure, StackTrace.current);
        } catch (_) {
          if (!ref.mounted) return;
          state = AsyncError(failure, StackTrace.current);
        }
      },
      (_) async {
        if (ref.mounted) ref.invalidate(dayStatusPollProvider);
        state = const AsyncData(null);
      },
    );
  }
}
