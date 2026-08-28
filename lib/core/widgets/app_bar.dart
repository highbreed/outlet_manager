import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/auth.dart';
import '../../features/connectivity/connectivity.dart';
import '../providers/location_tracking_providers.dart';
import '../utils/assets.dart';
import 'confirmation_dialog.dart';

/// Menu options for the app bar
enum AppBarMenuOption { settings, helpCenter, signOut }

/// Custom app bar for the application with common features
class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showLocationIndicator;
  final bool showMenu;
  final bool showLogo;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.showLocationIndicator = true,
    this.showMenu = true,
    this.showLogo = false,
    this.leading,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationTracking = ref.watch(locationTrackingControllerProvider);
    final isOnline = ref.watch(isOnlineProvider);
    final user = ref.watch(currentUserProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      leading: leading,
      title: showLogo
          ? Image.asset(
              isDark ? Assets.logoWhite : Assets.logoBlack,
              height: 50,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to text if image fails to load
                return Text(title ?? 'Outlet Manager');
              },
            )
          : (title != null ? Text(title!) : null),
      actions: [
        // Online/Offline indicator
        if (!isOnline)
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Center(
              child: Icon(Icons.cloud_off, size: 18, color: Colors.orange),
            ),
          ),
        // Location tracking indicator
        if (showLocationIndicator)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Center(
              child: locationTracking.isTracking
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.my_location, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'Tracking',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    )
                  : const Icon(Icons.location_off, size: 16),
            ),
          ),
        // Custom actions
        if (actions != null) ...actions!,
        // Menu button with options
        if (showMenu)
          PopupMenuButton<AppBarMenuOption>(
            icon: const Icon(Icons.more_vert),
            tooltip: 'More options',
            offset: const Offset(0, 50),
            itemBuilder: (context) => [
              // User info header
              if (user != null)
                PopupMenuItem<AppBarMenuOption>(
                  enabled: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        user.fullName,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.email,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              // Settings option
              const PopupMenuItem<AppBarMenuOption>(
                value: AppBarMenuOption.settings,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ),
              // Help Center option
              const PopupMenuItem<AppBarMenuOption>(
                value: AppBarMenuOption.helpCenter,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.help_outline),
                  title: Text('Help Center'),
                ),
              ),
              const PopupMenuDivider(),
              // Sign Out option
              const PopupMenuItem<AppBarMenuOption>(
                value: AppBarMenuOption.signOut,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Sign Out', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
            onSelected: (option) => _handleMenuOption(context, ref, option),
          ),
      ],
    );
  }

  Future<void> _handleMenuOption(
    BuildContext context,
    WidgetRef ref,
    AppBarMenuOption option,
  ) async {
    switch (option) {
      case AppBarMenuOption.settings:
        // Navigate to settings screen
        context.push('/settings');
        break;

      case AppBarMenuOption.helpCenter:
        // Navigate to help center screen
        context.push('/help');
        break;

      case AppBarMenuOption.signOut:
        // Show confirmation dialog before signing out
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
        break;
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
