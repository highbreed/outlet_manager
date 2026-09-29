import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/failures.dart';
import 'biometric_error_reason.dart';

part 'biometric_verification_outcome.freezed.dart';

/// What `verifyBiometric(context, purpose: ...)` — the Attendance-facing
/// gate — returns. This is the ONLY biometric type Attendance code ever
/// sees; it carries no ML Kit/camera/liveness detail.
@freezed
class BiometricVerificationOutcome with _$BiometricVerificationOutcome {
  const factory BiometricVerificationOutcome({
    required bool verified,
    String? verificationId,
    // Single use, bound to this employee/CLOCK_IN/device — must reach
    // clock-in within this window (contract: 120s).
    DateTime? verificationExpiresAt,
    BiometricErrorReason? errorReason,
    Failure? rawFailure,
  }) = _BiometricVerificationOutcome;
}
