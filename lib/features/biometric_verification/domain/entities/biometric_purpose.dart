/// Why a biometric challenge/verification is being requested. Wire values
/// match the real backend contract exactly — `ENROLLMENT` (before
/// `/enroll`) or `CLOCK_IN` (before `/verify`); no other value is valid.
enum BiometricPurpose {
  enrollment,
  clockIn;

  String get wireValue => switch (this) {
    BiometricPurpose.enrollment => 'ENROLLMENT',
    BiometricPurpose.clockIn => 'CLOCK_IN',
  };

  static BiometricPurpose fromWireValue(String value) => switch (value) {
    'ENROLLMENT' => BiometricPurpose.enrollment,
    'CLOCK_IN' => BiometricPurpose.clockIn,
    _ => throw ArgumentError('Unknown biometric purpose wire value: $value'),
  };
}
