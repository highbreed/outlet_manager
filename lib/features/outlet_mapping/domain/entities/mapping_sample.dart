import 'package:freezed_annotation/freezed_annotation.dart';

import 'mapping_enums.dart';

part 'mapping_sample.freezed.dart';

/// A single GPS observation captured during an outlet-mapping session.
/// Optional diagnostic fields are only ever populated when the plugin
/// actually supplied them — never defaulted/synthesized (spec §26).
@freezed
class MappingSample with _$MappingSample {
  const factory MappingSample({
    /// Local UUID — Isar row identity, distinct from [clientSampleId].
    required String localId,
    required int footprintId,

    /// Immutable once generated (spec §11/§23) — the backend dedup key,
    /// together with footprintId. Never regenerated on retry.
    required String clientSampleId,

    /// Monotonic within a footprint (spec §24) — tie-breaker for equal
    /// `recorded_at`.
    required int sequence,

    required double latitude,
    required double longitude,
    required double accuracyM,
    required DateTime recordedAt,

    // Diagnostic only — never read for any accept/reject/enforcement
    // decision anywhere in this feature. See spec §6.
    double? altitudeM,
    double? verticalAccuracyM,
    String? floorLabel,
    double? speedMps,
    double? headingDeg,
    String? provider,
    bool? isMock,

    @Default(MappingSampleSyncState.pending) MappingSampleSyncState syncState,
    @Default(0) int attemptCount,
    DateTime? lastAttemptAt,
    String? lastError,

    required DateTime createdAt,
  }) = _MappingSample;
}
