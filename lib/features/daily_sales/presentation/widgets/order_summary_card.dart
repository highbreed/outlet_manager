import 'package:flutter/material.dart';

import '../../../../core/core.dart';

/// Subtotal / VAT / total breakdown for the in-progress cart.
///
/// Prices are a best-effort estimate looked up from the product catalogue
/// (VAT-inclusive, same convention used elsewhere in the app) — the real
/// price is only known once the server confirms the sale, so this is
/// always labelled as an estimate.
class OrderSummaryCard extends StatelessWidget {
  final double totalWithVat;
  final int itemCount;

  /// Whether every line's price is known. Only meaningful when
  /// [isEstimate] is true — irrelevant once the server has confirmed the
  /// sale and returned real prices.
  final bool allPricesResolved;

  /// Whether this total is a client-side best-effort guess (register flow)
  /// or the real, server-confirmed amount (sale detail screen).
  final bool isEstimate;

  const OrderSummaryCard({
    super.key,
    required this.totalWithVat,
    required this.itemCount,
    this.allPricesResolved = true,
    this.isEstimate = true,
  });

  @override
  Widget build(BuildContext context) {
    final vatPercent = AppConfig.defaultVatPercent;
    final vatAmount = totalWithVat * (vatPercent / (100 + vatPercent));
    final netAmount = totalWithVat - vatAmount;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: kSecondaryColor,
                ),
              ),
              if (isEstimate)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Estimated',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          _SummaryRow(
            label: 'Subtotal ($itemCount item${itemCount == 1 ? '' : 's'})',
            value: '$currency ${netAmount.toStringAsFixed(0)}',
          ),
          const SizedBox(height: 8),
          _SummaryRow(
            label: 'VAT (${vatPercent.toStringAsFixed(0)}%)',
            value: '$currency ${vatAmount.toStringAsFixed(0)}',
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: _SummaryRow(
              label: 'Total',
              value: '$currency ${totalWithVat.toStringAsFixed(0)}',
              emphasize: true,
            ),
          ),
          if (isEstimate && !allPricesResolved) ...[
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, size: 15, color: kSecondaryColor),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Some prices aren\'t available yet — the total may be higher. The final amount is confirmed when you submit.',
                    style: TextStyle(fontSize: 11.5, color: kSecondaryColor),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool emphasize;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = emphasize
        ? const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w800,
            color: kTextDark,
          )
        : const TextStyle(fontSize: 13, color: kTextMuted);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(
          value,
          style: emphasize
              ? style
              : style.copyWith(color: kTextDark, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
