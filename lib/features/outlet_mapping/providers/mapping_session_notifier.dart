import 'dart:async';
import 'dart:developer' as developer;

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/location/background_geolocation_service.dart';
import '../../../core/network/failures.dart';
import '../../../core/providers/location_providers.dart';
import '../../auth/data/auth_controller.dart';
import '../../auth/data/auth_state.dart';
import '../../daily_route/domain/entities/outlet_visit.dart';
import '../data/models/mapping_response_models.dart';
import '../domain/config/mapping_config.dart';
import '../domain/entities/mapping_enums.dart';
import '../domain/entities/mapping_session.dart';
import '../domain/entities/mapping_ui_state.dart';
import '../services/mapping_recovery_coordinator.dart';
import '../services/mapping_uploader.dart';
import 'outlet_mapping_service_providers.dart';

part 'mapping_session_notifier.g.dart';

/// The `max_samples` guard's seed value on resume (spec §30 of the
/// hardening pass) — local row count is only a correct total because
/// nothing currently deletes `synced` rows during an active session; the
/// backend's own last-known total protects this seed value even if that
/// assumption ever changes. Pulled out as a pure function so this specific
/// fix has a direct unit test without needing to exercise the native
/// plugin or the full notifier.
int resumeSampleCountFloor(int localCount, int? lastKnownServerTotalSamples) {
  final serverTotal = lastKnownServerTotalSamples ?? 0;
  return localCount > serverTotal ? localCount : serverTotal;
}

/// Whether a freshly-reported server sample total should replace the
/// session's cached [MappingSession.lastKnownServerTotalSamples] — only
/// ever moves forward, never backward, and a missing report is a no-op.
bool shouldUpdateServerTotal(int? currentKnownTotal, int? reportedTotal) {
  if (reportedTotal == null) return false;
  return (currentKnownTotal ?? 0) < reportedTotal;
}

/// The single long-lived orchestrator for outlet mapping (spec §42).
///
/// `keepAlive: true` is deliberate, matching the exact lesson this
/// codebase already learned the hard way from the biometric feature's
/// notifiers (see their own doc comments): a capture session that must
/// survive navigation, backgrounding, and brief zero-listener gaps cannot
/// use Riverpod's `autoDispose` default. Unlike the biometric notifiers,
/// though, **this one is NOT invalidated by any screen's `dispose()`**
/// (spec §18 — screen ≠ session, a deliberate departure from the
/// biometric feature's own cleanup pattern). It is only ever invalidated
/// by [_maybeCleanupAfterTerminal] once local state is genuinely terminal
/// AND every sample for that footprint has synced (or was intentionally
/// discarded).
///
/// Owns: the active [MappingSession], starting/resuming/finishing/
/// aborting it, the upload queue's opportunistic drain, and GPS
/// mapping-mode on/off — via [MappingRecoveryCoordinator]/[MappingUploader]/
/// [BackgroundGeolocationService], never directly reimplementing any of
/// their jobs. The UI only ever reads [state] and calls the public methods
/// below (spec §19/§80 — widgets dispatch intents, they don't orchestrate
/// repositories themselves).
@Riverpod(keepAlive: true)
class MappingSessionNotifier extends _$MappingSessionNotifier {
  Timer? _opportunisticTimer;
  StreamSubscription<MappingSampleCapturedEvent>? _sampleSub;
  bool _busy = false;

  @override
  MappingSessionUiState build() {
    ref.onDispose(() {
      _opportunisticTimer?.cancel();
      _sampleSub?.cancel();
    });
    return const MappingSessionUiState();
  }

  MappingConfig get _config => ref.read(mappingConfigProvider);
  BackgroundGeolocationService get _locationService =>
      ref.read(backgroundGeolocationServiceProvider);
  MappingUploader get _uploader => ref.read(mappingUploaderProvider);

  String? get _currentUserId {
    final auth = ref.read(authControllerProvider);
    return auth is Authenticated ? auth.user.id.toString() : null;
  }

  /// Spec §32/§88 — called once from the app-startup authenticated-
  /// transition trigger (see `main.dart`'s `_DeviceRegistrationListener`),
  /// and safe to call again any time (e.g. this notifier cold-starting
  /// later than app startup).
  Future<void> recoverForCurrentUser() async {
    final userId = _currentUserId;
    if (userId == null) return;

    final coordinator = MappingRecoveryCoordinator(
      sessionLocalDataSource: ref.read(mappingSessionLocalDataSourceProvider),
      sampleLocalDataSource: ref.read(mappingSampleLocalDataSourceProvider),
      repository: ref.read(outletMappingRepositoryProvider),
      locationService: _locationService,
    );

    final result = await coordinator.recover(userId);
    _applyRecoveryResult(result);
  }

  void _applyRecoveryResult(MappingRecoveryResult result) {
    switch (result) {
      case MappingRecoveryResumable(:final session, :final promptExplicitResume):
        state = MappingSessionUiState(
          session: session,
          showResumePrompt: promptExplicitResume,
        );
        developer.log(
          '[MappingSessionNotifier] recovery: resumable footprint=${session.footprintId} '
          'promptExplicitResume=$promptExplicitResume',
          name: 'MappingSessionNotifier',
        );
        // MappingSessionUiState's constructor above defaults
        // localSampleCount/pendingUploadCount to 0 — accurate only for a
        // BRAND NEW session (startMapping() seeds them explicitly). On
        // recovery this is a real, already-captured session; the trail
        // view already reads real counts straight from Isar (never went
        // through this state), which is what surfaced this gap. Seed both
        // from what's actually persisted rather than leaving the UI
        // showing 0/0 until the next opportunistic upload tick happens to
        // call _refreshPendingCount.
        unawaited(_seedCountsAfterRecovery(session));
        if (!promptExplicitResume) {
          // Local state already past active walking (e.g. was
          // uploadPending/submitting when interrupted) — resume draining
          // toward /finish automatically, no employee action needed.
          unawaited(_resumeUploadTowardFinish(session));
        }
      case MappingRecoveryTerminal(:final session, :final resolvedState, :final failureCode, :final failureMessage):
        final updated = session.copyWith(
          localState: resolvedState,
          failureCode: failureCode,
          failureMessage: failureMessage,
          updatedAt: DateTime.now(),
        );
        state = MappingSessionUiState(session: updated);
        developer.log(
          '[MappingSessionNotifier] recovery: terminal footprint=${session.footprintId} '
          'resolvedState=$resolvedState',
          name: 'MappingSessionNotifier',
        );
        unawaited(_persistAndMaybeCleanup(updated));
      case MappingRecoveryError(:final session, :final message):
        state = MappingSessionUiState(session: session, errorMessage: message);
        developer.log(
          '[MappingSessionNotifier] recovery: error footprint=${session.footprintId} message=$message',
          name: 'MappingSessionNotifier',
        );
      case MappingRecoveryNone():
        state = const MappingSessionUiState();
    }
  }

  /// Spec §33 — refuses to start a second concurrent session locally.
  Future<bool> hasActiveSessionForVisit(String visitLocalId) async {
    final userId = _currentUserId;
    if (userId == null) return false;
    final existing =
        await ref.read(mappingSessionLocalDataSourceProvider).getActiveForUser(userId);
    return existing != null && existing.visitLocalId == visitLocalId;
  }

  /// Spec §15/§84 — network required to start; never creates a fake local
  /// footprint if the request fails.
  Future<bool> startMapping({
    required int requestId,
    required OutletVisit visit,
  }) async {
    if (_busy) return false;
    final userId = _currentUserId;
    if (userId == null) return false;

    // Backend `visit_id` is an integer field on the request body (spec §E
    // of the hardening report — confirmed by direct precedent elsewhere
    // in this codebase against the same backend, not guessed). A visit
    // that can offer mapping already came from a backend response (it has
    // a `mappingRequest`), so `serverId` should always be a parseable
    // backend id in practice — this guard exists purely so a genuinely
    // unsynced visit fails with a clear message instead of a raw
    // FormatException crash.
    final visitServerId = int.tryParse(visit.serverId ?? '');
    if (visitServerId == null) {
      state = state.copyWith(
        errorMessage: 'This visit has not finished syncing yet — please try again shortly.',
      );
      return false;
    }

    _setBusy(true);
    try {
      final result = await ref
          .read(outletMappingRepositoryProvider)
          .startCapture(requestId: requestId, visitId: visitServerId);

      return await result.fold(
        (failure) async {
          state = state.copyWith(errorMessage: failure.displayMessage);
          developer.log(
            '[MappingSessionNotifier] startMapping failed: ${failure.displayMessage}',
            name: 'MappingSessionNotifier',
          );
          return false;
        },
        (response) async {
          final localDataSource = ref.read(mappingSessionLocalDataSourceProvider);
          final sampleLocalDataSource = ref.read(mappingSampleLocalDataSourceProvider);

          final localHighestSequence =
              await sampleLocalDataSource.getHighestSequence(response.footprintId);
          final localCount =
              await sampleLocalDataSource.countAllForFootprint(response.footprintId);

          var nextSequence = localHighestSequence + 1;
          var currentCount = localCount;
          var startedAt = DateTime.now();
          int? lastKnownServerTotalSamples;

          // `resumed: true` means the backend reconnected this call to an
          // ALREADY-OPEN footprint rather than minting a new one — most
          // commonly after the app was uninstalled and reinstalled,
          // wiping the local Isar state that would otherwise carry this.
          // Reconcile against the backend's own view rather than starting
          // the count/sequence/elapsed-timer blind at zero. Best-effort:
          // a reconciliation failure still lets mapping start, just
          // without the reconciled seed (falls back to local-only
          // numbers — the pre-existing behavior).
          if (response.resumed) {
            final statusResult = await ref
                .read(outletMappingRepositoryProvider)
                .getCaptureStatus(response.footprintId);
            statusResult.fold(
              (failure) => developer.log(
                '[MappingSessionNotifier] resumed=true but capture-status reconciliation '
                'failed: ${failure.displayMessage}',
                name: 'MappingSessionNotifier',
              ),
              (status) {
                currentCount = resumeSampleCountFloor(localCount, status.samplesReceived);
                nextSequence =
                    currentCount > nextSequence ? currentCount : nextSequence;
                startedAt = status.captureStartedAt;
                lastKnownServerTotalSamples = status.samplesReceived;
              },
            );
          }

          final now = DateTime.now();
          final session = MappingSession(
            localId: const Uuid().v4(),
            footprintId: response.footprintId,
            mappingRequestId: requestId,
            visitLocalId: visit.localId,
            outletId: visit.outletId,
            outletCode: visit.outletCode,
            outletName: visit.outletName,
            ownerUserId: userId,
            localState: MappingLocalState.capturing,
            startedAt: startedAt,
            serverTimeAtStart: response.serverTime,
            nextSequence: nextSequence,
            limits: response.limits,
            recommendedIntervalMs: null,
            lastKnownServerTotalSamples: lastKnownServerTotalSamples,
            preMappingDistanceFilter: 50.0, // overwritten below once GPS mode actually starts
            preMappingHeartbeatInterval: 60,
            createdAt: now,
            updatedAt: now,
          );
          await localDataSource.save(session);

          await _locationService.startMappingCapture(
            footprintId: response.footprintId,
            startSequence: nextSequence,
            currentSampleCount: currentCount,
            maxSamples: response.limits.maxSamples,
            minSampleIntervalMs: _config.minSampleIntervalMs,
            mappingDistanceFilterMeters: _config.mappingDistanceFilterMeters,
            duplicateSuppressionMeters: _config.duplicateSuppressionMeters,
          );

          state = MappingSessionUiState(session: session, localSampleCount: currentCount);
          _startListeningToSamples(response.footprintId);
          _startOpportunisticUpload();
          developer.log(
            '[MappingSessionNotifier] mapping started footprint=${response.footprintId} '
            'seededSampleCount=$currentCount maxSamples=${response.limits.maxSamples} '
            'resumed=${response.resumed}',
            name: 'MappingSessionNotifier',
          );
          return true;
        },
      );
    } finally {
      _setBusy(false);
    }
  }

  /// Explicit re-entry after cold-start recovery found a still-`CAPTURING`
  /// footprint (spec §56) — never automatic.
  Future<void> resumeMapping() async {
    final session = state.session;
    if (session == null) return;

    final sampleLocalDataSource = ref.read(mappingSampleLocalDataSourceProvider);
    final nextSequence = await sampleLocalDataSource.getHighestSequence(session.footprintId) + 1;
    final localCount = await sampleLocalDataSource.countAllForFootprint(session.footprintId);
    // Defensive floor (spec §30 of the hardening pass): local row count is
    // only a correct total because nothing currently deletes `synced`
    // rows during an active session — the backend's own last-known total
    // protects this seed value even if that assumption ever changes.
    final currentCount = resumeSampleCountFloor(localCount, session.lastKnownServerTotalSamples);

    await _locationService.startMappingCapture(
      footprintId: session.footprintId,
      startSequence: nextSequence,
      currentSampleCount: currentCount,
      maxSamples: session.limits.maxSamples,
      minSampleIntervalMs: session.recommendedIntervalMs ?? _config.minSampleIntervalMs,
      mappingDistanceFilterMeters: _config.mappingDistanceFilterMeters,
      duplicateSuppressionMeters: _config.duplicateSuppressionMeters,
    );

    final updated = session.copyWith(
      localState: MappingLocalState.capturing,
      nextSequence: nextSequence,
      updatedAt: DateTime.now(),
    );
    await ref.read(mappingSessionLocalDataSourceProvider).save(updated);
    // localSampleCount uses the raw local row count, not the defensive-
    // floor currentCount above — that floor exists purely to protect the
    // native max_samples gate against a hypothetical future where synced
    // rows get deleted mid-session; "readings captured" on screen should
    // reflect what's actually in local storage right now, consistent with
    // how startMapping() seeds this same field.
    state = state.copyWith(
      session: updated,
      showResumePrompt: false,
      localSampleCount: localCount,
    );
    _startListeningToSamples(session.footprintId);
    _startOpportunisticUpload();
    unawaited(_refreshPendingCount(session.footprintId));
    developer.log(
      '[MappingSessionNotifier] mapping resumed footprint=${session.footprintId} '
      'seededSampleCount=$currentCount startSequence=$nextSequence',
      name: 'MappingSessionNotifier',
    );
  }

  /// Spec §47/§49 — stops collecting immediately, restores normal GPS,
  /// then either submits right away (queue already empty) or falls back
  /// to `uploadPending` without blocking the caller.
  Future<void> finishMapping() async {
    final session = state.session;
    if (session == null || _busy) return;
    developer.log(
      '[MappingSessionNotifier] finishMapping footprint=${session.footprintId}',
      name: 'MappingSessionNotifier',
    );
    _setBusy(true);
    try {
      await _locationService.stopMappingCapture();
      _sampleSub?.cancel();
      _opportunisticTimer?.cancel();

      final finishedLocal = session.copyWith(
        localState: MappingLocalState.captureFinishedLocal,
        captureFinishedLocalAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await ref.read(mappingSessionLocalDataSourceProvider).save(finishedLocal);
      state = state.copyWith(session: finishedLocal, showResumePrompt: false);

      await _resumeUploadTowardFinish(finishedLocal);
    } finally {
      _setBusy(false);
    }
  }

  /// Drains the queue (bounded by [MappingConfig.finishDrainTimeout], spec
  /// §O) then calls `/finish` if and only if the queue is confirmed empty
  /// — never before (spec §52). Safe to call repeatedly: from
  /// [finishMapping], from recovery, from connectivity restoration, or
  /// from the opportunistic timer while `uploadPending`.
  Future<void> _resumeUploadTowardFinish(MappingSession session) async {
    if (session.localState != MappingLocalState.captureFinishedLocal &&
        session.localState != MappingLocalState.uploadPending) {
      return;
    }

    final drainResult = await _uploader
        .drain(session.footprintId, maxBatch: session.limits.maxBatch)
        .timeout(_config.finishDrainTimeout, onTimeout: () => const MappingDrainResult(
              batchesSent: 0,
              batchesFailed: 0,
              queueEmpty: false,
            ));

    _refreshPendingCount(session.footprintId);
    await _persistServerTotalIfNewer(session, drainResult.lastServerTotalSamples);
    developer.log(
      '[MappingSessionNotifier] drain footprint=${session.footprintId} '
      'batchesSent=${drainResult.batchesSent} batchesFailed=${drainResult.batchesFailed} '
      'queueEmpty=${drainResult.queueEmpty} alreadyInFlight=${drainResult.alreadyInFlight}',
      name: 'MappingSessionNotifier',
    );

    if (drainResult.terminalFailure != null) {
      await _reconcileAfterConflict(session, drainResult.terminalFailure!);
      return;
    }

    if (!drainResult.queueEmpty) {
      final pending = session.copyWith(
        localState: MappingLocalState.uploadPending,
        updatedAt: DateTime.now(),
      );
      await ref.read(mappingSessionLocalDataSourceProvider).save(pending);
      state = state.copyWith(session: pending);
      return;
    }

    await _submitFinish(session);
  }

  Future<void> _submitFinish(MappingSession session) async {
    final submitting = session.copyWith(
      localState: MappingLocalState.submitting,
      updatedAt: DateTime.now(),
    );
    await ref.read(mappingSessionLocalDataSourceProvider).save(submitting);
    state = state.copyWith(session: submitting);

    Either<Failure, FinishCaptureResponse>? outcome;
    try {
      outcome = await ref
          .read(outletMappingRepositoryProvider)
          .finishCapture(session.footprintId)
          .timeout(const Duration(seconds: 15));
    } catch (_) {
      // Timeout or any other transport-level throw — spec §16: ambiguous,
      // never assumed to mean failure. Handled below via
      // finishResultUnknown reconciliation.
      outcome = null;
    }

    if (outcome == null) {
      final unknown = submitting.copyWith(
        localState: MappingLocalState.finishResultUnknown,
        updatedAt: DateTime.now(),
      );
      await ref.read(mappingSessionLocalDataSourceProvider).save(unknown);
      state = state.copyWith(session: unknown);
      await _reconcileFinishResultUnknown(unknown);
      return;
    }

    await outcome.fold(
      (failure) async {
        final unknown = submitting.copyWith(
          localState: MappingLocalState.finishResultUnknown,
          updatedAt: DateTime.now(),
        );
        await ref.read(mappingSessionLocalDataSourceProvider).save(unknown);
        state = state.copyWith(session: unknown);
        await _reconcileFinishResultUnknown(unknown);
      },
      (response) async {
        if (response.status == MappingFootprintStatus.pendingReview) {
          final done = submitting.copyWith(
            localState: MappingLocalState.pendingReview,
            updatedAt: DateTime.now(),
          );
          await ref.read(mappingSessionLocalDataSourceProvider).save(done);
          state = state.copyWith(session: done, finishSummary: response.summary);
          developer.log(
            '[MappingSessionNotifier] /finish -> pendingReview footprint=${session.footprintId}',
            name: 'MappingSessionNotifier',
          );
          await _maybeCleanupAfterTerminal(done);
        } else {
          final failed = submitting.copyWith(
            localState: MappingLocalState.captureFailed,
            failureCode: response.failureCode,
            failureMessage: response.message,
            updatedAt: DateTime.now(),
          );
          await ref.read(mappingSessionLocalDataSourceProvider).save(failed);
          state = state.copyWith(session: failed);
          developer.log(
            '[MappingSessionNotifier] /finish -> captureFailed footprint=${session.footprintId} '
            'code=${response.failureCode}',
            name: 'MappingSessionNotifier',
          );
        }
      },
    );
  }

  /// Spec §16's ambiguous-timeout reconciliation: query capture-status
  /// rather than assume success or failure.
  Future<void> _reconcileFinishResultUnknown(MappingSession session) async {
    final result = await ref.read(outletMappingRepositoryProvider).getCaptureStatus(session.footprintId);
    await result.fold(
      (failure) async {
        state = state.copyWith(errorMessage: failure.displayMessage);
      },
      (status) async {
        switch (status.status) {
          case MappingFootprintStatus.pendingReview:
            final done = session.copyWith(
              localState: MappingLocalState.pendingReview,
              updatedAt: DateTime.now(),
            );
            await ref.read(mappingSessionLocalDataSourceProvider).save(done);
            state = state.copyWith(session: done, finishSummary: status.summary);
            await _maybeCleanupAfterTerminal(done);
          case MappingFootprintStatus.captureFailed:
            final failed = session.copyWith(
              localState: MappingLocalState.captureFailed,
              failureCode: status.failureCode,
              failureMessage: status.message,
              updatedAt: DateTime.now(),
            );
            await ref.read(mappingSessionLocalDataSourceProvider).save(failed);
            state = state.copyWith(session: failed);
          case MappingFootprintStatus.capturing:
            // Backend never actually processed the finish — safe to retry.
            await _submitFinish(session.copyWith(localState: MappingLocalState.uploadPending));
          default:
            final cancelled = session.copyWith(
              localState: MappingLocalState.cancelled,
              updatedAt: DateTime.now(),
            );
            await ref.read(mappingSessionLocalDataSourceProvider).save(cancelled);
            state = state.copyWith(session: cancelled);
        }
      },
    );
  }

  Future<void> _reconcileAfterConflict(MappingSession session, Failure failure) async {
    if (failure is OutletMappingFailure) {
      final code = failure.mapOrNull(conflict: (f) => f.code);
      if (code == 'CAPTURE_ABANDONED') {
        // GPS restoration (spec §27-29 of the hardening pass): this branch
        // is reachable from retryUpload() while the session is still
        // `capturing` — i.e. mapping mode can still be active natively —
        // if the backend abandons the footprint independently (e.g. an
        // admin action) mid-walk. Every other abandon path already stops
        // mapping mode before reaching here (finishMapping/stopMapping
        // call it directly; the recovery coordinator's own resumable path
        // calls _ensureNormalConfig first); this call makes the same
        // guarantee true here too. Idempotent/no-op if already stopped.
        await _locationService.stopMappingCapture();
        _sampleSub?.cancel();
        _opportunisticTimer?.cancel();
        final abandoned = session.copyWith(
          localState: MappingLocalState.abandoned,
          updatedAt: DateTime.now(),
        );
        await ref.read(mappingSessionLocalDataSourceProvider).save(abandoned);
        await ref.read(mappingSampleLocalDataSourceProvider).deleteUnsentForFootprint(session.footprintId);
        state = state.copyWith(session: abandoned, errorMessage: failure.displayMessage);
        return;
      }
    }
    // CAPTURE_NOT_OPEN / VISIT_NOT_IN_PROGRESS or anything else conflict-
    // shaped — reconcile via capture-status rather than guessing (spec
    // §30).
    await _reconcileFinishResultUnknown(session);
  }

  /// Spec §58 — deliberate abandon, discards unsent local evidence, keeps
  /// synced rows as server-side audit trail.
  Future<void> stopMapping() async {
    final session = state.session;
    if (session == null || _busy) return;
    developer.log(
      '[MappingSessionNotifier] stopMapping (abandon) footprint=${session.footprintId}',
      name: 'MappingSessionNotifier',
    );
    _setBusy(true);
    try {
      await _locationService.stopMappingCapture();
      _sampleSub?.cancel();
      _opportunisticTimer?.cancel();

      final result = await ref.read(outletMappingRepositoryProvider).abandonCapture(session.footprintId);
      await ref.read(mappingSampleLocalDataSourceProvider).deleteUnsentForFootprint(session.footprintId);

      final abandoned = session.copyWith(
        localState: MappingLocalState.abandoned,
        updatedAt: DateTime.now(),
      );
      await ref.read(mappingSessionLocalDataSourceProvider).save(abandoned);

      result.fold(
        (failure) {
          // Best-effort — local intent (stop collecting, discard unsent
          // rows) already happened regardless of whether the network call
          // reached the backend (spec §64's "don't pretend abandon
          // succeeded" is about NOT claiming server confirmation when it
          // didn't happen, not about blocking the local intent).
          state = state.copyWith(
            session: abandoned,
            errorMessage: 'Could not confirm with the server yet — will retry automatically.',
          );
        },
        (_) {
          state = state.copyWith(session: abandoned);
        },
      );
    } finally {
      _setBusy(false);
    }
  }

  /// Spec §70/§L — called from `ActiveVisitScreen`'s clock-out dialog for
  /// the "Finish Mapping & Clock Out" choice.
  Future<void> finishMappingForClockOut() => finishMapping();

  /// Spec §70/§L — "Stop Mapping & Clock Out" choice.
  Future<void> stopMappingForClockOut() => stopMapping();

  /// Manual retry / opportunistic drain trigger (spec §31/§65) — safe to
  /// call from a connectivity-restored listener, a periodic timer, or a
  /// manual "Retry" tap; the uploader's own in-flight guard (spec §66)
  /// makes concurrent calls collapse to one drain.
  Future<void> retryUpload() async {
    final session = state.session;
    if (session == null) return;
    if (session.localState == MappingLocalState.capturing) {
      final result = await _uploader.drain(session.footprintId, maxBatch: session.limits.maxBatch);
      _refreshPendingCount(session.footprintId);
      await _persistServerTotalIfNewer(session, result.lastServerTotalSamples);
      if (result.terminalFailure != null) {
        await _reconcileAfterConflict(session, result.terminalFailure!);
      }
      return;
    }
    await _resumeUploadTowardFinish(session);
  }

  /// Keeps `MappingSession.lastKnownServerTotalSamples` current — the
  /// defensive floor `resumeMapping()` uses for the `max_samples` guard
  /// (spec §30 of the hardening pass). Only ever increases; a batch
  /// response can't report fewer samples than the backend already had.
  Future<void> _persistServerTotalIfNewer(MappingSession session, int? reportedTotal) async {
    if (!shouldUpdateServerTotal(session.lastKnownServerTotalSamples, reportedTotal)) return;
    final updated = session.copyWith(lastKnownServerTotalSamples: reportedTotal);
    await ref.read(mappingSessionLocalDataSourceProvider).save(updated);
    if (state.session?.localId == session.localId) {
      state = state.copyWith(session: updated);
    }
  }

  void _startListeningToSamples(int footprintId) {
    _sampleSub?.cancel();
    _sampleSub = _locationService.mappingSampleCapturedEvents.listen((event) {
      if (event.footprintId != footprintId) return;
      state = state.copyWith(localSampleCount: event.totalLocalCount);
      final session = state.session;
      if (session != null) {
        final updated = session.copyWith(lastSampleAt: event.recordedAt);
        state = state.copyWith(session: updated);
      }
    });
  }

  void _startOpportunisticUpload() {
    _opportunisticTimer?.cancel();
    _opportunisticTimer = Timer.periodic(_config.opportunisticUploadInterval, (_) {
      final session = state.session;
      if (session == null || session.localState != MappingLocalState.capturing) return;
      unawaited(retryUpload());
    });
  }

  Future<void> _refreshPendingCount(int footprintId) async {
    final count =
        await ref.read(mappingSampleLocalDataSourceProvider).countPendingForFootprint(footprintId);
    state = state.copyWith(pendingUploadCount: count);
  }

  /// Seeds `localSampleCount`/`pendingUploadCount` from what's actually
  /// persisted right after recovery constructs a fresh
  /// `MappingSessionUiState` (which defaults both to 0) — see the call
  /// site's comment. Guards against a session switch racing this async
  /// read, same pattern as `_persistServerTotalIfNewer`.
  Future<void> _seedCountsAfterRecovery(MappingSession session) async {
    final sampleLocalDataSource = ref.read(mappingSampleLocalDataSourceProvider);
    final localCount = await sampleLocalDataSource.countAllForFootprint(session.footprintId);
    final pendingCount =
        await sampleLocalDataSource.countPendingForFootprint(session.footprintId);
    if (state.session?.localId == session.localId) {
      state = state.copyWith(localSampleCount: localCount, pendingUploadCount: pendingCount);
    }
  }

  Future<void> _persistAndMaybeCleanup(MappingSession session) async {
    await ref.read(mappingSessionLocalDataSourceProvider).save(session);
    await _maybeCleanupAfterTerminal(session);
  }

  /// Spec §18's explicit cleanup condition, stated precisely: only once
  /// local state is terminal AND every sample for that footprint has
  /// synced (or was intentionally discarded for `cancelled`/`abandoned`).
  /// Navigation, backgrounding, and screen disposal are never cleanup
  /// events — see this class's own doc comment.
  Future<void> _maybeCleanupAfterTerminal(MappingSession session) async {
    if (!session.localState.isTerminal) return;
    final pending =
        await ref.read(mappingSampleLocalDataSourceProvider).countPendingForFootprint(session.footprintId);
    if (pending > 0) return;
    developer.log(
      '[MappingSessionNotifier] session terminal and fully synced, footprint=${session.footprintId}',
      name: 'MappingSessionNotifier',
    );
    // State intentionally left as-is (terminal, for the result screen to
    // read) — actual row retention/deletion is §G's separate policy, not
    // this notifier's job.
  }

  void _setBusy(bool value) {
    _busy = value;
    state = state.copyWith(isBusy: value);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}
