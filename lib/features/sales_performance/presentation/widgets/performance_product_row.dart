import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../products/data/datasources/products_remote_datasource.dart';
import '../../../products/presentation/widgets/stock_status_badge.dart'
    show formatKes;
import '../../data/datasources/sales_performance_remote_datasource.dart';

/// One product's target for the outlet/period (`GET /products/sales-targets`)
/// merged with its actual confirmed-sales contribution for the same period
/// (`GET /sales/my-performance`'s `products`, matched by item code) — `sold`
/// is `null` when the item has a target but wasn't sold this period.
class MergedTargetProduct {
  final OutletSalesTargetItem target;
  final SalesPerformanceProduct? sold;

  const MergedTargetProduct({required this.target, this.sold});

  String get itemCode => target.itemCode;
  String? get itemGroup1 => target.itemGroup1;
  int get quantitySold => sold?.quantitySold ?? 0;
  double get amountSold => sold?.amountSold ?? 0;
  double get incentiveEarned => sold?.incentiveEarned ?? 0;

  bool get hasTargetAmount => target.targetAmount != null;

  /// Percentage of target achieved. Prefers the currency-value target
  /// (`target.targetAmount`, pending backend) over the unit-quantity one
  /// once it's available, since sold-value is what the mock actually shows;
  /// falls back to unit-based percentage until then. `null` when the
  /// relevant target is 0 (can't divide).
  double? get achievementPercentage {
    final targetAmount = target.targetAmount;
    if (targetAmount != null) {
      return targetAmount > 0 ? (amountSold / targetAmount) * 100 : null;
    }
    return target.targetQty > 0 ? (quantitySold / target.targetQty) * 100 : null;
  }
}

/// One product's target-vs-achieved for the month, rendered as a divided
/// row inside a grouped card (see `_GroupedCard` in
/// `sales_performance_screen.dart`) — matches the mock's grouped-list
/// layout rather than each product being its own bordered card.
class PerformanceProductRow extends StatelessWidget {
  final MergedTargetProduct product;
  final bool showDivider;

  const PerformanceProductRow({
    super.key,
    required this.product,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final target = product.target;
    final pct = product.achievementPercentage;
    final achieved = pct != null && pct >= 100;
    final subtitle = [
      target.brand,
      target.modelNo,
    ].whereType<String>().where((s) => s.isNotEmpty).join(' · ');

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: showDivider
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFF0F0EE))),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      target.itemName?.isNotEmpty == true
                          ? target.itemName!
                          : target.itemCode,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: kTextDark,
                      ),
                    ),
                    if (subtitle.isNotEmpty)
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11, color: kTextFaint),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                pct != null ? '${pct.toStringAsFixed(0)}%' : 'No target set',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: pct == null
                      ? kTextFaint
                      : achieved
                      ? kSuccessColor
                      : kSecondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.hasTargetAmount
                    ? '${formatKes(product.amountSold)} / ${formatKes(target.targetAmount!)}'
                    : '${product.quantitySold} / ${target.targetQty.round()} units',
                style: const TextStyle(fontSize: 11, color: kTextFaint),
              ),
              if (product.incentiveEarned > 0)
                Text(
                  '+${formatKes(product.incentiveEarned)}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: kSuccessColor,
                  ),
                ),
            ],
          ),
          if (pct != null) ...[
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: (pct / 100).clamp(0, 1),
                minHeight: 5,
                backgroundColor: const Color(0xFFEFEFEC),
                valueColor: AlwaysStoppedAnimation(
                  achieved ? kSuccessColor : kSecondaryColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
