import 'package:fpdart/fpdart.dart';

import '../../../core/network/failures.dart';
import '../domain/entities/biometric_purpose.dart';
import '../domain/entities/liveness_challenge.dart';

/// Isolated so challenge generation can move between a purely local
/// implementation and a backend-issued one without touching the liveness
/// engine itself. `RemoteChallengeGenerator` is the V1 default — see the
/// Phase 4 plan's "Liveness architecture"/"Backend coordination" sections
/// for why server-issued challenges matter (nonce/freshness semantics).
abstract class LivenessChallengeGenerator {
  Future<Either<Failure, LivenessChallenge>> generate({
    required BiometricPurpose purpose,
    required String deviceId,
  });
}
