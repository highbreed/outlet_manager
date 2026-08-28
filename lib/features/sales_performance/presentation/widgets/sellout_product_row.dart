import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../products/presentation/widgets/stock_status_badge.dart'
    show formatKes;
import '../../data/datasources/sales_performance_remote_datasource.dart';

/// One product's confirmed-sales contribution for the month
/// (`GET /sales/my-performance`'s `products`) — no target context, just
/// what actually sold. Used by the Sellout tab, which (unlike the Sales
/// Target tab) isn't scoped to a single outlet's target list and works
/// agent-wide when no outlet filter is picked.
///
/// Rendered as one divided row inside a grouped card (see
/// `_GroupedCard` in `sales_performance_screen.dart`), not its own
/// bordered card — matches the mock's grouped-list layout.
class SelloutProductRow extends StatelessWidget {
  final SalesPerformanceProduct product;
  final bool showDivider;

  const SelloutProductRow({
    super.key,
    required this.product,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: showDivider
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFF0F0EE))),
            )
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName?.isNotEmpty == true
                      ? product.productName!
                      : product.itemCode,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextDark,
                  ),
                ),
                if (product.modelNo != null && product.modelNo!.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    product.modelNo!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11, color: kTextFaint),
                  ),
                ],
                const SizedBox(height: 2),
                Text(
                  '${product.quantitySold} unit${product.quantitySold == 1 ? '' : 's'} sold',
                  style: const TextStyle(fontSize: 11, color: kTextFaint),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatKes(product.amountSold),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
              if (product.incentiveEarned > 0) ...[
                const SizedBox(height: 2),
                Text(
                  '+${formatKes(product.incentiveEarned)}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: kSuccessColor,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
