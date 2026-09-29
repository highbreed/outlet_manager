import 'package:freezed_annotation/freezed_annotation.dart';

import 'biometric_purpose.dart';
import 'liveness_action.dart';

part 'liveness_challenge.freezed.dart';

/// A liveness challenge to perform — server-issued from V1 via
/// `POST /biometrics/challenge` (see `RemoteChallengeGenerator`);
/// `LocalChallengeGenerator` produces the same shape for dev/test builds
/// only, never selectable in release (see "Production safety" in the
/// Phase 4 plan).
@freezed
class LivenessChallenge with _$LivenessChallenge {
  const factory LivenessChallenge({
    required String challengeId,
    required List<LivenessAction> actions,
    required DateTime expiresAt,
    required BiometricPurpose purpose,
  }) = _LivenessChallenge;

  const LivenessChallenge._();

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}
