import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../auth/auth.dart';
import '../home/widgets/feature_navigation.dart';

class _MenuRow {
  final String label;
  final VoidCallback onTap;
  final bool destructive;

  const _MenuRow({
    required this.label,
    required this.onTap,
    this.destructive = false,
  });
}

/// Bottom nav "Menu" destination — profile header plus grouped navigation
/// to destinations that don't need a dedicated bottom-nav slot (route plan,
/// session history, products, after-sales, settings, help, sign out).
/// Pure navigation only — reuses the existing sign-out confirmation flow
/// from [CustomAppBar].
class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return AppScaffold(
      showAppBar: false,
      showBottomNav: true,
      currentNavIndex: 3,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 110),
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: kSecondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      _initials(user?.fullName ?? 'U'),
                      style: const TextStyle(
                        color: kTextLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.fullName ?? 'User',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        user?.primaryRole ?? 'Sales Representative',
                        style: const TextStyle(
                          fontSize: 12,
                          color: kTextMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _MenuGroup(
              title: 'Sales & Merchandising',
              rows: [
                _MenuRow(
                  label: 'Stock Take',
                  onTap: () => navigateToFeature(
                    context,
                    ref,
                    homeFeatures.firstWhere((f) => f.route == '/stock-take'),
                  ),
                ),
                _MenuRow(
                  label: 'Daily Sales',
                  onTap: () => navigateToFeature(
                    context,
                    ref,
                    homeFeatures.firstWhere((f) => f.route == '/daily-sales'),
                  ),
                ),
                _MenuRow(
                  label: 'Orders & Quotations',
                  onTap: () => context.push('/sales-orders'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _MenuGroup(
              title: 'Tools',
              rows: [
                _MenuRow(
                  label: 'Products',
                  onTap: () => context.push('/products'),
                ),
                _MenuRow(
                  label: 'After Sales',
                  onTap: () => context.push('/after-sales'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _MenuGroup(
              title: 'Activity',
              rows: [
                _MenuRow(
                  label: 'Route Plan',
                  onTap: () => context.push('/schedules'),
                ),
                _MenuRow(
                  label: 'Session History',
                  onTap: () => context.push('/clock-in/history'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _MenuGroup(
              title: 'Settings & Help',
              rows: [
                _MenuRow(
                  label: 'Settings',
                  onTap: () => context.push('/settings'),
                ),
                _MenuRow(label: 'Help Center', onTap: () => context.push('/help')),
                _MenuRow(
                  label: 'Sign Out',
                  destructive: true,
                  onTap: () => _handleSignOut(context, ref),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignOut(BuildContext context, WidgetRef ref) async {
    final confirmed = await ConfirmationDialog.show(
      context,
      title: 'Sign Out',
      message: 'Are you sure you want to sign out?',
      confirmText: 'Sign Out',
      cancelText: 'Cancel',
      isDestructive: true,
    );

    if (confirmed && context.mounted) {
      ref.read(authControllerProvider.notifier).logout();
    }
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty);
    if (parts.isEmpty) return 'U';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}

class _MenuGroup extends StatelessWidget {
  final String title;
  final List<_MenuRow> rows;

  const _MenuGroup({required this.title, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            color: kTextFaint,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        AppCard(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              for (var i = 0; i < rows.length; i++)
                _MenuRowTile(row: rows[i], isLast: i == rows.length - 1),
            ],
          ),
        ),
      ],
    );
  }
}

class _MenuRowTile extends StatelessWidget {
  final _MenuRow row;
  final bool isLast;

  const _MenuRowTile({required this.row, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: row.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(bottom: BorderSide(color: kBackground)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                row.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: row.destructive ? kRedColor : kTextDark,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 16,
              color: row.destructive ? kRedColor : kTextFaint,
            ),
          ],
        ),
      ),
    );
  }
}
