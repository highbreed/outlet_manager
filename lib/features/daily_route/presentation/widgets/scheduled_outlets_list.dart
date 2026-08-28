import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../../domain/entities/day_status.dart';

/// Preview list of today's scheduled stops, shown pre-activation (no
/// `OutletVisit` record exists yet — those are only created on activation).
/// Backed by `scheduled_stops` from the day-status endpoint.
///
/// When [maxVisible] is set and there are more stops than that, only the
/// first [maxVisible] render, followed by a "+N more" row that hands off to
/// [onViewAll] instead of listing everything inline — used on Home, where a
/// rep with a long route shouldn't push the rest of the page down. Leave
/// [maxVisible] `null` (the default) to always show the full list, as on
/// the route activation screen.
class ScheduledOutletsCard extends StatelessWidget {
  final List<ScheduledStop> stops;
  final int? maxVisible;
  final VoidCallback? onViewAll;

  const ScheduledOutletsCard({
    super.key,
    required this.stops,
    this.maxVisible,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final sorted = [...stops]
      ..sort((a, b) => a.visitOrder.compareTo(b.visitOrder));
    final cap = maxVisible;
    final overflow = (cap != null && sorted.length > cap)
        ? sorted.length - cap
        : 0;
    final visible = overflow > 0 ? sorted.take(cap!).toList() : sorted;

    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12, bottom: 2),
            child: Text(
              'SCHEDULED OUTLETS',
              style: TextStyle(
                fontSize: 11,
                color: kTextFaint,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          for (var i = 0; i < visible.length; i++)
            _ScheduledOutletRow(
              stop: visible[i],
              isLast: i == visible.length - 1 && overflow == 0,
            ),
          if (overflow > 0) _MoreOutletsRow(count: overflow, onTap: onViewAll),
        ],
      ),
    );
  }
}

class _ScheduledOutletRow extends StatelessWidget {
  final ScheduledStop stop;
  final bool isLast;

  const _ScheduledOutletRow({required this.stop, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: kBorderColor)),
      ),
      child: Row(
        children: [
          Text(
            stop.visitOrder.toString().padLeft(2, '0'),
            style: const TextStyle(fontSize: 12, color: kTextFaint),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              stop.outletName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          if (formatScheduledClockTime(stop.scheduledClockIn) case final time?) ...[
            const SizedBox(width: 8),
            Text(time, style: const TextStyle(fontSize: 12, color: kTextMuted)),
          ],
        ],
      ),
    );
  }
}

class _MoreOutletsRow extends StatelessWidget {
  final int count;
  final VoidCallback? onTap;

  const _MoreOutletsRow({required this.count, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '+$count more outlet${count == 1 ? '' : 's'}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward, color: kSecondaryColor, size: 16),
          ],
        ),
      ),
    );
  }
}

/// Formats a `"HH:MM:SS"` (24h) time-of-day string from the day-status
/// endpoint into `"h:mm AM/PM"`. Falls back to the raw string if it doesn't
/// parse — defensive, not an error condition worth swallowing silently.
String? formatScheduledClockTime(String? raw) {
  if (raw == null) return null;
  final parts = raw.split(':');
  if (parts.length < 2) return raw;
  final hour = int.tryParse(parts[0]);
  final minute = int.tryParse(parts[1]);
  if (hour == null || minute == null) return raw;
  final period = hour >= 12 ? 'PM' : 'AM';
  final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
  return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
}
