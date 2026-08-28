import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'bottom_nav_bar.dart';

/// Custom scaffold wrapper that combines app bar and bottom navigation
class AppScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final bool showAppBar;
  final bool showBottomNav;
  final bool showLocationIndicator;
  final bool showMenu;
  final bool showLogo;
  final Widget? leading;
  final int currentNavIndex;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.showAppBar = true,
    this.showBottomNav = false,
    this.showLocationIndicator = true,
    this.showLogo = false,
    this.showMenu = true,
    this.leading,
    this.currentNavIndex = 0,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? CustomAppBar(
              title: title,
              actions: actions,
              showLocationIndicator: showLocationIndicator,
              showLogo: showLogo,
              showMenu: showMenu,
              leading: leading,
            )
          : null,
      body: body,
      bottomNavigationBar: showBottomNav
          ? CustomBottomNavBar(currentIndex: currentNavIndex)
          : null,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
