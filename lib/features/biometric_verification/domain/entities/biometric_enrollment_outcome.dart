import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/failures.dart';
import 'biometric_enrollment_status.dart';
import 'biometric_error_reason.dart';
import 'registration_pose.dart';

part 'biometric_enrollment_outcome.freezed.dart';

@freezed
class BiometricEnrollmentOutcome with _$BiometricEnrollmentOutcome {
  const factory BiometricEnrollmentOutcome({
    required bool enrolled,
    BiometricEnrollmentStatus? status,
    // Set on a 200-level rejection (enrolled:false) — NO_FACE,
    // MULTIPLE_FACES, LOW_QUALITY, INVALID_IMAGE, ENROLLMENT_INCONSISTENT.
    String? rejectionReason,
    // Which of the 3 captured photos failed, when applicable (null for
    // ENROLLMENT_INCONSISTENT, which isn't about one specific photo).
    RegistrationPose? failedPose,
    BiometricErrorReason? errorReason,
    Failure? rawFailure,
  }) = _BiometricEnrollmentOutcome;
}
