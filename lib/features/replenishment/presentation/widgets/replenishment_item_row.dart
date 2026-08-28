import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../daily_sales/presentation/widgets/surface_card.dart';
import '../../data/datasources/replenishment_remote_datasource.dart';

enum _Severity { critical, low }

/// Purely a visual bucketing derived from real [ReplenishmentOrderItem]
/// fields (current stock vs. its minimum) — every item in this list is
/// already at or below its minimum by construction, so this just tells
/// how far below: severely (critical) or only just (low).
_Severity _severityFor(ReplenishmentOrderItem item) {
  if (item.minStockLevel <= 0) return _Severity.low;
  final ratio = item.currentStock / item.minStockLevel;
  return ratio <= 0.34 ? _Severity.critical : _Severity.low;
}

/// One suggested-reorder line — informational only, no accept/edit actions
/// exist for this feature yet.
class ReplenishmentItemRow extends StatelessWidget {
  final ReplenishmentOrderItem item;

  const ReplenishmentItemRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final currency = AppConfig.defaultCurrency;
    final severity = _severityFor(item);
    final barMax = item.maxStockLevel > item.minStockLevel
        ? item.maxStockLevel
        : item.minStockLevel * 2;
    final stockFraction = barMax <= 0
        ? 0.0
        : (item.currentStock / barMax).clamp(0.0, 1.0);
    final minFraction = barMax <= 0
        ? 0.0
        : (item.minStockLevel / barMax).clamp(0.0, 1.0);

    return SurfaceCard(
      padding: const EdgeInsets.all(14),
      borderColor: kSecondaryColor,
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
                      item.itemName?.isNotEmpty == true
                          ? item.itemName!
                          : item.itemCode,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: kTextDark,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.modelNumber ?? item.itemCode,
                      style: const TextStyle(fontSize: 11, color: kTextFaint),
                    ),
                  ],
                ),
              ),
              StatusChip(
                label: severity == _Severity.critical ? 'CRITICAL' : 'LOW',
                variant: severity == _Severity.critical
                    ? StatusChipVariant.danger
                    : StatusChipVariant.warning,
              ),
            ],
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      value: stockFraction,
                      minHeight: 6,
                      backgroundColor: const Color(0xFFEFEFEC),
                      valueColor: AlwaysStoppedAnimation(
                        severity == _Severity.critical
                            ? kRedColor
                            : kWarningColor,
                      ),
                    ),
                  ),
                  Positioned(
                    left: minFraction * constraints.maxWidth - 0.75,
                    top: -3,
                    child: Container(width: 1.5, height: 12, color: kTextFaint),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  style: const TextStyle(fontSize: 11, color: kTextMuted),
                  children: [
                    const TextSpan(text: 'On hand '),
                    TextSpan(
                      text: '${item.currentStock}',
                      style: const TextStyle(
                        color: kTextDark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const TextSpan(text: ' · Min '),
                    TextSpan(
                      text: '${item.minStockLevel}',
                      style: const TextStyle(
                        color: kTextDark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Suggested +${item.proposedQuantity}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '$currency ${item.lineTotal.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: kTextDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
