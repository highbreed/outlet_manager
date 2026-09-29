import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../daily_route/domain/entities/geofence_override_request.dart';
import '../../../daily_route/providers/daily_route_providers.dart';
import '../../providers/clock_in_controller.dart';
import '../widgets/widgets.dart';
import 'active_session_screen.dart';

/// Main clock-in screen showing outlet selection and clock-in button
class ClockInScreen extends ConsumerStatefulWidget {
  final String outletId;
  final String outletName;
  final String outletCode;
  final int allocatedMinutes;
  final double outletLatitude;
  final double outletLongitude;
  final double geofenceRadius;
  final bool isDeviation;
  final String? routeId;
  final String? visitLocalId;

  const ClockInScreen({
    super.key,
    required this.outletId,
    required this.outletName,
    required this.outletCode,
    required this.allocatedMinutes,
    required this.outletLatitude,
    required this.outletLongitude,
    this.geofenceRadius = 200.0,
    this.isDeviation = false,
    this.routeId,
    this.visitLocalId,
  });

  @override
  ConsumerState<ClockInScreen> createState() => _ClockInScreenState();
}

class _ClockInScreenState extends ConsumerState<ClockInScreen> {
  ClockInValidation? _validation;
  bool _isValidating = false;
  double? _liveAccuracy;

  @override
  void initState() {
    super.initState();
    _validateLocation();
  }

  Future<void> _validateLocation() async {
    setState(() {
      _isValidating = true;
      _liveAccuracy = null;
    });

    final validation = await ref
        .read(clockInControllerProvider.notifier)
        .validateClockIn(
          outletLatitude: widget.outletLatitude,
          outletLongitude: widget.outletLongitude,
          geofenceRadius: widget.geofenceRadius,
          isDeviation: widget.isDeviation,
          onLocationUpdate: (location) {
            if (mounted) setState(() => _liveAccuracy = location.accuracy);
          },
        );

    if (mounted) {
      setState(() {
        _validation = validation;
        _isValidating = false;
      });
    }
  }

  Future<void> _handleClockIn() async {
    await ref
        .read(clockInControllerProvider.notifier)
        .clockIn(
          outletId: widget.outletId,
          outletName: widget.outletName,
          outletCode: widget.outletCode,
          isDeviation: widget.isDeviation,
          routeId: widget.routeId,
          allocatedMinutes: widget.allocatedMinutes,
        );

    final state = ref.read(clockInControllerProvider);
    if (state is ClockInSuccess && mounted) {
      // Navigate to active session screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ActiveSessionScreen()),
      );
    } else if (state is ClockInError && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.failure.displayMessage),
          backgroundColor: kRedColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controllerState = ref.watch(clockInControllerProvider);
    final isLoading = controllerState is ClockInLoading;

    final override = widget.visitLocalId != null
        ? ref
              .watch(overrideForVisitProvider(widget.visitLocalId!))
              .value
        : null;

    return AppScaffold(
      title: 'Clock In',
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Pending override banner
              if (override != null &&
                  override.status == GeofenceOverrideStatus.pending) ...[
                _PendingOverrideBanner(
                  request: override,
                  onView: () => context.push(
                    '/daily-route/visit/${widget.visitLocalId}/override',
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Outlet Info Card
              OutletInfoCard(
                outletName: widget.outletName,
                outletCode: widget.outletCode,
                allocatedMinutes: widget.allocatedMinutes,
                distanceMeters: _validation?.distanceToOutlet,
                isDeviation: widget.isDeviation,
                isSelected: true,
              ),
              const SizedBox(height: 24),

              // Location Status
              Center(
                child: _isValidating
                    ? GpsStatusIndicator(
                        isLoading: true,
                        accuracy: _liveAccuracy,
                      )
                    : GpsStatusIndicator(
                        accuracy: _validation?.currentAccuracy,
                      ),
              ),
              const SizedBox(height: 16),

              // Validation Messages
              if (_validation != null && !_validation!.canClockIn) ...[
                _ValidationError(message: _validation!.errorMessage!),
                const SizedBox(height: 16),
              ],

              if (_validation?.warnings.isNotEmpty ?? false) ...[
                ..._validation!.warnings.map(
                  (w) => _WarningMessage(message: w),
                ),
                const SizedBox(height: 16),
              ],

              const Spacer(),

              // Clock In Button
              Center(
                child: ClockInButton(
                  isEnabled: _validation?.canClockIn ?? false,
                  isLoading: isLoading,
                  onPressed: _handleClockIn,
                ),
              ),

              const Spacer(),

              // Refresh location button
              Center(
                child: TextButton.icon(
                  onPressed: _isValidating ? null : _validateLocation,
                  icon: const Icon(Icons.refresh, size: 18),
                  label: const Text('Refresh Location'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _ValidationError extends StatelessWidget {
  final String message;

  const _ValidationError({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kRedColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kRedColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: kRedColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: kRedColor, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class _WarningMessage extends StatelessWidget {
  final String message;

  const _WarningMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber, color: Colors.orange, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.orange, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class _PendingOverrideBanner extends StatelessWidget {
  final GeofenceOverrideRequest request;
  final VoidCallback onView;

  const _PendingOverrideBanner({required this.request, required this.onView});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFCA28)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.hourglass_top_outlined,
            color: Color(0xFFF57F17),
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Override Request Pending',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: Color(0xFFF57F17),
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Waiting for supervisor approval',
                  style: TextStyle(fontSize: 12, color: kTextMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: onView,
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFF57F17),
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
