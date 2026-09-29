/// Server-tracked enrollment lifecycle for an employee's biometric
/// profile, per `GET /biometrics/status`'s `status` field. `active`
/// blocks the client's own registration screen from re-launching —
/// re-enrollment requires an authorized supervisor/admin reset
/// (`POST /biometrics/users/{user_id}/reset`, backend/admin-tool only,
/// not built by this phase).
enum BiometricEnrollmentStatus {
  notEnrolled,
  enrollmentRequired,
  enrolled,
  active,
  reEnrollmentRequired,
  revoked;

  static BiometricEnrollmentStatus fromWireValue(String value) => switch (value) {
    'NOT_ENROLLED' => BiometricEnrollmentStatus.notEnrolled,
    'ENROLLMENT_REQUIRED' => BiometricEnrollmentStatus.enrollmentRequired,
    'ENROLLED' => BiometricEnrollmentStatus.enrolled,
    'ACTIVE' => BiometricEnrollmentStatus.active,
    'RE_ENROLLMENT_REQUIRED' => BiometricEnrollmentStatus.reEnrollmentRequired,
    'REVOKED' => BiometricEnrollmentStatus.revoked,
    _ => throw ArgumentError('Unknown biometric enrollment status wire value: $value'),
  };
}
