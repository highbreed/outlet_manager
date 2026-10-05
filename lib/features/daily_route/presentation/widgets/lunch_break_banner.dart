import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/providers/location_providers.dart';
import '../../../../core/providers/notification_providers.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/lunch_break.dart';
import '../../providers/daily_route_providers.dart';

/// "Today's Route" screen's lunch-break control: a Start-lunch card while
/// [LunchBreakState.available], a live countdown while
/// [LunchBreakState.onBreak], or a "lunch taken" summary once
/// [LunchBreakState.used] — nothing for [LunchBreakState.unavailable] or
/// while day-status hasn't loaded yet.
///
/// Purely a display/request surface over [lunchBreakProvider]: every
/// branch below reads live server state and nothing here ever decides on
/// its own that a break started, ended, or how long it ran — see
/// [LunchBreakNotifier]'s doc comment for the reconciliation this relies
/// on.
class LunchBreakBanner extends ConsumerWidget {
  const LunchBreakBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lunchBreak = ref.watch(lunchBreakProvider);
    if (lunchBreak == null || lunchBreak.state == LunchBreakState.unavailable) {
      return const SizedBox.shrink();
    }

    final card = switch (lunchBreak.state) {
      LunchBreakState.available => _AvailableCard(lunchBreak: lunchBreak),
      LunchBreakState.onBreak => _OnBreakCard(lunchBreak: lunchBreak),
      LunchBreakState.used => _UsedCard(lunchBreak: lunchBreak),
      LunchBreakState.unavailable => const SizedBox.shrink(),
    };

    // Top-only padding, self-contained: callers can drop this straight
    // into a list with no surrounding spacing boilerplate. Collapses to
    // zero size (no stray gap) whenever there's nothing to show, and
    // whatever comes after this already brings its own leading gap.
    return Padding(padding: const EdgeInsets.only(top: 12), child: card);
  }
}

/// Small tinted icon tile shared across the three card states.
class _LunchIconTile extends StatelessWidget {
  final IconData icon;
  final Color background;
  final Color foreground;

  const _LunchIconTile({
    required this.icon,
    this.background = kSecondaryLightColor,
    this.foreground = kSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, color: foreground, size: 22),
    );
  }
}

/// [time] is always the correct absolute instant (parseBackendTimestamp
/// converts to UTC internally) — that's required for the countdown/
/// duration math elsewhere in this file (`endsAt.difference(DateTime.now())`
/// etc.), which must stay instant-correct. Display is a separate concern:
/// reading `.hour`/`.minute` straight off that UTC instant showed the UTC
/// wall clock (e.g. 09:13 for a 12:13 EAT lunch), 3 hours off — confirmed
/// field report. `.toLocal()` isn't the fix either, since it depends on the
/// device's own timezone setting, not Kenya's. This app only ever operates
/// in Africa/Nairobi, which has no DST, so the fixed +3 offset is applied
/// explicitly here, independent of device locale, for display only.
String _formatTime(DateTime time) {
  final nairobiTime = time.toUtc().add(const Duration(hours: 3));
  final hour = nairobiTime.hour;
  final minute = nairobiTime.minute.toString().padLeft(2, '0');
  final period = hour >= 12 ? 'PM' : 'AM';
  final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
  return '$hour12:$minute $period';
}

class _AvailableCard extends ConsumerWidget {
  final LunchBreak lunchBreak;

  const _AvailableCard({required this.lunchBreak});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(lunchBreakNotifierProvider).isLoading;

    return AppCard(
      child: Row(
        children: [
          const _LunchIconTile(icon: Icons.restaurant_rounded),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lunch break',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(height: 2),
                Text(
                  '${lunchBreak.allowedMinutes} min available today',
                  style: const TextStyle(color: kTextMuted, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SecondaryButton(
            label: 'Start',
            expand: false,
            leadingIcon: Icons.play_arrow_rounded,
            onPressed: isLoading ? null : () => _confirmAndStart(context, ref),
          ),
        ],
      ),
    );
  }

  /// Two deliberate steps — a stray/accidental tap here burns the one
  /// lunch break the agent gets for the whole day, so a single dialog
  /// isn't enough of a gate. Step 1 states the consequence in plain
  /// terms before anything is committed; step 2 is the final go/no-go.
  Future<void> _confirmAndStart(BuildContext context, WidgetRef ref) async {
    final acknowledged = await context.showConfirmDialog(
      title: 'Before you start lunch',
      message:
          "You can only take one lunch break per day, and it can't be "
          'undone once started — the countdown keeps running even if you '
          'close the app. Only continue if you\'re ready to go on break '
          'right now.',
      confirmText: 'Continue',
    );
    if (!acknowledged) return;
    if (!context.mounted) return;

    final confirmed = await context.showConfirmDialog(
      title: 'Start lunch break?',
      message:
          'Start your ${lunchBreak.allowedMinutes}-minute lunch break now?',
      confirmText: 'Start lunch',
    );
    if (!confirmed) return;
    if (!context.mounted) return;

    final position = await _resolveBestEffortLocation(ref);

    await ref
        .read(lunchBreakNotifierProvider.notifier)
        .start(
          latitude: position?.latitude,
          longitude: position?.longitude,
          accuracyMeters: position?.accuracy,
        );

    if (!context.mounted) return;
    final result = ref.read(lunchBreakNotifierProvider);
    if (result.hasError) {
      ToastNotification.showError(
        context,
        (result.error as Failure).displayMessage,
      );
    }
  }

  /// Never blocks Start on GPS: tries the near-instant last-known fix
  /// first, and only falls back to a short bounded live fetch if there
  /// isn't one. Any permission/service/timeout failure is swallowed —
  /// location is optional audit data per the contract, never a
  /// precondition for starting lunch.
  Future<({double latitude, double longitude, double accuracy})?>
  _resolveBestEffortLocation(WidgetRef ref) async {
    try {
      final last = await Geolocator.getLastKnownPosition();
      if (last != null) {
        return (
          latitude: last.latitude,
          longitude: last.longitude,
          accuracy: last.accuracy,
        );
      }
    } catch (_) {}

    try {
      final location = await ref
          .read(locationServiceProvider)
          .getCurrentLocation(timeout: const Duration(seconds: 2));
      return (
        latitude: location.latitude,
        longitude: location.longitude,
        accuracy: location.accuracy,
      );
    } catch (_) {
      return null;
    }
  }
}

class _OnBreakCard extends ConsumerStatefulWidget {
  final LunchBreak lunchBreak;

  const _OnBreakCard({required this.lunchBreak});

  @override
  ConsumerState<_OnBreakCard> createState() => _OnBreakCardState();
}

class _OnBreakCardState extends ConsumerState<_OnBreakCard> {
  Timer? _timer;
  Duration _remaining = Duration.zero;
  bool _handledExpiry = false;

  @override
  void initState() {
    super.initState();
    _tick();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  @override
  void didUpdateWidget(covariant _OnBreakCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lunchBreak.endsAt != widget.lunchBreak.endsAt) {
      _handledExpiry = false;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Always recomputed from the server's [LunchBreak.endsAt] — never a
  /// locally decremented counter — so this is automatically correct after
  /// any background/foreground gap with no lifecycle-observer wiring.
  void _tick() {
    final endsAt = widget.lunchBreak.endsAt;
    if (endsAt == null || !mounted) return;

    final remaining = endsAt.difference(DateTime.now());
    setState(() => _remaining = remaining.isNegative ? Duration.zero : remaining);

    if (remaining <= Duration.zero && !_handledExpiry) {
      _handledExpiry = true;
      _timer?.cancel();
      unawaited(_handleExpiry(endsAt));
    }
  }

  /// Reconciles with the server instead of assuming local timer math is
  /// correct, then — only if the reconciled state confirms a natural
  /// `expired` end within a short freshness window — fires the
  /// foreground-only nudge. Never fires for a manual end (the agent beat
  /// the buzzer) or a route-closed end (there's no outlet to return to).
  Future<void> _handleExpiry(DateTime endsAt) async {
    ref.invalidate(dayStatusPollProvider);
    try {
      final reconciled = await ref.read(dayStatusPollProvider.future);
      final overdue = DateTime.now().difference(endsAt);
      if (reconciled.lunchBreak.endReason == LunchBreakEndReason.expired &&
          overdue >= Duration.zero &&
          overdue <= const Duration(seconds: 60)) {
        await ref.read(notificationServiceProvider).showLunchOver();
      }
    } catch (_) {
      // Best-effort — the next ambient poll will reconcile regardless.
    }
  }

  @override
  Widget build(BuildContext context) {
    final lunchBreak = widget.lunchBreak;
    final isLoading = ref.watch(lunchBreakNotifierProvider).isLoading;
    final endsAt = lunchBreak.endsAt;
    final startedAt = lunchBreak.startedAt;

    final totalSeconds = (endsAt != null && startedAt != null)
        ? endsAt.difference(startedAt).inSeconds
        : null;
    final progress = (totalSeconds != null && totalSeconds > 0)
        ? (1 - (_remaining.inSeconds / totalSeconds)).clamp(0.0, 1.0)
        : null;

    return AppCard(
      borderColor: kSecondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              Icon(Icons.restaurant_rounded, color: kSecondaryColor, size: 20),
              SizedBox(width: 8),
              Text(
                'On lunch break',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              _formatCountdown(_remaining),
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: kTextDark,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
          ),
          if (endsAt != null) ...[
            const SizedBox(height: 4),
            Center(
              child: Text(
                'Back by ${_formatTime(endsAt)}',
                style: const TextStyle(color: kTextMuted, fontSize: 13),
              ),
            ),
          ],
          const SizedBox(height: 14),
          if (progress != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: kSecondaryLightColor,
                valueColor: const AlwaysStoppedAnimation(kSecondaryColor),
              ),
            ),
          const SizedBox(height: 16),
          SecondaryButton(
            label: 'End lunch',
            leadingIcon: Icons.stop_circle_outlined,
            onPressed: isLoading ? null : _end,
          ),
        ],
      ),
    );
  }

  /// Two deliberate steps, mirroring Start — ending early is just as
  /// one-shot as starting (today's break is used up either way, so an
  /// accidental tap here loses whatever time was left with no way back).
  Future<void> _end() async {
    final acknowledged = await context.showConfirmDialog(
      title: 'Before you end lunch',
      message:
          "Ending now uses up today's lunch break — you won't be able to "
          "start another one later, even though you still have "
          "${_formatCountdown(_remaining)} left.",
      confirmText: 'Continue',
    );
    if (!acknowledged) return;
    if (!mounted) return;

    final confirmed = await context.showConfirmDialog(
      title: 'End lunch break?',
      message: "You'll be marked back on duty immediately.",
      confirmText: 'End lunch',
    );
    if (!confirmed) return;
    if (!mounted) return;

    await ref.read(lunchBreakNotifierProvider.notifier).end();
    if (!mounted) return;
    final result = ref.read(lunchBreakNotifierProvider);
    if (result.hasError) {
      ToastNotification.showError(
        context,
        (result.error as Failure).displayMessage,
      );
    }
  }

  String _formatCountdown(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes % 60;
    final seconds = d.inSeconds % 60;
    final mm = minutes.toString().padLeft(2, '0');
    final ss = seconds.toString().padLeft(2, '0');
    return hours > 0 ? '$hours:$mm:$ss' : '$mm:$ss';
  }
}

class _UsedCard extends StatelessWidget {
  final LunchBreak lunchBreak;

  const _UsedCard({required this.lunchBreak});

  @override
  Widget build(BuildContext context) {
    final startedAt = lunchBreak.startedAt;
    final returnedAt = lunchBreak.returnedAt;
    final endsAt = lunchBreak.endsAt;

    String subtitle;
    if (lunchBreak.endReason == LunchBreakEndReason.routeClosed) {
      // No outlet to return to once the day is closed — don't imply there
      // is one with a time-range readout.
      subtitle = 'Route closed';
    } else if (startedAt != null && returnedAt != null) {
      final endedEarly =
          lunchBreak.endReason == LunchBreakEndReason.manual &&
          endsAt != null &&
          returnedAt.isBefore(endsAt);
      subtitle =
          '${_formatTime(startedAt)} – ${_formatTime(returnedAt)}'
          '${endedEarly ? '  •  Ended early' : ''}';
    } else {
      subtitle = 'Today';
    }

    return AppCard(
      child: Row(
        children: [
          _LunchIconTile(
            icon: Icons.check_circle_rounded,
            background: kBackground,
            foreground: kTextMuted,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lunch taken',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: kTextMuted, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
