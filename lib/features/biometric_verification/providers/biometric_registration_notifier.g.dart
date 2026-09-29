// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_registration_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(BiometricRegistrationNotifier)
const biometricRegistrationNotifierProvider =
    BiometricRegistrationNotifierProvider._();

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
final class BiometricRegistrationNotifierProvider
    extends
        $NotifierProvider<
          BiometricRegistrationNotifier,
          BiometricCaptureState
        > {
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
  const BiometricRegistrationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricRegistrationNotifierProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricRegistrationNotifierHash();

  @$internal
  @override
  BiometricRegistrationNotifier create() => BiometricRegistrationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BiometricCaptureState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BiometricCaptureState>(value),
    );
  }
}

String _$biometricRegistrationNotifierHash() =>
    r'cd07d0e045126e9fd09e3e535e925a8ad53bd3b0';

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

abstract class _$BiometricRegistrationNotifier
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
