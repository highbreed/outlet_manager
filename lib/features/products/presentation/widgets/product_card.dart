import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/product.dart';
import 'stock_status_badge.dart' show formatKes;

/// List card for a catalogue product.
///
/// Item codes are an internal SAP-style key the field team never uses to
/// identify a product, so they're deliberately left off this card (and off
/// the detail screen) — brand/model/category are what a rep actually
/// recognizes.
///
/// Departure from the mock: no stock status pill here. The catalogue list
/// endpoint doesn't return stock — it's only fetched (per-warehouse) once
/// the rep opens a specific product — so showing "LOW"/"IN STOCK" on every
/// row here would be fabricated.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  String? get _modelNumber =>
      product.modelNumber != null && product.modelNumber!.isNotEmpty
      ? product.modelNumber
      : null;

  String? get _category {
    if (product.subGroup3 != null && product.subGroup3!.isNotEmpty) {
      return product.subGroup3;
    }
    if (product.subGroup2 != null && product.subGroup2!.isNotEmpty) {
      return product.subGroup2;
    }
    return product.category;
  }

  @override
  Widget build(BuildContext context) {
    final modelNumber = _modelNumber;
    final category = _category;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBorderColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const ProductPhotoPlaceholder(size: 56, radius: 14),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      if (modelNumber != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          modelNumber,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: kTextMuted,
                          ),
                        ),
                      ],
                      if (category != null && category.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          category,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: kTextFaint,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formatKes(product.unitPrice),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kSecondaryColor,
                        fontSize: 13,
                      ),
                    ),
                    if (product.incentiveAmount > 0) ...[
                      const SizedBox(height: 3),
                      Text(
                        '+${formatKes(product.incentiveAmount)} incentive',
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
          ),
        ),
      ),
    );
  }
}

/// Diagonal-stripe placeholder standing in for real product imagery —
/// matches the mock's own placeholder pattern (the bundle's README notes
/// there are no real image assets; this is what production is meant to
/// replace). Used on both the list card and the detail screen's hero block.
class ProductPhotoPlaceholder extends StatelessWidget {
  final double size;
  final double radius;
  final String label;

  const ProductPhotoPlaceholder({
    super.key,
    required this.size,
    required this.radius,
    this.label = 'photo',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF0F0EE), Color(0xFFF7F7F7)],
          stops: [0.5, 0.5],
          tileMode: TileMode.repeated,
          transform: GradientRotation(0.785398),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: size >= 100 ? 10 : 7,
          color: kTextFaint,
        ),
      ),
    );
  }
}
