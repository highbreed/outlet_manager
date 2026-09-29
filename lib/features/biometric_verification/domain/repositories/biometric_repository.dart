import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/biometric_enrollment_outcome.dart';
import '../entities/biometric_purpose.dart';
import '../entities/biometric_status.dart';
import '../entities/biometric_verification_outcome.dart';
import '../entities/liveness_challenge.dart';

/// Repository interface for the biometric capture/liveness feature.
/// Implementations handle the data layer (real API or, dev/debug-only,
/// the fake datasource — see "Production safety" in the Phase 4 plan).
abstract class BiometricRepository {
  /// `GET /biometrics/status` — the source of truth for whether this
  /// employee must enroll and whether clock-in currently enforces
  /// verification for them. See the "Phase 5" plan.
  Future<Either<Failure, BiometricStatus>> getStatus();

  /// `POST /biometrics/challenge` — server-issued from V1, see the Phase 4
  /// plan's "Liveness architecture" section for why this isn't purely
  /// client-generated in production.
  Future<Either<Failure, LivenessChallenge>> requestChallenge({
    required BiometricPurpose purpose,
    required String deviceId,
  });

  /// `POST /biometrics/verify` (multipart). [verificationRequestId] is a
  /// per-attempt UUID distinct from [challengeId] and from the
  /// [BiometricVerificationOutcome.verificationId] a PASS returns — see
  /// "Identifiers" in the Phase 4 plan. Callers must mint it once per
  /// capture attempt and reuse it across retries (see the Phase 5 plan's
  /// "verificationRequestId architecture bug" section) — this method
  /// itself never generates one.
  Future<Either<Failure, BiometricVerificationOutcome>> verifyFace({
    required String captureSessionId,
    required String challengeId,
    required String verificationRequestId,
    required BiometricPurpose purpose,
    required String deviceId,
    required Uint8List image,
  });

  /// `POST /biometrics/enroll` (multipart, 3 poses).
  Future<Either<Failure, BiometricEnrollmentOutcome>> registerFace({
    required String captureSessionId,
    required String challengeId,
    required String deviceId,
    required Uint8List frontalImage,
    required Uint8List leftImage,
    required Uint8List rightImage,
  });
}
