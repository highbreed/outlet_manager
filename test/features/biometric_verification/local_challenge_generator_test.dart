import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:outlet_manager/features/biometric_verification/domain/config/biometric_config.dart';
import 'package:outlet_manager/features/biometric_verification/domain/entities/entities.dart';
import 'package:outlet_manager/features/biometric_verification/services/local_challenge_generator.dart';

void main() {
  group('LocalChallengeGenerator', () {
    const config = BiometricConfig();

    test('generates the configured number of actions', () async {
      final generator = LocalChallengeGenerator(config: config, random: Random(1));
      final result = await generator.generate(
        purpose: BiometricPurpose.clockIn,
        deviceId: 'device-1',
      );
      final challenge = result.getRight().toNullable()!;
      expect(challenge.actions.length, config.challengeActionCount);
    });

    test('generated actions are unique (sampled without replacement)', () async {
      final generator = LocalChallengeGenerator(config: config, random: Random(2));
      final result = await generator.generate(
        purpose: BiometricPurpose.clockIn,
        deviceId: 'device-1',
      );
      final challenge = result.getRight().toNullable()!;
      expect(challenge.actions.toSet().length, challenge.actions.length);
    });

    test('sets an expiry matching the configured challenge timeout', () async {
      final generator = LocalChallengeGenerator(config: config, random: Random(3));
      final before = DateTime.now();
      final result = await generator.generate(
        purpose: BiometricPurpose.clockIn,
        deviceId: 'device-1',
      );
      final challenge = result.getRight().toNullable()!;
      final expectedExpiry = before.add(config.challengeTimeout);
      expect(
        challenge.expiresAt.difference(expectedExpiry).inSeconds.abs(),
        lessThanOrEqualTo(1),
      );
    });

    test('challenge is not expired immediately after generation', () async {
      final generator = LocalChallengeGenerator(config: config, random: Random(4));
      final result = await generator.generate(
        purpose: BiometricPurpose.clockIn,
        deviceId: 'device-1',
      );
      final challenge = result.getRight().toNullable()!;
      expect(challenge.isExpired, isFalse);
    });

    test('challenge reports expired once past expiresAt', () async {
      final challenge = LivenessChallenge(
        challengeId: 'abc',
        actions: const [LivenessAction.blink],
        expiresAt: DateTime.now().subtract(const Duration(seconds: 1)),
        purpose: BiometricPurpose.clockIn,
      );
      expect(challenge.isExpired, isTrue);
    });

    test('different seeds can produce different action orderings', () async {
      final orderings = <String>{};
      for (var seed = 0; seed < 10; seed++) {
        final generator = LocalChallengeGenerator(config: config, random: Random(seed));
        final result = await generator.generate(
          purpose: BiometricPurpose.clockIn,
          deviceId: 'device-1',
        );
        final challenge = result.getRight().toNullable()!;
        orderings.add(challenge.actions.map((a) => a.wireValue).join(','));
      }
      // Not every seed need differ, but with 10 seeds and 4!/(4-3)! = 24
      // possible orderings, seeing only one unique ordering would indicate
      // shuffle() isn't actually randomizing.
      expect(orderings.length, greaterThan(1));
    });
  });
}
