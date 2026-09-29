import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/device/device_fingerprint.dart';
import '../../../../core/location/location_data.dart';
import '../../../../core/network/failures.dart';
import '../../../../core/providers/location_providers.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../biometric_verification/biometric_verification.dart';
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
  Future<void> Function()? _stopWatchingPosition;
  LocationData? _lastLocation;
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
    // Fire-and-forget — dispose() can't be awaited, and a failure here
    // just means the native watch stays registered until the plugin's own
    // next lifecycle event, not a leak we need to guard further. There's
    // only one location engine involved (flutter_background_geolocation's
    // own watchPosition, independent of startTracking()/stopTracking()),
    // so — unlike the old geolocator-based anchor/significant-change
    // streams this replaces — there's nothing else to pause/resume around
    // it, and no disposal-ordering race to guard against.
    _stopWatchingPosition?.call();
    super.dispose();
  }

  // A single continuous watch for as long as this screen is open, via the
  // plugin's own `watchPosition` API (see
  // BackgroundGeolocationService.watchPosition's doc comment) — lightweight
  // and tracking-independent, so it doesn't need startTracking()/a visit/a
  // geofence, and doesn't compete with anything else for a shared engine
  // the way the old geolocator-based anchor + significant-change streams
  // did (see git history for that saga). The user hasn't clocked in yet on
  // this screen, so nothing else needs to be paused in the meantime.
  Future<void> _startLocationUpdates() async {
    try {
      _stopWatchingPosition = await ref
          .read(backgroundGeolocationServiceProvider)
          .watchPosition(
            onLocation: (location) {
              final visit = _getVisit();
              if (visit == null || !mounted) return;
              setState(() {
                _lastLocation = location;
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
            },
          );
    } catch (e, st) {
      // The generic UI message below doesn't say why — log the real
      // exception so it's actually visible in the run console instead of
      // being swallowed here.
      developer.log(
        '[VisitDetail] location watch error: $e',
        name: 'VisitDetail',
        error: e,
        stackTrace: st,
      );
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
        ref.watch(overrideForVisitProvider(widget.visitLocalId)).value;
    final isOverrideApproved =
        existingOverride?.status == GeofenceOverrideStatus.approved;
    final canClockIn =
        visit.canClockIn &&
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
    final isOverrideApproved =
        existingOverride?.status == GeofenceOverrideStatus.approved;
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
            //
            // When an override is approved, canClockIn is true purely on
            // the strength of the override — the raw distance can still
            // be far outside the geofence (confirmed on-device: 1948m
            // against a 200m radius). Tapping straight into _clockIn()
            // here would call the plain, override-unaware
            // ClockInVisitUseCase, which unconditionally re-validates
            // that same distance and rejects it — the override would
            // never actually take effect. GeofenceOverrideRequestScreen
            // already has the correct, fully working override-aware
            // clock-in call (clockInWithOverride, which skips the
            // distance check); route there instead of duplicating that
            // logic here.
            ClockInButton(
              onPressed: canClockIn
                  ? () => isOverrideApproved
                      ? context.push(
                          '/daily-route/visit/${widget.visitLocalId}/override',
                        )
                      : _clockIn(visit)
                  : null,
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

            // Skip button — only offered while still pending. A visit
            // that's already skipped can be clocked into (see
            // OutletVisit.canClockIn) but not skipped again.
            if (visit.canSkip)
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
    } else if (error is InvalidVisitStateFailure) {
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
    // Reuse the live reading the continuous stream above is already
    // keeping current, rather than opening a second, independent
    // Geolocator request here — the plugin's own engine doesn't have the
    // multi-stream contention problem the old geolocator-based anchor did
    // (see git history). canClockIn already requires _currentAccuracy !=
    // null before this button is even tappable, so _lastLocation is
    // guaranteed set by the time this runs.
    final location = _lastLocation!;

    // Fresh status decides whether verification is required for this
    // employee at all — a fetch failure fails OPEN (treats as not
    // required): the backend's own clock-in-side rejection is the real
    // security backstop if that guess is wrong. See the "Phase 5" plan's
    // "Fail-open design principle".
    final statusResult = await ref.read(getBiometricStatusUseCaseProvider).call();
    if (!mounted) return;
    final requiresVerification = statusResult.fold(
      (failure) => false,
      (status) => status.clockInVerificationRequired,
    );

    String? verificationId;
    String? deviceId;

    if (requiresVerification) {
      // canClockIn already means we're within the geofence (or have an
      // approved override) before this button is even tappable — no
      // separate pre-check needed here. Verify identity before the actual
      // clock-in call, not after: never make the agent pass facial
      // verification only to then discover a geofence/state problem.
      final outcome = await verifyBiometric(context, purpose: BiometricPurpose.clockIn);
      debugPrint(
        '[DIAG] verifyBiometric returned: outcome=$outcome '
        'verified=${outcome?.verified} verificationId=${outcome?.verificationId} '
        'mounted=$mounted',
      );
      if (outcome == null || !outcome.verified || outcome.verificationId == null) {
        debugPrint('[DIAG] _clockIn bailing out after verifyBiometric — no valid outcome');
        return;
      }
      verificationId = outcome.verificationId;
      deviceId = await DeviceFingerprint.getOrCreate();
    }

    debugPrint('[DIAG] _clockIn calling _attemptClockIn verificationId=$verificationId');
    await _attemptClockIn(
      visit: visit,
      location: location,
      verificationId: verificationId,
      deviceId: deviceId,
      allowRetry: true,
    );
  }

  /// [allowRetry] bounds the stale-token recovery to a single resend —
  /// confirmed decision (automatic, not a manual "tap to retry"), see the
  /// "Phase 5" plan's section D.
  Future<void> _attemptClockIn({
    required OutletVisit visit,
    required LocationData location,
    required String? verificationId,
    required String? deviceId,
    required bool allowRetry,
  }) async {
    debugPrint(
      '[DIAG] _attemptClockIn starting: visitLocalId=${visit.localId} '
      'verificationId=$verificationId deviceId=$deviceId allowRetry=$allowRetry',
    );
    await ref
        .read(clockInNotifierProvider.notifier)
        .clockIn(
          visitLocalId: visit.localId,
          latitude: location.latitude,
          longitude: location.longitude,
          accuracyMeters: location.accuracy,
          verificationId: verificationId,
          deviceId: deviceId,
        );

    final state = ref.read(clockInNotifierProvider);
    debugPrint(
      '[DIAG] _attemptClockIn result: hasValue=${state.hasValue} '
      'value=${state.value} hasError=${state.hasError} error=${state.error}',
    );

    if (state.hasValue && state.value != null) {
      if (mounted) context.go('/daily-route/visit/${visit.localId}/active');
      return;
    }

    if (!allowRetry || !state.hasError || !mounted) return;

    final error = state.error;
    if (error is! BiometricVerificationFailure) return;

    final reason = error.mapOrNull(clockInRejected: (f) => f.reason);

    if (reason == BiometricClockInRejectionReason.verificationExpired ||
        reason == BiometricClockInRejectionReason.verificationInvalid) {
      // Stale/expired token — re-verify once with a fresh challenge and
      // retry the clock-in once with the new token; a second failure
      // surfaces as a normal error, no further looping.
      final outcome = await verifyBiometric(context, purpose: BiometricPurpose.clockIn);
      if (outcome == null || !outcome.verified || outcome.verificationId == null) {
        return;
      }
      await _attemptClockIn(
        visit: visit,
        location: location,
        verificationId: outcome.verificationId,
        deviceId: await DeviceFingerprint.getOrCreate(),
        allowRetry: false,
      );
      return;
    }

    if (reason == BiometricClockInRejectionReason.verificationAlreadyUsed) {
      // Reuses the existing today's-route refresh rather than a dedicated
      // single-visit GET endpoint (none confirmed to exist) — confirmed
      // decision. If the refreshed visit shows in_progress, this was
      // already a successful clock-in server-side; treat it as such
      // rather than erroring.
      ref.invalidate(todaysRouteProvider);
      ref.invalidate(dayStatusPollProvider);
      final refreshed = await ref
          .read(outletVisitRepositoryProvider)
          .getVisitByLocalId(visit.localId);
      final alreadyInProgress = refreshed.fold(
        (failure) => false,
        (v) => v?.status == VisitStatus.inProgress,
      );
      if (alreadyInProgress && mounted) {
        context.go('/daily-route/visit/${visit.localId}/active');
      }
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
