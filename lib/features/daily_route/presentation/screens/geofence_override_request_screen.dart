import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/location_providers.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/geofence_override_request.dart';
import '../../domain/entities/outlet_visit.dart';
import '../../providers/daily_route_providers.dart';
import '../widgets/widgets.dart';

class GeofenceOverrideRequestScreen extends ConsumerStatefulWidget {
  final String visitLocalId;

  const GeofenceOverrideRequestScreen({
    super.key,
    required this.visitLocalId,
  });

  @override
  ConsumerState<GeofenceOverrideRequestScreen> createState() =>
      _GeofenceOverrideRequestScreenState();
}

class _GeofenceOverrideRequestScreenState
    extends ConsumerState<GeofenceOverrideRequestScreen> {
  final _reasonCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double? _latitude;
  double? _longitude;
  double? _accuracy;
  double? _distanceFromOutlet;
  bool _fetchingLocation = true;
  String? _locationError;

  Timer? _countdownTimer;
  Duration _timeRemaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _fetchLocation();
    // Restore any override saved in a previous session for this visit.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(geofenceOverrideNotifierProvider.notifier)
          .loadExistingForVisit(widget.visitLocalId);
    });
  }

  @override
  void dispose() {
    _reasonCtrl.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }

  OutletVisit? get _visit {
    final visits = ref.read(visitListProvider);
    return visits
        .where((v) => v.localId == widget.visitLocalId)
        .firstOrNull;
  }

  Future<void> _fetchLocation() async {
    final visit = _visit;
    if (visit == null) return;
    try {
      final locationService = ref.read(locationServiceProvider);
      final loc = await locationService.getCurrentLocation();
      if (!mounted) return;
      setState(() {
        _latitude = loc.latitude;
        _longitude = loc.longitude;
        _accuracy = loc.accuracy;
        _distanceFromOutlet = _haversine(
          loc.latitude,
          loc.longitude,
          visit.outletLatitude,
          visit.outletLongitude,
        );
        _fetchingLocation = false;
        _locationError = null;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _fetchingLocation = false;
        _locationError = 'Unable to get your current location';
      });
    }
  }

  double _haversine(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const r = 6371000.0;
    final dLat = _rad(lat2 - lat1);
    final dLon = _rad(lon2 - lon1);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_rad(lat1)) *
            math.cos(_rad(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    return r * 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  }

  double _rad(double deg) => deg * math.pi / 180;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_latitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Waiting for location…')),
      );
      return;
    }

    await ref.read(geofenceOverrideNotifierProvider.notifier).requestOverride(
          visitLocalId: widget.visitLocalId,
          latitude: _latitude!,
          longitude: _longitude!,
          accuracyMeters: _accuracy!,
          reason: _reasonCtrl.text.trim(),
        );

    final state = ref.read(geofenceOverrideNotifierProvider);
    if (state.hasValue && state.value != null) {
      _startCountdown(state.value!);
    }
  }

  void _startCountdown(GeofenceOverrideRequest override) {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      final remaining = override.timeRemaining(DateTime.now());
      setState(() => _timeRemaining = remaining);
      if (remaining == Duration.zero) {
        _countdownTimer?.cancel();
      }
    });
    setState(() => _timeRemaining = override.timeRemaining(DateTime.now()));
  }

  Future<void> _refreshStatus(GeofenceOverrideRequest override) async {
    await ref
        .read(geofenceOverrideNotifierProvider.notifier)
        .refreshStatus(override.localId);

    final updated = ref.read(geofenceOverrideNotifierProvider).valueOrNull;
    if (updated != null && updated.isPending) {
      _startCountdown(updated);
    }
  }

  Future<void> _clockInWithOverride(GeofenceOverrideRequest override) async {
    await ref
        .read(geofenceOverrideNotifierProvider.notifier)
        .clockInWithOverride(
          visitLocalId: widget.visitLocalId,
          overrideLocalId: override.localId,
        );

    final state = ref.read(geofenceOverrideNotifierProvider);
    if (!state.hasError && mounted) {
      context.go('/daily-route/visit/${widget.visitLocalId}/active');
    }
  }

  @override
  Widget build(BuildContext context) {
    final overrideAsync = ref.watch(geofenceOverrideNotifierProvider);
    final visit = _visit;

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteBackHeader(
              title: 'Request Override',
              onBack: () =>
                  context.canPop() ? context.pop() : context.go('/daily-route/visits'),
            ),
            Expanded(
              child: overrideAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => _ErrorBody(
                  message: e is Exception
                      ? e.toString().replaceFirst('Exception: ', '')
                      : e.toString(),
                  onRetry: () => ref.invalidate(geofenceOverrideNotifierProvider),
                ),
                data: (override) {
                  if (override == null) {
                    return _RequestForm(
                      visit: visit,
                      distanceFromOutlet: _distanceFromOutlet,
                      fetchingLocation: _fetchingLocation,
                      locationError: _locationError,
                      accuracy: _accuracy,
                      formKey: _formKey,
                      reasonCtrl: _reasonCtrl,
                      onSubmit: _submit,
                      onRetryLocation: _fetchLocation,
                    );
                  }
                  return _OverrideStatusBody(
                    request: override,
                    timeRemaining: _timeRemaining,
                    onRefresh: () => _refreshStatus(override),
                    onClockIn: () => _clockInWithOverride(override),
                    onCancel: () {
                      ref.invalidate(geofenceOverrideNotifierProvider);
                      context.pop();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Request form
// ─────────────────────────────────────────────────────────────────────────────

class _RequestForm extends StatelessWidget {
  final OutletVisit? visit;
  final double? distanceFromOutlet;
  final bool fetchingLocation;
  final String? locationError;
  final double? accuracy;
  final GlobalKey<FormState> formKey;
  final TextEditingController reasonCtrl;
  final VoidCallback onSubmit;
  final VoidCallback onRetryLocation;

  const _RequestForm({
    required this.visit,
    required this.distanceFromOutlet,
    required this.fetchingLocation,
    required this.locationError,
    required this.accuracy,
    required this.formKey,
    required this.reasonCtrl,
    required this.onSubmit,
    required this.onRetryLocation,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Info banner ───────────────────────────────────────────────
            AppCard(
              borderColor: kWarningColor.withValues(alpha: 0.4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kWarningBg,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.location_off_outlined,
                      color: kWarningText,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Outside Geofence',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: kWarningText,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (fetchingLocation)
                          const Text(
                            'Getting your location…',
                            style: TextStyle(fontSize: 13, color: kTextMuted),
                          )
                        else if (locationError != null)
                          Text(
                            locationError!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: kTextMuted,
                            ),
                          )
                        else if (distanceFromOutlet != null) ...[
                          Text(
                            'You are ${_fmtDistance(distanceFromOutlet!)} from '
                            '${visit?.outletName ?? 'the outlet'}.',
                            style: const TextStyle(
                              fontSize: 13,
                              color: kTextMuted,
                            ),
                          ),
                          if (accuracy != null) ...[
                            const SizedBox(height: 2),
                            Text(
                              'GPS accuracy: ±${accuracy!.round()}m',
                              style: const TextStyle(
                                fontSize: 12,
                                color: kTextMuted,
                              ),
                            ),
                          ],
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Outlet info ───────────────────────────────────────────────
            if (visit != null) ...[
              const SizedBox(height: 14),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InfoRow(
                      icon: Icons.store_outlined,
                      label: 'Outlet',
                      value: visit!.outletName,
                    ),
                    const SizedBox(height: 10),
                    _InfoRow(
                      icon: Icons.radar,
                      label: 'Geofence radius',
                      value: '${visit!.geofenceRadiusMeters.round()} m',
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            // ── Reason field ──────────────────────────────────────────────
            const Text(
              'Reason for Override',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Explain why you need to clock in from outside the geofence. '
              'Your supervisor will review this request.',
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: reasonCtrl,
              minLines: 3,
              maxLines: 6,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                hintText:
                    'e.g. The outlet relocated since the last visit and the '
                    'GPS coordinates haven\'t been updated yet…',
              ),
              validator: (v) {
                if (v == null || v.trim().length < 10) {
                  return 'Please provide a reason (at least 10 characters)';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            // ── Location error retry ───────────────────────────────────────
            if (locationError != null) ...[
              SecondaryButton(
                label: 'Retry Location',
                leadingIcon: Icons.refresh,
                onPressed: onRetryLocation,
                expand: false,
              ),
              const SizedBox(height: 16),
            ],

            // ── Submit ─────────────────────────────────────────────────────
            PrimaryButton(
              label: 'Send Override Request',
              trailingIcon: Icons.send_outlined,
              onPressed:
                  (fetchingLocation || locationError != null) ? null : onSubmit,
            ),

            const SizedBox(height: 12),

            const Text(
              'Your supervisor will be notified immediately. '
              'The request expires after 15 minutes.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: kTextMuted),
            ),
          ],
        ),
      ),
    );
  }

  String _fmtDistance(double meters) {
    if (meters < 1000) return '${meters.round()} m';
    return '${(meters / 1000).toStringAsFixed(1)} km';
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Override status body
// ─────────────────────────────────────────────────────────────────────────────

class _OverrideStatusBody extends StatelessWidget {
  final GeofenceOverrideRequest request;
  final Duration timeRemaining;
  final VoidCallback onRefresh;
  final VoidCallback onClockIn;
  final VoidCallback onCancel;

  const _OverrideStatusBody({
    required this.request,
    required this.timeRemaining,
    required this.onRefresh,
    required this.onClockIn,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatusCard(request: request, timeRemaining: timeRemaining),
          const SizedBox(height: 20),

          // Request details
          _DetailCard(request: request),
          const SizedBox(height: 28),

          // Actions
          if (request.isPending) ...[
            PrimaryButton(
              label: 'Refresh Status',
              trailingIcon: Icons.refresh,
              onPressed: onRefresh,
            ),
            const SizedBox(height: 12),
            SecondaryButton(label: 'Cancel Request', onPressed: onCancel),
          ],

          if (request.isApproved)
            PrimaryButton(
              label: 'Clock In Now',
              trailingIcon: Icons.login,
              onPressed: onClockIn,
            ),

          if (request.isRejected || request.isExpired)
            SecondaryButton(label: 'Back to Visit', onPressed: onCancel),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Status card
// ─────────────────────────────────────────────────────────────────────────────

class _StatusCard extends StatelessWidget {
  final GeofenceOverrideRequest request;
  final Duration timeRemaining;
  const _StatusCard({required this.request, required this.timeRemaining});

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color border, Color fg, IconData icon) =
        switch (request.status) {
      GeofenceOverrideStatus.pending => (
          kWarningBg,
          kWarningColor,
          kWarningText,
          Icons.hourglass_top_outlined,
        ),
      GeofenceOverrideStatus.approved => (
          kSuccessBg,
          kSuccessColor,
          kSuccessText,
          Icons.check_circle_outline,
        ),
      GeofenceOverrideStatus.rejected => (
          kRedColor.withValues(alpha: 0.08),
          kRedColor.withValues(alpha: 0.4),
          kRedColor,
          Icons.cancel_outlined,
        ),
      GeofenceOverrideStatus.expired => (
          kBackground,
          kBorderColor,
          kTextFaint,
          Icons.timer_off_outlined,
        ),
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: border, width: 1.2),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: fg),
          const SizedBox(height: 10),
          Text(
            request.statusText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: fg,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _statusSubtitle(request),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: kTextMuted),
          ),

          // Countdown for pending
          if (request.isPending && timeRemaining > Duration.zero) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.timer_outlined, size: 15, color: kTextMuted),
                  const SizedBox(width: 6),
                  Text(
                    'Expires in ${_fmtDuration(timeRemaining)}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: kTextMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],

          // Supervisor notes on rejection
          if (request.isRejected && request.decisionNotes != null) ...[
            const SizedBox(height: 10),
            Text(
              '"${request.decisionNotes}"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: fg.withValues(alpha: 0.8),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _statusSubtitle(GeofenceOverrideRequest o) {
    switch (o.status) {
      case GeofenceOverrideStatus.pending:
        return 'Waiting for your supervisor to approve.\n'
            'You will be notified once a decision is made.';
      case GeofenceOverrideStatus.approved:
        return o.decidedByName != null
            ? 'Approved by ${o.decidedByName}. You may now clock in.'
            : 'Your override was approved. You may now clock in.';
      case GeofenceOverrideStatus.rejected:
        return o.decidedByName != null
            ? 'Rejected by ${o.decidedByName}.'
            : 'Your override request was not approved.';
      case GeofenceOverrideStatus.expired:
        return 'The override request expired before a decision was made.';
    }
  }

  String _fmtDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Request details card
// ─────────────────────────────────────────────────────────────────────────────

class _DetailCard extends StatelessWidget {
  final GeofenceOverrideRequest request;
  const _DetailCard({required this.request});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.info_outline, size: 15, color: kSecondaryColor),
              SizedBox(width: 6),
              Text(
                'Request Details',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
          const Divider(height: 24, color: kBorderColor),
          _DetailRow(label: 'Distance', value: request.distanceText),
          _DetailRow(label: 'Reason', value: request.reason, multiline: true),
          _DetailRow(
            label: 'Requested at',
            value: _fmtDateTime(request.requestedAt),
          ),
          if (request.outletName != null)
            _DetailRow(label: 'Outlet', value: request.outletName!),
        ],
      ),
    );
  }

  String _fmtDateTime(DateTime d) {
    final h = d.hour.toString().padLeft(2, '0');
    final m = d.minute.toString().padLeft(2, '0');
    return '${d.day.toString().padLeft(2, '0')} ${_month(d.month)} ${d.year}  $h:$m';
  }

  String _month(int m) => const [
        '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ][m];
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool multiline;
  const _DetailRow({
    required this.label,
    required this.value,
    this.multiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: multiline
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style:
                        const TextStyle(fontSize: 12, color: kTextMuted)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 13)),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(label,
                      style: const TextStyle(
                          fontSize: 12, color: kTextMuted)),
                ),
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared helpers
// ─────────────────────────────────────────────────────────────────────────────

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: kTextMuted),
        const SizedBox(width: 8),
        Text(label,
            style: const TextStyle(fontSize: 13, color: kTextMuted)),
        const SizedBox(width: 4),
        Text(value,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _ErrorBody extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorBody({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: kTextMuted,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kTextMuted),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Retry',
              trailingIcon: Icons.refresh,
              onPressed: onRetry,
              expand: false,
            ),
          ],
        ),
      ),
    );
  }
}
