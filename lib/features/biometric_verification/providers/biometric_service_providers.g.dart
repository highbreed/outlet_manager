// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_service_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$biometricCameraServiceHash() =>
    r'0e86b98e9fbca34453335db2e97f5fd90994f9dd';

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
///
/// Copied from [biometricCameraService].
@ProviderFor(biometricCameraService)
final biometricCameraServiceProvider =
    Provider<BiometricCameraService>.internal(
      biometricCameraService,
      name: r'biometricCameraServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$biometricCameraServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BiometricCameraServiceRef = ProviderRef<BiometricCameraService>;
String _$faceDetectionServiceHash() =>
    r'efbe7f85ae7dfcb24ce188abe15f63fa7ca0958f';

/// See also [faceDetectionService].
@ProviderFor(faceDetectionService)
final faceDetectionServiceProvider = Provider<FaceDetectionService>.internal(
  faceDetectionService,
  name: r'faceDetectionServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$faceDetectionServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FaceDetectionServiceRef = ProviderRef<FaceDetectionService>;
String _$faceQualityServiceHash() =>
    r'b682b969547dfb240430cfb98efc60c856f4646e';

/// See also [faceQualityService].
@ProviderFor(faceQualityService)
final faceQualityServiceProvider = Provider<FaceQualityService>.internal(
  faceQualityService,
  name: r'faceQualityServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$faceQualityServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FaceQualityServiceRef = ProviderRef<FaceQualityService>;
String _$activeLivenessServiceHash() =>
    r'7f409b6c5d9eaad5c453cb12960897c8908501e0';

/// See also [activeLivenessService].
@ProviderFor(activeLivenessService)
final activeLivenessServiceProvider = Provider<ActiveLivenessService>.internal(
  activeLivenessService,
  name: r'activeLivenessServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeLivenessServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveLivenessServiceRef = ProviderRef<ActiveLivenessService>;
String _$livenessServiceHash() => r'aae62c713538a582354b51df795a5b09388cb0df';

/// See also [livenessService].
@ProviderFor(livenessService)
final livenessServiceProvider = Provider<LivenessService>.internal(
  livenessService,
  name: r'livenessServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$livenessServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LivenessServiceRef = ProviderRef<LivenessService>;
String _$livenessChallengeGeneratorHash() =>
    r'4f85fb1cc9793c0e542a47e34bf641af890ec395';

/// V1 default is server-issued challenges (see the "Phase 4" plan's
/// "Liveness architecture"/"Backend coordination" sections) —
/// `LocalChallengeGenerator` is only reachable by editing this provider
/// directly for local development, same explicit-opt-in spirit as
/// [useDevBiometricFake].
///
/// Copied from [livenessChallengeGenerator].
@ProviderFor(livenessChallengeGenerator)
final livenessChallengeGeneratorProvider =
    Provider<LivenessChallengeGenerator>.internal(
      livenessChallengeGenerator,
      name: r'livenessChallengeGeneratorProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$livenessChallengeGeneratorHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LivenessChallengeGeneratorRef = ProviderRef<LivenessChallengeGenerator>;
String _$faceImageProcessorHash() =>
    r'88f11d4d8c59c82a0c9873cdfeedf89c7cb5e7fe';

/// See also [faceImageProcessor].
@ProviderFor(faceImageProcessor)
final faceImageProcessorProvider = Provider<FaceImageProcessor>.internal(
  faceImageProcessor,
  name: r'faceImageProcessorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$faceImageProcessorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FaceImageProcessorRef = ProviderRef<FaceImageProcessor>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
