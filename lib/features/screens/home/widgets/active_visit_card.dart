import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../daily_route/daily_route.dart';

/// Home screen card shown when the rep is clocked into an outlet: a solid
/// black rounded card with a live duration ticker and a "Continue Visit"
/// CTA, matching the redesign's "active visit" treatment.
class ActiveVisitCard extends ConsumerStatefulWidget {
  const ActiveVisitCard({super.key});

  @override
  ConsumerState<ActiveVisitCard> createState() => _ActiveVisitCardState();
}

class _ActiveVisitCardState extends ConsumerState<ActiveVisitCard> {
  Timer? _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _updateElapsed();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateElapsed();
    });
  }

  void _updateElapsed() {
    final visit = ref.read(activeVisitProvider);
    if (visit?.actualClockIn != null) {
      setState(() {
        _elapsed = DateTime.now().difference(visit!.actualClockIn!);
      });
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  String _formatTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    final visit = ref.watch(activeVisitProvider);
    if (visit == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => context.push('/daily-route/visit/${visit.localId}/active'),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: kTextDark,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ACTIVE VISIT · ${_formatDuration(_elapsed)}',
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.6,
                fontWeight: FontWeight.w700,
                color: kSecondaryLightColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              visit.outletName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: kTextLight,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            if (visit.actualClockIn != null)
              Text(
                'Clocked in ${_formatTime(visit.actualClockIn!)}',
                style: const TextStyle(fontSize: 12, color: Colors.white60),
              ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 13),
              decoration: BoxDecoration(
                color: kTextLight,
                borderRadius: BorderRadius.circular(999),
              ),
              child: const Text(
                'Continue Visit →',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
