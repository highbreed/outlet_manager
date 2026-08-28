import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../domain/entities/clock_in_session.dart';
import '../../providers/clock_in_controller.dart';
import '../../providers/clock_in_providers.dart';
import '../widgets/widgets.dart';

/// Screen showing active clock-in session with timer and clock-out option
class ActiveSessionScreen extends ConsumerWidget {
  const ActiveSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeSessionAsync = ref.watch(activeSessionProvider);

    return activeSessionAsync.when(
      data: (session) {
        if (session == null) {
          // No active session, redirect back
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return _ActiveSessionContent(session: session);
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, _) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: kRedColor),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActiveSessionContent extends ConsumerStatefulWidget {
  final ClockInSession session;

  const _ActiveSessionContent({required this.session});

  @override
  ConsumerState<_ActiveSessionContent> createState() =>
      _ActiveSessionContentState();
}

class _ActiveSessionContentState extends ConsumerState<_ActiveSessionContent> {
  bool _isClockingOut = false;

  void _showClockOutForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ClockOutForm(
        outletName: widget.session.outletName,
        isLoading: _isClockingOut,
        onCancel: () => Navigator.of(context).pop(),
        onSubmit: _handleClockOut,
      ),
    );
  }

  Future<void> _handleClockOut({
    required double transportExpense,
    required String routeCovered,
    required bool hasOrder,
  }) async {
    setState(() => _isClockingOut = true);

    await ref
        .read(clockInControllerProvider.notifier)
        .clockOut(
          sessionId: widget.session.id,
          transportExpense: transportExpense,
          routeCovered: routeCovered,
          hasOrder: hasOrder,
        );

    if (!mounted) return;

    final state = ref.read(clockInControllerProvider);

    if (state is ClockOutSuccess) {
      Navigator.of(context).pop(); // Close bottom sheet
      Navigator.of(context).pop(); // Return to previous screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully clocked out'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (state is ClockInError) {
      setState(() => _isClockingOut = false);
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
    final session = widget.session;
    final isTimeExceeded = ref.watch(isTimeExceededProvider);

    return AppScaffold(
      title: 'Active Session',
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Outlet Info
                    ActiveSessionOutletInfo(
                      outletName: session.outletName,
                      outletCode: session.outletCode,
                      isDeviation: session.isDeviation,
                    ),
                    const SizedBox(height: 32),

                    // Timer Display
                    SessionTimer(
                      startTime: session.clockedInAt,
                      allocatedMinutes: session.allocatedMinutes,
                    ),
                    const SizedBox(height: 32),

                    // Time Warning
                    if (isTimeExceeded)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: kRedColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kRedColor.withOpacity(0.3)),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.warning_amber, color: kRedColor),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Allocated time exceeded. Please clock out soon.',
                                style: TextStyle(
                                  color: kRedColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 24),

                    // Session Info Card
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Session Details',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Divider(height: 24),
                            _DetailRow(
                              label: 'Clock-in Time',
                              value: _formatTime(session.clockedInAt),
                            ),
                            _DetailRow(
                              label: 'Allocated Time',
                              value: '${session.allocatedMinutes} minutes',
                            ),
                            _DetailRow(
                              label: 'GPS Accuracy',
                              value:
                                  '${session.clockInAccuracy.toStringAsFixed(0)}m',
                            ),
                            _DetailRow(
                              label: 'Sync Status',
                              value: session.syncState.name,
                              valueColor: session.syncState == SyncState.synced
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Clock Out Button Area
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  ClockOutButton(
                    isLoading: _isClockingOut,
                    onPressed: _showClockOutForm,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tap to clock out',
                    style: TextStyle(color: kTextMuted, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: kTextMuted)),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w500, color: valueColor),
          ),
        ],
      ),
    );
  }
}
