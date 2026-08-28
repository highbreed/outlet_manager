import 'package:flutter/material.dart';

import '../theme/colors.dart';

class FloatingNavDestination {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final VoidCallback onTap;

  const FloatingNavDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.onTap,
  });
}

/// The redesign's bottom navigation: a floating white pill bar (bordered,
/// softly shadowed) with a light-purple highlight behind the selected
/// destination, replacing the previous full-width [NavigationBar].
class FloatingBottomNav extends StatelessWidget {
  final int currentIndex;
  final List<FloatingNavDestination> destinations;

  const FloatingBottomNav({
    super.key,
    required this.currentIndex,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: kBorderColor),
          boxShadow: [
            BoxShadow(
              color: kTextDark.withValues(alpha: 0.10),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            for (var i = 0; i < destinations.length; i++)
              Expanded(child: _NavItem(destinations[i], selected: i == currentIndex)),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final FloatingNavDestination destination;
  final bool selected;

  const _NavItem(this.destination, {required this.selected});

  @override
  Widget build(BuildContext context) {
    final color = selected ? kSecondaryColor : kTextMuted;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: destination.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: selected ? kSecondaryLightColor : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(selected ? destination.selectedIcon : destination.icon, color: color, size: 20),
              const SizedBox(height: 2),
              Text(
                destination.label,
                style: TextStyle(
                  fontSize: 10,
                  color: color,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
