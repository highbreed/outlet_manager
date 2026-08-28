import 'package:flutter/material.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/theme/colors.dart';

/// Purple totals band — same visual language as Daily Sales'
/// `OrderSummaryCard`/Stock Take's `_TotalsBand`.
class OrderTotalsCard extends StatelessWidget {
  final double subtotal;
  final double discountPercent;
  final double discountAmount;
  final double taxPercent;
  final double taxAmount;
  final double total;
  final int itemCount;

  const OrderTotalsCard({
    super.key,
    required this.subtotal,
    required this.discountPercent,
    required this.discountAmount,
    required this.taxPercent,
    required this.taxAmount,
    required this.total,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    final currency = AppConfig.defaultCurrency;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _row('Subtotal ($itemCount units)', '$currency ${_formatMoney(subtotal)}'),
          if (discountPercent > 0)
            _row(
              'Discount',
              '− $currency ${_formatMoney(discountAmount)}',
            ),
          _row(
            'VAT included (${taxPercent.toStringAsFixed(0)}%)',
            '$currency ${_formatMoney(taxAmount)}',
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.only(top: 8),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0x264B2E83)),
              ),
            ),
            child: _row(
              'Total',
              '$currency ${_formatMoney(total)}',
              bold: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value, {bool bold = false}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: bold ? 14 : 12,
            color: kSecondaryColor,
            fontWeight: bold ? FontWeight.w800 : FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: bold ? 14 : 12,
            fontWeight: bold ? FontWeight.w800 : FontWeight.w600,
            color: kSecondaryColor,
          ),
        ),
      ],
    ),
  );

  String _formatMoney(double value) {
    final fixed = value.toStringAsFixed(0);
    return fixed.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ',',
    );
  }
}
