import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/providers/location_providers.dart';
import '../../../../core/theme/colors.dart';
import '../../../outlet_mapping/domain/entities/mapping_enums.dart';
import '../../../outlet_mapping/presentation/widgets/mapping_request_card.dart';
import '../../../outlet_mapping/providers/mapping_session_notifier.dart';
import '../../domain/entities/outlet_visit.dart';
import '../../providers/daily_route_providers.dart';
import '../widgets/widgets.dart';

/// Screen shown when agent is clocked in to a visit.
///
/// Shows visit timer, outlet info, and clock-out button.
class ActiveVisitScreen extends ConsumerStatefulWidget {
  final String visitLocalId;

  const ActiveVisitScreen({super.key, required this.visitLocalId});

  @override
  ConsumerState<ActiveVisitScreen> createState() => _ActiveVisitScreenState();
}

class _ActiveVisitScreenState extends ConsumerState<ActiveVisitScreen> {
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
    final visit = _getVisit();
    if (visit?.actualClockIn != null) {
      _elapsed = DateTime.now().difference(visit!.actualClockIn!);
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _elapsed += const Duration(seconds: 1);
      });
    });
  }

  // `widget.visitLocalId` may be either a real, Isar-persisted localId
  // (most callers — visit list/detail screens) or the ephemeral
  // server-id-as-localId that ActiveVisitCard uses when it's sourced from
  // dayStatusPollProvider (see that provider's doc comment: its embedded
  // visits are "ephemeral, not persisted to Isar" and use the server id
  // as a stand-in localId). visitListProvider, by contrast, always comes
  // from todaysRouteProvider's locally-persisted visits with real
  // localIds. The two id spaces don't overlap, so matching on localId
  // alone misses the ActiveVisitCard case entirely ("Visit not found"
  // even while genuinely clocked in) — match on serverId too, since both
  // paths populate it identically from the same backend `id` field.
  OutletVisit? _getVisit() {
    final visits = ref.read(visitListProvider);
    return visits
        .where(
          (v) =>
              v.localId == widget.visitLocalId ||
              v.serverId == widget.visitLocalId,
        )
        .firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    final visits = ref.watch(visitListProvider);
    final visit = visits
        .where(
          (v) =>
              v.localId == widget.visitLocalId ||
              v.serverId == widget.visitLocalId,
        )
        .firstOrNull;

    if (visit == null) {
      return const Scaffold(
        backgroundColor: kBackground,
        body: Center(child: Text('Visit not found')),
      );
    }

    // If visit is no longer in progress, redirect to list
    if (visit.status != VisitStatus.inProgress) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.go('/daily-route/visits');
      });
      return const Scaffold(
        backgroundColor: kBackground,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final clockOutState = ref.watch(clockOutNotifierProvider);

    // No back button and no bottom nav here by design — an active visit is
    // a focused mode you leave by clocking out, matching the mock.
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Active Visit',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 2),
              Text(
                '${visit.outletName} · Clocked in ${_formatTime(visit.actualClockIn!)}',
                style: const TextStyle(fontSize: 12, color: kTextMuted),
              ),
              const SizedBox(height: 16),

              // Duration card — black, matching the redesign's active-visit
              // treatment.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kTextDark,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    const Text(
                      'DURATION',
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.w700,
                        color: Colors.white60,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _formatDuration(_elapsed),
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: kTextLight,
                        fontFeatures: [FontFeature.tabularFigures()],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Clocked in at ${_formatTime(visit.actualClockIn!)}',
                      style: const TextStyle(fontSize: 12, color: Colors.white60),
                    ),
                    if (visit.allocatedMinutes > 0) ...[
                      const SizedBox(height: 10),
                      _buildAllocatedTimeInfo(visit.allocatedMinutes),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 20),

              MappingRequestCard(visit: visit),

              // Error message
              // A GeofenceViolationFailure is excluded here — _clockOut()
              // already shows a full dedicated dialog for it (title,
              // explanation, "End Anyway"/"Cancel"), and clockOutNotifierProvider's
              // state isn't reset after that dialog closes (it's watched
              // here, not consumed once). Without this exclusion, this
              // banner would render *underneath* the dialog and then sit
              // there indefinitely afterward — the same geofence error
              // reported twice, once nicely (the dialog) and once as a raw
              // Failure dump (this banner used .toString() instead of
              // .displayMessage, printing every constructor field verbatim).
              if (clockOutState.hasError &&
                  clockOutState.error is! GeofenceViolationFailure) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kRedColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: kRedColor, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          clockOutState.error is Failure
                              ? (clockOutState.error as Failure).displayMessage
                              : 'Failed to end visit: ${clockOutState.error}',
                          style: const TextStyle(color: kRedColor, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Clock out button
              ClockInButton(
                onPressed: () => _confirmAndClockOut(visit),
                isLoading: clockOutState.isLoading,
                isClockIn: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllocatedTimeInfo(int allocatedMinutes) {
    final elapsedMinutes = _elapsed.inMinutes;
    final isOvertime = elapsedMinutes > allocatedMinutes;
    final color = isOvertime ? const Color(0xFFFFB74D) : Colors.white60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isOvertime ? Icons.warning_amber : Icons.schedule,
          size: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          isOvertime
              ? '${elapsedMinutes - allocatedMinutes} min over allocated time'
              : '$elapsedMinutes of $allocatedMinutes min used',
          style: TextStyle(
            fontSize: 13,
            color: color,
            fontWeight: isOvertime ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  /// Two-step confirmation before ending the visit — clocking out is not
  /// reversible from the app (no "resume visit" flow), so a single tap
  /// shouldn't be enough to trigger it.
  ///
  /// If outlet mapping is still `capturing` for this visit, this defers to
  /// [_confirmClockOutWhileMapping] instead (spec §22/§70) — an explicit
  /// three-way choice rather than a plain confirm, since clocking out here
  /// also has to decide what happens to the in-progress capture.
  Future<void> _confirmAndClockOut(OutletVisit visit) async {
    final mappingState = ref.read(mappingSessionNotifierProvider).session;
    final isMappingThisVisit =
        mappingState != null && mappingState.visitLocalId == visit.localId;
    if (isMappingThisVisit && mappingState.localState == MappingLocalState.capturing) {
      await _confirmClockOutWhileMapping(visit);
      return;
    }

    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('End This Visit?'),
        content: const Text(
          'Clocking out will end this visit now. This action cannot be '
          'undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: kRedColor),
            child: const Text('Clock Out'),
          ),
        ],
      ),
    );

    if (confirm != true || !mounted) return;
    await _clockOut(visit);
  }

  /// Spec §22/§70's explicit three-way choice — never silently leaves
  /// mapping running until a server-side timeout, and never conflates
  /// "finish" (keep the data) with "stop" (discard it).
  Future<void> _confirmClockOutWhileMapping(OutletVisit visit) async {
    final choice = await showDialog<_ClockOutMappingChoice>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Outlet mapping is still in progress'),
        content: const Text(
          'What would you like to do with the mapping capture before clocking out?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(_ClockOutMappingChoice.continueMapping),
            child: const Text('Continue Mapping'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(_ClockOutMappingChoice.finishAndClockOut),
            child: const Text('Finish Mapping & Clock Out'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(_ClockOutMappingChoice.stopAndClockOut),
            style: TextButton.styleFrom(foregroundColor: kRedColor),
            child: const Text('Stop Mapping & Clock Out'),
          ),
        ],
      ),
    );

    if (!mounted || choice == null || choice == _ClockOutMappingChoice.continueMapping) return;

    if (choice == _ClockOutMappingChoice.finishAndClockOut) {
      await ref.read(mappingSessionNotifierProvider.notifier).finishMappingForClockOut();
    } else {
      await ref.read(mappingSessionNotifierProvider.notifier).stopMappingForClockOut();
    }
    if (!mounted) return;
    await _clockOut(visit);
  }

  Future<void> _clockOut(OutletVisit visit, {bool force = false}) async {
    final locationService = ref.read(locationServiceProvider);
    final location = await locationService.getCurrentLocation();

    final result = await ref
        .read(clockOutNotifierProvider.notifier)
        .clockOut(
          visitLocalId: visit.localId,
          latitude: location.latitude,
          longitude: location.longitude,
          accuracyMeters: location.accuracy,
          forceClockOut: force,
        );

    if (!mounted) return;

    if (result.hasValue && result.value != null) {
      context.go(
        '/daily-route/visit/${visit.localId}/complete',
        extra: {
          'outletName': visit.outletName,
          'duration': _formatDuration(_elapsed),
        },
      );
      return;
    }

    if (result.hasError) {
      final error = result.error;
      if (error is GeofenceViolationFailure) {
        await _showGeofenceViolationDialog(visit, error);
        return;
      }

      final message = error is Failure
          ? error.displayMessage
          : 'Failed to end visit: $error';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: kRedColor),
      );
    }
  }

  Future<void> _showGeofenceViolationDialog(
    OutletVisit visit,
    GeofenceViolationFailure failure,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Outside Outlet Radius'),
        content: Text(
          '${failure.displayMessage}\n\n'
          'You can still end this visit, but it will be flagged as an '
          'out-of-geofence clock-out.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('End Anyway'),
          ),
        ],
      ),
    );

    if (!mounted) return;
    if (confirm == true) {
      await _clockOut(visit, force: true);
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String _formatTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$hour12:$minute $period';
  }
}

enum _ClockOutMappingChoice { continueMapping, finishAndClockOut, stopAndClockOut }
