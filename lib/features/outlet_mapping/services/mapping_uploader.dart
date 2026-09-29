import 'dart:developer' as developer;

import '../../../core/network/failures.dart';
import '../data/datasources/mapping_sample_local_datasource.dart';
import '../domain/repositories/outlet_mapping_repository.dart';

/// The single owner of mapping-sample upload/retry (spec §13/§29/§66).
/// Nothing else in this feature is allowed to call
/// `OutletMappingRepository.uploadSamples` directly — that's what makes
/// "one owner of retry" true by construction, not convention.
///
/// Serialized per footprint: [drain] guards itself with an in-flight set
/// so a screen-triggered call, a connectivity-restored call, a startup-
/// recovery call, and a periodic opportunistic call can never run
/// concurrently for the same footprint (spec §34/§66).
class MappingUploader {
  final OutletMappingRepository _repository;
  final MappingSampleLocalDataSource _localDataSource;

  final Set<int> _inFlightFootprints = {};

  MappingUploader({
    required OutletMappingRepository repository,
    required MappingSampleLocalDataSource localDataSource,
  })  : _repository = repository,
        _localDataSource = localDataSource;

  /// Result of one drain pass — how many batches succeeded/failed, and
  /// whether the queue is now fully empty for this footprint (the signal
  /// [MappingSessionNotifier] needs to know it's safe to call `/finish`,
  /// spec §52).
  Future<MappingDrainResult> drain(int footprintId, {required int maxBatch}) async {
    if (_inFlightFootprints.contains(footprintId)) {
      return const MappingDrainResult(
        batchesSent: 0,
        batchesFailed: 0,
        queueEmpty: false,
        alreadyInFlight: true,
      );
    }
    _inFlightFootprints.add(footprintId);
    try {
      var batchesSent = 0;
      var batchesFailed = 0;
      Failure? terminalFailure;
      int? lastServerTotalSamples;

      while (true) {
        final pending = await _localDataSource.getPendingForFootprint(
          footprintId,
          limit: maxBatch,
        );
        if (pending.isEmpty) break;

        final localIds = pending.map((s) => s.localId).toList();
        await _localDataSource.markBatchSyncing(localIds);

        final result = await _repository.uploadSamples(
          footprintId: footprintId,
          samples: pending,
        );

        final stop = await result.fold(
          (failure) async {
            batchesFailed++;
            await _localDataSource.markBatchFailed(localIds, failure.displayMessage);
            developer.log(
              '[MappingUploader] batch failed footprint=$footprintId '
              'count=${localIds.length}: ${failure.displayMessage}',
              name: 'MappingUploader',
            );
            // A conflict/forbidden/not-found failure means retrying THIS
            // batch blindly won't help — stop the drain loop and surface
            // the failure so the caller (notifier) can reconcile via
            // capture-status rather than spin. A plain network/server
            // failure just stops this pass; the next trigger (online-
            // restored, resume, periodic) tries again.
            if (failure is OutletMappingFailure) terminalFailure = failure;
            return true;
          },
          (response) async {
            // 200 means every row in the batch — new AND duplicate — was
            // durably accepted by the backend (spec §29: duplicates are
            // successful idempotent delivery, not failures).
            await _localDataSource.markBatchSynced(localIds);
            batchesSent++;
            lastServerTotalSamples = response.totalSamples;
            developer.log(
              '[MappingUploader] batch synced footprint=$footprintId '
              'received=${response.received} acceptedNew=${response.acceptedNew} '
              'duplicates=${response.duplicates} totalSamples=${response.totalSamples}',
              name: 'MappingUploader',
            );
            return false;
          },
        );

        if (stop) break;
      }

      final remaining = await _localDataSource.countPendingForFootprint(footprintId);
      return MappingDrainResult(
        batchesSent: batchesSent,
        batchesFailed: batchesFailed,
        queueEmpty: remaining == 0,
        terminalFailure: terminalFailure,
        lastServerTotalSamples: lastServerTotalSamples,
      );
    } finally {
      _inFlightFootprints.remove(footprintId);
    }
  }
}

class MappingDrainResult {
  final int batchesSent;
  final int batchesFailed;
  final bool queueEmpty;
  final bool alreadyInFlight;
  final Failure? terminalFailure;

  /// The backend's own `total_samples` from the last successful batch in
  /// this drain pass, if any — used to keep `MappingSession
  /// .lastKnownServerTotalSamples` current as a defensive floor for the
  /// `max_samples` guard (spec §30 of the hardening pass).
  final int? lastServerTotalSamples;

  const MappingDrainResult({
    required this.batchesSent,
    required this.batchesFailed,
    required this.queueEmpty,
    this.alreadyInFlight = false,
    this.terminalFailure,
    this.lastServerTotalSamples,
  });
}
