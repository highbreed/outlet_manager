import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../auth/auth.dart';
import '../../daily_route/daily_route.dart';
import '../../outlet_mapping/presentation/widgets/mapping_request_card.dart';
import 'widgets/widgets.dart';

/// Main home screen shown after successful authentication.
/// Restructured around context — active visit / route progress first —
/// instead of the previous 13-tile feature grid.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    // Polled day status (see dayStatusPollProvider) is the source of truth
    // for what Home shows — it catches admin-side changes (closing,
    // force-closing) that a one-off fetch wouldn't. activeVisitProvider
    // still feeds ActiveVisitCard's own live duration ticker.
    final dayStatus = ref.watch(dayStatusPollProvider).valueOrNull;
    final hasActiveVisit = dayStatus?.status == DayStatus.atOutlet;
    // Same source ActiveVisitCard itself reads (activeVisitProvider is
    // dayStatusPollProvider-sourced) — kept as a separate watch here
    // rather than threaded through ActiveVisitCard so the mapping card
    // still renders even before/without ActiveVisitCard's own build.
    final activeVisit = ref.watch(activeVisitProvider);
    final routeInProgress =
        dayStatus != null &&
        (dayStatus.status == DayStatus.active ||
            dayStatus.status == DayStatus.atOutlet ||
            dayStatus.status == DayStatus.inTransit);

    return AppScaffold(
      showAppBar: false,
      showBottomNav: true,
      currentNavIndex: 0,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingHeader(user: user),
              const SizedBox(height: 10),
              if (hasActiveVisit) ...[
                const ActiveVisitCard(),
                const SizedBox(height: 18),
              ],
              if (hasActiveVisit && activeVisit != null) ...[
                MappingRequestCard(visit: activeVisit),
                const SizedBox(height: 18),
              ],
              const RouteStatusCard(),
              const SizedBox(height: 18),
              // Shown regardless of active-visit state — the mock's active
              // visit frame omits this section, but hiding it left the
              // fastest way to reach Stock Take/Daily Sales/etc. only
              // reachable via the Tasks tab while clocked in, which is
              // exactly the wrong tradeoff for the most time-pressured
              // moment of a rep's day.
              QuickActionsSection(
                items: routeInProgress || hasActiveVisit
                    ? homeFeatures.take(6).toList()
                    : compactHomeFeatures,
              ),
              const SizedBox(height: 18),
              PerformanceSection(hasActiveVisit: hasActiveVisit),
              const SizedBox(height: 18),
              const RecentActivitySection(),
            ],
          ),
        ),
      ),
    );
  }
}
