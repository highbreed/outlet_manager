import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import 'liveness_instruction_banner.dart';

/// Terminal success/failure view — shown once [BiometricCaptureState.isTerminal].
class BiometricResultView extends StatelessWidget {
  final BiometricCaptureState state;
  final VoidCallback onRetry;

  const BiometricResultView({super.key, required this.state, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final verified = state.phase == BiometricPhase.verified;
    return Container(
      color: Colors.black87,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                verified ? Icons.check_circle : Icons.error_outline,
                color: verified ? Colors.greenAccent : Colors.redAccent,
                size: 72,
              ),
              const SizedBox(height: 24),
              Text(
                // Reuses the same phase/errorReason -> copy mapping the
                // in-progress banner uses — previously this always showed
                // the same generic "couldn't verify your face" text
                // regardless of the actual reason (challenge expired,
                // poor image quality, rate limited, etc.), which masked
                // what was actually going wrong during on-device testing.
                verified ? 'Face verified' : LivenessInstructionBanner.textFor(state),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              if (!verified) ...[
                const SizedBox(height: 24),
                ElevatedButton(onPressed: onRetry, child: const Text('Try Again')),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
