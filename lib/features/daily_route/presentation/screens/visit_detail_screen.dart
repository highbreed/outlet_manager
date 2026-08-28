import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/providers/location_providers.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/geofence_override_request.dart';
import '../../domain/entities/outlet_visit.dart';
import '../../providers/daily_route_providers.dart';
import '../widgets/widgets.dart';

/// Screen for viewing a pending visit and clocking in.
class VisitDetailScreen extends ConsumerStatefulWidget {
  final String visitLocalId;

  const VisitDetailScreen({super.key, required this.visitLocalId});

  @override
  ConsumerState<VisitDetailScreen> createState() => _VisitDetailScreenState();
}

class _VisitDetailScreenState extends ConsumerState<VisitDetailScreen> {
  Timer? _locationTimer;
  double? _currentDistance;
  double? _currentAccuracy;
  bool _isLoadingLocation = true;
  String? _locationError;

  @override
  void initState() {
    super.initState();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    _locationTimer?.cancel();
    super.dispose();
  }

  void _startLocationUpdates() {
    _updateLocation();
    // Update location every 3 seconds
    _locationTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      _updateLocation();
    });
  }

  Future<void> _updateLocation() async {
    final visit = _getVisit();
    if (visit == null) return;

    try {
      final locationService = ref.read(locationServiceProvider);
      final location = await locationService.getCurrentLocation();

      if (mounted) {
        setState(() {
          _currentDistance = _calculateDistance(
            location.latitude,
            location.longitude,
            visit.outletLatitude,
            visit.outletLongitude,
          );
          _currentAccuracy = location.accuracy;
          _isLoadingLocation = false;
          _locationError = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingLocation = false;
          _locationError = 'Unable to get location';
        });
      }
    }
  }

  OutletVisit? _getVisit() {
    final visits = ref.read(visitListProvider);
    return visits.where((v) => v.localId == widget.visitLocalId).firstOrNull;
  }

  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const earthRadius = 6371000.0; // meters
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * math.pi / 180;

  @override
  Widget build(BuildContext context) {
    final visits = ref.watch(visitListProvider);
    final visit = visits
        .where((v) => v.localId == widget.visitLocalId)
        .firstOrNull;

    if (visit == null) {
      return Scaffold(
        backgroundColor: kBackground,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RouteBackHeader(title: 'Visit', onBack: () => context.pop()),
              const Expanded(
                child: Center(child: Text('Visit not found')),
              ),
            ],
          ),
        ),
      );
    }

    final clockInState = ref.watch(clockInNotifierProvider);
    final existingOverride =
        ref.watch(overrideForVisitProvider(widget.visitLocalId)).valueOrNull;
    final isOverrideApproved =
        existingOverride?.status == GeofenceOverrideStatus.approved;
    final canClockIn =
        _currentAccuracy != null &&
        _currentAccuracy! <= 200.0 &&
        (isOverrideApproved ||
            (_currentDistance != null &&
                _currentDistance! <= visit.geofenceRadiusMeters));

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteBackHeader(title: 'Visit Detail', onBack: () => context.pop()),
            Expanded(child: _buildBody(context, visit, clockInState, existingOverride, canClockIn)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    OutletVisit visit,
    AsyncValue<dynamic> clockInState,
    GeofenceOverrideRequest? existingOverride,
    bool canClockIn,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            // Outlet info card
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: kSecondaryLightColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(
                            '${visit.visitOrder}',
                            style: const TextStyle(
                              color: kSecondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              visit.outletName,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: kTextDark,
                              ),
                            ),
                            Text(
                              visit.outletCode,
                              style: const TextStyle(
                                fontSize: 13,
                                color: kTextMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      VisitStatusChip(status: visit.status),
                    ],
                  ),
                  if (visit.scheduledClockIn != null) ...[
                    const Divider(height: 24, color: kBackground),
                    Row(
                      children: [
                        const Icon(Icons.schedule, size: 16, color: kTextMuted),
                        const SizedBox(width: 8),
                        Text(
                          'Scheduled: ${visit.scheduledClockIn!}',
                          style: const TextStyle(fontSize: 13, color: kTextMuted),
                        ),
                        if (visit.allocatedMinutes > 0) ...[
                          const SizedBox(width: 16),
                          Text(
                            '${visit.allocatedMinutes} min allocated',
                            style: const TextStyle(fontSize: 13, color: kTextMuted),
                          ),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Geofence status
            GeofenceStatusWidget(
              distanceMeters: _currentDistance ?? 0,
              requiredRadius: visit.geofenceRadiusMeters,
              isLoading: _isLoadingLocation,
              error: _locationError,
            ),

            // GPS accuracy warning
            if (_currentAccuracy != null && _currentAccuracy! > 200.0) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kWarningBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.gps_off, color: kWarningText, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'GPS accuracy is ${_currentAccuracy!.round()}m (need ≤200m)',
                        style: const TextStyle(color: kWarningText, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),

            // Override request banner
            if (existingOverride != null) ...[
              const SizedBox(height: 4),
              _OverrideBanner(
                request: existingOverride,
                onViewDetails: () => context.push(
                  '/daily-route/visit/${widget.visitLocalId}/override',
                ),
              ),
              const SizedBox(height: 4),
            ],

            // Error message
            if (clockInState.hasError) ...[
              _buildErrorWidget(clockInState.error),
              const SizedBox(height: 16),
            ],

            // Clock in button
            ClockInButton(
              onPressed: canClockIn ? () => _clockIn(visit) : null,
              isLoading: clockInState.isLoading,
              isEnabled: canClockIn,
              isClockIn: true,
            ),
            const SizedBox(height: 12),

            // Request override button — hide if a pending/approved override
            // already exists (user should use the banner instead).
            if (_currentDistance != null &&
                _currentDistance! > visit.geofenceRadiusMeters &&
                (existingOverride == null ||
                    existingOverride.isRejected ||
                    existingOverride.isExpired))
              SecondaryActionButton(
                onPressed: () => _requestOverride(visit),
                label: existingOverride != null
                    ? 'Request New Override'
                    : 'Request Override',
                icon: Icons.verified_user_outlined,
                color: kWarningText,
              ),
            const SizedBox(height: 12),

            // Skip button
            Center(
              child: TextButton(
                onPressed: () => _showSkipDialog(visit),
                child: const Text(
                  'Skip Visit',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(Object? error) {
    String message = 'An error occurred';

    if (error is GeofenceViolationFailure) {
      message = error.displayMessage;
    } else if (error is GpsAccuracyFailure) {
      message = error.displayMessage;
    } else if (error is VisitInProgressFailure) {
      message = error.displayMessage;
    } else if (error != null) {
      message = error.toString();
    }

    return Container(
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
              message,
              style: const TextStyle(color: kRedColor, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _clockIn(OutletVisit visit) async {
    final locationService = ref.read(locationServiceProvider);
    final location = await locationService.getCurrentLocation();

    await ref
        .read(clockInNotifierProvider.notifier)
        .clockIn(
          visitLocalId: visit.localId,
          latitude: location.latitude,
          longitude: location.longitude,
          accuracyMeters: location.accuracy,
        );

    // Check result
    final state = ref.read(clockInNotifierProvider);
    if (state.hasValue && state.value != null && mounted) {
      context.go('/daily-route/visit/${visit.localId}/active');
    }
  }

  Future<void> _requestOverride(OutletVisit visit) async {
    // Navigate to override request screen
    context.push('/daily-route/visit/${visit.localId}/override');
  }

  Future<void> _showSkipDialog(OutletVisit visit) async {
    // Show skip reason dialog
    final result = await SkipReasonDialog.show(
      context,
      outletName: visit.outletName,
    );

    if (result != null && mounted) {
      await ref
          .read(skipVisitNotifierProvider.notifier)
          .skip(
            visitLocalId: visit.localId,
            skipReasonId: result.reasonId,
            skipNotes: result.notes,
          );
      if (mounted) {
        context.pop();
      }
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Override status banner
// ─────────────────────────────────────────────────────────────────────────────

class _OverrideBanner extends StatelessWidget {
  final GeofenceOverrideRequest request;
  final VoidCallback onViewDetails;

  const _OverrideBanner({
    required this.request,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg;
    final Color textColor;
    final IconData icon;
    final String title;
    final String subtitle;

    switch (request.status) {
      case GeofenceOverrideStatus.pending:
        bg = kWarningBg;
        textColor = kWarningText;
        icon = Icons.hourglass_top_outlined;
        title = 'Override Request Pending';
        subtitle = 'Waiting for supervisor approval';
        break;
      case GeofenceOverrideStatus.approved:
        bg = kSuccessBg;
        textColor = kSuccessText;
        icon = Icons.check_circle_outline;
        title = 'Override Approved';
        subtitle = request.decidedByName != null
            ? 'Approved by ${request.decidedByName}. You may clock in.'
            : 'You may now clock in from your current location.';
        break;
      case GeofenceOverrideStatus.rejected:
        bg = kRedColor.withValues(alpha: 0.08);
        textColor = kRedColor;
        icon = Icons.cancel_outlined;
        title = 'Override Rejected';
        subtitle = request.decisionNotes ??
            (request.decidedByName != null
                ? 'Rejected by ${request.decidedByName}.'
                : 'Your override request was not approved.');
        break;
      case GeofenceOverrideStatus.expired:
        bg = kBackground;
        textColor = kTextMuted;
        icon = Icons.timer_off_outlined;
        title = 'Override Request Expired';
        subtitle = 'The request expired before a decision was made.';
        break;
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: textColor, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: onViewDetails,
            style: TextButton.styleFrom(
              foregroundColor: textColor,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'View',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
