import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary_button.dart';

/// Shown right after a successful clock-out — confirms the visit is done.
///
/// The mock's per-module breakdown (stock take count, shelf share %, sales
/// total, facings count) isn't shown here: none of that data is available
/// at clock-out time (no cross-module visit-summary API exists yet), and
/// fabricating numbers would be worse than omitting the card. Only the
/// outlet name and visit duration — both real, known at clock-out — are
/// shown.
class VisitCompleteScreen extends StatelessWidget {
  final String outletName;
  final String durationLabel;

  const VisitCompleteScreen({
    super.key,
    required this.outletName,
    required this.durationLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 44, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 6),
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: kSuccessBg,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_outline,
                      color: kSuccessText,
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Visit complete',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$outletName · $durationLabel',
                    style: const TextStyle(fontSize: 13, color: kTextMuted),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                label: 'Back to Route',
                onPressed: () => context.go('/daily-route/visits'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
