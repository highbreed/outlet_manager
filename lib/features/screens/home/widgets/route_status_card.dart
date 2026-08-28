import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../daily_route/daily_route.dart';

/// Home screen's "Today's Route" card: today's route progress when a route
/// exists, an "unclosed route" warning when a previous route needs closing,
/// or a "Start Your Day" call-to-action when no route has been activated
/// yet.
///
/// Driven entirely by [dayStatusPollProvider] — a single polled endpoint
/// (`GET /visits/routes/day-status`) that re-fetches every
/// [dayStatusPollInterval] while this card is on screen, so admin-side
/// changes (closing/force-closing the route, editing today's schedule) show
/// up here without the agent taking any action first. The older
/// `/routes/today` + `/routes/pending` providers are untouched and still
/// used by the rest of the Daily Route feature (activation, visit list,
/// close, etc.) — this card is the only thing that switched.
class RouteStatusCard extends ConsumerWidget {
  const RouteStatusCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dayStatusAsync = ref.watch(dayStatusPollProvider);

    return dayStatusAsync.when(
      data: (dayStatus) {
        switch (dayStatus.status) {
          case DayStatus.blocked:
            return const _UnclosedRouteCard();
          case DayStatus.notScheduled:
            return const _NoRouteAssignedCard();
          case DayStatus.notActivated:
            return _RouteNotStartedCard(dayStatus: dayStatus);
          case DayStatus.active:
          case DayStatus.atOutlet:
          case DayStatus.inTransit:
          case DayStatus.completed:
            final routeData = dayStatus.route;
            if (routeData == null) return const _ErrorCard();

            final visits = routeData.visits;
            final completed = visits
                .where((v) => v.status == VisitStatus.completed)
                .length;
            final total = visits.length;
            final hasActiveVisit = visits.any(
              (v) => v.status == VisitStatus.inProgress,
            );
            final nextVisit = routeData.sortedVisits
                .where((v) => v.status == VisitStatus.pending)
                .firstOrNull;

            return _RouteProgressCard(
              completed: completed,
              total: total,
              hasActiveVisit: hasActiveVisit,
              nextVisit: nextVisit,
            );
        }
      },
      loading: () => const _LoadingCard(),
      error: (error, stack) => const _ErrorCard(),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 12),
          Text('Loading route status…', style: TextStyle(color: kTextMuted)),
        ],
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: kRedColor.withValues(alpha: 0.4),
      onTap: () => context.push('/daily-route'),
      child: const Row(
        children: [
          Icon(Icons.error_outline, color: kRedColor, size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Could not load route. Tap to retry.',
              style: TextStyle(color: kRedColor),
            ),
          ),
        ],
      ),
    );
  }
}

/// Home only ever previews up to this many scheduled outlets inline — a rep
/// with a long route shouldn't have their whole day list push everything
/// else down the page. "+N more" hands off to the route activation screen,
/// which shows the full list.
const _homeScheduledOutletsPreviewCount = 3;

/// Route assigned for today but not yet activated ("not_activated" day
/// status). Matches the mock's centered black card with outlet count and
/// first-stop time, plus a "Scheduled Outlets" preview built from the
/// day-status endpoint's `scheduled_stops` — real per-outlet data (name,
/// order, scheduled time), not a fabricated summary.
class _RouteNotStartedCard extends StatelessWidget {
  final DayStatusInfo dayStatus;

  const _RouteNotStartedCard({required this.dayStatus});

  @override
  Widget build(BuildContext context) {
    final stops = [...dayStatus.scheduledStops]
      ..sort((a, b) => a.visitOrder.compareTo(b.visitOrder));
    final total = stops.length;
    final firstStop = formatScheduledClockTime(
      stops.firstOrNull?.scheduledClockIn,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCard(
          dark: true,
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
          onTap: () => context.push('/daily-route'),
          child: Column(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.location_on_outlined,
                  color: kTextLight,
                  size: 22,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                "Your route hasn't started",
                style: TextStyle(
                  color: kTextLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                firstStop != null
                    ? '$total outlets planned for today · first stop $firstStop'
                    : '$total outlets planned for today',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white60, fontSize: 12),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  color: kTextLight,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'Start Route →',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kTextDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (stops.isNotEmpty) ...[
          const SizedBox(height: 14),
          ScheduledOutletsCard(
            stops: stops,
            maxVisible: _homeScheduledOutletsPreviewCount,
            onViewAll: () => context.push('/daily-route'),
          ),
        ],
      ],
    );
  }
}

/// No route assigned to the rep at all for today.
class _NoRouteAssignedCard extends StatelessWidget {
  const _NoRouteAssignedCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      child: Column(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: kBackground,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.event_busy_outlined,
              color: kTextFaint,
              size: 22,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'No route assigned today',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          const Text(
            'Check back tomorrow or contact your supervisor.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: kTextMuted),
          ),
        ],
      ),
    );
  }
}

class _UnclosedRouteCard extends StatelessWidget {
  const _UnclosedRouteCard();

  @override
  Widget build(BuildContext context) {
    // Navigate straight to the Close Route screen — it lists the outlets
    // that weren't visited and owns the skip-reason + close flow itself,
    // rather than popping a skip-reason sheet on top of Home.
    return AppCard(
      borderColor: kWarningColor.withValues(alpha: 0.4),
      onTap: () => context.push('/daily-route/close'),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kWarningBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.warning_amber_rounded,
              color: kWarningText,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Unclosed Route',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: kTextDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Close your previous route to continue',
                  style: TextStyle(fontSize: 12, color: kTextMuted),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward, color: kWarningText, size: 18),
        ],
      ),
    );
  }
}

class _RouteProgressCard extends StatelessWidget {
  final int completed;
  final int total;
  final bool hasActiveVisit;
  final OutletVisit? nextVisit;

  const _RouteProgressCard({
    required this.completed,
    required this.total,
    required this.hasActiveVisit,
    required this.nextVisit,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total > 0 ? completed / total : 0.0;
    final remaining = total - completed;
    final nextVisitTime = formatScheduledClockTime(nextVisit?.scheduledClockIn);

    return AppCard(
      onTap: () => context.push('/daily-route/visits'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Route",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Text(
                '$total outlets',
                style: const TextStyle(fontSize: 12, color: kTextMuted),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFFEFEFEC),
              valueColor: const AlwaysStoppedAnimation<Color>(kSecondaryColor),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 10),
          if (hasActiveVisit)
            Text(
              '$completed completed · $remaining remaining',
              style: const TextStyle(fontSize: 12, color: kTextMuted),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$completed completed',
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
                Text(
                  '$remaining remaining',
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
              ],
            ),
          if (!hasActiveVisit && nextVisit != null) ...[
            const SizedBox(height: 14),
            const Text(
              'NEXT',
              style: TextStyle(fontSize: 11, color: kTextFaint),
            ),
            const SizedBox(height: 4),
            Text(
              nextVisitTime != null
                  ? '${nextVisit!.outletName} · $nextVisitTime'
                  : nextVisit!.outletName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 13),
              decoration: BoxDecoration(
                color: kTextDark,
                borderRadius: BorderRadius.circular(999),
              ),
              child: const Text(
                'Continue Route →',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
