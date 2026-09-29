import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../connectivity/connectivity.dart';
import '../../../daily_route/domain/entities/outlet_visit.dart';
import '../../providers/mapping_session_notifier.dart';
import 'outlet_mapping_capture_screen.dart';

/// Intro + readiness merged into one screen (spec §28/§44 — the brief's
/// own preference, matching this codebase's existing convention of
/// combining explanation and live device checks on one screen rather than
/// forcing a second tap through inert content, same as
/// `GeofenceOverrideRequestScreen`). Location permission itself is not
/// re-checked here — it's already a mandatory login-time gate app-wide by
/// the time an employee reaches an active visit (spec §72's "don't build
/// a second permission system").
class OutletMappingIntroScreen extends ConsumerWidget {
  final OutletVisit visit;

  const OutletMappingIntroScreen({super.key, required this.visit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = ref.watch(isOnlineProvider);
    final uiState = ref.watch(mappingSessionNotifierProvider);

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text('Map Outlet', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(height: 8),
              Text(visit.outletName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 16),
              AppCard(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'This outlet needs to be mapped so attendance can use the correct working area.',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 12),
                      _InstructionLine('Walk all legitimate working areas'),
                      _InstructionLine('Include every floor where staff work'),
                      _InstructionLine('Walk near the usable perimeter where practical'),
                      _InstructionLine('Keep your phone with you the whole time'),
                      _InstructionLine("Don't stop until every relevant area is covered"),
                      _InstructionLine("Don't walk into neighbouring businesses"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (!isOnline)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kWarningBg,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.wifi_off, color: kWarningText, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Internet connection is required to start outlet mapping. '
                          'Once mapping has started, it can continue offline.',
                          style: TextStyle(color: kWarningText, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              if (uiState.errorMessage != null) ...[
                const SizedBox(height: 12),
                Text(uiState.errorMessage!, style: const TextStyle(color: kRedColor, fontSize: 13)),
              ],
              const Spacer(),
              PrimaryButton(
                label: 'Start Mapping',
                onPressed: !isOnline || uiState.isBusy ? null : () => _start(context, ref),
                isLoading: uiState.isBusy,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _start(BuildContext context, WidgetRef ref) async {
    final requestId = visit.mappingRequest?.requestId;
    if (requestId == null) return;
    final ok = await ref
        .read(mappingSessionNotifierProvider.notifier)
        .startMapping(requestId: requestId, visit: visit);
    if (!context.mounted || !ok) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => OutletMappingCaptureScreen(visit: visit)),
    );
  }
}

class _InstructionLine extends StatelessWidget {
  final String text;
  const _InstructionLine(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(Icons.check_circle_outline, size: 16, color: kTextMuted),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }
}
