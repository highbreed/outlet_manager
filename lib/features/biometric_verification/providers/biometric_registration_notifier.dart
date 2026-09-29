import 'dart:developer' as developer;
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/device/device_fingerprint.dart';
import '../../../core/network/failures.dart';
import '../domain/entities/entities.dart';
import 'biometric_config_provider.dart';
import 'biometric_repository_providers.dart';
import 'biometric_service_providers.dart';
import 'biometric_status_provider.dart';

part 'biometric_registration_notifier.g.dart';

/// Runs ONE liveness challenge (proving a live person is registering, not
/// a photo), then guides the employee through 3 poses (frontal/slight-
/// left/slight-right) — not three independent liveness sessions, per the
/// "Phase 4" plan's "Registration flow" section.
///
/// `keepAlive: true` is deliberate, not the `@riverpod` default: this
/// notifier runs a long in-flight `start()` (network round trip) while
/// the screen sits under the same `GoRouter` whose `refreshListenable`
/// fires on every location/full-screen-intent poll tick and biometric-
/// status invalidation. Confirmed on-device: with the default autoDispose,
/// one of those refreshes can drop this provider's listener count to zero
/// for a moment mid-`start()`, disposing it and rebuilding a fresh
/// instance that never receives the in-flight challenge response — the
/// screen gets stuck on "Getting ready..." forever, watching the new
/// (never-started) instance while the old one's result lands nowhere.
/// "Fresh session per screen visit" is instead enforced explicitly by
/// `FaceRegistrationScreen.dispose()` invalidating this provider.
@Riverpod(keepAlive: true)
class BiometricRegistrationNotifier extends _$BiometricRegistrationNotifier {
  RegistrationPose _currentPose = RegistrationPose.frontal;
  Uint8List? _frontalImage;
  Uint8List? _leftImage;
  Uint8List? _rightImage;
  int _consecutiveQualifyingFrames = 0;
  bool _uploadInFlight = false;
  String _deviceId = '';

  @override
  BiometricCaptureState build() {
    return BiometricCaptureState(captureSessionId: const Uuid().v4());
  }

  RegistrationPose get currentPose => _currentPose;

  Future<void> start() async {
    _currentPose = RegistrationPose.frontal;
    _frontalImage = null;
    _leftImage = null;
    _rightImage = null;
    _consecutiveQualifyingFrames = 0;
    _uploadInFlight = false;
    ref.read(activeLivenessServiceProvider).resetAction();

    state = BiometricCaptureState(
      captureSessionId: const Uuid().v4(),
      phase: BiometricPhase.initializing,
    );

    _deviceId = await DeviceFingerprint.getOrCreate();

    final result = await ref
        .read(livenessChallengeGeneratorProvider)
        .generate(purpose: BiometricPurpose.enrollment, deviceId: _deviceId);
    result.fold(
      (failure) {
        state = state.copyWith(
          phase: BiometricPhase.error,
          errorReason: _mapFailureToReason(failure),
        );
      },
      (challenge) {
        state = state.copyWith(
          phase: BiometricPhase.waitingForFace,
          challenge: challenge,
          currentActionIndex: 0,
          actionOutcomes: [
            for (final action in challenge.actions) LivenessActionOutcome(action: action),
          ],
        );
      },
    );
  }

  Future<void> onFrame(
    CameraImage image, {
    required int sensorOrientation,
    required CameraLensDirection lensDirection,
  }) async {
    if (state.isTerminal || _uploadInFlight) return;

    final challenge = state.challenge;
    if (challenge != null && challenge.isExpired && state.phase == BiometricPhase.challengeRunning) {
      state = state.copyWith(
        phase: BiometricPhase.error,
        errorReason: BiometricErrorReason.challengeExpired,
      );
      return;
    }

    final faces = await ref.read(faceDetectionServiceProvider).processFrame(
      image,
      sensorOrientation: sensorOrientation,
      lensDirection: lensDirection,
    );
    if (faces == null) return;

    if (faces.length != 1) {
      state = state.copyWith(
        phase: BiometricPhase.waitingForFace,
        errorReason: faces.isEmpty
            ? BiometricErrorReason.noFace
            : BiometricErrorReason.multipleFaces,
        currentFacePose: null,
      );
      _consecutiveQualifyingFrames = 0;
      return;
    }

    final pose = faces.single;
    final quality = ref.read(faceQualityServiceProvider).evaluate(pose, frame: image);
    state = state.copyWith(currentFacePose: pose, currentQuality: quality);

    // Once challengeRunning, the liveness action / pose-capture step
    // itself is the sole authority on whether the current pose is
    // correct — both the shared liveness turnLeft/turnRight actions and
    // the left/right registration poses *require* exactly the rotation
    // this quality gate's excessiveRotation check would reject. Applying
    // it unconditionally fought both: every time the user turned far
    // enough to satisfy a turn action or the left/right pose, this reset
    // the phase back to `aligning` ("Look straight ahead"), confirmed
    // on-device. Still applies before the challenge starts and for
    // non-rotation reasons throughout.
    if (!quality.acceptable && state.phase != BiometricPhase.challengeRunning) {
      state = state.copyWith(
        phase: BiometricPhase.aligning,
        errorReason: BiometricErrorReason.poorImageQuality,
      );
      _consecutiveQualifyingFrames = 0;
      return;
    }

    if (state.phase == BiometricPhase.waitingForFace || state.phase == BiometricPhase.aligning) {
      state = state.copyWith(phase: BiometricPhase.ready, errorReason: null);
    }
    if (state.phase == BiometricPhase.ready) {
      state = state.copyWith(phase: BiometricPhase.challengeRunning);
    }

    // Routing must key off whether liveness actions actually remain
    // (currentActionIndex < actions.length), not _frontalImage == null —
    // that stays null for the entire liveness phase AND the frontal pose
    // capture, so once _runLivenessStep correctly no-ops after the last
    // action (see its own currentActionIndex-advancement fix above), this
    // branch kept intercepting every frame and _runPoseCaptureStep was
    // never reached at all. Confirmed on-device: all 3 liveness actions
    // satisfied, then nothing further happened.
    final livenessStillRunning =
        challenge != null && state.currentActionIndex < challenge.actions.length;
    if (state.phase == BiometricPhase.challengeRunning && livenessStillRunning) {
      // Still proving liveness — the one shared challenge before any pose
      // capture begins.
      await _runLivenessStep(pose);
      return;
    }

    // Liveness already passed — now guiding through the 3 poses.
    await _runPoseCaptureStep(pose, image);
  }

  Future<void> _runLivenessStep(FacePose pose) async {
    final challenge = state.challenge;
    if (challenge == null || state.currentActionIndex >= challenge.actions.length) return;

    final action = challenge.actions[state.currentActionIndex];
    final outcome = ref.read(livenessServiceProvider).observe(action, pose);

    debugPrint(
      '[DIAG] liveness action=$action yaw=${pose.yawDegrees.toStringAsFixed(1)} '
      'pitch=${pose.pitchDegrees.toStringAsFixed(1)} '
      'eyeOpen=${pose.averageEyeOpenProbability?.toStringAsFixed(2)} '
      'satisfied=${outcome.satisfied} '
      'frames=${outcome.consecutiveQualifyingFrames}',
    );

    final updatedOutcomes = [...state.actionOutcomes];
    updatedOutcomes[state.currentActionIndex] = outcome;
    state = state.copyWith(actionOutcomes: updatedOutcomes);

    if (!outcome.satisfied) return;

    final nextIndex = state.currentActionIndex + 1;
    ref.read(activeLivenessServiceProvider).resetAction();

    // currentActionIndex must always advance, even past the last action —
    // otherwise it stays pointing at the final action forever, this
    // method's own early-return guard above (`currentActionIndex >=
    // actions.length`) never trips, and the last action gets re-observed
    // and re-required indefinitely instead of the flow ever reaching pose
    // capture. Confirmed on-device: turnLeft (the last sampled action)
    // kept being satisfied and immediately demanded again, forever.
    state = state.copyWith(currentActionIndex: nextIndex);
    if (nextIndex >= challenge.actions.length) {
      // Liveness passed — move on to guided pose capture, starting with
      // frontal. capturing/processing phases below are reused to mean
      // "capturing this specific pose", not the whole session ending.
      state = state.copyWith(phase: BiometricPhase.ready);
    }
  }

  Future<void> _runPoseCaptureStep(FacePose pose, CameraImage image) async {
    final config = ref.read(biometricConfigProvider);
    final qualifies = switch (_currentPose) {
      RegistrationPose.frontal =>
        pose.yawDegrees.abs() <= config.lookStraightYawToleranceDegrees,
      RegistrationPose.left => pose.yawDegrees <= -config.turnActionYawThresholdDegrees,
      RegistrationPose.right => pose.yawDegrees >= config.turnActionYawThresholdDegrees,
    };

    if (!qualifies) {
      _consecutiveQualifyingFrames = 0;
      return;
    }
    _consecutiveQualifyingFrames++;
    if (_consecutiveQualifyingFrames < config.minConsecutiveHoldFrames) return;

    _consecutiveQualifyingFrames = 0;
    state = state.copyWith(phase: BiometricPhase.capturing);
    try {
      final frame = await ref.read(biometricCameraServiceProvider).captureStillFrame(pose: pose);
      state = state.copyWith(phase: BiometricPhase.processing);
      final processed = await ref.read(faceImageProcessorProvider).process(frame);

      switch (_currentPose) {
        case RegistrationPose.frontal:
          _frontalImage = processed;
          _currentPose = RegistrationPose.left;
        case RegistrationPose.left:
          _leftImage = processed;
          _currentPose = RegistrationPose.right;
        case RegistrationPose.right:
          _rightImage = processed;
      }

      if (_frontalImage != null && _leftImage != null && _rightImage != null) {
        await _uploadEnrollment();
      } else {
        state = state.copyWith(phase: BiometricPhase.ready);
      }
    } catch (e, st) {
      developer.log(
        '[BiometricRegistrationNotifier] pose capture failed: $e',
        name: 'BiometricRegistrationNotifier',
        error: e,
        stackTrace: st,
      );
      state = state.copyWith(phase: BiometricPhase.error, errorReason: BiometricErrorReason.unknown);
    }
  }

  Future<void> _uploadEnrollment() async {
    final challenge = state.challenge;
    final frontal = _frontalImage;
    final left = _leftImage;
    final right = _rightImage;
    if (challenge == null || frontal == null || left == null || right == null) return;

    _uploadInFlight = true;
    state = state.copyWith(phase: BiometricPhase.uploading);
    try {
      final result = await ref.read(registerFaceUseCaseProvider).call(
        captureSessionId: state.captureSessionId,
        challengeId: challenge.challengeId,
        deviceId: _deviceId,
        frontalImage: frontal,
        leftImage: left,
        rightImage: right,
      );
      await result.fold(
        _handleEnrollFailure,
        (outcome) async {
          state = state.copyWith(
            phase: outcome.enrolled ? BiometricPhase.verified : BiometricPhase.rejected,
          );
          if (outcome.enrolled) {
            ref.invalidate(biometricStatusProvider);
          }
        },
      );
    } finally {
      _uploadInFlight = false;
    }
  }

  /// A network failure on `/biometrics/enroll` leaves it genuinely
  /// ambiguous whether the server persisted the enrollment before the
  /// response was lost — resolve it with a fresh `GET /status` rather
  /// than guessing either way.
  Future<void> _handleEnrollFailure(Failure failure) async {
    if (failure is NetworkFailure) {
      final statusResult = await ref.read(getBiometricStatusUseCaseProvider).call();
      final alreadyEnrolled = statusResult.fold(
        (_) => false,
        (status) =>
            status.status == BiometricEnrollmentStatus.active ||
            status.status == BiometricEnrollmentStatus.enrolled,
      );
      if (alreadyEnrolled) {
        ref.invalidate(biometricStatusProvider);
        state = state.copyWith(phase: BiometricPhase.verified, errorReason: null);
        return;
      }
      state = state.copyWith(
        phase: BiometricPhase.error,
        errorReason: BiometricErrorReason.networkUnavailable,
      );
      return;
    }

    if (failure is BiometricVerificationFailure) {
      final reason = _mapFailureToReason(failure);

      // 200-level rejections (NO_FACE/MULTIPLE_FACES/LOW_QUALITY/
      // ENROLLMENT_INCONSISTENT, all surfaced as invalidImage by the
      // repository) and stale-challenge 409s all recover the same way:
      // a completely fresh challenge + pose capture, never a bare retry
      // of the same 3 images.
      final needsFreshChallenge = failure.mapOrNull(
            invalidImage: (_) => true,
            imageTooLarge: (_) => true,
            challengeInvalid: (_) => true,
            challengeExpired: (_) => true,
            challengeUsed: (_) => true,
          ) ??
          false;

      if (needsFreshChallenge) {
        state = state.copyWith(errorReason: reason);
        await start();
        return;
      }

      // Someone else finished enrollment first, or it's already ACTIVE —
      // refresh status so the screen/router reflect the real state.
      final requiresStatusRefresh = failure.mapOrNull(
            enrollmentConflict: (_) => true,
            enrollmentNotAllowed: (_) => true,
          ) ??
          false;
      if (requiresStatusRefresh) {
        ref.invalidate(biometricStatusProvider);
      }

      state = state.copyWith(phase: BiometricPhase.error, errorReason: reason);
      return;
    }

    state = state.copyWith(phase: BiometricPhase.error, errorReason: BiometricErrorReason.serverError);
  }

  BiometricErrorReason _mapFailureToReason(Failure failure) {
    if (failure is BiometricVerificationFailure) {
      return failure.map(
        faceNotMatched: (_) => BiometricErrorReason.faceNotMatched,
        challengeExpired: (_) => BiometricErrorReason.challengeExpired,
        notEnrolled: (_) => BiometricErrorReason.needsRegistration,
        noProfile: (_) => BiometricErrorReason.needsRegistration,
        reEnrollmentRequired: (_) => BiometricErrorReason.needsRegistration,
        profileRevoked: (_) => BiometricErrorReason.contactSupervisor,
        noTemplate: (_) => BiometricErrorReason.needsRegistration,
        enrollmentNotAllowed: (_) => BiometricErrorReason.contactSupervisor,
        modelVersionMismatch: (_) => BiometricErrorReason.contactSupervisor,
        biometricsDisabled: (_) => BiometricErrorReason.biometricsDisabled,
        challengeInvalid: (_) => BiometricErrorReason.challengeExpired,
        challengeUsed: (_) => BiometricErrorReason.challengeExpired,
        enrollmentConflict: (_) => BiometricErrorReason.needsRegistration,
        verificationRequestConflict: (_) => BiometricErrorReason.unknown,
        invalidImage: (_) => BiometricErrorReason.poorImageQuality,
        imageTooLarge: (_) => BiometricErrorReason.poorImageQuality,
        technicallyUnavailable: (_) => BiometricErrorReason.technicallyUnavailable,
        deviceNotRegistered: (_) => BiometricErrorReason.deviceNotRegistered,
        biometricRateLimited: (_) => BiometricErrorReason.rateLimited,
        clockInRejected: (_) => BiometricErrorReason.unknown,
      );
    }
    if (failure is NetworkFailure) return BiometricErrorReason.networkUnavailable;
    if (failure is ServerFailure) return BiometricErrorReason.serverError;
    return BiometricErrorReason.unknown;
  }

  void cancel() {
    _currentPose = RegistrationPose.frontal;
    _frontalImage = null;
    _leftImage = null;
    _rightImage = null;
    _consecutiveQualifyingFrames = 0;
    _uploadInFlight = false;
    state = state.copyWith(phase: BiometricPhase.idle, errorReason: null);
  }
}
