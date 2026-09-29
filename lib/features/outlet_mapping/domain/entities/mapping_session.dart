import 'package:freezed_annotation/freezed_annotation.dart';

import 'mapping_capture_limits.dart';
import 'mapping_enums.dart';

part 'mapping_session.freezed.dart';

/// The durable local record of one mapping capture attempt (spec §18).
/// At most one non-terminal row exists locally at a time (spec §33). This
/// is the notifier's persisted state — [MappingLocalState] is the state
/// machine; everything else here is context needed to act on that state
/// (recovery, ownership, restoration, UI display) without a network round
/// trip.
@freezed
class MappingSession with _$MappingSession {
  const MappingSession._();

  const factory MappingSession({
    required String localId,
    required int footprintId,
    required int mappingRequestId,
    required String visitLocalId,

    // Denormalized for the resume/recovery UI — never used for any
    // decision, display only.
    required String outletId,
    required String outletCode,
    required String outletName,

    /// Security-critical (spec §19/§95) — every session belongs to exactly
    /// one authenticated user; recovery/upload/finish/abandon all check
    /// this against the CURRENT session before acting.
    required String ownerUserId,

    required MappingLocalState localState,

    required DateTime startedAt,
    DateTime? serverTimeAtStart,
    DateTime? lastSampleAt,
    DateTime? captureFinishedLocalAt,

    /// Cached, but never blindly trusted — recomputed from actual
    /// [MappingSample] rows on every cold-start recovery (spec §24).
    @Default(0) int nextSequence,

    required MappingCaptureLimits limits,
    int? recommendedIntervalMs,

    /// The backend's own `total_samples`/`samples_received` figure, from
    /// the most recent `/samples` or `/capture-status` response — used as
    /// a defensive floor (`max(localCount, this)`) when seeding the
    /// `max_samples` guard on resume. Local row count alone is only a
    /// correct total today because nothing currently deletes `synced`
    /// rows during an active session; this field means that stays true
    /// even if a future retention/cleanup pass starts deleting them.
    int? lastKnownServerTotalSamples,

    /// Exact snapshot to restore on exit from mapping mode — never
    /// hardcoded assumptions (spec §5/§6/§36/§37).
    required double preMappingDistanceFilter,
    required double preMappingHeartbeatInterval,
    Map<String, dynamic>? preMappingExtras,

    @Default(1) int configVersion,

    MappingFailureCode? failureCode,
    String? failureMessage,

    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MappingSession;

  /// Whether the mapping GPS consumer should be actively sampling for this
  /// session right now.
  bool get isActivelyCapturing => localState.isActivelyCapturing;

  /// Whether this session still needs an upload-queue drain attempted.
  bool get needsUploadAttempt =>
      localState == MappingLocalState.uploadPending ||
      localState == MappingLocalState.capturing;
}
