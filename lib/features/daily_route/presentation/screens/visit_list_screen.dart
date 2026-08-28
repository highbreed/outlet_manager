import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/daily_route.dart';
import '../../domain/entities/outlet_visit.dart';
import '../../domain/usecases/get_todays_route_usecase.dart';
import '../../providers/daily_route_providers.dart';
import '../widgets/widgets.dart';

const _kBarTrack = Color(0xFFEFEFEC);
const _kRowDivider = Color(0xFFF0F0EE);

const _weekdayNames = [
  'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday',
];
const _monthNames = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

String _formatToday() {
  final now = DateTime.now();
  return '${_weekdayNames[now.weekday - 1]}, ${now.day} ${_monthNames[now.month - 1]}';
}

/// "Today's Route" — the Daily Route tab root. Restructured per the
/// redesign: an aggregate progress card, a single distinguished "next
/// outlet" (or "in progress") card, and a flat upcoming list — replacing
/// the old full per-visit card list (that detail now lives on the Skipped
/// Outlets screen, and within each visit's own detail screen).
class VisitListScreen extends ConsumerWidget {
  const VisitListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeAsync = ref.watch(todaysRouteProvider);

    return AppScaffold(
      showAppBar: false,
      showBottomNav: true,
      currentNavIndex: 1,
      body: SafeArea(
        child: routeAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => _buildErrorState(context, ref, error),
          data: (routeWithVisits) {
            if (routeWithVisits == null) {
              return _buildNoRouteState(context);
            }
            return _buildVisitList(context, ref, routeWithVisits);
          },
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: kRedColor),
            const SizedBox(height: 16),
            const Text(
              'Failed to load route',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: kTextMuted),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Retry',
              expand: false,
              onPressed: () => ref.invalidate(todaysRouteProvider),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoRouteState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.route, size: 64, color: kTextMuted),
            const SizedBox(height: 16),
            const Text(
              'No route for today',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const Text(
              "Activate your route to see today's visits.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: kTextMuted),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Activate Route',
              expand: false,
              onPressed: () => context.go('/daily-route'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisitList(
    BuildContext context,
    WidgetRef ref,
    DailyRouteWithVisits routeWithVisits,
  ) {
    final route = routeWithVisits.route;
    final visits = routeWithVisits.sortedVisits;
    final total = visits.length;
    final completed = routeWithVisits.completedVisits.length;
    final skippedCount = routeWithVisits.skippedVisits.length;
    final activeVisit = routeWithVisits.activeVisit;
    final pendingOnly = routeWithVisits.pendingVisits;
    final pendingCount = pendingOnly.length +
        visits.where((v) => v.status == VisitStatus.inProgress).length;

    final nextVisit = pendingOnly.isNotEmpty
        ? (routeWithVisits.sortedVisits
                  ..sort((a, b) => a.visitOrder.compareTo(b.visitOrder)))
              .firstWhere((v) => v.status == VisitStatus.pending)
        : null;
    final upcoming = pendingOnly
        .where((v) => v.localId != nextVisit?.localId)
        .toList()
      ..sort((a, b) => a.visitOrder.compareTo(b.visitOrder));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today's Route",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 2),
              Text(
                _formatToday(),
                style: const TextStyle(fontSize: 12, color: kTextMuted),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
            children: [
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$completed of $total visits completed',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: total > 0 ? completed / total : 0,
                        backgroundColor: _kBarTrack,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          kSecondaryColor,
                        ),
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$total total',
                          style: const TextStyle(fontSize: 12, color: kTextMuted),
                        ),
                        Text(
                          '$pendingCount pending',
                          style: const TextStyle(fontSize: 12, color: kTextMuted),
                        ),
                        Text(
                          '$completed done',
                          style: const TextStyle(fontSize: 12, color: kTextMuted),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              if (skippedCount > 0) ...[
                const SizedBox(height: 12),
                _SkippedOutletsLink(count: skippedCount),
              ],

              if (activeVisit != null) ...[
                const SizedBox(height: 16),
                const _SectionCaption('IN PROGRESS'),
                const SizedBox(height: 8),
                _NextOutletCard(
                  visit: activeVisit,
                  ctaLabel: 'Continue Visit',
                  onTap: () => context.push(
                    '/daily-route/visit/${activeVisit.localId}/active',
                  ),
                ),
              ] else if (nextVisit != null) ...[
                const SizedBox(height: 16),
                const _SectionCaption('NEXT OUTLET'),
                const SizedBox(height: 8),
                _NextOutletCard(
                  visit: nextVisit,
                  ctaLabel: 'Start Visit',
                  onTap: () =>
                      context.push('/daily-route/visit/${nextVisit.localId}'),
                ),
              ],

              if (upcoming.isNotEmpty) ...[
                const SizedBox(height: 16),
                const _SectionCaption('UPCOMING'),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    border: Border.all(color: kBorderColor),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      for (var i = 0; i < upcoming.length; i++)
                        _UpcomingRow(
                          visit: upcoming[i],
                          isLast: i == upcoming.length - 1,
                          onTap: () => context
                              .push('/daily-route/visit/${upcoming[i].localId}'),
                        ),
                    ],
                  ),
                ),
              ],

              if (visits.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: Center(
                    child: Text(
                      'No visits scheduled for today',
                      style: TextStyle(color: kTextMuted),
                    ),
                  ),
                ),

              const SizedBox(height: 20),
            ],
          ),
        ),

        if (route.status == DailyRouteStatus.activated ||
            route.status == DailyRouteStatus.inProgress)
          _buildCloseRouteControl(context, ref, routeWithVisits),
      ],
    );
  }

  Widget _buildCloseRouteControl(
    BuildContext context,
    WidgetRef ref,
    DailyRouteWithVisits routeWithVisits,
  ) {
    final pendingCount = routeWithVisits.pendingVisits.length;
    final hasActiveVisit = routeWithVisits.activeVisit != null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasActiveVisit) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: kWarningBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.warning_amber, color: kWarningText, size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Clock out from your current visit before closing the route',
                      style: TextStyle(color: kWarningText, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SecondaryButton(label: 'Close Route', onPressed: null),
          ] else
            SecondaryButton(
              label: pendingCount > 0
                  ? 'Close Route ($pendingCount to miss)'
                  : 'Close Route',
              onPressed: () => _handleCloseRoute(context, ref, routeWithVisits),
            ),
        ],
      ),
    );
  }

  Future<void> _handleCloseRoute(
    BuildContext context,
    WidgetRef ref,
    DailyRouteWithVisits routeWithVisits,
  ) async {
    final pendingVisits = routeWithVisits.pendingVisits;
    final activeVisit = routeWithVisits.activeVisit;

    // If there's an active visit, fall back to the full close screen —
    // it has the "end visit first" recovery flow this quick sheet doesn't.
    if (activeVisit != null) {
      context.push('/daily-route/close');
      return;
    }

    List<BulkSkipResult>? skipResults;
    if (pendingVisits.isNotEmpty) {
      final bulkVisits = pendingVisits
          .map(
            (v) => BulkSkipVisit(
              localId: v.localId,
              outletName: v.outletName,
              outletCode: v.outletCode,
            ),
          )
          .toList();

      skipResults = await BulkSkipReasonsDialog.show(context, visits: bulkVisits);
      if (skipResults == null) return; // User cancelled
    }

    if (!context.mounted) return;
    await showCloseRouteConfirmSheet(
      context,
      ref,
      routeWithVisits: routeWithVisits,
      skipResults: skipResults,
    );
  }
}

class _SectionCaption extends StatelessWidget {
  final String label;

  const _SectionCaption(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: kTextFaint,
        letterSpacing: 0.6,
      ),
    );
  }
}

class _SkippedOutletsLink extends StatelessWidget {
  final int count;

  const _SkippedOutletsLink({required this.count});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.push('/daily-route/skipped'),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: kSecondaryColor2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '$count outlet${count == 1 ? '' : 's'} skipped today · tap to review',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kWarningText,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, size: 16, color: kWarningText),
            ],
          ),
        ),
      ),
    );
  }
}

class _NextOutletCard extends StatelessWidget {
  final OutletVisit visit;
  final String ctaLabel;
  final VoidCallback onTap;

  const _NextOutletCard({
    required this.visit,
    required this.ctaLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: kTextDark,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        visit.visitOrder.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          color: kTextLight,
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          visit.outletName,
                          style: const TextStyle(
                            color: kTextLight,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          visit.outletCode,
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    visit.scheduledClockIn ?? '',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 11,
                    ),
                    decoration: BoxDecoration(
                      color: kTextLight,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ctaLabel,
                          style: const TextStyle(
                            color: kTextDark,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.arrow_forward, size: 14, color: kTextDark),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UpcomingRow extends StatelessWidget {
  final OutletVisit visit;
  final bool isLast;
  final VoidCallback onTap;

  const _UpcomingRow({
    required this.visit,
    required this.isLast,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(bottom: BorderSide(color: _kRowDivider)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${visit.visitOrder.toString().padLeft(2, '0')} · ${visit.outletName}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (visit.scheduledClockIn != null)
                    Text(
                      visit.scheduledClockIn!,
                      style: const TextStyle(fontSize: 11, color: kTextFaint),
                    ),
                ],
              ),
            ),
            const Text(
              'Upcoming',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: kTextMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
