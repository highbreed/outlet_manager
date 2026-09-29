import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../daily_route/domain/entities/outlet_visit.dart';
import '../../providers/mapping_session_notifier.dart';
import 'outlet_mapping_intro_screen.dart';

/// Shown ONLY for `captureFailed`/`abandoned` (spec §20's screen-count
/// reduction) — the one case genuinely needing a dedicated "here's what
/// happened, retry?" moment. A successful submission never reaches this
/// screen; the employee is already back on `ActiveVisitScreen` and
/// `MappingRequestCard` carries that story.
class OutletMappingResultScreen extends ConsumerWidget {
  final OutletVisit visit;

  const OutletMappingResultScreen({super.key, required this.visit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(mappingSessionNotifierProvider);
    final session = uiState.session;
    final message = session?.failureCode?.displayMessage ??
        session?.failureMessage ??
        'Mapping needs to be repeated.';

    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: kBackground,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Icon(Icons.error_outline, size: 48, color: kRedColor),
                const SizedBox(height: 16),
                const Text(
                  'Mapping Needs Retrying',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                Text(message, style: const TextStyle(fontSize: 14, color: kTextMuted)),
                const Spacer(),
                PrimaryButton(
                  label: 'Map Again',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => OutletMappingIntroScreen(visit: visit)),
                    );
                  },
                ),
                const SizedBox(height: 12),
                SecondaryButton(
                  label: 'Done',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
