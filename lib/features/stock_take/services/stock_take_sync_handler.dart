import 'dart:convert';

import '../../../core/database/models/sync_operation_model.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/sync/sync_service.dart';
import '../data/datasources/stock_take_local_datasource.dart';
import '../data/datasources/stock_take_remote_datasource.dart';
import '../data/models/stock_take_session_model.dart';

/// Handler for processing stock take sync operations in background
class StockTakeSyncHandler {
  final StockTakeLocalDataSource _localDataSource;
  final StockTakeRemoteDataSource _remoteDataSource;
  final SyncService _syncService;

  StockTakeSyncHandler({
    required StockTakeLocalDataSource localDataSource,
    required StockTakeRemoteDataSource remoteDataSource,
    required SyncService syncService,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource,
       _syncService = syncService;

  /// Process a single sync operation
  Future<bool> processOperation(SyncOperationModel operation) async {
    switch (operation.type) {
      case SyncOperationType.uploadStockTakeSerials:
        return _handleUploadSerials(operation);
      case SyncOperationType.completeStockTake:
        return _handleCompleteStockTake(operation);
      default:
        return false; // Not our operation type
    }
  }

  /// Handle uploading serials for an item
  Future<bool> _handleUploadSerials(SyncOperationModel operation) async {
    final data = jsonDecode(operation.dataJson) as Map<String, dynamic>;
    final sessionLocalId = data['session_local_id'] as String?;

    try {
      await _syncService.markSyncing(operation);

      final sessionServerId = data['session_server_id'] as int?;
      final itemLocalId = data['item_local_id'] as String;
      var itemServerId = data['item_server_id'] as int?;
      final customerProductId = data['customer_product_id'] as int;
      final serialsData = data['serials'] as List<dynamic>;

      if (sessionServerId == null) {
        await _syncService.markFailed(
          operation,
          'Session not synced to server',
        );
        return false;
      }

      // Ensure item has server ID
      if (itemServerId == null) {
        // Try to create item on server
        final itemResponse = await _remoteDataSource.addItem(
          sessionId: sessionServerId,
          customerProductId: customerProductId,
        );
        itemServerId = itemResponse['id'] as int;

        // Update local item with server ID
        final item = await _localDataSource.getItemByLocalId(itemLocalId);
        if (item != null) {
          item.serverId = itemServerId;
          await _localDataSource.updateItem(item);
        }
      }

      // Upload serials
      final serialsToUpload = serialsData
          .map(
            (s) => {
              'serial_number': s['serial_number'],
              'device_scan_id': s['device_scan_id'],
              'device_scanned_at': s['device_scanned_at'],
              if (s['scan_sequence'] != null)
                'scan_sequence': s['scan_sequence'],
            },
          )
          .toList();

      final response = await _remoteDataSource.uploadSerialsBatch(
        sessionId: sessionServerId,
        itemId: itemServerId,
        serials: serialsToUpload,
      );

      // Update local serials as synced
      final uploadedSerials = response['serials'] as List<dynamic>? ?? [];
      for (var i = 0; i < serialsData.length; i++) {
        final localId = serialsData[i]['local_id'] as String;
        final serial = await _localDataSource.getSerialByLocalId(localId);
        if (serial != null) {
          if (i < uploadedSerials.length) {
            final uploadedData = uploadedSerials[i] as Map<String, dynamic>;
            serial.serverId = uploadedData['id'] as int?;
          }
          serial.syncState = SyncState.synced;
          await _localDataSource.updateSerial(serial);
        }
      }

      await _syncService.markSynced(operation);
      return true;
    } on NetworkException catch (e) {
      if (e.statusCode == 404 && sessionLocalId != null) {
        // Same day-scoping auto-cancel case as _handleCompleteStockTake:
        // the session (or item, which can't outlive it) is gone
        // server-side, so this upload will never succeed - fix up the
        // local record instead of retrying against a dead session for an
        // hour.
        await _markLocalSessionStale(sessionLocalId);
      }
      await _syncService.markFailed(operation, e.toString());
      return false;
    } catch (e) {
      await _syncService.markFailed(operation, e.toString());
      return false;
    }
  }

  /// Handle completing a stock take session on server
  Future<bool> _handleCompleteStockTake(SyncOperationModel operation) async {
    final data = jsonDecode(operation.dataJson) as Map<String, dynamic>;
    final sessionLocalId = data['session_local_id'] as String?;

    try {
      await _syncService.markSyncing(operation);

      final sessionServerId = data['session_server_id'] as int?;

      if (sessionServerId == null) {
        await _syncService.markFailed(
          operation,
          'Session not synced to server',
        );
        return false;
      }

      // Complete on server
      await _remoteDataSource.completeSession(sessionServerId);

      await _syncService.markSynced(operation);
      return true;
    } on NetworkException catch (e) {
      if (e.statusCode == 404 && sessionLocalId != null) {
        // The session is gone server-side (e.g. its day-scoping
        // auto-cancel fired sometime between when this was originally
        // queued and this retry running) - it will never accept a
        // completion, so keep retrying pointlessly for up to an hour
        // (the backoff schedule) and instead fix up the local record now,
        // even though the item/serial data queued alongside it is lost.
        await _markLocalSessionStale(sessionLocalId);
      }
      await _syncService.markFailed(operation, e.toString());
      return false;
    } catch (e) {
      await _syncService.markFailed(operation, e.toString());
      return false;
    }
  }

  /// Mark a session cancelled locally when the backend has definitively
  /// (404) stopped recognizing it - see the day-scoping auto-cancel note on
  /// StockTakeRepositoryImpl._reconcileWithBackend for the full picture.
  Future<void> _markLocalSessionStale(String sessionLocalId) async {
    final session = await _localDataSource.getSessionByLocalId(sessionLocalId);
    if (session == null || session.status == StockTakeStatus.cancelled) {
      return;
    }
    session
      ..status = StockTakeStatus.cancelled
      ..cancelledAt = DateTime.now()
      ..cancelReason ??= 'Session no longer found on server';
    await _localDataSource.updateSession(session);
  }

  /// Process all pending stock take operations
  Future<int> processAllPending() async {
    print('[StockTakeSyncHandler] Processing all pending operations...');
    int processed = 0;

    while (true) {
      final operation = await _syncService.getNextOperation();
      if (operation == null) {
        print('[StockTakeSyncHandler] No more operations to process');
        break;
      }

      print('[StockTakeSyncHandler] Found operation: ${operation.type}');

      // Only process stock take operations
      if (operation.type == SyncOperationType.uploadStockTakeSerials ||
          operation.type == SyncOperationType.completeStockTake) {
        print('[StockTakeSyncHandler] Processing ${operation.type}...');
        final success = await processOperation(operation);
        if (success) {
          processed++;
          print(
            '[StockTakeSyncHandler] Successfully processed ${operation.type}',
          );
        } else {
          print('[StockTakeSyncHandler] Failed to process ${operation.type}');
        }
      } else {
        print(
          '[StockTakeSyncHandler] Skipping non-stock-take operation: ${operation.type}',
        );
      }
    }

    print(
      '[StockTakeSyncHandler] Finished processing. Total processed: $processed',
    );
    return processed;
  }
}
