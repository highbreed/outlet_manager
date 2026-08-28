import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../daily_route/providers/daily_route_providers.dart';

/// Model for a task-module entry point (used by Home's Quick Actions row,
/// the Tasks screen, and the Menu screen).
class HomeFeatureItem {
  final String title;
  final String? subtitle;
  final IconData iconData;
  final String route;
  final Map<String, dynamic>? routeExtra;
  final bool isComingSoon;

  const HomeFeatureItem({
    required this.title,
    this.subtitle,
    required this.iconData,
    required this.route,
    this.routeExtra,
    this.isComingSoon = false,
  });
}

/// Routes that need the current active visit's outlet injected into
/// `extra` so the destination screen knows which outlet it's working
/// against (see [navigateToFeature]).
const _visitContextRoutes = {
  '/stock-take',
  '/shelf-share',
  '/facings',
  '/daily-sales',
};

/// Full list of task modules, in the order they appear on the Tasks screen.
/// The Home screen's Quick Actions row shows a curated subset of these.
const List<HomeFeatureItem> homeFeatures = [
  HomeFeatureItem(
    title: 'Stock Take',
    subtitle: 'Inventory count',
    iconData: Icons.inventory_2_outlined,
    route: '/stock-take',
  ),
  HomeFeatureItem(
    title: 'Daily Sales',
    subtitle: 'Register & confirm sales',
    iconData: Icons.point_of_sale_outlined,
    route: '/daily-sales',
  ),
  HomeFeatureItem(
    title: 'Orders & Quotations',
    subtitle: 'Orders & quotations',
    iconData: Icons.description_outlined,
    route: '/sales-orders',
  ),
  HomeFeatureItem(
    title: 'Shelf Share',
    subtitle: 'Brand facings',
    iconData: Icons.bar_chart_rounded,
    route: '/shelf-share',
  ),
  HomeFeatureItem(
    title: 'Facings Count',
    subtitle: 'Shelf visibility',
    iconData: Icons.grid_view_rounded,
    route: '/facings',
  ),
  HomeFeatureItem(
    title: 'Products',
    subtitle: 'Catalogue & stock',
    iconData: Icons.inventory_outlined,
    route: '/products',
  ),
  HomeFeatureItem(
    title: 'My Performance',
    subtitle: 'Targets & incentives',
    iconData: Icons.insights_outlined,
    route: '/sales-performance',
  ),
  HomeFeatureItem(
    title: 'After Sales',
    subtitle: 'Complaints',
    iconData: Icons.support_agent_outlined,
    route: '/after-sales',
  ),
  HomeFeatureItem(
    title: 'Cash Flow',
    subtitle: 'Track finances',
    iconData: Icons.account_balance_wallet_outlined,
    route: '/coming-soon',
    routeExtra: {
      'featureName': 'Cash Flow',
      'featureIcon': Icons.account_balance_wallet,
    },
    isComingSoon: true,
  ),
];

/// Quick Actions subset shown on Home when there's no route in progress
/// (route not started / no route assigned) — matches the mock's 3-item
/// row: Products, Orders, Performance.
List<HomeFeatureItem> get compactHomeFeatures {
  const titles = ['Products', 'Orders & Quotations', 'My Performance'];
  return titles
      .map((t) => homeFeatures.firstWhere((f) => f.title == t))
      .toList();
}

/// Navigates to a task module, injecting the active visit's outlet context
/// (customerId/customerCode/customerName/visitLocalId/visitServerId) for
/// the modules that need it — the same rule the old feature-grid tiles used.
void navigateToFeature(
  BuildContext context,
  WidgetRef ref,
  HomeFeatureItem feature,
) {
  Map<String, dynamic>? extra = feature.routeExtra;

  if (_visitContextRoutes.contains(feature.route)) {
    // activeVisitProvider is sourced from the polled day-status endpoint
    // (see its doc comment), so this already reflects clock-in/out state
    // within one poll cycle.
    final activeVisit = ref.read(activeVisitProvider);
    if (activeVisit != null) {
      final serverId = activeVisit.serverId;
      extra = {
        'customerId': int.tryParse(activeVisit.outletId) ?? 0,
        'customerCode': activeVisit.outletCode,
        'customerName': activeVisit.outletName,
        'visitLocalId': activeVisit.localId,
        'visitServerId': serverId != null ? int.tryParse(serverId) : null,
      };
    } else {
      extra = {
        'customerId': 0,
        'customerCode': '',
        'customerName': 'No Active Visit',
        'visitLocalId': null,
        'visitServerId': null,
      };
    }
  }

  if (extra != null) {
    context.push(feature.route, extra: extra);
  } else {
    context.push(feature.route);
  }
}
