// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_registration_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
///
/// Copied from [BiometricRegistrationNotifier].
@ProviderFor(BiometricRegistrationNotifier)
final biometricRegistrationNotifierProvider =
    NotifierProvider<
      BiometricRegistrationNotifier,
      BiometricCaptureState
    >.internal(
      BiometricRegistrationNotifier.new,
      name: r'biometricRegistrationNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$biometricRegistrationNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BiometricRegistrationNotifier = Notifier<BiometricCaptureState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
