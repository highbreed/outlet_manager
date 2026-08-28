import 'package:flutter/material.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/status_chip.dart';
import '../../domain/entities/entities.dart';

class QuotationCard extends StatelessWidget {
  final SalesQuotation quotation;
  final VoidCallback? onTap;
  final VoidCallback? onConvert;

  const QuotationCard({
    super.key,
    required this.quotation,
    this.onTap,
    this.onConvert,
  });

  bool get _isOpen =>
      !quotation.isExpired &&
      (quotation.status == QuotationStatus.draft ||
          quotation.status == QuotationStatus.sent ||
          quotation.status == QuotationStatus.accepted);

  StatusChipVariant get _variant {
    if (quotation.isExpired) return StatusChipVariant.danger;
    switch (quotation.status) {
      case QuotationStatus.draft:
        return StatusChipVariant.neutral;
      case QuotationStatus.sent:
      case QuotationStatus.accepted:
        return StatusChipVariant.warning;
      case QuotationStatus.converted:
        return StatusChipVariant.success;
      case QuotationStatus.expired:
      case QuotationStatus.cancelled:
        return StatusChipVariant.danger;
    }
  }

  String get _statusLabel =>
      quotation.isExpired && quotation.status != QuotationStatus.expired
      ? 'Expired'
      : quotation.status.label;

  @override
  Widget build(BuildContext context) {
    final isConverted = quotation.status == QuotationStatus.converted;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Opacity(
        opacity: isConverted ? 0.6 : 1,
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
                border: Border.all(color: kBorderColor),
              ),
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
                              quotation.customerName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${quotation.quotationNumber} · ${_formatDate(quotation.createdAt)} · ${quotation.customerType.label}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 11,
                                color: kTextFaint,
                              ),
                            ),
                          ],
                        ),
                      ),
                      StatusChip(label: _statusLabel, variant: _variant),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '${AppConfig.defaultCurrency} ${_formatAmount(quotation.total)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      if (_isOpen && onConvert != null)
                        Material(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(999),
                          child: InkWell(
                            onTap: onConvert,
                            borderRadius: BorderRadius.circular(999),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 7,
                              ),
                              child: Text(
                                'Convert to Order',
                                style: TextStyle(
                                  color: kTextLight,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
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
