import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/theme/colors.dart';
import '../../../daily_route/providers/daily_route_providers.dart';
import '../../data/datasources/products_remote_datasource.dart';
import '../providers/products_providers.dart';
import 'section_card.dart';
import 'stock_status_badge.dart' show formatKes;

const _kBlockedColor = kRedColor;
const _kUnblockedColor = kSuccessColor;

/// Alternative/substitute products for this item. Always loads — when the
/// rep is clocked in to an outlet, block/qty status is resolved against
/// that outlet's catalogue; otherwise the list still shows without it.
class AlternativesCard extends ConsumerWidget {
  final String itemCode;

  const AlternativesCard({super.key, required this.itemCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeVisit = ref.watch(activeVisitProvider);
    final args = (itemCode, activeVisit?.outletCode);
    final altAsync = ref.watch(alternativesProvider(args));

    return altAsync.when(
      loading: () => const SectionCard(
        title: 'Alternative Products',
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
      ),
      error: (error, _) => SectionCard(
        title: 'Alternative Products',
        child: Row(
          children: [
            Expanded(
              child: Text(
                error is Failure
                    ? error.displayMessage
                    : 'Unable to load alternative products',
                style: const TextStyle(fontSize: 13, color: kTextMuted),
              ),
            ),
            TextButton(
              onPressed: () => ref.invalidate(alternativesProvider(args)),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
      data: (result) {
        if (result.alternatives.isEmpty) {
          return const SectionCard(
            title: 'Alternative Products',
            child: Text(
              'No alternative products found.',
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
          );
        }

        return SectionCard(
          title: 'Alternative Products',
          child: Column(
            children: [
              for (var i = 0; i < result.alternatives.length; i++) ...[
                if (i > 0) const Divider(height: 20),
                _AlternativeRow(alt: result.alternatives[i]),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _AlternativeRow extends StatelessWidget {
  final ProductAlternative alt;

  const _AlternativeRow({required this.alt});

  @override
  Widget build(BuildContext context) {
    final blocked = alt.isBranchBlocked;
    final title = (alt.itemName?.isNotEmpty ?? false)
        ? alt.itemName!
        : alt.altItemCode;
    final subtitle = [
      alt.brand,
      alt.modelNo,
    ].whereType<String>().where((s) => s.isNotEmpty).join(' · ');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: kTextDark,
                ),
              ),
              if (subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    subtitle,
                    style: const TextStyle(fontSize: 11, color: kTextMuted),
                  ),
                ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    formatKes(alt.regularPrice),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kSecondaryColor,
                    ),
                  ),
                  if (alt.incentiveAmount > 0) ...[
                    const SizedBox(width: 6),
                    Text(
                      '+${formatKes(alt.incentiveAmount)} incentive',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: kSuccessColor,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 2),
              if (alt.foundInCatalogue)
                Text(
                  'Onshelf ${alt.minOnshelfQty}-${alt.maxOnshelfQty} · '
                  'Backstore ${alt.minBackstoreQty}-${alt.maxBackstoreQty}',
                  style: const TextStyle(fontSize: 11, color: kTextMuted),
                )
              else if (blocked != null)
                const Text(
                  'Not currently stocked at this outlet',
                  style: TextStyle(fontSize: 11, color: kTextMuted),
                ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        if (blocked != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: (blocked ? _kBlockedColor : _kUnblockedColor).withValues(
                alpha: 0.12,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              blocked ? 'Blocked' : 'Unblocked',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: blocked ? _kBlockedColor : _kUnblockedColor,
              ),
            ),
          ),
      ],
    );
  }
}
