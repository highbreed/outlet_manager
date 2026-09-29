// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_capture_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(BiometricCaptureNotifier)
const biometricCaptureNotifierProvider = BiometricCaptureNotifierProvider._();

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
final class BiometricCaptureNotifierProvider
    extends $NotifierProvider<BiometricCaptureNotifier, BiometricCaptureState> {
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
  const BiometricCaptureNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricCaptureNotifierProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricCaptureNotifierHash();

  @$internal
  @override
  BiometricCaptureNotifier create() => BiometricCaptureNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BiometricCaptureState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BiometricCaptureState>(value),
    );
  }
}

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

abstract class _$BiometricCaptureNotifier
    extends $Notifier<BiometricCaptureState> {
  BiometricCaptureState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BiometricCaptureState, BiometricCaptureState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BiometricCaptureState, BiometricCaptureState>,
              BiometricCaptureState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
