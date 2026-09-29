import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/biometric_purpose.dart';
import '../entities/liveness_challenge.dart';
import '../repositories/biometric_repository.dart';

class RequestLivenessChallengeUseCase {
  final BiometricRepository _repository;

  RequestLivenessChallengeUseCase(this._repository);

  Future<Either<Failure, LivenessChallenge>> call({
    required BiometricPurpose purpose,
    required String deviceId,
  }) =>
      _repository.requestChallenge(purpose: purpose, deviceId: deviceId);
}
