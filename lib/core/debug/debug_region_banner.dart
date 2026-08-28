import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../config/app_config.dart';

/// Wraps [child] with a thin banner showing the active region and environment.
/// Renders nothing in release builds.
class DebugRegionBanner extends StatelessWidget {
  final Widget child;

  const DebugRegionBanner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) return child;

    final env = AppConfig.environment.name.toUpperCase();
    final region = AppConfig.region.code;
    final currency = AppConfig.region.currency;
    final vat = AppConfig.defaultVatPercent.toStringAsFixed(0);

    return Column(
      children: [
        Material(
          color: const Color(0xFF6A0DAD),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                '[$env] $region · $currency · VAT $vat%',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
