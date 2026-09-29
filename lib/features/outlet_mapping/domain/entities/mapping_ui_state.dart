import 'package:freezed_annotation/freezed_annotation.dart';

import 'mapping_capture_limits.dart';
import 'mapping_session.dart';

part 'mapping_ui_state.freezed.dart';

/// What `OutletMappingCaptureScreen`/`MappingRequestCard` actually render
/// — derived from [MappingSession] plus a few UI-only fields that don't
/// belong on the persisted session (spec §19 — UI state stays thin and
/// derived, never a parallel source of truth).
@freezed
class MappingSessionUiState with _$MappingSessionUiState {
  const factory MappingSessionUiState({
    MappingSession? session,

    /// True only right after cold-start recovery found a `CAPTURING`
    /// session that was actively being walked when the process died
    /// (spec §56) — cleared the moment the employee taps Resume or Stop.
    @Default(false) bool showResumePrompt,

    /// In-flight guard surfaced to the UI so a button can disable itself
    /// during start/finish/abandon — the actual concurrency guard lives in
    /// the notifier, this is display-only.
    @Default(false) bool isBusy,

    String? errorMessage,
    MappingCaptureSummary? finishSummary,

    @Default(0) int localSampleCount,
    @Default(0) int pendingUploadCount,
  }) = _MappingSessionUiState;
}
