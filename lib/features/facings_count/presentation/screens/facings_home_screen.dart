import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../auth/auth.dart';
import '../../domain/entities/facings_count.dart';
import '../providers/facings_count_controller.dart';

/// Main home screen for the Horizontal Facings Count feature.
/// Shows the active draft (if any) and today's submitted counts.
class FacingsHomeScreen extends ConsumerStatefulWidget {
  final int customerId;
  final String customerCode;
  final String customerName;
  final String? visitLocalId;
  final int? visitServerId;

  const FacingsHomeScreen({
    super.key,
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    this.visitLocalId,
    this.visitServerId,
  });

  @override
  ConsumerState<FacingsHomeScreen> createState() => _FacingsHomeScreenState();
}

class _FacingsHomeScreenState extends ConsumerState<FacingsHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final agentId = ref.read(currentUserProvider)?.id;
      if (agentId != null) {
        ref
            .read(facingsCountControllerProvider.notifier)
            .loadForCustomer(
              customerId: widget.customerId,
              salesAgentId: agentId,
            );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countState = ref.watch(facingsCountControllerProvider);

    // Not clocked in state
    if (widget.customerId <= 0) {
      return AppScaffold(
        title: 'Facings Count',
        showBottomNav: true,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_off_rounded,
                    color: Colors.orange,
                    size: 56,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Not Clocked In',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: kTextDark,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'You need to clock in to an outlet before you can\nrecord a facings count. Please go to your daily\nroute and clock in to an outlet first.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: kTextMuted,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () => context.push('/daily-route'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSecondaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                  ),
                  icon: const Icon(Icons.route_rounded, size: 20),
                  label: const Text(
                    'Go to Daily Route',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return AppScaffold(
      title: 'Facings Count',
      showBottomNav: true,
      body: Column(
        children: [
          _CustomerHeader(
            customerName: widget.customerName,
            customerCode: widget.customerCode,
          ),

          if (countState.errorMessage != null)
            _ErrorBanner(
              message: countState.errorMessage!,
              onDismiss: () => ref
                  .read(facingsCountControllerProvider.notifier)
                  .clearError(),
            ),

          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: kSecondaryColor,
              unselectedLabelColor: kTextMuted,
              indicatorColor: kSecondaryColor,
              tabs: const [
                Tab(text: 'Active Count'),
                Tab(text: "Today's Counts"),
              ],
            ),
          ),

          Expanded(
            child: countState.isLoading
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(color: kSecondaryColor),
                        if (countState.loadingMessage != null) ...[
                          const SizedBox(height: 16),
                          Text(
                            countState.loadingMessage!,
                            style: const TextStyle(
                              color: kTextMuted,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ],
                    ),
                  )
                : TabBarView(
                    controller: _tabController,
                    children: [
                      _ActiveCountTab(
                        activeDraft: countState.activeDraft,
                        customerId: widget.customerId,
                        customerCode: widget.customerCode,
                        customerName: widget.customerName,
                        visitLocalId: widget.visitLocalId,
                        visitServerId: widget.visitServerId,
                      ),
                      _TodayCountsTab(counts: countState.todaySubmitted),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Customer Header
// =============================================================================

class _CustomerHeader extends StatelessWidget {
  final String customerName;
  final String customerCode;

  const _CustomerHeader({
    required this.customerName,
    required this.customerCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customerName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kTextDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            customerCode,
            style: const TextStyle(fontSize: 14, color: kTextMuted),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Error Banner
// =============================================================================

class _ErrorBanner extends StatelessWidget {
  final String message;
  final VoidCallback onDismiss;

  const _ErrorBanner({required this.message, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: kRedColor.withValues(alpha: 0.1),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: kRedColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: kRedColor, fontSize: 13),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: onDismiss,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Active Count Tab
// =============================================================================

class _ActiveCountTab extends ConsumerWidget {
  final FacingsCount? activeDraft;
  final int customerId;
  final String customerCode;
  final String customerName;
  final String? visitLocalId;
  final int? visitServerId;

  const _ActiveCountTab({
    this.activeDraft,
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    this.visitLocalId,
    this.visitServerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (activeDraft != null) {
      return _ActiveDraftCard(draft: activeDraft!);
    }

    return _EmptyDraftView(
      customerId: customerId,
      customerCode: customerCode,
      customerName: customerName,
      visitLocalId: visitLocalId,
      visitServerId: visitServerId,
    );
  }
}

// =============================================================================
// Empty Draft View (Start New)
// =============================================================================

class _EmptyDraftView extends ConsumerWidget {
  final int customerId;
  final String customerCode;
  final String customerName;
  final String? visitLocalId;
  final int? visitServerId;

  const _EmptyDraftView({
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    this.visitLocalId,
    this.visitServerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.grid_view_rounded,
              size: 64,
              color: kTextMuted.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'No Active Facings Count',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Start a new count to record shelf facings\nfor this outlet.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: kTextMuted),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _startCount(context, ref),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Start Facings Count'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _startCount(BuildContext context, WidgetRef ref) async {
    final agentId = ref.read(currentUserProvider)?.id;
    if (agentId == null) return;

    final success = await ref
        .read(facingsCountControllerProvider.notifier)
        .startCount(
          visitLocalId: visitLocalId ?? '',
          visitServerId: visitServerId,
          customerId: customerId,
          customerCode: customerCode,
          customerName: customerName,
          salesAgentId: agentId,
        );

    if (success && context.mounted) {
      final draft = ref.read(facingsCountControllerProvider).activeDraft;
      if (draft != null) {
        context.push('/facings/count/${draft.localId}');
      }
    }
  }
}

// =============================================================================
// Active Draft Card
// =============================================================================

class _ActiveDraftCard extends StatelessWidget {
  final FacingsCount draft;

  const _ActiveDraftCard({required this.draft});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: kSecondaryColor.withValues(alpha: 0.3)),
        ),
        child: InkWell(
          onTap: () => context.push('/facings/count/${draft.localId}'),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryLightColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'In Progress',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (!draft.isSynced)
                      const Icon(Icons.cloud_off, size: 16, color: kTextMuted),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _StatChip(
                      icon: Icons.category,
                      label: '${draft.totalItemGroups} groups',
                    ),
                    const SizedBox(width: 16),
                    _StatChip(
                      icon: Icons.bar_chart,
                      label: '${draft.totalFacings} facings',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Started ${_formatDate(draft.createdAt)}',
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        context.push('/facings/count/${draft.localId}'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Continue Count'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${date.day}/${date.month}/${date.year}';
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: kTextMuted),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 13, color: kTextMuted)),
      ],
    );
  }
}

// =============================================================================
// Today's Counts Tab
// =============================================================================

class _TodayCountsTab extends StatelessWidget {
  final List<FacingsCount> counts;

  const _TodayCountsTab({required this.counts});

  @override
  Widget build(BuildContext context) {
    if (counts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 48,
              color: kTextMuted.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'No counts submitted today',
              style: TextStyle(fontSize: 16, color: kTextMuted),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: counts.length,
      itemBuilder: (context, index) {
        return _SubmittedCountCard(count: counts[index]);
      },
    );
  }
}

class _SubmittedCountCard extends StatelessWidget {
  final FacingsCount count;

  const _SubmittedCountCard({required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () => context.push(
          '/facings/count/${count.localId}',
          extra: {'readOnly': true},
        ),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _StatusBadge(status: count.status),
                        const SizedBox(width: 8),
                        Text(
                          '${count.totalItemGroups} groups · ${count.totalFacings} facings',
                          style: const TextStyle(
                            fontSize: 13,
                            color: kTextMuted,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _formatTime(count.submittedAt ?? count.createdAt),
                      style: const TextStyle(fontSize: 12, color: kTextMuted),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: kTextMuted),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class _StatusBadge extends StatelessWidget {
  final FacingsCountStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    String label;

    switch (status) {
      case FacingsCountStatus.approved:
        bgColor = Colors.green.shade50;
        textColor = Colors.green.shade700;
        label = 'Approved';
      case FacingsCountStatus.rejected:
        bgColor = kRedColor.withValues(alpha: 0.1);
        textColor = kRedColor;
        label = 'Rejected';
      case FacingsCountStatus.submitted:
        bgColor = Colors.orange.shade50;
        textColor = Colors.orange.shade700;
        label = 'Submitted';
      case FacingsCountStatus.inProgress:
        bgColor = kSecondaryLightColor;
        textColor = kSecondaryColor;
        label = 'In Progress';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
