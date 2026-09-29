/// One of the 3 poses captured during enrollment. Promoted from a
/// notifier-internal enum to a domain entity so it can also represent the
/// wire `failed_pose` value `/biometrics/enroll` returns on a rejection.
enum RegistrationPose {
  frontal,
  left,
  right;

  static RegistrationPose? fromWireValue(String? value) => switch (value) {
    'FRONTAL' => RegistrationPose.frontal,
    'LEFT' => RegistrationPose.left,
    'RIGHT' => RegistrationPose.right,
    _ => null,
  };
}
