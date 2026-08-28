import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../domain/entities/shelf_share_session.dart';
import '../providers/shelf_share_session_controller.dart';

/// Main home screen for the Shelf Share feature
/// Shows active session (if any) and completed sessions
class ShelfShareHomeScreen extends ConsumerStatefulWidget {
  final int customerId;
  final String customerCode;
  final String customerName;
  final String? visitLocalId;
  final int? visitServerId;

  const ShelfShareHomeScreen({
    super.key,
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    this.visitLocalId,
    this.visitServerId,
  });

  @override
  ConsumerState<ShelfShareHomeScreen> createState() =>
      _ShelfShareHomeScreenState();
}

class _ShelfShareHomeScreenState extends ConsumerState<ShelfShareHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(shelfShareSessionControllerProvider.notifier)
          .loadForCustomer(
            widget.customerId,
            visitServerId: widget.visitServerId,
          );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(shelfShareSessionControllerProvider);

    // Not clocked in state
    if (widget.customerId <= 0) {
      return AppScaffold(
        title: 'Shelf Share',
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
                  'You need to clock in to an outlet before you can\naccess Shelf Share. Please go to your daily route\nand clock in to an outlet first.',
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
      title: 'Shelf Share',
      showBottomNav: true,
      body: Column(
        children: [
          // Customer header
          _CustomerHeader(
            customerName: widget.customerName,
            customerCode: widget.customerCode,
          ),

          // Error banner
          if (sessionState.errorMessage != null)
            _ErrorBanner(
              message: sessionState.errorMessage!,
              onDismiss: () => ref
                  .read(shelfShareSessionControllerProvider.notifier)
                  .clearError(),
            ),

          // Tab bar
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: kSecondaryColor,
              unselectedLabelColor: kTextMuted,
              indicatorColor: kSecondaryColor,
              tabs: const [
                Tab(text: 'Active'),
                Tab(text: 'Completed'),
                Tab(text: 'All Items'),
              ],
            ),
          ),

          // Tab content
          Expanded(
            child: sessionState.isLoading
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(color: kSecondaryColor),
                        if (sessionState.loadingMessage != null) ...[
                          const SizedBox(height: 16),
                          Text(
                            sessionState.loadingMessage!,
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
                      _ActiveSessionTab(
                        activeSession: sessionState.activeSession,
                        customerId: widget.customerId,
                        customerCode: widget.customerCode,
                        customerName: widget.customerName,
                        visitLocalId: widget.visitLocalId,
                        visitServerId: widget.visitServerId,
                      ),
                      _CompletedSessionsTab(
                        sessions: sessionState.completedSessions,
                      ),
                      _AllItemsTab(
                        activeSession: sessionState.activeSession,
                        completedSessions: sessionState.completedSessions,
                      ),
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
// Active Session Tab
// =============================================================================

class _ActiveSessionTab extends ConsumerWidget {
  final ShelfShareSession? activeSession;
  final int customerId;
  final String customerCode;
  final String customerName;
  final String? visitLocalId;
  final int? visitServerId;

  const _ActiveSessionTab({
    this.activeSession,
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    this.visitLocalId,
    this.visitServerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (activeSession != null) {
      return _ActiveSessionCard(session: activeSession!);
    }

    return _EmptySessionView(
      customerId: customerId,
      customerCode: customerCode,
      customerName: customerName,
      visitLocalId: visitLocalId,
      visitServerId: visitServerId,
    );
  }
}

// =============================================================================
// Empty Session View (Start New)
// =============================================================================

class _EmptySessionView extends ConsumerWidget {
  final int customerId;
  final String customerCode;
  final String customerName;
  final String? visitLocalId;
  final int? visitServerId;

  const _EmptySessionView({
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    this.visitLocalId,
    this.visitServerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canStart = visitServerId != null;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shelves,
              size: 64,
              color: kTextMuted.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'No Active Shelf Share',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              canStart
                  ? 'Start a new shelf share session to record brand facings.'
                  : 'A synced visit is required to start a shelf share session.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: kTextMuted),
            ),
            const SizedBox(height: 24),
            if (canStart)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _startSession(context, ref),
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text('Start Shelf Share'),
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

  Future<void> _startSession(BuildContext context, WidgetRef ref) async {
    // TODO: Get salesAgentId from auth state
    final success = await ref
        .read(shelfShareSessionControllerProvider.notifier)
        .createSession(
          visitServerId: visitServerId!,
          customerId: customerId,
          customerCode: customerCode,
          customerName: customerName,
          salesAgentId: 0, // Will be set from auth
          visitLocalId: visitLocalId ?? '',
        );

    if (success && context.mounted) {
      final session = ref
          .read(shelfShareSessionControllerProvider)
          .activeSession;
      if (session != null) {
        context.push('/shelf-share/session/${session.localId}');
      }
    }
  }
}

// =============================================================================
// Active Session Card
// =============================================================================

class _ActiveSessionCard extends StatelessWidget {
  final ShelfShareSession session;

  const _ActiveSessionCard({required this.session});

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
          onTap: () => context.push('/shelf-share/session/${session.localId}'),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status row
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
                      child: Text(
                        session.statusDisplayName,
                        style: const TextStyle(
                          color: kSecondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (!session.isSynced)
                      const Icon(Icons.cloud_off, size: 16, color: kTextMuted),
                  ],
                ),
                const SizedBox(height: 12),

                // Stats
                Row(
                  children: [
                    _StatChip(
                      icon: Icons.category,
                      label: '${session.completedItemGroups} groups',
                    ),
                    const SizedBox(width: 16),
                    _StatChip(
                      icon: Icons.bar_chart,
                      label: '${session.totalBrandEntries} entries',
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Date
                Text(
                  'Started ${_formatDate(session.createdAt)}',
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),

                const SizedBox(height: 12),

                // Action button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        context.push('/shelf-share/session/${session.localId}'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Continue Session'),
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

// =============================================================================
// Stat Chip
// =============================================================================

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
// All Items Tab - Aggregated view of all brand entries across sessions
// =============================================================================

class _AllItemsTab extends StatelessWidget {
  final ShelfShareSession? activeSession;
  final List<ShelfShareSession> completedSessions;

  const _AllItemsTab({this.activeSession, required this.completedSessions});

  @override
  Widget build(BuildContext context) {
    // Gather all sessions
    final allSessions = <ShelfShareSession>[
      if (activeSession != null) activeSession!,
      ...completedSessions,
    ];

    if (allSessions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 48,
              color: kTextMuted.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'No items recorded yet',
              style: TextStyle(fontSize: 16, color: kTextMuted),
            ),
            const SizedBox(height: 8),
            const Text(
              'Brand entries will appear here once\nyou start adding them to sessions.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
          ],
        ),
      );
    }

    // Aggregate: group by item group, then by brand
    final groupMap = <int, _AggregatedItemGroup>{};

    for (final session in allSessions) {
      for (final group in session.itemGroups) {
        final agg = groupMap.putIfAbsent(
          group.itemGroupId,
          () => _AggregatedItemGroup(
            itemGroupId: group.itemGroupId,
            itemGroupName: group.itemGroupName,
          ),
        );

        for (final brand in group.brandEntries) {
          final existing = agg.brands.putIfAbsent(
            brand.brandId,
            () => _AggregatedBrand(
              brandId: brand.brandId,
              brandName: brand.brandName,
            ),
          );
          existing.totalQuantity += brand.facings;
          existing.sessionCount += 1;
        }
      }
    }

    final groups = groupMap.values.toList()
      ..sort((a, b) => a.itemGroupName.compareTo(b.itemGroupName));

    // Stats
    final totalBrands = groups.fold<int>(0, (s, g) => s + g.brands.length);
    final totalQuantity = groups.fold<int>(
      0,
      (s, g) =>
          s + g.brands.values.fold<int>(0, (bs, b) => bs + b.totalQuantity),
    );

    return Column(
      children: [
        // Summary bar
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: kSecondaryColor.withValues(alpha: 0.05),
          child: Row(
            children: [
              _SummaryChip(
                icon: Icons.category_outlined,
                label: '${groups.length} Groups',
              ),
              const SizedBox(width: 16),
              _SummaryChip(
                icon: Icons.branding_watermark_outlined,
                label: '$totalBrands Brands',
              ),
              const SizedBox(width: 16),
              _SummaryChip(
                icon: Icons.numbers,
                label: '$totalQuantity Total Qty',
              ),
            ],
          ),
        ),

        // Item group list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: groups.length,
            itemBuilder: (context, index) {
              final group = groups[index];
              return _AllItemsGroupCard(group: group);
            },
          ),
        ),
      ],
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SummaryChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: kSecondaryColor),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: kSecondaryColor,
          ),
        ),
      ],
    );
  }
}

class _AllItemsGroupCard extends StatelessWidget {
  final _AggregatedItemGroup group;

  const _AllItemsGroupCard({required this.group});

  @override
  Widget build(BuildContext context) {
    final brands = group.brands.values.toList()
      ..sort((a, b) => b.totalQuantity.compareTo(a.totalQuantity));
    final groupTotal = brands.fold<int>(0, (s, b) => s + b.totalQuantity);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: kSecondaryColor.withValues(alpha: 0.05),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.category_rounded,
                    size: 18,
                    color: kSecondaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.itemGroupName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kTextDark,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${brands.length} brands · $groupTotal total qty',
                        style: const TextStyle(fontSize: 12, color: kTextMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Brand rows
          ...brands.map((brand) {
            final percent = groupTotal > 0
                ? (brand.totalQuantity / groupTotal * 100)
                : 0.0;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          brand.brandName,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: kTextDark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Share bar
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: LinearProgressIndicator(
                            value: percent / 100,
                            minHeight: 6,
                            backgroundColor: Colors.grey.shade100,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              kSecondaryColor.withValues(alpha: 0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${brand.totalQuantity}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: kTextDark,
                        ),
                      ),
                      Text(
                        '${percent.toStringAsFixed(1)}%',
                        style: const TextStyle(fontSize: 11, color: kTextMuted),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 6),
        ],
      ),
    );
  }
}

/// Helper data classes for aggregation
class _AggregatedItemGroup {
  final int itemGroupId;
  final String itemGroupName;
  final Map<int, _AggregatedBrand> brands = {};

  _AggregatedItemGroup({
    required this.itemGroupId,
    required this.itemGroupName,
  });
}

class _AggregatedBrand {
  final int brandId;
  final String brandName;
  int totalQuantity = 0;
  int sessionCount = 0;

  _AggregatedBrand({required this.brandId, required this.brandName});
}

// =============================================================================
// Completed Sessions Tab
// =============================================================================

class _CompletedSessionsTab extends StatelessWidget {
  final List<ShelfShareSession> sessions;

  const _CompletedSessionsTab({required this.sessions});

  @override
  Widget build(BuildContext context) {
    if (sessions.isEmpty) {
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
              'No completed sessions',
              style: TextStyle(fontSize: 16, color: kTextMuted),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return _CompletedSessionCard(session: session);
      },
    );
  }
}

class _CompletedSessionCard extends StatelessWidget {
  final ShelfShareSession session;

  const _CompletedSessionCard({required this.session});

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
          '/shelf-share/session/${session.localId}',
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
                        _StatusBadge(status: session.status),
                        const SizedBox(width: 8),
                        Text(
                          '${session.completedItemGroups} groups · ${session.totalBrandEntries} entries',
                          style: const TextStyle(
                            fontSize: 13,
                            color: kTextMuted,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _formatDate(session.createdAt),
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

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class _StatusBadge extends StatelessWidget {
  final ShelfShareStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case ShelfShareStatus.submitted:
        bgColor = Colors.orange.shade50;
        textColor = Colors.orange.shade700;
      case ShelfShareStatus.approved:
        bgColor = Colors.green.shade50;
        textColor = Colors.green.shade700;
      case ShelfShareStatus.rejected:
        bgColor = kRedColor.withValues(alpha: 0.1);
        textColor = kRedColor;
      default:
        bgColor = kSecondaryLightColor;
        textColor = kSecondaryColor;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.name[0].toUpperCase() + status.name.substring(1),
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
