import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../providers/complaint_providers.dart';
import 'aftersales_filter_sheet.dart';

class ComplaintFilterBar extends ConsumerWidget {
  const ComplaintFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(aftersalesSearchProvider);
    final filter = ref.watch(complaintFilterProvider);
    final activeCount = filter.activeFilterCount;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (v) =>
                      ref.read(aftersalesSearchProvider.notifier).state = v,
                  decoration: InputDecoration(
                    hintText: 'Search by name, complaint no., serial…',
                    prefixIcon: const Icon(Icons.search, size: 20),
                    suffixIcon: search.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.close, size: 18),
                            onPressed: () => ref
                                .read(aftersalesSearchProvider.notifier)
                                .state = '',
                          )
                        : null,
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _FilterButton(
                activeCount: activeCount,
                onTap: () => AftersalesFilterSheet.show(context),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _ActiveFilterSummary(filter: filter),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final int activeCount;
  final VoidCallback onTap;

  const _FilterButton({required this.activeCount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: activeCount > 0 ? kSecondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: activeCount > 0
                      ? kSecondaryColor
                      : Theme.of(context).dividerColor,
                ),
              ),
              child: Icon(
                Icons.tune,
                size: 20,
                color: activeCount > 0 ? Colors.white : null,
              ),
            ),
          ),
        ),
        if (activeCount > 0)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                '$activeCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

class _ActiveFilterSummary extends StatelessWidget {
  final ComplaintFilter filter;

  const _ActiveFilterSummary({required this.filter});

  @override
  Widget build(BuildContext context) {
    final parts = <String>[];

    if (filter.fromDate != null) {
      parts.add(
        filter.fromDate == filter.toDate
            ? _fmtDate(filter.fromDate!)
            : '${_fmtDate(filter.fromDate!)} – ${filter.toDate != null ? _fmtDate(filter.toDate!) : '…'}',
      );
    }
    if (filter.consumerName != null) parts.add(filter.consumerName!);
    if (filter.consumerRegion != null) parts.add(filter.consumerRegion!);
    if (filter.consumerPhone != null) parts.add(filter.consumerPhone!);

    if (parts.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        const Icon(Icons.info_outline, size: 13, color: kTextMuted),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            parts.join(' · '),
            style: const TextStyle(fontSize: 12, color: kTextMuted),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _fmtDate(DateTime d) {
    final today = DateTime.now();
    final isToday =
        d.year == today.year && d.month == today.month && d.day == today.day;
    if (isToday) { return 'Today'; }
    final yesterday = today.subtract(const Duration(days: 1));
    if (d.year == yesterday.year &&
        d.month == yesterday.month &&
        d.day == yesterday.day) { return 'Yesterday'; }
    return '${d.day.toString().padLeft(2, '0')} ${_month(d.month)} ${d.year}';
  }

  String _month(int m) => const [
        '',
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ][m];
}
