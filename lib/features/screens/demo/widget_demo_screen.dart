import 'package:flutter/material.dart';

import '../../../core/core.dart';

/// Example screen demonstrating all reusable widgets
class WidgetDemoScreen extends StatelessWidget {
  const WidgetDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Widget Demo',
      showBottomNav: true,
      currentNavIndex: 0,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Toast Notifications Demo
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Toast Notifications',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),

                    // Using static methods
                    ElevatedButton.icon(
                      onPressed: () {
                        ToastNotification.showSuccess(
                          context,
                          'This is a success message!',
                        );
                      },
                      icon: const Icon(Icons.check_circle),
                      label: const Text('Show Success'),
                    ),
                    const SizedBox(height: 8),

                    // Using context extensions (easier)
                    ElevatedButton.icon(
                      onPressed: () {
                        context.showErrorToast('This is an error message!');
                      },
                      icon: const Icon(Icons.error),
                      label: const Text('Show Error'),
                    ),
                    const SizedBox(height: 8),

                    ElevatedButton.icon(
                      onPressed: () {
                        context.showWarningToast('This is a warning!');
                      },
                      icon: const Icon(Icons.warning),
                      label: const Text('Show Warning'),
                    ),
                    const SizedBox(height: 8),

                    ElevatedButton.icon(
                      onPressed: () {
                        context.showInfoToast('This is an info message!');
                      },
                      icon: const Icon(Icons.info),
                      label: const Text('Show Info'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Loading Overlay Demo
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Loading Overlay',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),

                    ElevatedButton.icon(
                      onPressed: () {
                        // Show loading
                        context.showLoading(message: 'Loading...');

                        // Simulate async operation
                        Future.delayed(const Duration(seconds: 2), () {
                          context.hideLoading();
                          context.showSuccessToast('Done!');
                        });
                      },
                      icon: const Icon(Icons.hourglass_empty),
                      label: const Text('Show Loading'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Confirmation Dialog Demo
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirmation Dialog',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),

                    ElevatedButton.icon(
                      onPressed: () async {
                        final confirmed = await context.showConfirmDialog(
                          title: 'Confirm Action',
                          message: 'Are you sure you want to proceed?',
                          confirmText: 'Yes',
                          cancelText: 'No',
                        );

                        if (confirmed && context.mounted) {
                          context.showSuccessToast('Action confirmed!');
                        }
                      },
                      icon: const Icon(Icons.help_outline),
                      label: const Text('Show Confirmation'),
                    ),
                    const SizedBox(height: 8),

                    ElevatedButton.icon(
                      onPressed: () async {
                        final confirmed = await context.showConfirmDialog(
                          title: 'Delete Item',
                          message: 'This action cannot be undone.',
                          confirmText: 'Delete',
                          cancelText: 'Cancel',
                          isDestructive: true,
                        );

                        if (confirmed && context.mounted) {
                          context.showSuccessToast('Item deleted!');
                        }
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('Show Destructive Confirmation'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Usage Example Code
            Card(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Usage Examples',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '''
// Toast Notifications
context.showSuccessToast('Success!');
context.showErrorToast('Error occurred');
context.showWarningToast('Warning!');
context.showInfoToast('Info message');

// Loading Overlay
context.showLoading(message: 'Loading...');
context.hideLoading();

// Confirmation Dialog
final confirmed = await context.showConfirmDialog(
  title: 'Confirm',
  message: 'Are you sure?',
  isDestructive: true,
);

// AppScaffold with Bottom Nav
AppScaffold(
  title: 'My Screen',
  showBottomNav: true,
  currentNavIndex: 0,
  body: YourContent(),
)

// Custom AppBar without scaffold
Scaffold(
  appBar: CustomAppBar(
    title: 'Custom',
    showLocationIndicator: false,
  ),
  body: YourContent(),
)
                      ''',
                      style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
