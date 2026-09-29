import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/biometric_purpose.dart';
import '../entities/biometric_verification_outcome.dart';
import '../repositories/biometric_repository.dart';

class VerifyFaceUseCase {
  final BiometricRepository _repository;

  VerifyFaceUseCase(this._repository);

  /// [verificationRequestId] is caller-supplied, not generated here — the
  /// contract requires reusing the same id across a retry of the same
  /// attempt, so the caller (`BiometricCaptureNotifier`) mints it once per
  /// attempt and passes it on every retry. See the "Phase 5" plan's
  /// "Identifiers" section.
  Future<Either<Failure, BiometricVerificationOutcome>> call({
    required String captureSessionId,
    required String challengeId,
    required String verificationRequestId,
    required BiometricPurpose purpose,
    required String deviceId,
    required Uint8List image,
  }) {
    return _repository.verifyFace(
      captureSessionId: captureSessionId,
      challengeId: challengeId,
      verificationRequestId: verificationRequestId,
      purpose: purpose,
      deviceId: deviceId,
      image: image,
    );
  }
}
