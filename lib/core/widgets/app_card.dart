import 'package:flutter/material.dart';

import '../theme/colors.dart';

/// The redesign's card primitive: a white, bordered, 22px-radius surface
/// with no drop shadow. Used throughout for grouped content — route status,
/// outlet info, checklists, stat tiles, etc.
///
/// [dark] renders the "emphasis" variant seen in the mock (solid black
/// background, white text) used for the active-visit / next-outlet cards.
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool dark;
  final Color? borderColor;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.onTap,
    this.dark = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(22);
    final card = Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: dark ? kTextDark : kPrimaryLightColor,
        borderRadius: radius,
        border: dark
            ? null
            : Border.all(color: borderColor ?? kBorderColor),
      ),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: dark ? kTextLight : kTextDark),
        child: child,
      ),
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      borderRadius: radius,
      child: InkWell(borderRadius: radius, onTap: onTap, child: card),
    );
  }
}
