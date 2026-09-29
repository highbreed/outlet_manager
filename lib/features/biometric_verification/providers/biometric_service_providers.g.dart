// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_service_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(biometricCameraService)
const biometricCameraServiceProvider = BiometricCameraServiceProvider._();

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

final class BiometricCameraServiceProvider
    extends
        $FunctionalProvider<
          BiometricCameraService,
          BiometricCameraService,
          BiometricCameraService
        >
    with $Provider<BiometricCameraService> {
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
  const BiometricCameraServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricCameraServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricCameraServiceHash();

  @$internal
  @override
  $ProviderElement<BiometricCameraService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BiometricCameraService create(Ref ref) {
    return biometricCameraService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BiometricCameraService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BiometricCameraService>(value),
    );
  }
}

String _$biometricCameraServiceHash() =>
    r'0e86b98e9fbca34453335db2e97f5fd90994f9dd';

@ProviderFor(faceDetectionService)
const faceDetectionServiceProvider = FaceDetectionServiceProvider._();

final class FaceDetectionServiceProvider
    extends
        $FunctionalProvider<
          FaceDetectionService,
          FaceDetectionService,
          FaceDetectionService
        >
    with $Provider<FaceDetectionService> {
  const FaceDetectionServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faceDetectionServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faceDetectionServiceHash();

  @$internal
  @override
  $ProviderElement<FaceDetectionService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FaceDetectionService create(Ref ref) {
    return faceDetectionService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FaceDetectionService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FaceDetectionService>(value),
    );
  }
}

String _$faceDetectionServiceHash() =>
    r'efbe7f85ae7dfcb24ce188abe15f63fa7ca0958f';

@ProviderFor(faceQualityService)
const faceQualityServiceProvider = FaceQualityServiceProvider._();

final class FaceQualityServiceProvider
    extends
        $FunctionalProvider<
          FaceQualityService,
          FaceQualityService,
          FaceQualityService
        >
    with $Provider<FaceQualityService> {
  const FaceQualityServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faceQualityServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faceQualityServiceHash();

  @$internal
  @override
  $ProviderElement<FaceQualityService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FaceQualityService create(Ref ref) {
    return faceQualityService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FaceQualityService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FaceQualityService>(value),
    );
  }
}

String _$faceQualityServiceHash() =>
    r'b682b969547dfb240430cfb98efc60c856f4646e';

@ProviderFor(activeLivenessService)
const activeLivenessServiceProvider = ActiveLivenessServiceProvider._();

final class ActiveLivenessServiceProvider
    extends
        $FunctionalProvider<
          ActiveLivenessService,
          ActiveLivenessService,
          ActiveLivenessService
        >
    with $Provider<ActiveLivenessService> {
  const ActiveLivenessServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeLivenessServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeLivenessServiceHash();

  @$internal
  @override
  $ProviderElement<ActiveLivenessService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ActiveLivenessService create(Ref ref) {
    return activeLivenessService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ActiveLivenessService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ActiveLivenessService>(value),
    );
  }
}

String _$activeLivenessServiceHash() =>
    r'7f409b6c5d9eaad5c453cb12960897c8908501e0';

@ProviderFor(livenessService)
const livenessServiceProvider = LivenessServiceProvider._();

final class LivenessServiceProvider
    extends
        $FunctionalProvider<LivenessService, LivenessService, LivenessService>
    with $Provider<LivenessService> {
  const LivenessServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'livenessServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$livenessServiceHash();

  @$internal
  @override
  $ProviderElement<LivenessService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LivenessService create(Ref ref) {
    return livenessService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LivenessService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LivenessService>(value),
    );
  }
}

String _$livenessServiceHash() => r'aae62c713538a582354b51df795a5b09388cb0df';

/// V1 default is server-issued challenges (see the "Phase 4" plan's
/// "Liveness architecture"/"Backend coordination" sections) —
/// `LocalChallengeGenerator` is only reachable by editing this provider
/// directly for local development, same explicit-opt-in spirit as
/// [useDevBiometricFake].

@ProviderFor(livenessChallengeGenerator)
const livenessChallengeGeneratorProvider =
    LivenessChallengeGeneratorProvider._();

/// V1 default is server-issued challenges (see the "Phase 4" plan's
/// "Liveness architecture"/"Backend coordination" sections) —
/// `LocalChallengeGenerator` is only reachable by editing this provider
/// directly for local development, same explicit-opt-in spirit as
/// [useDevBiometricFake].

final class LivenessChallengeGeneratorProvider
    extends
        $FunctionalProvider<
          LivenessChallengeGenerator,
          LivenessChallengeGenerator,
          LivenessChallengeGenerator
        >
    with $Provider<LivenessChallengeGenerator> {
  /// V1 default is server-issued challenges (see the "Phase 4" plan's
  /// "Liveness architecture"/"Backend coordination" sections) —
  /// `LocalChallengeGenerator` is only reachable by editing this provider
  /// directly for local development, same explicit-opt-in spirit as
  /// [useDevBiometricFake].
  const LivenessChallengeGeneratorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'livenessChallengeGeneratorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$livenessChallengeGeneratorHash();

  @$internal
  @override
  $ProviderElement<LivenessChallengeGenerator> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LivenessChallengeGenerator create(Ref ref) {
    return livenessChallengeGenerator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LivenessChallengeGenerator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LivenessChallengeGenerator>(value),
    );
  }
}

String _$livenessChallengeGeneratorHash() =>
    r'4f85fb1cc9793c0e542a47e34bf641af890ec395';

@ProviderFor(faceImageProcessor)
const faceImageProcessorProvider = FaceImageProcessorProvider._();

final class FaceImageProcessorProvider
    extends
        $FunctionalProvider<
          FaceImageProcessor,
          FaceImageProcessor,
          FaceImageProcessor
        >
    with $Provider<FaceImageProcessor> {
  const FaceImageProcessorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faceImageProcessorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faceImageProcessorHash();

  @$internal
  @override
  $ProviderElement<FaceImageProcessor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FaceImageProcessor create(Ref ref) {
    return faceImageProcessor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FaceImageProcessor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FaceImageProcessor>(value),
    );
  }
}

String _$faceImageProcessorHash() =>
    r'88f11d4d8c59c82a0c9873cdfeedf89c7cb5e7fe';
