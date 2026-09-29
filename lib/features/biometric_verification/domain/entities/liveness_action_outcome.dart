import 'package:freezed_annotation/freezed_annotation.dart';

import 'liveness_action.dart';

part 'liveness_action_outcome.freezed.dart';

/// Per-action progress within a running challenge — which action, whether
/// it's been satisfied yet, and how many consecutive qualifying
/// observations have been seen (for the hold-duration requirement; see
/// `BiometricConfig.minConsecutiveHoldFrames`/`minHoldDuration`).
@freezed
class LivenessActionOutcome with _$LivenessActionOutcome {
  const factory LivenessActionOutcome({
    required LivenessAction action,
    @Default(false) bool satisfied,
    @Default(0) int consecutiveQualifyingFrames,
    DateTime? firstQualifyingObservationAt,
  }) = _LivenessActionOutcome;
}
