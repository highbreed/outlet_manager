import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/toast_notification.dart';
import '../../domain/entities/outlet_visit.dart';
import '../../providers/daily_route_providers.dart';
import '../widgets/route_back_header.dart';

/// Lists today's skipped outlets, with "Reschedule" (not yet backed by any
/// API — shows a coming-soon toast, matching the app's existing pattern for
/// unbuilt actions) and "Visit Now" (navigates to the outlet's visit
/// detail, same as any other visit) actions per outlet.
class SkippedOutletsScreen extends ConsumerWidget {
  const SkippedOutletsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeAsync = ref.watch(todaysRouteProvider);

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: routeAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Error: $error')),
          data: (routeWithVisits) {
            final skipped = routeWithVisits?.skippedVisits ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RouteBackHeader(
                  title: 'Skipped Outlets',
                  onBack: () => context.pop(),
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                ),
                if (skipped.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor2,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '${skipped.length} outlet${skipped.length == 1 ? '' : 's'} skipped today · tap to reschedule or revisit',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: kWarningText,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: skipped.isEmpty
                      ? const Center(
                          child: Text(
                            'No outlets skipped today',
                            style: TextStyle(color: kTextMuted),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
                          itemCount: skipped.length,
                          separatorBuilder: (_, _) => const SizedBox(height: 10),
                          itemBuilder: (context, index) =>
                              _SkippedOutletCard(visit: skipped[index]),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SkippedOutletCard extends StatelessWidget {
  final OutletVisit visit;

  const _SkippedOutletCard({required this.visit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        border: Border.all(color: kBorderColor),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      visit.outletName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${visit.outletCode} · ${visit.visitOrder.toString().padLeft(2, '0')}'
                      '${visit.scheduledClockIn != null ? ' · ${visit.scheduledClockIn}' : ''}',
                      style: const TextStyle(fontSize: 11, color: kTextFaint),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                  color: kBackground,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'Skipped',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: kTextMuted,
                  ),
                ),
              ),
            ],
          ),
          if (visit.skipReasonCode != null) ...[
            const SizedBox(height: 8),
            Text(
              'Reason: ${visit.skipReasonCode}',
              style: const TextStyle(fontSize: 11, color: kTextMuted),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _ActionPill(
                  label: 'Reschedule',
                  filled: false,
                  onTap: () => context.showInfoToast('Coming soon'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _ActionPill(
                  label: 'Visit Now',
                  filled: true,
                  onTap: () =>
                      context.push('/daily-route/visit/${visit.localId}'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionPill extends StatelessWidget {
  final String label;
  final bool filled;
  final VoidCallback onTap;

  const _ActionPill({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: filled ? kTextDark : Colors.transparent,
            border: filled ? null : Border.all(color: kBorderColor),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: filled ? kTextLight : kTextDark,
            ),
          ),
        ),
      ),
    );
  }
}
