import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/biometric_enrollment_outcome.dart';
import '../repositories/biometric_repository.dart';

class RegisterFaceUseCase {
  final BiometricRepository _repository;

  RegisterFaceUseCase(this._repository);

  Future<Either<Failure, BiometricEnrollmentOutcome>> call({
    required String captureSessionId,
    required String challengeId,
    required String deviceId,
    required Uint8List frontalImage,
    required Uint8List leftImage,
    required Uint8List rightImage,
  }) {
    return _repository.registerFace(
      captureSessionId: captureSessionId,
      challengeId: challengeId,
      deviceId: deviceId,
      frontalImage: frontalImage,
      leftImage: leftImage,
      rightImage: rightImage,
    );
  }
}
