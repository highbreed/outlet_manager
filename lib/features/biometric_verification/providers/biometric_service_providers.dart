import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/active_liveness_service.dart';
import '../services/biometric_camera_service.dart';
import '../services/camera_biometric_service_impl.dart';
import '../services/default_face_image_processor.dart';
import '../services/default_face_quality_service.dart';
import '../services/face_detection_service.dart';
import '../services/face_image_processor.dart';
import '../services/face_quality_service.dart';
import '../services/liveness_challenge_generator.dart';
import '../services/liveness_service.dart';
import '../services/local_active_liveness_service.dart';
import '../services/mlkit_face_detection_service.dart';
import '../services/remote_challenge_generator.dart';
import 'biometric_config_provider.dart';
import 'biometric_repository_providers.dart';

part 'biometric_service_providers.g.dart';

/// `keepAlive: true` on every provider below, not the `@riverpod` default
/// — "a fresh instance per capture session, not a shared singleton" is
/// still the intent, but autoDispose is the wrong mechanism for it here.
/// These are only ever consumed via `ref.read` inside screen `build()`/
/// callback methods (never `ref.watch`), which does not count as a
/// listener for autoDispose purposes — confirmed on-device: with the
/// `@riverpod` default, [biometricCameraServiceProvider] could be (and
/// reliably was) disposed by Riverpod moments after creation, tearing
/// down the `CameraController` out from under
/// `BiometricCameraPreview._start()` mid-initialization, so the camera
/// preview showed "Camera unavailable" on every attempt. Same class of
/// bug as `BiometricRegistrationNotifier`/`BiometricCaptureNotifier` (see
/// their doc comments) — "fresh session per screen visit" is instead
/// enforced explicitly by `FaceRegistrationScreen`/`FaceVerificationScreen`
/// invalidating these providers in `dispose()`.

@Riverpod(keepAlive: true)
BiometricCameraService biometricCameraService(Ref ref) {
  final service = CameraBiometricServiceImpl();
  ref.onDispose(service.dispose);
  return service;
}

@Riverpod(keepAlive: true)
FaceDetectionService faceDetectionService(Ref ref) {
  final service = MlkitFaceDetectionService();
  ref.onDispose(service.dispose);
  return service;
}

@Riverpod(keepAlive: true)
FaceQualityService faceQualityService(Ref ref) {
  return DefaultFaceQualityService(config: ref.watch(biometricConfigProvider));
}

@Riverpod(keepAlive: true)
ActiveLivenessService activeLivenessService(Ref ref) {
  return LocalActiveLivenessService(config: ref.watch(biometricConfigProvider));
}

@Riverpod(keepAlive: true)
LivenessService livenessService(Ref ref) {
  return LivenessService(active: ref.watch(activeLivenessServiceProvider));
}

/// V1 default is server-issued challenges (see the "Phase 4" plan's
/// "Liveness architecture"/"Backend coordination" sections) —
/// `LocalChallengeGenerator` is only reachable by editing this provider
/// directly for local development, same explicit-opt-in spirit as
/// [useDevBiometricFake].
@Riverpod(keepAlive: true)
LivenessChallengeGenerator livenessChallengeGenerator(Ref ref) {
  return RemoteChallengeGenerator(ref.watch(biometricRepositoryProvider));
}

@Riverpod(keepAlive: true)
FaceImageProcessor faceImageProcessor(Ref ref) {
  return DefaultFaceImageProcessor(config: ref.watch(biometricConfigProvider));
}
