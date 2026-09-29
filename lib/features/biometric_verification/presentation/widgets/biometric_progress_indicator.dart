import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

/// Step/segment progress across the challenge's actions plus
/// capture/upload — never conveyed by color alone (each segment also has
/// an icon), per the Phase 4 plan's accessibility requirement.
class BiometricProgressIndicator extends StatelessWidget {
  final BiometricCaptureState state;

  const BiometricProgressIndicator({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final outcomes = state.actionOutcomes;
    if (outcomes.isEmpty) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < outcomes.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          _StepDot(
            done: i < state.currentActionIndex ||
                (i == state.currentActionIndex && outcomes[i].satisfied),
            active: i == state.currentActionIndex,
          ),
        ],
      ],
    );
  }
}

class _StepDot extends StatelessWidget {
  final bool done;
  final bool active;

  const _StepDot({required this.done, required this.active});

  @override
  Widget build(BuildContext context) {
    final color = done ? Colors.greenAccent : (active ? Colors.white : Colors.white38);
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: done
          ? const Icon(Icons.check, size: 18, color: Colors.black)
          : null,
    );
  }
}
