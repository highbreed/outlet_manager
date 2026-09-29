// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$biometricStatusHash() => r'4f661d973677b14b00e45ef99c54aa84f5511a02';

/// A plain (non-polling) fetch of `GET /biometrics/status` — unlike the
/// two permission gates in `location_tracking_providers.dart`, which poll
/// because OS permission state can flip behind the app's back with no
/// event to hook, `clock_in_verification_required` is a slow, operational
/// server-side change. Explicitly invalidated at registration success,
/// relevant 409s (NO_PROFILE/RE_ENROLLMENT_REQUIRED/PROFILE_REVOKED), and
/// fresh login — see the "Phase 5" plan's section A.3.
///
/// Callers making a security-relevant decision (the login gate, a
/// clock-in) should invalidate + re-read this immediately before deciding
/// rather than trusting a value that may be stale.
///
/// Copied from [biometricStatus].
@ProviderFor(biometricStatus)
final biometricStatusProvider =
    AutoDisposeFutureProvider<Either<Failure, BiometricStatus>>.internal(
      biometricStatus,
      name: r'biometricStatusProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$biometricStatusHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BiometricStatusRef =
    AutoDisposeFutureProviderRef<Either<Failure, BiometricStatus>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
