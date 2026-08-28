import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Displays an error message banner
class ErrorBanner extends StatelessWidget {
  final String message;

  const ErrorBanner({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kRedColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kRedColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: kRedColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message, style: const TextStyle(color: kRedColor)),
          ),
        ],
      ),
    );
  }
}
