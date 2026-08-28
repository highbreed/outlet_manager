import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/product.dart';

/// Formats a price as `KES 1,234.56`.
String formatKes(double value) {
  final fixed = value.toStringAsFixed(2);
  final parts = fixed.split('.');
  final whole = parts[0].replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => ',',
  );
  return 'KES $whole.${parts[1]}';
}

/// Pill badge showing a product's stock availability.
class StockStatusBadge extends StatelessWidget {
  final StockStatus status;
  final int? quantity;

  const StockStatusBadge({super.key, required this.status, this.quantity});

  Color get _color => switch (status) {
    StockStatus.inStock => kSuccessColor,
    StockStatus.lowStock => kWarningColor,
    StockStatus.outOfStock => kRedColor,
  };

  String get _label => switch (status) {
    StockStatus.inStock => quantity != null ? '$quantity in stock' : 'In stock',
    StockStatus.lowStock => quantity != null ? 'Low · $quantity left' : 'Low stock',
    StockStatus.outOfStock => 'Out of stock',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        _label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: _color,
        ),
      ),
    );
  }
}
