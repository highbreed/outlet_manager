import 'package:fpdart/fpdart.dart';

import '../../../core/network/failures.dart';
import '../domain/entities/biometric_purpose.dart';
import '../domain/entities/liveness_challenge.dart';
import '../domain/repositories/biometric_repository.dart';
import 'liveness_challenge_generator.dart';

/// V1 default — challenges come from `POST /biometrics/challenge` via the
/// repository, giving the backend control over the nonce/freshness
/// semantics rather than a fully client-controlled challenge.
class RemoteChallengeGenerator implements LivenessChallengeGenerator {
  final BiometricRepository repository;

  RemoteChallengeGenerator(this.repository);

  @override
  Future<Either<Failure, LivenessChallenge>> generate({
    required BiometricPurpose purpose,
    required String deviceId,
  }) =>
      repository.requestChallenge(purpose: purpose, deviceId: deviceId);
}
