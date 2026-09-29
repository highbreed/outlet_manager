/// Every tunable value for the biometric capture/liveness pipeline,
/// centralized so nothing is scattered as magic numbers through the
/// services/notifiers/widgets that use them. All are constructor
/// parameters with the documented defaults — not fixed field
/// initializers — specifically so tests and, later, a real device-tuning
/// pass can override individual values without subclassing.
///
/// All defaults below are **starting points requiring real-device
/// tuning** (Honeywell + Samsung, varying lighting) — not final
/// recognition parameters. See the "Phase 4" plan's "BiometricConfig
/// starting defaults" section for the reasoning behind each group.
class BiometricConfig {
  const BiometricConfig({
    // Alignment tolerances (degrees) — how far off-center a pose can be
    // and still count as "aligned enough to proceed".
    this.alignedYawToleranceDegrees = 15.0,
    this.alignedPitchToleranceDegrees = 15.0,
    this.alignedRollToleranceDegrees = 20.0,

    // Liveness action thresholds.
    //
    // turnActionYawThresholdDegrees recalibrated twice from live on-device
    // data (SM-A165F): first 30.0 -> 15.0 (a natural, unprompted "turn
    // your head left/right" peaked around 13 degrees, nowhere near the
    // original 30). Separately, a real sign-convention bug in ML Kit's
    // raw yaw (see MlkitFaceDetectionService._toFacePose) was also fixed;
    // once corrected, turnRight's yaw was consistently positive as
    // expected but still topped out around 13 degrees — just short of
    // 15.0. Lowered to 10.0 to give real margin over that observed 9-13
    // degree range while still requiring a deliberate turn (ordinary head
    // jitter/alignment noise stays under ~5 degrees, well clear of this).
    this.turnActionYawThresholdDegrees = 10.0,
    this.lookStraightYawToleranceDegrees = 10.0,
    this.lookStraightPitchToleranceDegrees = 10.0,
    // Lowered 5 -> 3 frames / 500ms -> 350ms: on-device data showed
    // people naturally turn-and-release rather than sustain a pose
    // (crossing the yaw threshold for only 1-2 frames), even after fixing
    // the sign bug and lowering the threshold itself. Paired with the
    // "...and hold" copy change in LivenessInstructionBanner, which
    // addresses the same root cause from the UX side.
    this.minConsecutiveHoldFrames = 3,
    this.minHoldDuration = const Duration(milliseconds: 350),
    this.blinkClosedEyeProbabilityThreshold = 0.35,
    this.blinkOpenEyeProbabilityThreshold = 0.65,
    this.blinkTransitionWindow = const Duration(milliseconds: 1500),

    // Face size / position, expressed as ratios so they're
    // resolution-independent.
    this.minFaceAreaRatio = 0.08,
    this.maxFaceAreaRatio = 0.65,
    this.faceCenterToleranceRatio = 0.15,

    // Image quality.
    this.minBrightness = 60, // 0-255 luma
    this.maxBrightness = 200,
    // Blur variance check starts disabled — adds CPU cost on low-end
    // hardware; enable only if device testing shows it's needed beyond
    // what liveness hold-duration naturally filters out.
    this.minBlurVarianceThreshold,

    // Frame throttling — detection cadence, not the camera's own frame rate.
    this.frameAnalysisInterval = const Duration(milliseconds: 150),

    // Challenge.
    this.challengeTimeout = const Duration(seconds: 30),
    this.challengeActionCount = 3, // sampled without replacement from the 4-action set

    // Capture/output. Recognition quality matters more than hitting an
    // exact byte count — encode once at captureJpegQuality and accept
    // the result; never loop stepping quality down to force a byte
    // ceiling.
    this.captureJpegQuality = 85,
    this.targetOutputLongSidePx = 480, // within the 300-600px band
    this.cropPaddingRatio = 0.4,
    this.idealMaxOutputBytes = 300000, // ~300KB — ideal band ceiling
    this.acceptableMaxOutputBytes = 500000, // ~500KB — still fine, logged not enforced

    // Verification token validity — placeholder, real value decided
    // during backend implementation (balances slow-network tolerance
    // against limiting replay value if a verification_id ever leaked).
    this.verificationTokenValidity = const Duration(minutes: 2),
  });

  final double alignedYawToleranceDegrees;
  final double alignedPitchToleranceDegrees;
  final double alignedRollToleranceDegrees;

  final double turnActionYawThresholdDegrees;
  final double lookStraightYawToleranceDegrees;
  final double lookStraightPitchToleranceDegrees;
  final int minConsecutiveHoldFrames;
  final Duration minHoldDuration;
  final double blinkClosedEyeProbabilityThreshold;
  final double blinkOpenEyeProbabilityThreshold;
  final Duration blinkTransitionWindow;

  final double minFaceAreaRatio;
  final double maxFaceAreaRatio;
  final double faceCenterToleranceRatio;

  final int minBrightness;
  final int maxBrightness;
  final double? minBlurVarianceThreshold;

  final Duration frameAnalysisInterval;

  final Duration challengeTimeout;
  final int challengeActionCount;

  final int captureJpegQuality;
  final int targetOutputLongSidePx;
  final double cropPaddingRatio;
  final int idealMaxOutputBytes;
  final int acceptableMaxOutputBytes;

  final Duration verificationTokenValidity;
}
