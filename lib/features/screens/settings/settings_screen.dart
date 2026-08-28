import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../auth/auth.dart';

/// Settings screen
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return AppScaffold(
      title: 'Settings',
      showBottomNav: false,
      body: ListView(
        children: [
          // Profile Section
          if (user != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person, size: 40),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        user.fullName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        user.email,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Chip(
                        label: Text(user.primaryRole),
                        avatar: const Icon(Icons.badge, size: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // General Settings
          _buildSectionHeader(context, 'General'),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            subtitle: const Text('Manage notification preferences'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to notifications settings
              context.showInfoToast('Coming soon!');
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: const Text('English'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to language settings
              context.showInfoToast('Coming soon!');
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text('Theme'),
            subtitle: const Text('System default'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to theme settings
              context.showInfoToast('Coming soon!');
            },
          ),

          const Divider(),

          // Location Settings
          _buildSectionHeader(context, 'Location'),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Location Services'),
            subtitle: const Text('Manage location tracking'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to location settings
              context.showInfoToast('Coming soon!');
            },
          ),
          ListTile(
            leading: const Icon(Icons.map_outlined),
            title: const Text('Map Preferences'),
            subtitle: const Text('Customize map display'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to map settings
              context.showInfoToast('Coming soon!');
            },
          ),

          const Divider(),

          // Data & Privacy
          _buildSectionHeader(context, 'Data & Privacy'),
          ListTile(
            leading: const Icon(Icons.cloud_sync_outlined),
            title: const Text('Data Sync'),
            subtitle: const Text('Manage data synchronization'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to sync settings
              context.showInfoToast('Coming soon!');
            },
          ),
          ListTile(
            leading: const Icon(Icons.security_outlined),
            title: const Text('Privacy'),
            subtitle: const Text('Privacy and security settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to privacy settings
              context.showInfoToast('Coming soon!');
            },
          ),

          const Divider(),

          // About
          _buildSectionHeader(context, 'About'),
          ListTile(
            leading: const Icon(Icons.info_outlined),
            title: const Text('App Version'),
            subtitle: const Text('1.0.0+1'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Terms of Service'),
            trailing: const Icon(Icons.open_in_new),
            onTap: () {
              // TODO: Open terms of service
              context.showInfoToast('Opening terms of service...');
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.open_in_new),
            onTap: () {
              // TODO: Open privacy policy
              context.showInfoToast('Opening privacy policy...');
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
