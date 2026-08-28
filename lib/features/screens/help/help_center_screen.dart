import 'package:flutter/material.dart';

import '../../../core/core.dart';

/// Help Center screen
class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Help Center',
      showBottomNav: false,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for help...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (query) {
              // TODO: Implement search
            },
          ),

          const SizedBox(height: 24),

          // Quick Actions
          Text('Quick Actions', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  context,
                  icon: Icons.chat_outlined,
                  label: 'Live Chat',
                  onTap: () {
                    context.showInfoToast('Starting live chat...');
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickActionCard(
                  context,
                  icon: Icons.email_outlined,
                  label: 'Email Support',
                  onTap: () {
                    context.showInfoToast('Opening email...');
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // FAQ Section
          Text(
            'Frequently Asked Questions',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),

          _buildFAQItem(
            context,
            question: 'How do I track outlet locations?',
            answer:
                'Enable location services in your device settings, then navigate to the map screen. The app will automatically track your location when visiting outlets.',
          ),
          _buildFAQItem(
            context,
            question: 'How do I sync my data?',
            answer:
                'Data is automatically synced when you have an internet connection. You can also manually sync by going to Settings > Data Sync.',
          ),
          _buildFAQItem(
            context,
            question: 'What should I do if I\'m offline?',
            answer:
                'The app works offline! All your data will be saved locally and synced automatically when you reconnect to the internet.',
          ),
          _buildFAQItem(
            context,
            question: 'How do I update my profile?',
            answer:
                'Go to the profile tab and tap the edit icon. You can update your name, email, and other information.',
          ),
          _buildFAQItem(
            context,
            question: 'How do I report a bug?',
            answer:
                'Use the "Report a Bug" option below or contact our support team via email at support@outletmanager.com',
          ),

          const SizedBox(height: 24),

          // Help Topics
          Text('Help Topics', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),

          _buildHelpTopic(
            context,
            icon: Icons.location_on,
            title: 'Location & Tracking',
            subtitle: 'Learn about location services',
          ),
          _buildHelpTopic(
            context,
            icon: Icons.store,
            title: 'Managing Outlets',
            subtitle: 'Add, edit, and organize outlets',
          ),
          _buildHelpTopic(
            context,
            icon: Icons.cloud_sync,
            title: 'Data Synchronization',
            subtitle: 'How data sync works',
          ),
          _buildHelpTopic(
            context,
            icon: Icons.security,
            title: 'Privacy & Security',
            subtitle: 'Your data protection',
          ),

          const SizedBox(height: 24),

          // Contact Support
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(
                    Icons.support_agent,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Still need help?',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Our support team is here to help you',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () {
                      context.showInfoToast('Opening support...');
                    },
                    icon: const Icon(Icons.mail_outline),
                    label: const Text('Contact Support'),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(
                icon,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(
    BuildContext context, {
    required String question,
    required String answer,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(question),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(answer, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpTopic(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        context.showInfoToast('Opening $title...');
      },
    );
  }
}
