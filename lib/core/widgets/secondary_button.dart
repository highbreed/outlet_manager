import 'package:flutter/material.dart';

/// The redesign's secondary action: an outlined pill button (gray hairline
/// border, black text/icon) — used alongside [PrimaryButton] for
/// lower-emphasis actions like "Clock Out" or "Cancel".
class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? leadingIcon;
  final bool expand;

  /// Overrides for dark/non-default backgrounds (e.g. the outlet-mapping
  /// capture screen's solid black scaffold) — the theme default is black
  /// text/icon on a light background, invisible there otherwise. Left
  /// null everywhere else, so every existing usage is unchanged.
  final Color? foregroundColor;
  final Color? borderColor;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.expand = true,
    this.foregroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      onPressed: onPressed,
      style: (foregroundColor != null || borderColor != null)
          ? OutlinedButton.styleFrom(
              foregroundColor: foregroundColor,
              side: borderColor != null ? BorderSide(color: borderColor!) : null,
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 18),
            const SizedBox(width: 8),
          ],
          Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
