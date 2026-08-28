import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/outlet_visit.dart';
import '../../domain/repositories/daily_route_repository.dart';
import '../../providers/daily_route_providers.dart';
import '../widgets/widgets.dart';

/// Screen for closing the daily route.
///
/// Shows summary of completed/skipped visits and close confirmation.
class RouteCloseScreen extends ConsumerStatefulWidget {
  const RouteCloseScreen({super.key});

  @override
  ConsumerState<RouteCloseScreen> createState() => _RouteCloseScreenState();
}

class _RouteCloseScreenState extends ConsumerState<RouteCloseScreen> {
  List<BulkSkipResult>? _skipResults;
  bool _isEndingVisit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get skip results from route extra data
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    if (extra != null && extra['skipResults'] != null) {
      _skipResults = extra['skipResults'] as List<BulkSkipResult>;
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeAsync = ref.watch(routeToCloseProvider);
    final closeState = ref.watch(routeCloseNotifierProvider);

    const textColor = kTextDark;
    const mutedColor = kTextMuted;
    const successColor = kSuccessColor;
    const warningColor = kWarningText;
    const errorColor = kRedColor;
    const warningBgColor = kWarningBg;

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteBackHeader(title: 'Close Route', onBack: () => context.pop()),
            Expanded(
              child: routeAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(child: Text('Error: $error')),
                data: (routeWithVisits) {
                  if (routeWithVisits == null) {
                    return const Center(child: Text('No route found'));
                  }

          final route = routeWithVisits.route;
          final visits = routeWithVisits.sortedVisits;
          final completed = routeWithVisits.completedVisits;
          final skipped = routeWithVisits.skippedVisits;
          final pending = routeWithVisits.pendingVisits;
          final activeVisit = routeWithVisits.activeVisit;
          final hasActiveVisit = activeVisit != null;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Route summary card
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Route Summary',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Progress indicator
                      RouteProgressIndicator(
                        progress: routeWithVisits.progressPercentage,
                        completed: completed.length,
                        total: visits.length,
                        size: 100,
                      ),
                      const SizedBox(height: 16),
                      // Stats
                      _buildStatRow(
                        'Completed',
                        '${completed.length}',
                        successColor,
                        mutedColor: mutedColor,
                      ),
                      _buildStatRow(
                        'Skipped',
                        '${skipped.length}',
                        warningColor,
                        mutedColor: mutedColor,
                      ),
                      if (pending.isNotEmpty)
                        _buildStatRow(
                          'Pending',
                          '${pending.length}',
                          mutedColor,
                          mutedColor: mutedColor,
                        ),
                      const Divider(height: 24, color: kBackground),
                      _buildStatRow(
                        'Total visits',
                        '${visits.length}',
                        textColor,
                        bold: true,
                        mutedColor: mutedColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Time summary
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Time Summary',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (route.activatedAt != null)
                        _buildTimeRow(
                          'Started',
                          _formatDateTime(route.activatedAt!),
                          mutedColor: mutedColor,
                          textColor: textColor,
                        ),
                      if (route.firstClockInAt != null)
                        _buildTimeRow(
                          'First clock-in',
                          _formatDateTime(route.firstClockInAt!),
                          mutedColor: mutedColor,
                          textColor: textColor,
                        ),
                      if (route.lastClockOutAt != null)
                        _buildTimeRow(
                          'Last clock-out',
                          _formatDateTime(route.lastClockOutAt!),
                          mutedColor: mutedColor,
                          textColor: textColor,
                        ),
                      if (route.activatedAt != null) ...[
                        const Divider(height: 24, color: kBackground),
                        _buildTimeRow(
                          'Total duration',
                          _formatDuration(
                            DateTime.now().difference(route.activatedAt!),
                          ),
                          bold: true,
                          mutedColor: mutedColor,
                          textColor: textColor,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Error if active visit (must end first)
                if (hasActiveVisit) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: errorColor.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: errorColor.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: errorColor,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Visit In Progress',
                                    style: TextStyle(
                                      color: errorColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'You need to end the visit at ${activeVisit.outletName} before closing the route.',
                                    style: TextStyle(
                                      color: textColor.withValues(alpha: 0.7),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _isEndingVisit
                                ? null
                                : () => _endActiveVisit(
                                    context,
                                    ref,
                                    activeVisit.localId,
                                  ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: errorColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: _isEndingVisit
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : const Icon(Icons.stop_circle_outlined),
                            label: Text(
                              _isEndingVisit
                                  ? 'Ending Visit...'
                                  : 'End Visit Now',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                // Warning if pending visits - need skip reasons
                if (pending.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: warningBgColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: warningColor.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.warning_amber,
                              color: warningColor,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${pending.length} Pending Visit(s)',
                                    style: TextStyle(
                                      color: warningColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _skipResults != null &&
                                            _skipResults!.length ==
                                                pending.length
                                        ? 'Skip reasons provided - ready to close'
                                        : 'Skip reasons required before closing',
                                    style: TextStyle(
                                      color: textColor.withValues(alpha: 0.7),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Show pending visits list
                        ...pending.map((visit) {
                          final hasReason =
                              _skipResults?.any(
                                (r) => r.visitLocalId == visit.localId,
                              ) ??
                              false;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Icon(
                                  hasReason
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color: hasReason ? successColor : mutedColor,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    visit.outletName,
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () =>
                                _showSkipReasonsDialog(context, pending),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: warningColor,
                              side: BorderSide(color: warningColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: Icon(
                              _skipResults != null &&
                                      _skipResults!.length == pending.length
                                  ? Icons.edit
                                  : Icons.add_comment,
                            ),
                            label: Text(
                              _skipResults != null &&
                                      _skipResults!.length == pending.length
                                  ? 'Edit Skip Reasons'
                                  : 'Add Skip Reasons',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                // Error message
                if (closeState.hasError) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: errorColor.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error_outline, color: errorColor, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            closeState.error.toString(),
                            style: TextStyle(color: errorColor, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Close button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: Builder(
                    builder: (context) {
                      // Check if we can close: no active visit, and all pending visits have skip reasons
                      final hasPendingWithoutReasons =
                          pending.isNotEmpty &&
                          (_skipResults == null ||
                              _skipResults!.length < pending.length);
                      final canClose =
                          !hasActiveVisit && !hasPendingWithoutReasons;

                      return ElevatedButton(
                        onPressed: closeState.isLoading || !canClose
                            ? null
                            : () => _closeRoute(context, ref, route.localId),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kSuccessColor,
                          foregroundColor: kTextLight,
                          disabledBackgroundColor: Colors.grey.shade300,
                          disabledForegroundColor: Colors.grey.shade600,
                          shape: const StadiumBorder(),
                        ),
                        child: closeState.isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    kTextLight,
                                  ),
                                ),
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.check_circle_outline, size: 24),
                                  SizedBox(width: 8),
                                  Text(
                                    'Close Route',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),

                // Cancel button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      'Continue Working',
                      style: TextStyle(fontSize: 16, color: mutedColor),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(
    String label,
    String value,
    Color color, {
    bool bold = false,
    required Color mutedColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: mutedColor,
              fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: bold ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow(
    String label,
    String value, {
    bool bold = false,
    required Color mutedColor,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: mutedColor,
              fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
              fontWeight: bold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _closeRoute(
    BuildContext context,
    WidgetRef ref,
    String routeLocalId,
  ) async {
    // Convert skip results to SkipVisitParams if any
    List<SkipVisitParams>? skippedVisits;
    if (_skipResults != null && _skipResults!.isNotEmpty) {
      skippedVisits = _skipResults!
          .map(
            (r) => SkipVisitParams(
              visitLocalId: r.visitLocalId,
              skipReasonId: r.reasonId,
              skipNotes: r.notes,
            ),
          )
          .toList();
    }

    await ref
        .read(routeCloseNotifierProvider.notifier)
        .close(routeLocalId: routeLocalId, skippedVisits: skippedVisits);

    // Check result
    final state = ref.read(routeCloseNotifierProvider);
    if (state.hasValue && state.value != null && context.mounted) {
      // Show success and go to home
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Route closed successfully!'),
          backgroundColor: Color(0xFF2E7D32),
        ),
      );
      context.go('/home');
    }
  }

  Future<void> _endActiveVisit(
    BuildContext context,
    WidgetRef ref,
    String visitLocalId,
  ) async {
    setState(() => _isEndingVisit = true);

    try {
      // Get current location for clock-out
      Position? position;
      try {
        position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            timeLimit: Duration(seconds: 10),
          ),
        );
      } catch (_) {
        // If location fails, use a default (will be force clock out anyway)
        position = null;
      }

      // Clock out with force flag (for abandoned visits from previous days)
      final result = await ref
          .read(clockOutNotifierProvider.notifier)
          .clockOut(
            visitLocalId: visitLocalId,
            latitude: position?.latitude ?? 0.0,
            longitude: position?.longitude ?? 0.0,
            accuracyMeters: position?.accuracy ?? 999.0,
            notes: 'Force ended from route close screen',
            forceClockOut: true,
          );

      if (context.mounted) {
        if (result.hasError) {
          final error = result.error;
          final message = error is Failure
              ? error.displayMessage
              : 'Error ending visit: $error';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message), backgroundColor: Colors.red),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Visit ended successfully'),
              backgroundColor: Color(0xFF2E7D32),
            ),
          );
          // Refresh the route data
          ref.invalidate(routeToCloseProvider);
        }
      }
    } finally {
      if (mounted) {
        setState(() => _isEndingVisit = false);
      }
    }
  }

  Future<void> _showSkipReasonsDialog(
    BuildContext context,
    List<OutletVisit> pendingVisits,
  ) async {
    final bulkVisits = pendingVisits
        .map(
          (v) => BulkSkipVisit(
            localId: v.localId,
            outletName: v.outletName,
            outletCode: v.outletCode,
          ),
        )
        .toList();

    final results = await BulkSkipReasonsDialog.show(
      context,
      visits: bulkVisits,
    );

    if (results != null && mounted) {
      setState(() {
        _skipResults = results;
      });
    }
  }

  String _formatDateTime(DateTime dt) {
    final hour = dt.hour;
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$hour12:$minute $period';
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }
}
