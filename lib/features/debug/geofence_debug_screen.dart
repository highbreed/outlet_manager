import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/location/background_location_service.dart';
import '../../core/providers/location_providers.dart';

/// Temporary field-testing tool for the native background tracking engine
/// (`android/app/src/main/kotlin/.../location/`) — geofence hysteresis and
/// Activity Recognition motion-aware cadence specifically. Field testers
/// won't have a laptop/`logcat` on the ground, so this surfaces the same
/// information in-app: current distance/cadence/hysteresis state (polled),
/// plus a live log of fixes, geofence transitions, motion transitions, and
/// sync results (pushed via `TrackingEventBridge.emitDebugLog`).
///
/// Not linked from production navigation — reached only via the
/// debug-mode-gated entry in `MenuScreen`. Safe to delete this whole file,
/// its route, and that entry once the live-testing TODO items in
/// `docs/GEOLOCATION_LIVE_TESTING_TODO.md` are confirmed and the engine has
/// shipped.
class GeofenceDebugScreen extends ConsumerStatefulWidget {
  const GeofenceDebugScreen({super.key});

  @override
  ConsumerState<GeofenceDebugScreen> createState() =>
      _GeofenceDebugScreenState();
}

class _GeofenceDebugScreenState extends ConsumerState<GeofenceDebugScreen> {
  static const _maxLogEntries = 300;

  BackgroundTrackingStatus? _status;
  final List<DebugLogEntry> _logs = [];
  final _scrollController = ScrollController();

  StreamSubscription<DebugLogEntry>? _logSubscription;
  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    _refreshStatus();
    _pollTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _refreshStatus(),
    );

    _logSubscription = ref
        .read(backgroundLocationServiceProvider)
        .debugLogEvents
        .listen((entry) {
          setState(() {
            _logs.add(entry);
            if (_logs.length > _maxLogEntries) {
              _logs.removeRange(0, _logs.length - _maxLogEntries);
            }
          });
          _scrollToBottom();
        });
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    _logSubscription?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshStatus() async {
    final status = await ref
        .read(backgroundLocationServiceProvider)
        .getTrackingStatus();
    if (mounted) setState(() => _status = status);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> _copyLogs() async {
    final text = _logs
        .map((e) => '${_formatTime(e.timestamp)}  ${e.message}')
        .join('\n');
    await Clipboard.setData(ClipboardData(text: text));
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Logs copied')));
    }
  }

  String _formatTime(DateTime t) {
    final local = t.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(local.hour)}:${two(local.minute)}:${two(local.second)}';
  }

  String _formatInterval(int? ms) {
    if (ms == null) return '—';
    if (ms < 60000) return '${(ms / 1000).round()}s';
    return '${(ms / 60000).round()}min';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geofence Debug'),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: 'Copy logs',
            onPressed: _logs.isEmpty ? null : _copyLogs,
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Clear logs',
            onPressed: () => setState(_logs.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          _StatusPanel(status: _status, formatInterval: _formatInterval),
          const Divider(height: 1),
          Expanded(
            child: _logs.isEmpty
                ? const Center(
                    child: Text(
                      'Waiting for events…\n(fixes, transitions, and syncs '
                      'appear here as they happen)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    itemCount: _logs.length,
                    itemBuilder: (context, index) {
                      final entry = _logs[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                            children: [
                              TextSpan(
                                text: '${_formatTime(entry.timestamp)}  ',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              TextSpan(text: entry.message),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _StatusPanel extends StatelessWidget {
  final BackgroundTrackingStatus? status;
  final String Function(int?) formatInterval;

  const _StatusPanel({required this.status, required this.formatInterval});

  @override
  Widget build(BuildContext context) {
    final s = status;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: s == null
          ? const Text('Loading…')
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _row(
                  'Tracking',
                  s.isTracking
                      ? '${s.outletName ?? "?"} (${s.visitId ?? "?"})'
                      : 'inactive',
                ),
                _row(
                  'Distance / radius',
                  s.distanceMeters == null
                      ? '—'
                      : '${s.distanceMeters!.round()}m / '
                            '${s.geofenceRadiusMeters?.round() ?? "?"}m',
                ),
                _row(
                  'Hysteresis',
                  'outside=${s.consecutiveOutside} inside=${s.consecutiveInside} '
                      'confirmedOutside=${s.confirmedOutside}',
                ),
                _row('Motion', s.isStill ? 'STILL' : 'moving/unknown'),
                _row('Cadence', formatInterval(s.currentIntervalMs)),
                _row('Queued pings', '${s.pendingPingCount}'),
              ],
            ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            TextSpan(text: value),
          ],
        ),
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
