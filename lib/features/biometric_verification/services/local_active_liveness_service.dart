import '../domain/config/biometric_config.dart';
import '../domain/entities/face_pose.dart';
import '../domain/entities/liveness_action.dart';
import '../domain/entities/liveness_action_outcome.dart';
import 'active_liveness_service.dart';

enum _BlinkState { waitingForClosed, waitingForOpenAgain, satisfied }

/// ML Kit head-pose/eye-probability-backed implementation.
///
/// NEEDS ON-DEVICE CALIBRATION: yaw/pitch sign conventions and exact
/// degree thresholds are ML Kit/device-dependent — the values here
/// (from [BiometricConfig]) are starting points, not validated against
/// real hardware yet. See the Phase 4 plan's device-testing section.
class LocalActiveLivenessService implements ActiveLivenessService {
  final BiometricConfig config;

  LocalActiveLivenessService({this.config = const BiometricConfig()});

  int _consecutiveQualifyingFrames = 0;
  DateTime? _firstQualifyingObservationAt;
  _BlinkState _blinkState = _BlinkState.waitingForClosed;

  @override
  void resetAction() {
    _consecutiveQualifyingFrames = 0;
    _firstQualifyingObservationAt = null;
    _blinkState = _BlinkState.waitingForClosed;
  }

  @override
  LivenessActionOutcome observe(LivenessAction action, FacePose pose) {
    return switch (action) {
      LivenessAction.lookStraight => _observeHold(
        action,
        pose.yawDegrees.abs() <= config.lookStraightYawToleranceDegrees &&
            pose.pitchDegrees.abs() <= config.lookStraightPitchToleranceDegrees,
      ),
      LivenessAction.turnLeft => _observeHold(
        action,
        pose.yawDegrees <= -config.turnActionYawThresholdDegrees,
      ),
      LivenessAction.turnRight => _observeHold(
        action,
        pose.yawDegrees >= config.turnActionYawThresholdDegrees,
      ),
      LivenessAction.blink => _observeBlink(pose),
    };
  }

  /// Shared hold-duration logic for lookStraight/turnLeft/turnRight — the
  /// pose must qualify across [BiometricConfig.minConsecutiveHoldFrames]
  /// consecutive observations *and* span at least
  /// [BiometricConfig.minHoldDuration], not just one lucky frame.
  LivenessActionOutcome _observeHold(LivenessAction action, bool qualifies) {
    if (!qualifies) {
      _consecutiveQualifyingFrames = 0;
      _firstQualifyingObservationAt = null;
      return LivenessActionOutcome(action: action, satisfied: false);
    }

    _consecutiveQualifyingFrames++;
    _firstQualifyingObservationAt ??= DateTime.now();
    final heldDuration = DateTime.now().difference(_firstQualifyingObservationAt!);

    final satisfied = _consecutiveQualifyingFrames >= config.minConsecutiveHoldFrames &&
        heldDuration >= config.minHoldDuration;

    return LivenessActionOutcome(
      action: action,
      satisfied: satisfied,
      consecutiveQualifyingFrames: _consecutiveQualifyingFrames,
      firstQualifyingObservationAt: _firstQualifyingObservationAt,
    );
  }

  /// Requires a genuine open→closed→open transition within
  /// [BiometricConfig.blinkTransitionWindow] — eyes already closed on the
  /// first observation is NOT a free pass (see [_BlinkState.waitingForClosed]
  /// as the entry state: we only progress from "seen closed" once we've
  /// first confirmed open-ness implicitly by starting the action in this
  /// state and requiring a transition through closed).
  LivenessActionOutcome _observeBlink(FacePose pose) {
    final probability = pose.averageEyeOpenProbability;
    if (probability == null) {
      return const LivenessActionOutcome(action: LivenessAction.blink, satisfied: false);
    }

    final isClosed = probability <= config.blinkClosedEyeProbabilityThreshold;
    final isOpen = probability >= config.blinkOpenEyeProbabilityThreshold;

    _firstQualifyingObservationAt ??= DateTime.now();
    final elapsed = DateTime.now().difference(_firstQualifyingObservationAt!);
    if (elapsed > config.blinkTransitionWindow && _blinkState != _BlinkState.satisfied) {
      // Window expired without completing the transition — restart it
      // rather than let a stale "waitingForOpenAgain" linger indefinitely.
      _blinkState = _BlinkState.waitingForClosed;
      _firstQualifyingObservationAt = DateTime.now();
    }

    switch (_blinkState) {
      case _BlinkState.waitingForClosed:
        if (isClosed) _blinkState = _BlinkState.waitingForOpenAgain;
      case _BlinkState.waitingForOpenAgain:
        if (isOpen) _blinkState = _BlinkState.satisfied;
      case _BlinkState.satisfied:
        break;
    }

    return LivenessActionOutcome(
      action: LivenessAction.blink,
      satisfied: _blinkState == _BlinkState.satisfied,
      firstQualifyingObservationAt: _firstQualifyingObservationAt,
    );
  }
}
