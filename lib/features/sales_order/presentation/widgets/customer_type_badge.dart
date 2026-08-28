import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/entities.dart';

/// Small pill badge showing whether a customer pays in cash or on credit.
class CustomerTypeBadge extends StatelessWidget {
  final CustomerType type;
  final double? fontSize;

  const CustomerTypeBadge({super.key, required this.type, this.fontSize});

  @override
  Widget build(BuildContext context) {
    final isCash = type == CustomerType.cash;
    final bg = isCash ? kSecondaryColor2 : kSecondaryLightColor;
    final fg = isCash ? const Color(0xFF8A5A00) : kSecondaryColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isCash ? 'CASH' : 'CREDIT',
        style: TextStyle(
          color: fg,
          fontSize: fontSize ?? 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
