import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../daily_route/presentation/widgets/widgets.dart';
import '../../domain/entities/entities.dart';
import '../providers/session_providers.dart';

/// Screen to view history of past stock takes for a customer. Backed by
/// the same `completedSessions` the old "Closed" tab on Home used
/// (`stockTakeSessionControllerProvider`) — previously this screen showed
/// hardcoded mock data and had no real entry point; Home's history icon
/// button now links here for real.
class StockTakeHistoryScreen extends ConsumerStatefulWidget {
  final int customerId;
  final String customerName;

  const StockTakeHistoryScreen({
    super.key,
    required this.customerId,
    required this.customerName,
  });

  @override
  ConsumerState<StockTakeHistoryScreen> createState() => _StockTakeHistoryScreenState();
}

class _StockTakeHistoryScreenState extends ConsumerState<StockTakeHistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = ref.read(stockTakeSessionControllerProvider.notifier);
      if (widget.customerId > 0) {
        controller.loadForCustomer(widget.customerId);
      } else {
        controller.loadAllActiveSessions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(stockTakeSessionControllerProvider);
    final sessions = sessionState.completedSessions;

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteBackHeader(
              title: 'Session History',
              onBack: () => context.pop(),
            ),
            Expanded(
              child: sessionState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : sessions.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      itemCount: sessions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _HistoryRow(session: sessions[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 56, color: kTextFaint),
            SizedBox(height: 18),
            Text(
              'No Stock Take History',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 6),
            Text(
              'Completed stock takes will appear here',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryRow extends StatelessWidget {
  final StockTakeSession session;

  const _HistoryRow({required this.session});

  @override
  Widget build(BuildContext context) {
    final isCancelled = session.isCancelled;

    return AppCard(
      onTap: () => context.push(
        '/stock-take/session/${session.localId}',
        extra: {'warehouseName': session.warehouseName, 'readOnly': true},
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  session.warehouseName,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              StatusChip(
                label: isCancelled ? 'Cancelled' : 'Completed',
                variant: isCancelled ? StatusChipVariant.neutral : StatusChipVariant.success,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            _formatSubtitle(session),
            style: const TextStyle(fontSize: 11, color: kTextFaint),
          ),
        ],
      ),
    );
  }

  String _formatSubtitle(StockTakeSession session) {
    final date = _formatDate(session.completedAt ?? session.updatedAt);
    if (session.isCancelled) {
      return date;
    }
    return '$date · ${session.totalProducts} products · ${session.totalSerials} serials';
  }

  String _formatDate(DateTime dt) {
    final now = DateTime.now();
    final isToday = dt.year == now.year && dt.month == now.month && dt.day == now.day;

    if (isToday) {
      final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
      final period = dt.hour >= 12 ? 'PM' : 'AM';
      return 'Today $hour:${dt.minute.toString().padLeft(2, '0')} $period';
    }

    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[dt.month]} ${dt.day}';
  }
}
