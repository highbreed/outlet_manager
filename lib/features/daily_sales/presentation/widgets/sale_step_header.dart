import 'package:flutter/material.dart';

import '../../../../core/core.dart';

/// Horizontal 3-step progress header for the New Sale wizard.
///
/// Each step is a circle+label pair laid out inline (not stacked), joined
/// by a connecting line — matching the mock exactly rather than the
/// stacked circle-over-label convention used elsewhere (e.g. Stock Take).
class SaleStepHeader extends StatelessWidget {
  static const steps = ['Products', 'Customer', 'Review'];

  final int currentStep;

  const SaleStepHeader({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      child: Row(
        children: [
          for (var i = 0; i < steps.length; i++) ...[
            _StepDot(
              index: i + 1,
              label: steps[i],
              state: i < currentStep
                  ? _StepState.completed
                  : i == currentStep
                  ? _StepState.active
                  : _StepState.upcoming,
            ),
            if (i != steps.length - 1)
              Expanded(
                child: Container(
                  height: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  color: i < currentStep ? kSuccessColor : kBorderColor,
                ),
              ),
          ],
        ],
      ),
    );
  }
}

enum _StepState { completed, active, upcoming }

class _StepDot extends StatelessWidget {
  final int index;
  final String label;
  final _StepState state;

  const _StepDot({
    required this.index,
    required this.label,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = switch (state) {
      _StepState.completed => kSuccessBg,
      _StepState.active => kTextDark,
      _StepState.upcoming => kBorderColor,
    };
    final labelColor = switch (state) {
      _StepState.completed => kSuccessColor,
      _StepState.active => kTextDark,
      _StepState.upcoming => kTextMuted,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: state == _StepState.completed
              ? const Icon(Icons.check, size: 12, color: kSuccessColor)
              : Text(
                  '$index',
                  style: TextStyle(
                    color: state == _StepState.active
                        ? kTextLight
                        : kTextMuted,
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                  ),
                ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: state == _StepState.upcoming
                ? FontWeight.w600
                : FontWeight.w700,
            color: labelColor,
          ),
        ),
      ],
    );
  }
}
