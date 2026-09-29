import 'dart:developer' as developer;

import '../../../core/location/background_geolocation_service.dart';
import '../data/datasources/mapping_sample_local_datasource.dart';
import '../data/datasources/mapping_session_local_datasource.dart';
import '../domain/entities/mapping_enums.dart';
import '../domain/entities/mapping_session.dart';
import '../domain/repositories/outlet_mapping_repository.dart';

/// The four recovery jobs kept as one small, independently-testable class
/// rather than folded into `MappingSessionNotifier` (spec §31): cold-start
/// discovery, backend reconciliation, location-config restoration, and
/// queue resumption. `MappingSessionNotifier.build()` calls this and
/// nothing else on cold start — this class has no Riverpod dependency
/// itself, so it's testable against fakes with no provider scaffolding.
class MappingRecoveryCoordinator {
  final MappingSessionLocalDataSource _sessionLocalDataSource;
  final MappingSampleLocalDataSource _sampleLocalDataSource;
  final OutletMappingRepository _repository;
  final BackgroundGeolocationService _locationService;

  MappingRecoveryCoordinator({
    required MappingSessionLocalDataSource sessionLocalDataSource,
    required MappingSampleLocalDataSource sampleLocalDataSource,
    required OutletMappingRepository repository,
    required BackgroundGeolocationService locationService,
  })  : _sessionLocalDataSource = sessionLocalDataSource,
        _sampleLocalDataSource = sampleLocalDataSource,
        _repository = repository,
        _locationService = locationService;

  /// Spec §32's exact flow. Called once per app start (from the
  /// authenticated-transition trigger, spec §88) and again whenever
  /// `MappingSessionNotifier` itself cold-starts (e.g. after being
  /// invalidated). Never resumes high-frequency capture mode itself —
  /// that's always the explicit "Resume Mapping" tap (spec §56); this only
  /// restores normal GPS config defensively and figures out what state to
  /// present.
  Future<MappingRecoveryResult> recover(String currentUserId) async {
    final active = await _sessionLocalDataSource.getActiveForUser(currentUserId);
    if (active == null) {
      // Defensive: ensure normal config even with nothing to recover,
      // covering a crash that happened mid-mapping-config change before
      // any session row was even written (spec §J's own flowchart note).
      await _ensureNormalConfig(null);
      return const MappingRecoveryResult.none();
    }

    // Ownership check (spec §19/§95) — getActiveForUser already scoped to
    // currentUserId, so this is a defensive double-check, not the primary
    // gate.
    if (active.ownerUserId != currentUserId) {
      return const MappingRecoveryResult.none();
    }

    final statusResult = await _repository.getCaptureStatus(active.footprintId);

    return statusResult.fold(
      (failure) {
        // 403/404 → not usable by this user (spec §55's "403/404" rule) —
        // treat as terminal/inert, never guess it's still open.
        developer.log(
          '[MappingRecoveryCoordinator] capture-status failed for footprint=${active.footprintId}: '
          '${failure.displayMessage}',
          name: 'MappingRecoveryCoordinator',
        );
        return MappingRecoveryResult.error(active, failure.displayMessage);
      },
      (status) async {
        switch (status.status) {
          case MappingFootprintStatus.capturing:
            // Still open server-side. Local state decides the UX per §55:
            // if the employee had already tapped Finish locally before
            // the interruption, don't ask them to "resume" walking —
            // just resume draining the queue toward /finish. Otherwise,
            // surface the explicit Resume Mapping prompt (§56) — never
            // silently re-enable high-frequency collection.
            await _ensureNormalConfig(active);
            final stillWalking = active.localState == MappingLocalState.capturing ||
                active.localState == MappingLocalState.preparing;
            return MappingRecoveryResult.resumable(active, promptExplicitResume: stillWalking);

          case MappingFootprintStatus.pendingReview:
            await _finalizeTerminal(active);
            return MappingRecoveryResult.terminal(active, MappingLocalState.pendingReview);

          case MappingFootprintStatus.captureFailed:
            await _ensureNormalConfig(active);
            return MappingRecoveryResult.terminal(
              active,
              MappingLocalState.captureFailed,
              failureCode: status.failureCode,
              failureMessage: status.message,
            );

          case MappingFootprintStatus.abandoned:
            await _finalizeAbandoned(active);
            return MappingRecoveryResult.terminal(active, MappingLocalState.abandoned);

          case MappingFootprintStatus.active:
          case MappingFootprintStatus.rejected:
          case MappingFootprintStatus.superseded:
            // Server-terminal, nothing further for this app to do (spec
            // §55) — clean local operational state.
            await _finalizeTerminal(active);
            return MappingRecoveryResult.terminal(active, MappingLocalState.cancelled);
        }
      },
    );
  }

  Future<void> _ensureNormalConfig(MappingSession? session) async {
    if (_locationService.isMappingActive) {
      await _locationService.stopMappingCapture();
    }
  }

  Future<void> _finalizeAbandoned(MappingSession session) async {
    await _locationService.stopMappingCapture();
    await _sampleLocalDataSource.deleteUnsentForFootprint(session.footprintId);
  }

  Future<void> _finalizeTerminal(MappingSession session) async {
    await _locationService.stopMappingCapture();
    // Retention: leave the session/sample rows in place here — §G's
    // retention policy (delete after N days once fully synced) owns
    // actual deletion, not recovery. Recovery only stops the engine.
  }
}

/// What [MappingRecoveryCoordinator.recover] found, for
/// `MappingSessionNotifier` to apply to its own state. Subtypes are public
/// (not the usual private-sealed-subtype convention) specifically because
/// `MappingSessionNotifier` pattern-matches on them from a different
/// library — Dart privacy is per-file, so a private subtype here would be
/// unreachable from there.
sealed class MappingRecoveryResult {
  const MappingRecoveryResult();

  const factory MappingRecoveryResult.none() = MappingRecoveryNone;

  const factory MappingRecoveryResult.resumable(
    MappingSession session, {
    required bool promptExplicitResume,
  }) = MappingRecoveryResumable;

  const factory MappingRecoveryResult.terminal(
    MappingSession session,
    MappingLocalState resolvedState, {
    MappingFailureCode? failureCode,
    String? failureMessage,
  }) = MappingRecoveryTerminal;

  const factory MappingRecoveryResult.error(MappingSession session, String message) =
      MappingRecoveryError;
}

class MappingRecoveryNone extends MappingRecoveryResult {
  const MappingRecoveryNone();
}

class MappingRecoveryResumable extends MappingRecoveryResult {
  final MappingSession session;
  final bool promptExplicitResume;
  const MappingRecoveryResumable(this.session, {required this.promptExplicitResume});
}

class MappingRecoveryTerminal extends MappingRecoveryResult {
  final MappingSession session;
  final MappingLocalState resolvedState;
  final MappingFailureCode? failureCode;
  final String? failureMessage;
  const MappingRecoveryTerminal(
    this.session,
    this.resolvedState, {
    this.failureCode,
    this.failureMessage,
  });
}

class MappingRecoveryError extends MappingRecoveryResult {
  final MappingSession session;
  final String message;
  const MappingRecoveryError(this.session, this.message);
}
