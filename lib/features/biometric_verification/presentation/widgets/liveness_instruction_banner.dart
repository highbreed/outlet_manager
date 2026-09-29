import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

/// Converts typed state ([BiometricPhase]/[BiometricErrorReason]/current
/// [LivenessAction]) to user-facing copy — this conversion belongs here,
/// in the presentation layer, per the Phase 4 plan; domain/service code
/// never produces UI strings directly.
class LivenessInstructionBanner extends StatelessWidget {
  final BiometricCaptureState state;

  const LivenessInstructionBanner({super.key, required this.state});

  /// Static so [BiometricResultView] can reuse the exact same
  /// phase/errorReason -> copy mapping for the terminal state instead of
  /// showing one generic message for every rejection reason.
  static String textFor(BiometricCaptureState state) {
    switch (state.phase) {
      case BiometricPhase.idle:
      case BiometricPhase.initializing:
        return 'Getting ready...';
      case BiometricPhase.waitingForFace:
        return switch (state.errorReason) {
          BiometricErrorReason.multipleFaces => 'Only one person should be visible',
          _ => 'Position your face inside the frame',
        };
      case BiometricPhase.aligning:
        return switch (state.currentQuality?.failureReason) {
          FaceQualityFailureReason.tooDark => 'Find better lighting',
          FaceQualityFailureReason.tooBright => 'Too much light — move to shade',
          FaceQualityFailureReason.faceTooSmall => 'Move closer',
          FaceQualityFailureReason.faceTooLarge => 'Move back',
          FaceQualityFailureReason.notCentered => 'Center your face in the frame',
          FaceQualityFailureReason.excessiveRotation => 'Look straight ahead',
          _ => 'Keep your face inside the frame',
        };
      case BiometricPhase.ready:
        return 'Hold still...';
      case BiometricPhase.challengeRunning:
        final action = state.currentActionOutcome?.action;
        return switch (action) {
          // "...and hold" is load-bearing, not just phrasing: confirmed
          // on-device that without it, people naturally do a quick
          // turn-and-release, crossing the yaw threshold for only 1-2
          // frames — well short of the ~750ms sustained hold
          // minConsecutiveHoldFrames/minHoldDuration require — so the
          // action never registered as satisfied.
          LivenessAction.lookStraight => 'Look straight ahead',
          LivenessAction.turnLeft => 'Turn your head left and hold',
          LivenessAction.turnRight => 'Turn your head right and hold',
          LivenessAction.blink => 'Blink',
          null => 'Hold still...',
        };
      case BiometricPhase.capturing:
        return 'Hold still...';
      case BiometricPhase.processing:
      case BiometricPhase.uploading:
        return 'Verifying...';
      case BiometricPhase.verified:
        return 'Face verified';
      case BiometricPhase.rejected:
      case BiometricPhase.error:
        return switch (state.errorReason) {
          BiometricErrorReason.faceNotMatched =>
            "We couldn't verify your face.\nPlease try again.",
          BiometricErrorReason.challengeExpired =>
            'Liveness check expired.\nPlease try again.',
          BiometricErrorReason.networkUnavailable ||
          BiometricErrorReason.requestTimeout =>
            'Unable to contact the server.\nCheck your connection and try again.',
          BiometricErrorReason.cameraPermissionDenied => 'Camera permission is required.',
          BiometricErrorReason.cameraUnavailable => 'Camera unavailable.',
          BiometricErrorReason.needsRegistration =>
            'Face registration is required.\nPlease register to continue.',
          BiometricErrorReason.contactSupervisor =>
            'Face verification is disabled for your account.\nContact your supervisor.',
          BiometricErrorReason.technicallyUnavailable =>
            'Face verification is temporarily unavailable.\nPlease try again shortly.',
          BiometricErrorReason.rateLimited =>
            'Too many attempts.\nPlease try again shortly.',
          BiometricErrorReason.deviceNotRegistered =>
            'This device is not registered.\nPlease try again.',
          BiometricErrorReason.biometricsDisabled =>
            'Face verification is not available.',
          _ => 'Something went wrong.\nPlease try again.',
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        textFor(state),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
