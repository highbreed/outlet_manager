// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_capture_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$biometricCaptureNotifierHash() =>
    r'84a183b60bcca4214421930a9eca9c2dca7188e2';

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
///
/// Copied from [BiometricCaptureNotifier].
@ProviderFor(BiometricCaptureNotifier)
final biometricCaptureNotifierProvider =
    NotifierProvider<BiometricCaptureNotifier, BiometricCaptureState>.internal(
      BiometricCaptureNotifier.new,
      name: r'biometricCaptureNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$biometricCaptureNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BiometricCaptureNotifier = Notifier<BiometricCaptureState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
