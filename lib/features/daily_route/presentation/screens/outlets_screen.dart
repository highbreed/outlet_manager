import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/outlet_visit.dart';
import '../../domain/usecases/get_todays_route_usecase.dart';
import '../../providers/daily_route_providers.dart';
import '../widgets/widgets.dart';

/// Screen showing all outlets assigned to the user today.
///
/// Displays outlets from the daily route in a card-based layout.
class OutletsScreen extends ConsumerWidget {
  const OutletsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeAsync = ref.watch(todaysRouteProvider);

    return AppScaffold(
      title: 'Today\'s Outlets',
      showBottomNav: true,
      currentNavIndex: 1,
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () => ref.invalidate(todaysRouteProvider),
        ),
      ],
      body: routeAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildErrorState(context, ref, error),
        data: (routeWithVisits) {
          if (routeWithVisits == null) {
            return _buildNoOutletsState(context);
          }
          return _buildOutletsList(context, ref, routeWithVisits);
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, Object error) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final mutedColor = textColor.withValues(alpha: 0.6);
    final errorColor = isDark ? const Color(0xFFFF6B6B) : kRedColor;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: errorColor),
            const SizedBox(height: 16),
            Text(
              'Unable to load outlets',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: mutedColor),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => ref.invalidate(todaysRouteProvider),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoOutletsState(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final mutedColor = textColor.withValues(alpha: 0.6);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.store_outlined, size: 80, color: mutedColor),
            const SizedBox(height: 16),
            Text(
              'No Outlets Assigned Today',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You don\'t have any outlets assigned for today.\nPlease check with your supervisor.',
              textAlign: TextAlign.center,
              style: TextStyle(color: mutedColor),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => context.go('/daily-route'),
              icon: const Icon(Icons.route),
              label: const Text('Go to Daily Route'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutletsList(
    BuildContext context,
    WidgetRef ref,
    DailyRouteWithVisits routeWithVisits,
  ) {
    final visits = routeWithVisits.sortedVisits;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final mutedColor = textColor.withValues(alpha: 0.6);

    // Group visits by status
    final completed = routeWithVisits.completedVisits;
    final inProgress = visits
        .where((v) => v.status == VisitStatus.inProgress)
        .toList();
    final pending = routeWithVisits.pendingVisits;
    final skipped = routeWithVisits.skippedVisits;

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(todaysRouteProvider);
        // Wait for the provider to refetch
        await ref.read(todaysRouteProvider.future);
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Summary card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSummaryItem(
                    context,
                    '${visits.length}',
                    'Total',
                    Icons.store,
                    isDark ? const Color(0xFF90CAF9) : kSecondaryColor,
                  ),
                  _buildSummaryItem(
                    context,
                    '${completed.length}',
                    'Completed',
                    Icons.check_circle,
                    isDark ? const Color(0xFF81C784) : const Color(0xFF2E7D32),
                  ),
                  _buildSummaryItem(
                    context,
                    '${pending.length}',
                    'Pending',
                    Icons.pending,
                    isDark ? const Color(0xFFFFB74D) : const Color(0xFFE65100),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Section header
          Row(
            children: [
              Icon(Icons.store, size: 20, color: mutedColor),
              const SizedBox(width: 8),
              Text(
                'Assigned Outlets',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // In Progress outlets first
          if (inProgress.isNotEmpty) ...[
            _buildSectionLabel(context, 'In Progress', const Color(0xFF1976D2)),
            ...inProgress.map((visit) => _buildOutletCard(context, visit)),
            const SizedBox(height: 8),
          ],

          // Pending outlets
          if (pending.isNotEmpty) ...[
            _buildSectionLabel(
              context,
              'Pending',
              isDark ? const Color(0xFFFFB74D) : const Color(0xFFE65100),
            ),
            ...pending.map((visit) => _buildOutletCard(context, visit)),
            const SizedBox(height: 8),
          ],

          // Completed outlets
          if (completed.isNotEmpty) ...[
            _buildSectionLabel(
              context,
              'Completed',
              isDark ? const Color(0xFF81C784) : const Color(0xFF2E7D32),
            ),
            ...completed.map((visit) => _buildOutletCard(context, visit)),
            const SizedBox(height: 8),
          ],

          // Skipped outlets
          if (skipped.isNotEmpty) ...[
            _buildSectionLabel(context, 'Skipped', mutedColor),
            ...skipped.map((visit) => _buildOutletCard(context, visit)),
          ],

          const SizedBox(height: 80), // Space for FAB
        ],
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context,
    String value,
    String label,
    IconData icon,
    Color color,
  ) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: textColor.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionLabel(BuildContext context, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutletCard(BuildContext context, OutletVisit visit) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final mutedColor = textColor.withValues(alpha: 0.6);

    final statusColor = _getStatusColor(visit.status, isDark);
    final canTap =
        visit.status == VisitStatus.pending ||
        visit.status == VisitStatus.inProgress;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: canTap
            ? () {
                if (visit.status == VisitStatus.inProgress) {
                  context.go('/daily-route/visit/${visit.localId}/active');
                } else {
                  context.go('/daily-route/visit/${visit.localId}');
                }
              }
            : null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Store icon with status indicator
              Stack(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: isDark ? 0.2 : 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.store, color: statusColor, size: 24),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).cardColor,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        _getStatusIcon(visit.status),
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Outlet info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      visit.outletName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          visit.outletCode,
                          style: TextStyle(fontSize: 13, color: mutedColor),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: mutedColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Visit #${visit.visitOrder}',
                          style: TextStyle(fontSize: 13, color: mutedColor),
                        ),
                      ],
                    ),
                    if (visit.scheduledClockIn != null) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.schedule, size: 14, color: mutedColor),
                          const SizedBox(width: 4),
                          Text(
                            visit.scheduledClockIn!,
                            style: TextStyle(fontSize: 12, color: mutedColor),
                          ),
                          if (visit.allocatedMinutes > 0) ...[
                            Text(
                              ' • ${visit.allocatedMinutes} min',
                              style: TextStyle(fontSize: 12, color: mutedColor),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              // Status chip
              VisitStatusChip(status: visit.status),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(VisitStatus status, bool isDark) {
    switch (status) {
      case VisitStatus.pending:
        return isDark ? const Color(0xFFFFB74D) : const Color(0xFFE65100);
      case VisitStatus.inProgress:
        return const Color(0xFF1976D2);
      case VisitStatus.completed:
        return isDark ? const Color(0xFF81C784) : const Color(0xFF2E7D32);
      case VisitStatus.skipped:
        return isDark ? const Color(0xFFBDBDBD) : const Color(0xFF757575);
    }
  }

  IconData _getStatusIcon(VisitStatus status) {
    switch (status) {
      case VisitStatus.pending:
        return Icons.schedule;
      case VisitStatus.inProgress:
        return Icons.play_arrow;
      case VisitStatus.completed:
        return Icons.check;
      case VisitStatus.skipped:
        return Icons.skip_next;
    }
  }
}
