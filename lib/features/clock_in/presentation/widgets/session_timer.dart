import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Animated timer display showing elapsed/remaining time
class SessionTimer extends StatefulWidget {
  final DateTime startTime;
  final int allocatedMinutes;
  final bool showRemaining;

  const SessionTimer({
    super.key,
    required this.startTime,
    required this.allocatedMinutes,
    this.showRemaining = true,
  });

  @override
  State<SessionTimer> createState() => _SessionTimerState();
}

class _SessionTimerState extends State<SessionTimer> {
  late Timer _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateElapsed();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateElapsed(),
    );
  }

  void _updateElapsed() {
    setState(() {
      _elapsed = DateTime.now().difference(widget.startTime);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allocated = Duration(minutes: widget.allocatedMinutes);
    final remaining = allocated - _elapsed;
    final isOvertime = remaining.isNegative;
    final displayDuration = isOvertime ? _elapsed - allocated : remaining;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Elapsed time
        _TimerDisplay(
          label: 'Elapsed',
          duration: _elapsed,
          color: kTextDark,
          isLarge: !widget.showRemaining,
        ),
        if (widget.showRemaining) ...[
          const SizedBox(height: 16),
          // Remaining/Overtime
          _TimerDisplay(
            label: isOvertime ? 'Overtime' : 'Remaining',
            duration: displayDuration.abs(),
            color: isOvertime ? kRedColor : kSecondaryColor,
            isLarge: true,
            showWarning: isOvertime,
          ),
        ],
        const SizedBox(height: 8),
        // Progress indicator
        _ProgressBar(
          progress: (_elapsed.inSeconds / allocated.inSeconds).clamp(0.0, 1.0),
          isOvertime: isOvertime,
        ),
      ],
    );
  }
}

class _TimerDisplay extends StatelessWidget {
  final String label;
  final Duration duration;
  final Color color;
  final bool isLarge;
  final bool showWarning;

  const _TimerDisplay({
    required this.label,
    required this.duration,
    required this.color,
    this.isLarge = false,
    this.showWarning = false,
  });

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showWarning) ...[
              Icon(Icons.warning_amber_rounded, color: color, size: 20),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                color: color.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          _formatDuration(duration),
          style: TextStyle(
            color: color,
            fontSize: isLarge ? 48 : 32,
            fontWeight: FontWeight.bold,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final double progress;
  final bool isOvertime;

  const _ProgressBar({required this.progress, required this.isOvertime});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            color: isOvertime ? kRedColor : kSecondaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

/// Compact timer for list items
class CompactTimer extends StatelessWidget {
  final DateTime startTime;
  final DateTime? endTime;

  const CompactTimer({super.key, required this.startTime, this.endTime});

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    final duration = (endTime ?? DateTime.now()).difference(startTime);
    return Text(
      _formatDuration(duration),
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    );
  }
}
