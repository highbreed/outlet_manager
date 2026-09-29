import '../domain/entities/face_pose.dart';
import '../domain/entities/liveness_action.dart';
import '../domain/entities/liveness_action_outcome.dart';

/// Head-turn + blink liveness, driven by ML Kit pose data. This is the
/// "active" half of [LivenessService] — see the Phase 4 plan's "Liveness
/// architecture" section for why it's named/scoped this way: best-effort
/// replay resistance, not real anti-spoofing, kept swappable behind
/// [LivenessService] for a future `PassiveLivenessService`.
abstract class ActiveLivenessService {
  /// Resets per-action tracking state (consecutive-hold counters, blink
  /// transition state). Call when starting a new action, or a fresh
  /// challenge/session.
  void resetAction();

  /// Feed one pose observation for the action currently being attempted.
  /// Returns the updated outcome — `satisfied` flips to `true` once the
  /// action's requirement (hold duration for turns/look-straight, a real
  /// open→closed→open transition for blink) is met.
  LivenessActionOutcome observe(LivenessAction action, FacePose pose);
}
