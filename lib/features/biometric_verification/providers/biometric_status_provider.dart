import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/failures.dart';
import '../domain/entities/biometric_status.dart';
import 'biometric_repository_providers.dart';

part 'biometric_status_provider.g.dart';

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
@riverpod
Future<Either<Failure, BiometricStatus>> biometricStatus(Ref ref) {
  return ref.watch(getBiometricStatusUseCaseProvider).call();
}
