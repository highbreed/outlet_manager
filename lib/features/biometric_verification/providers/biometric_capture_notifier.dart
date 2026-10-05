import 'dart:developer' as developer;
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/device/device_fingerprint.dart';
import '../../../core/network/failures.dart';
import '../domain/entities/entities.dart';
import 'biometric_repository_providers.dart';
import 'biometric_service_providers.dart';
import 'biometric_status_provider.dart';

part 'biometric_capture_notifier.g.dart';

/// Orchestrates a single capture session: camera -> detect -> quality ->
/// liveness -> capture -> process -> upload.
///
/// `keepAlive: true` is deliberate, not the `@riverpod` default — see
/// `BiometricRegistrationNotifier`'s matching doc comment for the exact
/// on-device failure this avoids: the default autoDispose can tear this
/// notifier down mid-[start] (a long in-flight network call) whenever the
/// surrounding `GoRouter`'s `refreshListenable` fires a rebuild, leaving
/// the screen watching a fresh, never-started instance while the old
/// one's result lands nowhere. "Fresh session per screen visit" (the
/// actual intent — never resumed across screens, and backgrounding must
/// [cancel] rather than pause-and-resume) is instead enforced explicitly
/// by `FaceVerificationScreen.dispose()` invalidating this provider.
@Riverpod(keepAlive: true)
class BiometricCaptureNotifier extends _$BiometricCaptureNotifier {
  BiometricPurpose _purpose = BiometricPurpose.clockIn;
  FacePose? _lastGoodPose;
  bool _uploadInFlight = false;
  String _deviceId = '';
  // Reused across a bounded retry of the SAME attempt (see [_captureAndUpload]).
  // Reset to null on every [start] so a fresh attempt always gets a fresh id.
  String? _verificationRequestId;

  @override
  BiometricCaptureState build() {
    return BiometricCaptureState(captureSessionId: const Uuid().v4());
  }

  /// Starts (or restarts, after [cancel]/an error) a fresh session:
  /// resets all state under a new [BiometricCaptureState.captureSessionId]
  /// and requests a fresh challenge.
  Future<void> start({required BiometricPurpose purpose}) async {
    _purpose = purpose;
    _lastGoodPose = null;
    _uploadInFlight = false;
    _verificationRequestId = null;
    ref.read(activeLivenessServiceProvider).resetAction();

    state = BiometricCaptureState(
      captureSessionId: const Uuid().v4(),
      phase: BiometricPhase.initializing,
    );

    _deviceId = await DeviceFingerprint.getOrCreate();
    // keepAlive doesn't mean disposal-proof — FaceVerificationScreen.dispose()
    // explicitly invalidates this provider for "fresh session per visit",
    // which can race this in-flight start() exactly like the registration
    // notifier's documented camera-permission-dialog race. Checked after
    // every await in this file that's followed by a state/ref touch.
    if (!ref.mounted) return;

    final result = await ref
        .read(livenessChallengeGeneratorProvider)
        .generate(purpose: purpose, deviceId: _deviceId);
    if (!ref.mounted) return;
    result.fold(
      (failure) {
        state = state.copyWith(
          phase: BiometricPhase.error,
          errorReason: _mapChallengeFailure(failure),
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

  /// Fed every camera frame — throttling/discarding busy frames is
  /// [FaceDetectionService]'s job, not the caller's.
  Future<void> onFrame(
    CameraImage image, {
    required int sensorOrientation,
    required CameraLensDirection lensDirection,
  }) async {
    if (state.isTerminal || _uploadInFlight) return;

    final challenge = state.challenge;
    if (challenge != null && challenge.isExpired) {
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
    if (faces == null) return; // frame discarded by the service's own throttle guard
    if (!ref.mounted) return;

    if (faces.isEmpty) {
      state = state.copyWith(
        phase: BiometricPhase.waitingForFace,
        errorReason: BiometricErrorReason.noFace,
        currentFacePose: null,
      );
      return;
    }
    if (faces.length > 1) {
      state = state.copyWith(
        phase: BiometricPhase.waitingForFace,
        errorReason: BiometricErrorReason.multipleFaces,
        currentFacePose: null,
      );
      return;
    }

    final pose = faces.single;
    final quality = ref.read(faceQualityServiceProvider).evaluate(pose, frame: image);
    state = state.copyWith(currentFacePose: pose, currentQuality: quality);

    // Once the challenge is running, the liveness action itself (via
    // ActiveLivenessService.observe) is the sole authority on whether the
    // current pose is correct — turnLeft/turnRight *require* exactly the
    // rotation this quality gate's excessiveRotation check would reject.
    // Applying it unconditionally fought the challenge: every time the
    // user turned far enough to satisfy a turn action, this reset the
    // phase back to `aligning` ("Look straight ahead"), confirmed
    // on-device. The quality gate still applies before the challenge
    // starts (ensuring a good enough initial alignment) and for
    // non-rotation reasons throughout, just not to bounce out of an
    // in-progress challenge over rotation.
    if (!quality.acceptable && state.phase != BiometricPhase.challengeRunning) {
      state = state.copyWith(
        phase: BiometricPhase.aligning,
        errorReason: BiometricErrorReason.poorImageQuality,
      );
      return;
    }

    _lastGoodPose = pose;

    if (state.phase == BiometricPhase.waitingForFace || state.phase == BiometricPhase.aligning) {
      state = state.copyWith(phase: BiometricPhase.ready, errorReason: null);
    }
    if (state.phase == BiometricPhase.ready) {
      state = state.copyWith(phase: BiometricPhase.challengeRunning);
    }
    if (state.phase == BiometricPhase.challengeRunning) {
      await _runChallengeStep(pose);
    }
  }

  Future<void> _runChallengeStep(FacePose pose) async {
    final challenge = state.challenge;
    if (challenge == null) return;
    if (state.currentActionIndex >= challenge.actions.length) return;

    final action = challenge.actions[state.currentActionIndex];
    final outcome = ref.read(livenessServiceProvider).observe(action, pose);

    final updatedOutcomes = [...state.actionOutcomes];
    updatedOutcomes[state.currentActionIndex] = outcome;
    state = state.copyWith(actionOutcomes: updatedOutcomes);

    if (!outcome.satisfied) return;

    final nextIndex = state.currentActionIndex + 1;
    ref.read(activeLivenessServiceProvider).resetAction();

    // currentActionIndex must always advance, even past the last action —
    // see the identical fix (and its on-device repro) in
    // BiometricRegistrationNotifier._runLivenessStep. Not observed to
    // repeat here since _captureAndUpload() below immediately moves the
    // phase out of challengeRunning on success, but kept consistent as a
    // defensive measure against the same class of stuck-loop bug if that
    // call were ever to return early without changing phase.
    state = state.copyWith(currentActionIndex: nextIndex);
    if (nextIndex >= challenge.actions.length) {
      await _captureAndUpload();
    }
  }

  Future<void> _captureAndUpload() async {
    final pose = _lastGoodPose;
    final challenge = state.challenge;
    if (pose == null || challenge == null || _uploadInFlight) return;

    _uploadInFlight = true;
    state = state.copyWith(phase: BiometricPhase.capturing);

    try {
      final frame = await ref.read(biometricCameraServiceProvider).captureStillFrame(pose: pose);
      if (!ref.mounted) return;

      state = state.copyWith(phase: BiometricPhase.processing);
      final processedBytes = await ref.read(faceImageProcessorProvider).process(frame);
      if (!ref.mounted) return;

      state = state.copyWith(phase: BiometricPhase.uploading);
      // Minted once per attempt and held for the lifetime of this attempt
      // (including a same-attempt retry below) — the contract requires
      // reusing the same verification_request_id across a retry.
      _verificationRequestId ??= const Uuid().v4();
      state = state.copyWith(verificationRequestId: _verificationRequestId);

      await _verifyWithRetry(challenge: challenge, image: processedBytes, allowRetry: true);
    } catch (e, st) {
      developer.log(
        '[BiometricCaptureNotifier] capture/upload failed: $e',
        name: 'BiometricCaptureNotifier',
        error: e,
        stackTrace: st,
      );
      if (!ref.mounted) return;
      state = state.copyWith(phase: BiometricPhase.error, errorReason: BiometricErrorReason.unknown);
    } finally {
      _uploadInFlight = false;
    }
  }

  /// A resend of the SAME `challengeId`/`verificationRequestId` — bounded
  /// to one retry, only for failures that are genuinely transient
  /// (network hiccup, or the technical-unavailable/rate-limited/
  /// device-not-registered codes, paced by their `retryAfter`). Every
  /// other failure (a real non-match, an expired/used challenge, a 409
  /// identity problem) is not retried here — those need a fresh challenge,
  /// which only [start] issues.
  Future<void> _verifyWithRetry({
    required LivenessChallenge challenge,
    required Uint8List image,
    required bool allowRetry,
  }) async {
    final result = await ref.read(verifyFaceUseCaseProvider).call(
      captureSessionId: state.captureSessionId,
      challengeId: challenge.challengeId,
      verificationRequestId: _verificationRequestId!,
      purpose: _purpose,
      deviceId: _deviceId,
      image: image,
    );
    if (!ref.mounted) return;

    await result.fold(
      (failure) async {
        if (allowRetry && _isRetryableSameRequest(failure)) {
          final delay = _retryDelay(failure);
          if (delay > Duration.zero) {
            await Future<void>.delayed(delay);
            if (!ref.mounted) return;
          }
          await _verifyWithRetry(challenge: challenge, image: image, allowRetry: false);
          return;
        }

        if (_requiresStatusRefresh(failure)) {
          if (ref.mounted) ref.invalidate(biometricStatusProvider);
        }
        if (!ref.mounted) return;

        state = state.copyWith(
          phase: BiometricPhase.rejected,
          errorReason: _mapFailureToReason(failure),
        );
      },
      (outcome) async {
        state = state.copyWith(
          phase: outcome.verified ? BiometricPhase.verified : BiometricPhase.rejected,
          verificationId: outcome.verificationId,
          errorReason: outcome.verified ? null : BiometricErrorReason.faceNotMatched,
        );
      },
    );
  }

  bool _isRetryableSameRequest(Failure failure) =>
      (failure is NetworkFailure || failure is BiometricVerificationFailure) &&
      failure.isRetryable;

  Duration _retryDelay(Failure failure) {
    if (failure is BiometricVerificationFailure) {
      return failure.mapOrNull(
            technicallyUnavailable: (f) => f.retryAfter ?? const Duration(seconds: 2),
            biometricRateLimited: (f) => f.retryAfter,
          ) ??
          Duration.zero;
    }
    return Duration.zero;
  }

  /// 409s meaning "go register"/"contact supervisor" invalidate the
  /// cached status so the next read (e.g. the router gate) reflects the
  /// server's current view rather than a stale cached value.
  bool _requiresStatusRefresh(Failure failure) {
    if (failure is! BiometricVerificationFailure) return false;
    return failure.mapOrNull(
          noProfile: (_) => true,
          reEnrollmentRequired: (_) => true,
          profileRevoked: (_) => true,
          noTemplate: (_) => true,
          enrollmentNotAllowed: (_) => true,
          modelVersionMismatch: (_) => true,
          biometricsDisabled: (_) => true,
        ) ??
        false;
  }

  BiometricErrorReason _mapChallengeFailure(Failure failure) => _mapFailureToReason(failure);

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

  /// Called when the app backgrounds mid-challenge — per the Phase 4
  /// plan, a half-completed challenge is never resumed; returning to the
  /// foreground always calls [start] again for a fully fresh session.
  void cancel() {
    _lastGoodPose = null;
    _uploadInFlight = false;
    state = state.copyWith(phase: BiometricPhase.idle, errorReason: null);
  }
}
