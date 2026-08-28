import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/secondary_button.dart';
import '../../domain/repositories/daily_route_repository.dart';
import '../../domain/usecases/get_todays_route_usecase.dart';
import '../../providers/daily_route_providers.dart';
import 'route_bottom_sheet.dart';
import 'skip_reason_dialog.dart';

/// The redesign's "Close today's route?" bottom-sheet confirmation for the
/// common in-flow close (today's route, no active visit, any pending
/// visits already have skip reasons collected via [BulkSkipReasonsDialog]).
/// On success, navigates to the Route Closed summary screen.
///
/// The rarer recovery case — a stale previous-day route, or one with an
/// active visit that must be force-ended first — still goes through the
/// full [RouteCloseScreen] at `/daily-route/close`; this sheet doesn't
/// replace that path.
Future<void> showCloseRouteConfirmSheet(
  BuildContext context,
  WidgetRef ref, {
  required DailyRouteWithVisits routeWithVisits,
  List<BulkSkipResult>? skipResults,
}) {
  final completed = routeWithVisits.completedVisits.length;
  final skipped = routeWithVisits.skippedVisits.length;
  final willBeMissed = routeWithVisits.pendingVisits.length;

  return showRouteBottomSheet(
    context,
    builder: (sheetContext) => _CloseRouteConfirmContent(
      routeLocalId: routeWithVisits.route.localId,
      completed: completed,
      skipped: skipped,
      willBeMissed: willBeMissed,
      skipResults: skipResults,
    ),
  );
}

class _CloseRouteConfirmContent extends ConsumerStatefulWidget {
  final String routeLocalId;
  final int completed;
  final int skipped;
  final int willBeMissed;
  final List<BulkSkipResult>? skipResults;

  const _CloseRouteConfirmContent({
    required this.routeLocalId,
    required this.completed,
    required this.skipped,
    required this.willBeMissed,
    required this.skipResults,
  });

  @override
  ConsumerState<_CloseRouteConfirmContent> createState() =>
      _CloseRouteConfirmContentState();
}

class _CloseRouteConfirmContentState
    extends ConsumerState<_CloseRouteConfirmContent> {
  bool _isClosing = false;
  String? _error;

  Future<void> _confirmClose() async {
    setState(() {
      _isClosing = true;
      _error = null;
    });

    List<SkipVisitParams>? skippedVisits;
    final results = widget.skipResults;
    if (results != null && results.isNotEmpty) {
      skippedVisits = results
          .map(
            (r) => SkipVisitParams(
              visitLocalId: r.visitLocalId,
              skipReasonId: r.reasonId,
              skipNotes: r.notes,
            ),
          )
          .toList();
    }

    await ref
        .read(routeCloseNotifierProvider.notifier)
        .close(routeLocalId: widget.routeLocalId, skippedVisits: skippedVisits);

    if (!mounted) return;

    final state = ref.read(routeCloseNotifierProvider);
    if (state.hasValue && state.value != null) {
      Navigator.of(context).pop();
      context.go(
        '/daily-route/close/summary',
        extra: {
          'completed': widget.completed,
          'skipped': widget.skipped,
          'missed': widget.willBeMissed,
        },
      );
      return;
    }

    setState(() {
      _isClosing = false;
      _error = state.error?.toString() ?? 'Failed to close route';
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasMissed = widget.willBeMissed > 0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            color: kWarningBg,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.warning_amber_rounded,
            color: kWarningText,
            size: 22,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          "Close today's route?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Text(
          hasMissed
              ? "${widget.willBeMissed} outlet${widget.willBeMissed == 1 ? '' : 's'} haven't been visited. Closing the route marks ${widget.willBeMissed == 1 ? 'it' : 'them'} as missed."
              : "All outlets have been accounted for.",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, color: kTextMuted),
        ),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: kBackground,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _StatRow(label: 'Completed', value: widget.completed),
              const SizedBox(height: 8),
              _StatRow(label: 'Skipped', value: widget.skipped),
              if (hasMissed) ...[
                const SizedBox(height: 8),
                _StatRow(
                  label: 'Will be marked missed',
                  value: widget.willBeMissed,
                  color: kWarningColor,
                ),
              ],
            ],
          ),
        ),
        if (_error != null) ...[
          const SizedBox(height: 12),
          Text(
            _error!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: kRedColor, fontSize: 12),
          ),
        ],
        const SizedBox(height: 14),
        SecondaryButton(
          label: 'Go Back',
          onPressed: _isClosing ? null : () => Navigator.of(context).pop(),
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          label: 'Close Route',
          isLoading: _isClosing,
          onPressed: _confirmClose,
        ),
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final int value;
  final Color? color;

  const _StatRow({required this.label, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13, color: color ?? kTextMuted),
        ),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: color ?? kTextDark,
          ),
        ),
      ],
    );
  }
}
