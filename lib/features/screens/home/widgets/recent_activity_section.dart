import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../providers/recent_activity_provider.dart';

/// Home screen's "Recent Activity" feed — today's real Stock Take
/// completions, Daily Sales submissions, and visit clock-in/out events,
/// merged and sorted newest-first (see [recentActivityProvider]).
///
/// Renders nothing while loading or on error, and nothing when there's
/// simply no activity yet today — this section is a bonus summary, not a
/// primary screen state worth its own error/empty chrome.
class RecentActivitySection extends ConsumerWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(recentActivityProvider).value ?? const [];
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Activity',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        for (final item in items) ...[
          _ActivityRow(item: item),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _ActivityRow extends StatelessWidget {
  final ActivityItem item;

  const _ActivityRow({required this.item});

  IconData get _icon {
    switch (item.type) {
      case ActivityType.stockTake:
        return Icons.check;
      case ActivityType.dailySale:
        return Icons.arrow_upward;
      case ActivityType.clockIn:
        return Icons.login;
      case ActivityType.clockOut:
        return Icons.logout;
    }
  }

  Color get _iconColor {
    switch (item.type) {
      case ActivityType.stockTake:
        return kSuccessText;
      case ActivityType.dailySale:
        return kSecondaryColor;
      case ActivityType.clockIn:
        return kSecondaryColor;
      case ActivityType.clockOut:
        return kTextFaint;
    }
  }

  Color get _iconBg {
    switch (item.type) {
      case ActivityType.stockTake:
        return kSuccessBg;
      case ActivityType.dailySale:
        return kSecondaryLightColor;
      case ActivityType.clockIn:
        return kSecondaryLightColor;
      case ActivityType.clockOut:
        return kBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: _iconBg, shape: BoxShape.circle),
            child: Icon(_icon, size: 16, color: _iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.moduleLabel} · ${item.outletName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${item.statusLabel} ${_formatTime(item.timestamp)}',
                  style: const TextStyle(fontSize: 11, color: kTextFaint),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _formatTime(DateTime dt) {
  final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
  final minute = dt.minute.toString().padLeft(2, '0');
  final period = dt.hour >= 12 ? 'PM' : 'AM';
  return '$hour:$minute $period';
}
