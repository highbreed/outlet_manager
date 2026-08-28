import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/visit_schedule.dart';
import '../../providers/visit_schedule_providers.dart';
import '../widgets/widgets.dart';

/// Screen showing the weekly visit schedule.
///
/// Displays schedules grouped by day of week with outlet counts
/// and allows navigation to day detail view.
class ScheduleListScreen extends ConsumerStatefulWidget {
  const ScheduleListScreen({super.key});

  @override
  ConsumerState<ScheduleListScreen> createState() => _ScheduleListScreenState();
}

class _ScheduleListScreenState extends ConsumerState<ScheduleListScreen>
    with WidgetsBindingObserver {
  int _selectedDayIndex = 0;
  bool _hasSyncedOnOpen = false;

  @override
  void initState() {
    super.initState();
    // Default to today
    _selectedDayIndex = DateTime.now().weekday - 1; // 0=Monday

    // Add lifecycle observer
    WidgetsBinding.instance.addObserver(this);

    // Sync schedules when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncOnOpen();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Sync when app comes back to foreground
      _syncInBackground();
    }
  }

  /// Sync schedules when screen first opens (non-blocking)
  Future<void> _syncOnOpen() async {
    if (_hasSyncedOnOpen) return;
    _hasSyncedOnOpen = true;
    await _syncInBackground();
  }

  /// Background sync without showing loading state or snackbar
  Future<void> _syncInBackground() async {
    final syncController = ref.read(scheduleSyncControllerProvider.notifier);
    await syncController.sync();
    // No snackbar - silent background sync
  }

  @override
  Widget build(BuildContext context) {
    final schedulesAsync = ref.watch(allSchedulesNotifierProvider);
    final syncState = ref.watch(scheduleSyncControllerProvider);

    return AppScaffold(
      title: 'My Schedule',
      showBottomNav: true,
      currentNavIndex: 2,
      actions: [
        IconButton(
          icon: syncState.isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.sync),
          onPressed: syncState.isLoading ? null : () => _syncSchedules(),
          tooltip: 'Sync schedules',
        ),
      ],
      body: schedulesAsync.when(
        data: (schedules) => _buildContent(schedules),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _buildError(error.toString()),
      ),
    );
  }

  Widget _buildContent(List<VisitSchedule> schedules) {
    final grouped = schedules.groupByDayOfWeek();

    return Column(
      children: [
        // Day selector tabs
        DayTabBar(
          selectedIndex: _selectedDayIndex,
          scheduleCounts: grouped.map((k, v) => MapEntry(k, v.length)),
          onDaySelected: (index) {
            setState(() => _selectedDayIndex = index);
          },
        ),

        // Schedule list for selected day
        Expanded(child: _buildDaySchedule(grouped[_selectedDayIndex] ?? [])),
      ],
    );
  }

  Widget _buildDaySchedule(List<VisitSchedule> schedules) {
    if (schedules.isEmpty) {
      return _buildEmptyDay();
    }

    return RefreshIndicator(
      onRefresh: _syncSchedules,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: schedules.length + 1, // +1 for summary header
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildDaySummary(schedules);
          }
          final schedule = schedules[index - 1];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ScheduleCard(schedule: schedule),
          );
        },
      ),
    );
  }

  Widget _buildDaySummary(List<VisitSchedule> schedules) {
    final totalMinutes = schedules.fold(
      0,
      (sum, s) => sum + s.allocatedMinutes,
    );
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kSecondaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kSecondaryColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          _SummaryItem(
            icon: Icons.store,
            value: schedules.length.toString(),
            label: 'Outlets',
          ),
          const SizedBox(width: 24),
          _SummaryItem(
            icon: Icons.schedule,
            value: hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m',
            label: 'Total Time',
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyDay() {
    final dayName = _getDayName(_selectedDayIndex);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_busy,
            size: 64,
            color: kTextMuted.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No visits scheduled',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kTextMuted,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You have no outlets to visit on $dayName',
            style: TextStyle(fontSize: 14, color: kTextMuted),
          ),
        ],
      ),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: kRedColor),
            const SizedBox(height: 16),
            Text(
              'Failed to load schedules',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: kTextMuted),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => ref.invalidate(allSchedulesNotifierProvider),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _syncSchedules() async {
    final success = await ref
        .read(scheduleSyncControllerProvider.notifier)
        .sync();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success
                ? 'Schedules synced successfully'
                : 'Failed to sync schedules',
          ),
          backgroundColor: success ? Colors.green : kRedColor,
        ),
      );
    }
  }

  String _getDayName(int index) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return days[index];
  }
}

class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _SummaryItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: kSecondaryColor, size: 20),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kSecondaryColor,
              ),
            ),
            Text(label, style: TextStyle(fontSize: 12, color: kTextMuted)),
          ],
        ),
      ],
    );
  }
}
