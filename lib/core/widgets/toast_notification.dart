import 'package:flutter/material.dart';

/// Toast/notification service for showing messages
class ToastNotification {
  /// Show a success message
  static void showSuccess(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      context,
      message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
      duration: duration,
    );
  }

  /// Show an error message
  static void showError(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    _showSnackBar(
      context,
      message,
      backgroundColor: Colors.red,
      icon: Icons.error,
      duration: duration,
    );
  }

  /// Show a warning message
  static void showWarning(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      context,
      message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
      duration: duration,
    );
  }

  /// Show an info message
  static void showInfo(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      context,
      message,
      backgroundColor: Colors.blue,
      icon: Icons.info,
      duration: duration,
    );
  }

  /// Show a custom snackbar
  static void _showSnackBar(
    BuildContext context,
    String message, {
    required Color backgroundColor,
    required IconData icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            // Use rootNavigator to avoid accessing potentially unmounted context
            if (context.mounted) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }
          },
        ),
      ),
    );
  }
}

/// Extension method for easier access from context
extension ToastNotificationExtension on BuildContext {
  void showSuccessToast(String message, {Duration? duration}) {
    ToastNotification.showSuccess(
      this,
      message,
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  void showErrorToast(String message, {Duration? duration}) {
    ToastNotification.showError(
      this,
      message,
      duration: duration ?? const Duration(seconds: 4),
    );
  }

  void showWarningToast(String message, {Duration? duration}) {
    ToastNotification.showWarning(
      this,
      message,
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  void showInfoToast(String message, {Duration? duration}) {
    ToastNotification.showInfo(
      this,
      message,
      duration: duration ?? const Duration(seconds: 3),
    );
  }
}
