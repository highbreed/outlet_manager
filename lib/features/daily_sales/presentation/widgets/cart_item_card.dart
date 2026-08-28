import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import 'surface_card.dart';

/// A single product line in the sale cart.
///
/// Pass [onIncrement]/[onDecrement]/[onRemove] to get an editable card with
/// quantity controls (used while building the cart); omit all three for a
/// compact, read-only summary row (used on the review step).
class CartItemCard extends StatelessWidget {
  final SaleCartItem item;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    this.onIncrement,
    this.onDecrement,
    this.onRemove,
  });

  bool get _isEditable =>
      onIncrement != null || onDecrement != null || onRemove != null;

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kBackground,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(
              Icons.inventory_2_outlined,
              color: kTextFaint,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
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
                  item.modelNumber ?? item.productCode,
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
                const SizedBox(height: 4),
                Text(
                  item.hasEstimatedPrice
                      ? '${AppConfig.defaultCurrency} ${item.estimatedUnitPrice!.toStringAsFixed(0)} each (est.)'
                      : 'Price confirmed at submission',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontStyle: item.hasEstimatedPrice
                        ? FontStyle.normal
                        : FontStyle.italic,
                    color: item.hasEstimatedPrice
                        ? kSecondaryColor
                        : kTextMuted,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (item.hasEstimatedPrice)
                Text(
                  '${AppConfig.defaultCurrency} ${item.estimatedLineTotal.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextDark,
                  ),
                ),
              const SizedBox(height: 6),
              if (_isEditable)
                Container(
                  decoration: BoxDecoration(
                    color: kBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _StepperButton(icon: Icons.remove, onTap: onDecrement),
                      SizedBox(
                        width: 24,
                        child: Text(
                          '${item.quantity}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      _StepperButton(icon: Icons.add, onTap: onIncrement),
                    ],
                  ),
                )
              else
                Text(
                  'Qty ${item.quantity}',
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
              if (onRemove != null) ...[
                const SizedBox(height: 6),
                InkWell(
                  onTap: onRemove,
                  borderRadius: BorderRadius.circular(8),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: Icon(
                      Icons.delete_outline,
                      size: 18,
                      color: kRedColor,
                    ),
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

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icon, size: 16, color: kSecondaryColor),
      ),
    );
  }
}
