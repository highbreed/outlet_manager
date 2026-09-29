import 'package:freezed_annotation/freezed_annotation.dart';

import 'biometric_enrollment_status.dart';

part 'biometric_status.freezed.dart';

/// `GET /biometrics/status`'s response — the single source of truth for
/// whether an employee must enroll and whether clock-in currently
/// enforces verification for them. `clockInVerificationRequired` can
/// change server-side without an app release (pilot/staged rollout), so
/// this should be re-fetched fresh at the moments that matter (login
/// gate, immediately before a clock-in decision), not trusted from a
/// long-lived cache.
@freezed
abstract class BiometricStatus with _$BiometricStatus {
  const factory BiometricStatus({
    required BiometricEnrollmentStatus status,
    required bool canEnroll,
    required bool requiresEnrollment,
    required bool clockInVerificationRequired,
    bool? modelCompatible,
    DateTime? enrolledAt,
    DateTime? lastVerifiedAt,
  }) = _BiometricStatus;

  const BiometricStatus._();

  /// The login-gate condition: registration is mandatory only when BOTH
  /// enforcement is on for this user AND they still need to enroll — per
  /// the contract's own table, not on [requiresEnrollment] alone. A user
  /// not yet in the enforcement rollout is never interrupted.
  bool get mustEnrollBeforeProceeding => clockInVerificationRequired && requiresEnrollment;
}
