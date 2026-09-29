import 'package:freezed_annotation/freezed_annotation.dart';

import 'biometric_error_reason.dart';
import 'biometric_phase.dart';
import 'face_pose.dart';
import 'face_quality_result.dart';
import 'liveness_action_outcome.dart';
import 'liveness_challenge.dart';

part 'biometric_capture_state.freezed.dart';

/// The full, typed state of an in-progress biometric capture —
/// [BiometricCaptureNotifier]'s state shape. No UI copy anywhere in here;
/// the presentation layer converts [phase]/[errorReason] to user-facing
/// text.
@freezed
class BiometricCaptureState with _$BiometricCaptureState {
  const factory BiometricCaptureState({
    required String captureSessionId,
    @Default(BiometricPhase.idle) BiometricPhase phase,
    LivenessChallenge? challenge,
    @Default(0) int currentActionIndex,
    @Default([]) List<LivenessActionOutcome> actionOutcomes,
    FacePose? currentFacePose,
    FaceQualityResult? currentQuality,
    BiometricErrorReason? errorReason,
    String? verificationRequestId,
    String? verificationId,
  }) = _BiometricCaptureState;

  const BiometricCaptureState._();

  bool get isTerminal =>
      phase == BiometricPhase.verified ||
      phase == BiometricPhase.rejected ||
      phase == BiometricPhase.error;

  LivenessActionOutcome? get currentActionOutcome =>
      currentActionIndex < actionOutcomes.length
          ? actionOutcomes[currentActionIndex]
          : null;
}
