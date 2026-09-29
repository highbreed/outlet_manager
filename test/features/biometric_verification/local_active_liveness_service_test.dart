import 'package:flutter_test/flutter_test.dart';
import 'package:outlet_manager/features/biometric_verification/domain/config/biometric_config.dart';
import 'package:outlet_manager/features/biometric_verification/domain/entities/entities.dart';
import 'package:outlet_manager/features/biometric_verification/services/local_active_liveness_service.dart';

FacePose _pose({
  double yaw = 0,
  double pitch = 0,
  double roll = 0,
  double? leftEyeOpen,
  double? rightEyeOpen,
}) {
  return FacePose(
    boundingBoxLeft: 0,
    boundingBoxTop: 0,
    boundingBoxWidth: 100,
    boundingBoxHeight: 100,
    frameWidth: 400,
    frameHeight: 400,
    yawDegrees: yaw,
    pitchDegrees: pitch,
    rollDegrees: roll,
    leftEyeOpenProbability: leftEyeOpen,
    rightEyeOpenProbability: rightEyeOpen,
    trackingId: 1,
  );
}

void main() {
  // minHoldDuration is intentionally near-zero here — the production
  // default (500ms) is designed around real camera frame arrival timing
  // (~150ms apart), which a synchronous unit test loop doesn't simulate.
  // Keeping it real would make every hold-duration test either slow
  // (needing actual `Future.delayed`s) or flaky; the consecutive-frame-
  // count requirement is exercised precisely below regardless.
  const config = BiometricConfig(minHoldDuration: Duration.zero);

  group('LocalActiveLivenessService — head turn', () {
    test('turnLeft is not satisfied by a single qualifying frame', () {
      final service = LocalActiveLivenessService(config: config);
      final outcome = service.observe(
        LivenessAction.turnLeft,
        _pose(yaw: -config.turnActionYawThresholdDegrees - 5),
      );
      expect(outcome.satisfied, isFalse);
    });

    test('turnLeft is satisfied after enough consecutive qualifying frames', () {
      final service = LocalActiveLivenessService(config: config);
      LivenessActionOutcome? outcome;
      for (var i = 0; i < config.minConsecutiveHoldFrames + 1; i++) {
        outcome = service.observe(
          LivenessAction.turnLeft,
          _pose(yaw: -config.turnActionYawThresholdDegrees - 5),
        );
      }
      expect(outcome!.satisfied, isTrue);
    });

    test('turnRight requires the opposite yaw sign from turnLeft', () {
      final service = LocalActiveLivenessService(config: config);
      // Facing left (negative yaw) should never satisfy turnRight.
      LivenessActionOutcome? outcome;
      for (var i = 0; i < config.minConsecutiveHoldFrames + 1; i++) {
        outcome = service.observe(
          LivenessAction.turnRight,
          _pose(yaw: -config.turnActionYawThresholdDegrees - 5),
        );
      }
      expect(outcome!.satisfied, isFalse);
    });

    test('an interrupting non-qualifying frame resets the consecutive count', () {
      final service = LocalActiveLivenessService(config: config);
      for (var i = 0; i < config.minConsecutiveHoldFrames - 1; i++) {
        service.observe(
          LivenessAction.turnLeft,
          _pose(yaw: -config.turnActionYawThresholdDegrees - 5),
        );
      }
      // Break the streak.
      service.observe(LivenessAction.turnLeft, _pose(yaw: 0));

      final outcome = service.observe(
        LivenessAction.turnLeft,
        _pose(yaw: -config.turnActionYawThresholdDegrees - 5),
      );
      expect(outcome.consecutiveQualifyingFrames, 1);
      expect(outcome.satisfied, isFalse);
    });

    test('minHoldDuration genuinely gates satisfaction, not just frame count', () async {
      // Real (non-zero) duration this time, to prove the duration check
      // isn't a no-op: enough qualifying frames arrive well within the
      // window, but satisfaction should only flip once real time has
      // actually elapsed.
      final realConfig = BiometricConfig(
        minConsecutiveHoldFrames: 2,
        minHoldDuration: const Duration(milliseconds: 100),
      );
      final service = LocalActiveLivenessService(config: realConfig);

      final immediate = service.observe(
        LivenessAction.turnLeft,
        _pose(yaw: -realConfig.turnActionYawThresholdDegrees - 5),
      );
      final stillTooSoon = service.observe(
        LivenessAction.turnLeft,
        _pose(yaw: -realConfig.turnActionYawThresholdDegrees - 5),
      );
      expect(immediate.satisfied, isFalse);
      expect(stillTooSoon.satisfied, isFalse); // frame count met, duration not yet

      await Future<void>.delayed(const Duration(milliseconds: 120));

      final afterWaiting = service.observe(
        LivenessAction.turnLeft,
        _pose(yaw: -realConfig.turnActionYawThresholdDegrees - 5),
      );
      expect(afterWaiting.satisfied, isTrue);
    });

    test('resetAction clears hold state between actions', () {
      final service = LocalActiveLivenessService(config: config);
      for (var i = 0; i < config.minConsecutiveHoldFrames + 1; i++) {
        service.observe(
          LivenessAction.turnLeft,
          _pose(yaw: -config.turnActionYawThresholdDegrees - 5),
        );
      }
      service.resetAction();
      final outcome = service.observe(
        LivenessAction.turnLeft,
        _pose(yaw: -config.turnActionYawThresholdDegrees - 5),
      );
      expect(outcome.consecutiveQualifyingFrames, 1);
      expect(outcome.satisfied, isFalse);
    });
  });

  group('LocalActiveLivenessService — lookStraight', () {
    test('satisfied when yaw and pitch are within tolerance long enough', () {
      final service = LocalActiveLivenessService(config: config);
      LivenessActionOutcome? outcome;
      for (var i = 0; i < config.minConsecutiveHoldFrames + 1; i++) {
        outcome = service.observe(LivenessAction.lookStraight, _pose());
      }
      expect(outcome!.satisfied, isTrue);
    });

    test('not satisfied when yaw exceeds tolerance', () {
      final service = LocalActiveLivenessService(config: config);
      LivenessActionOutcome? outcome;
      for (var i = 0; i < config.minConsecutiveHoldFrames + 1; i++) {
        outcome = service.observe(
          LivenessAction.lookStraight,
          _pose(yaw: config.lookStraightYawToleranceDegrees + 5),
        );
      }
      expect(outcome!.satisfied, isFalse);
    });
  });

  group('LocalActiveLivenessService — blink', () {
    test('already-closed eyes on the first observation is not a free pass', () {
      final service = LocalActiveLivenessService(config: config);
      final outcome = service.observe(
        LivenessAction.blink,
        _pose(leftEyeOpen: 0.05, rightEyeOpen: 0.05),
      );
      expect(outcome.satisfied, isFalse);
    });

    test('a real open -> closed -> open transition satisfies blink', () {
      final service = LocalActiveLivenessService(config: config);
      var outcome = service.observe(
        LivenessAction.blink,
        _pose(leftEyeOpen: 0.9, rightEyeOpen: 0.9),
      );
      expect(outcome.satisfied, isFalse);

      outcome = service.observe(
        LivenessAction.blink,
        _pose(leftEyeOpen: 0.05, rightEyeOpen: 0.05),
      );
      expect(outcome.satisfied, isFalse);

      outcome = service.observe(
        LivenessAction.blink,
        _pose(leftEyeOpen: 0.9, rightEyeOpen: 0.9),
      );
      expect(outcome.satisfied, isTrue);
    });

    test('remaining closed without reopening never satisfies blink', () {
      final service = LocalActiveLivenessService(config: config);
      service.observe(LivenessAction.blink, _pose(leftEyeOpen: 0.9, rightEyeOpen: 0.9));
      final outcome = service.observe(
        LivenessAction.blink,
        _pose(leftEyeOpen: 0.05, rightEyeOpen: 0.05),
      );
      expect(outcome.satisfied, isFalse);
    });

    test('missing eye-open probabilities never satisfies blink', () {
      final service = LocalActiveLivenessService(config: config);
      final outcome = service.observe(LivenessAction.blink, _pose());
      expect(outcome.satisfied, isFalse);
    });
  });
}
