import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'floating_bottom_nav.dart';

/// Bottom navigation for the application: a floating pill bar with four
/// destinations — Home, Route (Daily Route), Tasks (all task modules), and
/// Menu (profile, settings, less-frequent destinations).
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return FloatingBottomNav(
      currentIndex: currentIndex,
      destinations: [
        FloatingNavDestination(
          icon: Icons.home_outlined,
          selectedIcon: Icons.home,
          label: 'Home',
          onTap: () => context.go('/home'),
        ),
        FloatingNavDestination(
          icon: Icons.storefront_outlined,
          selectedIcon: Icons.storefront,
          label: 'Route',
          onTap: () => context.go('/daily-route'),
        ),
        FloatingNavDestination(
          icon: Icons.grid_view_outlined,
          selectedIcon: Icons.grid_view_rounded,
          label: 'Tasks',
          onTap: () => context.go('/tasks'),
        ),
        FloatingNavDestination(
          icon: Icons.menu_outlined,
          selectedIcon: Icons.menu,
          label: 'Menu',
          onTap: () => context.go('/menu'),
        ),
      ],
    );
  }
}
