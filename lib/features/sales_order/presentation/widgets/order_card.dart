import 'package:flutter/material.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../domain/entities/entities.dart';

class OrderCard extends StatelessWidget {
  final SalesOrder order;
  final VoidCallback? onTap;

  const OrderCard({super.key, required this.order, this.onTap});

  (Color bg, Color fg, IconData icon) get _statusStyle {
    switch (order.status) {
      case SalesOrderStatus.draft:
        return (kBackground, kTextFaint, Icons.edit_outlined);
      case SalesOrderStatus.pending:
        return (kWarningBg, kWarningText, Icons.schedule);
      case SalesOrderStatus.confirmed:
        return (kSecondaryLightColor, kSecondaryColor, Icons.description_outlined);
      case SalesOrderStatus.fulfilled:
        return (kSuccessBg, kSuccessText, Icons.check);
      case SalesOrderStatus.cancelled:
        return (kRedColor.withValues(alpha: 0.08), kRedColor, Icons.close);
    }
  }

  StatusChipVariant get _variant {
    switch (order.status) {
      case SalesOrderStatus.draft:
        return StatusChipVariant.neutral;
      case SalesOrderStatus.pending:
        return StatusChipVariant.warning;
      case SalesOrderStatus.confirmed:
        return StatusChipVariant.info;
      case SalesOrderStatus.fulfilled:
        return StatusChipVariant.success;
      case SalesOrderStatus.cancelled:
        return StatusChipVariant.danger;
    }
  }

  @override
  Widget build(BuildContext context) {
    final (bg, fg, icon) = _statusStyle;
    final isPending = order.status == SalesOrderStatus.pending;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isPending ? kWarningColor : kBorderColor,
                width: isPending ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: 17, color: fg),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.customerName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${order.orderNumber} · ${_formatDate(order.createdAt)} · ${order.customerType.label}',
                        overflow: TextOverflow.ellipsis,
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
                      '${AppConfig.defaultCurrency} ${_formatAmount(order.total)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    StatusChip(label: order.status.label, variant: _variant),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static String _formatDate(DateTime d) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[d.month - 1]} ${d.day}';
  }

  static String _formatAmount(double value) {
    final fixed = value.toStringAsFixed(0);
    return fixed.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ',',
    );
  }
}

extension on CustomerType {
  String get label => this == CustomerType.cash ? 'Cash' : 'Credit';
}
