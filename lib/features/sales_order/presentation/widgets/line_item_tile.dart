import 'package:flutter/material.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/theme/colors.dart';
import '../../domain/entities/entities.dart';

class LineItemTile extends StatelessWidget {
  final OrderLineItem item;
  final ValueChanged<int>? onQuantityChanged;
  final VoidCallback? onRemove;
  final bool readOnly;

  const LineItemTile({
    super.key,
    required this.item,
    this.onQuantityChanged,
    this.onRemove,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final currency = AppConfig.defaultCurrency;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBorderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kBackground,
              borderRadius: BorderRadius.circular(12),
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
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.modelNumber != null && item.modelNumber!.isNotEmpty
                      ? 'Model ${item.modelNumber}'
                      : item.productCode,
                  style: const TextStyle(fontSize: 11.5, color: kTextMuted),
                ),
                const SizedBox(height: 2),
                Text(
                  '$currency ${item.unitPrice.toStringAsFixed(0)} each',
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
                '$currency ${item.total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              if (readOnly)
                Text(
                  'Qty ${item.quantity}',
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                )
              else ...[
                _StepperBox(quantity: item.quantity, onChanged: onQuantityChanged),
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
            ],
          ),
        ],
      ),
    );
  }
}

class _StepperBox extends StatelessWidget {
  final int quantity;
  final ValueChanged<int>? onChanged;
  const _StepperBox({required this.quantity, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepperButton(
            icon: Icons.remove,
            onTap: () => onChanged?.call(quantity - 1),
          ),
          SizedBox(
            width: 24,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
          ),
          _StepperButton(
            icon: Icons.add,
            onTap: () => onChanged?.call(quantity + 1),
          ),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

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
