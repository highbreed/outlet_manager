import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../connectivity/connectivity.dart';
import '../../../daily_route/domain/entities/outlet_visit.dart';
import '../../data/datasources/mapping_sample_local_datasource.dart';
import '../../domain/entities/mapping_enums.dart';
import '../../domain/entities/mapping_sample.dart';
import '../../providers/mapping_session_notifier.dart';
import 'outlet_mapping_result_screen.dart';
import '../widgets/mapping_trail_painter.dart';

/// Owns no GPS subscription, upload queue, retry timer, sequence counter,
/// or config-restoration logic itself (spec §19) — it only renders
/// [MappingSessionNotifier]'s state and dispatches intents. All of that
/// lives in the `keepAlive` notifier, so navigating away from this screen
/// (back button, app switch, incoming call) never stops capture — spec
/// §40/§90.
///
/// Handles its own brief "Wrapping up..." terminal sub-view after Finish
/// is tapped (spec §20's resolution — no separate
/// `OutletMappingFinalisingScreen`), then auto-pops back to
/// `ActiveVisitScreen` rather than making the employee wait on a network
/// call (spec §15/§92): `MappingRequestCard` carries the rest of the story
/// from there.
class OutletMappingCaptureScreen extends ConsumerStatefulWidget {
  final OutletVisit visit;

  const OutletMappingCaptureScreen({super.key, required this.visit});

  @override
  ConsumerState<OutletMappingCaptureScreen> createState() =>
      _OutletMappingCaptureScreenState();
}

class _OutletMappingCaptureScreenState
    extends ConsumerState<OutletMappingCaptureScreen> {
  bool _popped = false;

  // ELAPSED is wall-clock time since the session started — it gates
  // `session.limits.minDurationSeconds`, a total-time-open requirement, not
  // a time-spent-moving one, so it must keep counting through stationary
  // stretches. Without this ticker the only thing that triggers a rebuild
  // is a new sample/pending-count change, so the display would freeze
  // solid the moment GPS goes quiet — exactly the moment the employee most
  // needs to see the clock still running toward the minimum.
  Timer? _elapsedTicker;

  @override
  void initState() {
    super.initState();
    _elapsedTicker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _elapsedTicker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(mappingSessionNotifierProvider);
    final isOnline = ref.watch(isOnlineProvider);
    final session = uiState.session;

    ref.listen(mappingSessionNotifierProvider, (previous, next) {
      final state = next.session?.localState;
      // The moment local capture has stopped collecting (Finish tapped,
      // successfully or not yet fully synced) this screen's job is done —
      // pop back to ActiveVisitScreen, never make the employee wait here
      // (spec §15/§20).
      if (!_popped &&
          (state == MappingLocalState.captureFinishedLocal ||
              state == MappingLocalState.uploadPending ||
              state == MappingLocalState.submitting ||
              state == MappingLocalState.pendingReview)) {
        _popped = true;
        Future.microtask(() {
          if (mounted) Navigator.of(context).pop();
        });
      }
      if (!_popped &&
          (state == MappingLocalState.captureFailed ||
              state == MappingLocalState.abandoned)) {
        _popped = true;
        Future.microtask(() {
          if (!mounted) return;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => OutletMappingResultScreen(visit: widget.visit),
            ),
          );
        });
      }
    });

    if (session == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    final elapsed = DateTime.now().difference(session.startedAt);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        // Back button/gesture is NOT abandonment (spec §90) — keep
        // capturing, just leave the screen. The active-mapping indicator
        // on ActiveVisitScreen (MappingRequestCard) makes this state
        // visible so the employee doesn't forget it's still running.
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mapping ${widget.visit.outletName}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isOnline
                      ? 'Recording'
                      : 'Offline — mapping is being saved on this device',
                  style: TextStyle(
                    color: isOnline ? Colors.greenAccent : kWarningColor,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: const Color(0xFF111111),
                      child: _MappingTrailView(
                        footprintId: session.footprintId,
                        sampleCount: uiState.localSampleCount,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _StatTile(
                        label: 'ELAPSED',
                        value: _formatDuration(elapsed),
                      ),
                    ),
                    Expanded(
                      child: _StatTile(
                        label: 'CAPTURED',
                        value: '${uiState.localSampleCount}',
                      ),
                    ),
                    Expanded(
                      child: _StatTile(
                        label: 'PENDING UPLOAD',
                        value: '${uiState.pendingUploadCount}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (session.limits.minDurationSeconds > elapsed.inSeconds ||
                    uiState.localSampleCount < session.limits.minSamples)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Keep walking through the outlet.',
                      style: TextStyle(color: Colors.white60, fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        label: 'Stop Mapping',
                        foregroundColor: Colors.white,
                        borderColor: Colors.white38,
                        onPressed: uiState.isBusy
                            ? null
                            : () => _confirmStop(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: PrimaryButton(
                        label: 'Finish Mapping',
                        onPressed: uiState.isBusy
                            ? null
                            : () => ref
                                  .read(mappingSessionNotifierProvider.notifier)
                                  .finishMapping(),
                        isLoading: uiState.isBusy,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmStop(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Stop Mapping?'),
        content: const Text(
          "This will discard everything captured in this attempt. You can map this outlet again later.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Continue Mapping'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: kRedColor),
            child: const Text('Stop Mapping'),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await ref.read(mappingSessionNotifierProvider.notifier).stopMapping();
    }
  }

  String _formatDuration(Duration d) {
    final m = d.inMinutes.toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}

/// Re-reads the footprint's captured samples from local storage whenever
/// [sampleCount] changes (driven by the notifier's live
/// `mappingSampleCapturedEvents` listener — see `MappingSessionNotifier
/// ._startListeningToSamples`) and hands them to [MappingTrailPainter].
/// A separate read rather than a param on [MappingSample] flowing through
/// [MappingSessionUiState] deliberately — the UI state only needs a count
/// for everything else on this screen; full sample rows are only ever
/// needed here, for this one visual.
class _MappingTrailView extends StatefulWidget {
  final int footprintId;
  final int sampleCount;

  const _MappingTrailView({required this.footprintId, required this.sampleCount});

  @override
  State<_MappingTrailView> createState() => _MappingTrailViewState();
}

class _MappingTrailViewState extends State<_MappingTrailView> {
  final _sampleLocalDataSource = MappingSampleLocalDataSource();
  List<MappingSample> _samples = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant _MappingTrailView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sampleCount != widget.sampleCount ||
        oldWidget.footprintId != widget.footprintId) {
      _load();
    }
  }

  Future<void> _load() async {
    final samples = await _sampleLocalDataSource.getAllForFootprint(widget.footprintId);
    if (mounted) setState(() => _samples = samples);
  }

  @override
  Widget build(BuildContext context) {
    // CustomPaint with no child and no explicit size collapses to
    // Size.zero under its incoming constraints (RenderCustomPaint
    // .computeSizeForNoChild) — with only the empty-state branch giving
    // it a child, the moment real samples arrive (child: null) it would
    // shrink to a zero-width sliver and paint nothing, regardless of how
    // correct the painter's own math is. SizedBox.expand forces tight
    // constraints so CustomPaint always fills the available space either
    // way.
    return SizedBox.expand(
      child: CustomPaint(
        painter: MappingTrailPainter(samples: _samples),
        child: _samples.isEmpty
            ? const Center(
                child: Text(
                  'Recorded Movement',
                  style: TextStyle(color: Colors.white24, fontSize: 12),
                ),
              )
            : null,
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  const _StatTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 10,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
