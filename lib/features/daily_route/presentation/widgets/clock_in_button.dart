import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Button for clocking in/out with loading and disabled states.
/// Clock-in uses the redesign's black pill primary style; clock-out uses
/// the outlined secondary pill (a lower-emphasis "leaving" action).
class ClockInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isClockIn;
  final bool isEnabled;
  final String? customLabel;

  const ClockInButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.isClockIn = true,
    this.isEnabled = true,
    this.customLabel,
  });

  @override
  Widget build(BuildContext context) {
    final label = customLabel ?? (isClockIn ? 'Clock In' : 'Clock Out');
    final active = isEnabled && !isLoading;

    if (isClockIn) {
      return ElevatedButton(
        onPressed: active ? onPressed : null,
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: kTextLight,
                ),
              )
            : Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
      );
    }

    return OutlinedButton(
      onPressed: active ? onPressed : null,
      child: isLoading
          ? const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            )
          : Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}

/// Secondary action button (skip, request override, etc.) — an outlined
/// pill matching [SecondaryButton], with optional accent color override for
/// warning-toned actions like "Request Override".
class SecondaryActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData icon;
  final bool isLoading;
  final Color? color;

  const SecondaryActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.isLoading = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? kTextDark;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: buttonColor,
          side: BorderSide(color: buttonColor.withValues(alpha: 0.4)),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(buttonColor),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 18),
                  const SizedBox(width: 8),
                  Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
      ),
    );
  }
}
