import 'package:flutter/material.dart';

/// Loading overlay that can be shown anywhere in the app
class LoadingOverlay {
  static OverlayEntry? _currentOverlay;

  /// Show loading overlay
  static void show(BuildContext context, {String? message}) {
    hide(); // Hide any existing overlay

    _currentOverlay = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black54,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_currentOverlay!);
  }

  /// Hide loading overlay
  static void hide() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}

/// Extension method for easier access from context
extension LoadingOverlayExtension on BuildContext {
  void showLoading({String? message}) {
    LoadingOverlay.show(this, message: message);
  }

  void hideLoading() {
    LoadingOverlay.hide();
  }
}
