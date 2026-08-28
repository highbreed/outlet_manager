import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// The redesign's bordered light surface, used throughout Daily Sales and
/// Replenishment — same visual language as [AppCard] (22px radius, hairline
/// border, no shadow) kept as a distinct widget here since call sites also
/// need the [SurfaceCard]-adjacent [SectionHeading].
class SurfaceCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;

  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.color,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(22);
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? kPrimaryLightColor,
        borderRadius: radius,
        border: Border.all(color: borderColor ?? kBorderColor),
      ),
      child: child,
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      borderRadius: radius,
      child: InkWell(borderRadius: radius, onTap: onTap, child: card),
    );
  }
}

/// A section title used above a [SurfaceCard] or group of controls, giving
/// each block of a screen a clear identity instead of content just running
/// together.
class SectionHeading extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const SectionHeading({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: kTextDark),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kTextDark,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  style: const TextStyle(fontSize: 12.5, color: kTextMuted),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
