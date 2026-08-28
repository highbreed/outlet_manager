import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../domain/entities/clock_in_session.dart';
import '../../providers/clock_in_providers.dart';
import '../widgets/widgets.dart';

/// Screen showing history of clock-in sessions
class SessionHistoryScreen extends ConsumerStatefulWidget {
  const SessionHistoryScreen({super.key});

  @override
  ConsumerState<SessionHistoryScreen> createState() =>
      _SessionHistoryScreenState();
}

class _SessionHistoryScreenState extends ConsumerState<SessionHistoryScreen> {
  DateTime _startDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime _endDate = DateTime.now();
  List<ClockInSession>? _sessions;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSessions();
  }

  Future<void> _loadSessions() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final repository = await ref.read(clockInRepositoryProvider.future);
      final result = await repository.getSessionHistory(
        startDate: _startDate,
        endDate: _endDate.add(const Duration(days: 1)),
      );

      result.fold(
        (failure) => setState(() => _error = failure.displayMessage),
        (sessions) => setState(() => _sessions = sessions),
      );
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _selectDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(
              context,
            ).colorScheme.copyWith(primary: kSecondaryColor),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
      _loadSessions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Session History',
      actions: [
        IconButton(
          icon: const Icon(Icons.date_range),
          onPressed: _selectDateRange,
          tooltip: 'Select date range',
        ),
      ],
      body: Column(
        children: [
          // Date range indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: kSecondaryLightColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: kSecondaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  '${_formatDate(_startDate)} - ${_formatDate(_endDate)}',
                  style: const TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _selectDateRange,
                  child: const Text(
                    'Change',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: kRedColor),
            const SizedBox(height: 16),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadSessions,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_sessions == null || _sessions!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            const Text(
              'No sessions found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: kTextMuted,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try selecting a different date range',
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    // Group sessions by date
    final groupedSessions = _groupSessionsByDate(_sessions!);

    return RefreshIndicator(
      onRefresh: _loadSessions,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: groupedSessions.length,
        itemBuilder: (context, index) {
          final entry = groupedSessions.entries.elementAt(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  _formatDateHeader(entry.key),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTextMuted,
                    fontSize: 13,
                  ),
                ),
              ),
              // Sessions for this date
              ...entry.value.map(
                (session) => SessionHistoryTile(
                  session: session,
                  onTap: () => _showSessionDetails(session),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Map<DateTime, List<ClockInSession>> _groupSessionsByDate(
    List<ClockInSession> sessions,
  ) {
    final grouped = <DateTime, List<ClockInSession>>{};
    for (final session in sessions) {
      final date = DateTime(
        session.clockedInAt.year,
        session.clockedInAt.month,
        session.clockedInAt.day,
      );
      grouped.putIfAbsent(date, () => []).add(session);
    }
    return grouped;
  }

  void _showSessionDetails(ClockInSession session) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _SessionDetailsSheet(session: session),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month - 1]}';
  }

  String _formatDateHeader(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) {
      return 'TODAY';
    } else if (dateOnly == today.subtract(const Duration(days: 1))) {
      return 'YESTERDAY';
    }

    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${weekdays[date.weekday - 1]}, ${date.day} ${months[date.month - 1]}';
  }
}

class _SessionDetailsSheet extends StatelessWidget {
  final ClockInSession session;

  const _SessionDetailsSheet({required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Outlet name
          Text(
            session.outletName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(session.outletCode, style: const TextStyle(color: kTextMuted)),
          const SizedBox(height: 24),

          // Details grid
          _DetailItem(
            icon: Icons.login,
            label: 'Clock In',
            value: _formatDateTime(session.clockedInAt),
          ),
          if (session.clockedOutAt != null)
            _DetailItem(
              icon: Icons.logout,
              label: 'Clock Out',
              value: _formatDateTime(session.clockedOutAt!),
            ),
          _DetailItem(
            icon: Icons.timer,
            label: 'Duration',
            value: _formatDuration(session),
          ),
          if (session.transportExpense != null)
            _DetailItem(
              icon: Icons.directions_car,
              label: 'Transport',
              value: 'KES ${session.transportExpense!.toStringAsFixed(2)}',
            ),
          if (session.routeCovered != null)
            _DetailItem(
              icon: Icons.route,
              label: 'Route',
              value: session.routeCovered!,
            ),
          _DetailItem(
            icon: Icons.shopping_cart,
            label: 'Order Placed',
            value: session.hasOrder == true ? 'Yes' : 'No',
          ),
          _DetailItem(
            icon: Icons.sync,
            label: 'Sync Status',
            value: session.syncState.name,
            valueColor: session.syncState == SyncState.synced
                ? Colors.green
                : null,
          ),

          const SizedBox(height: 24),

          // Close button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '${dateTime.day} ${months[dateTime.month - 1]} at $hour:$minute';
  }

  String _formatDuration(ClockInSession session) {
    final endTime = session.clockedOutAt ?? DateTime.now();
    final duration = endTime.difference(session.clockedInAt);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }
}

class _DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailItem({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: kTextMuted),
          const SizedBox(width: 12),
          Expanded(
            child: Text(label, style: const TextStyle(color: kTextMuted)),
          ),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w500, color: valueColor),
          ),
        ],
      ),
    );
  }
}
