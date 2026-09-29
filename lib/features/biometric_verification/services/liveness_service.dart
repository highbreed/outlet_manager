import '../domain/entities/face_pose.dart';
import '../domain/entities/liveness_action.dart';
import '../domain/entities/liveness_action_outcome.dart';
import 'active_liveness_service.dart';

/// Composes the liveness result — today, purely [ActiveLivenessService];
/// the seam for a future `PassiveLivenessService` (anti-spoof model/SDK)
/// is the commented line below. Once that exists, `satisfied` becomes
/// `activeOutcome.satisfied && passiveOutcome.satisfied`, without any
/// caller of [LivenessService] needing to change — see the Phase 4 plan's
/// "Liveness architecture" section.
class LivenessService {
  final ActiveLivenessService active;
  // final PassiveLivenessService? passive; // future

  LivenessService({required this.active});

  void resetAction() => active.resetAction();

  LivenessActionOutcome observe(LivenessAction action, FacePose pose) {
    final activeOutcome = active.observe(action, pose);
    // final passiveOutcome = passive?.observe(pose);
    // return activeOutcome.copyWith(
    //   satisfied: activeOutcome.satisfied && (passiveOutcome?.satisfied ?? true),
    // );
    return activeOutcome;
  }
}
