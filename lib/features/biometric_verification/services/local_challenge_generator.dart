import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

import '../../../core/network/failures.dart';
import '../domain/config/biometric_config.dart';
import '../domain/entities/biometric_purpose.dart';
import '../domain/entities/liveness_action.dart';
import '../domain/entities/liveness_challenge.dart';
import 'liveness_challenge_generator.dart';

/// Dev/test-only — a fully client-generated challenge has no backend
/// nonce/freshness guarantee. Must never be selected in a release build;
/// see the Phase 4 plan's "Production safety" section (the same
/// debug-only gating pattern used for the fake biometric datasource).
class LocalChallengeGenerator implements LivenessChallengeGenerator {
  final BiometricConfig config;
  final Random _random;

  LocalChallengeGenerator({
    this.config = const BiometricConfig(),
    Random? random,
  }) : _random = random ?? Random();

  @override
  Future<Either<Failure, LivenessChallenge>> generate({
    required BiometricPurpose purpose,
    required String deviceId,
  }) async {
    final actions = List<LivenessAction>.from(LivenessAction.values)..shuffle(_random);
    final selected = actions.take(config.challengeActionCount).toList(growable: false);
    return Right(
      LivenessChallenge(
        challengeId: const Uuid().v4(),
        actions: selected,
        expiresAt: DateTime.now().add(config.challengeTimeout),
        purpose: purpose,
      ),
    );
  }
}
