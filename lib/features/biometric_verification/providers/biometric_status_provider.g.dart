// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(biometricStatus)
const biometricStatusProvider = BiometricStatusProvider._();

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

final class BiometricStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<Either<Failure, BiometricStatus>>,
          Either<Failure, BiometricStatus>,
          FutureOr<Either<Failure, BiometricStatus>>
        >
    with
        $FutureModifier<Either<Failure, BiometricStatus>>,
        $FutureProvider<Either<Failure, BiometricStatus>> {
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
  const BiometricStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricStatusHash();

  @$internal
  @override
  $FutureProviderElement<Either<Failure, BiometricStatus>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Either<Failure, BiometricStatus>> create(Ref ref) {
    return biometricStatus(ref);
  }
}

String _$biometricStatusHash() => r'4f661d973677b14b00e45ef99c54aa84f5511a02';
