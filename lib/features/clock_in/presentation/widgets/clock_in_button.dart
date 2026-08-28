import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Large circular clock-in button with pulsing animation
class ClockInButton extends StatefulWidget {
  final bool isEnabled;
  final bool isLoading;
  final VoidCallback? onPressed;
  final String label;

  const ClockInButton({
    super.key,
    this.isEnabled = true,
    this.isLoading = false,
    this.onPressed,
    this.label = 'CLOCK IN',
  });

  @override
  State<ClockInButton> createState() => _ClockInButtonState();
}

class _ClockInButtonState extends State<ClockInButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    if (widget.isEnabled && !widget.isLoading) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(ClockInButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isEnabled && !widget.isLoading) {
      _pulseController.repeat(reverse: true);
    } else {
      _pulseController.stop();
      _pulseController.reset();
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.isEnabled && !widget.isLoading
              ? _pulseAnimation.value
              : 1.0,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: widget.isEnabled && !widget.isLoading ? widget.onPressed : null,
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.isEnabled
                  ? [kSecondaryColor, kSecondaryColor.withOpacity(0.8)]
                  : [Colors.grey.shade400, Colors.grey.shade500],
            ),
            boxShadow: widget.isEnabled
                ? [
                    BoxShadow(
                      color: kSecondaryColor.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: widget.isLoading
                ? const CircularProgressIndicator(
                    color: kTextLight,
                    strokeWidth: 3,
                  )
                : Text(
                    widget.label,
                    style: const TextStyle(
                      color: kTextLight,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

/// Clock-out button variant (red themed)
class ClockOutButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;

  const ClockOutButton({super.key, this.isLoading = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kRedColor, kRedColor.withOpacity(0.8)],
          ),
          boxShadow: [
            BoxShadow(
              color: kRedColor.withOpacity(0.4),
              blurRadius: 16,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: kTextLight,
                  strokeWidth: 3,
                )
              : const Text(
                  'CLOCK OUT',
                  style: TextStyle(
                    color: kTextLight,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
        ),
      ),
    );
  }
}
