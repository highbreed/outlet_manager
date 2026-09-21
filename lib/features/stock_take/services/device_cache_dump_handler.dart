import 'dart:developer' as developer;

import 'package:dio/dio.dart';

import '../../../core/database/isar_database.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/isolate_auth_context.dart';
import '../data/datasources/stock_take_local_datasource.dart';
import '../data/models/models.dart';

/// Handles a silent "device cache dump" FCM data push: support/ops asking
/// this device, right now, what it has cached locally and unsynced for a
/// given stock count session - e.g. when what's on the server doesn't
/// match what the agent says they did.
///
/// Called from both [firebaseMessagingBackgroundHandler] (app
/// backgrounded/terminated) and [FcmService]'s foreground message
/// listener, so it must be fully self-contained: no Riverpod `Ref`, no
/// `BuildContext`, only isolate-safe singletons (`IsarDatabase`,
/// `TokenStorage`, a standalone `Dio`) - the same pattern
/// `location_ping_worker.dart` uses for background WorkManager tasks, for
/// the same reason (`AuthInterceptor`/`dioProvider` need a Riverpod `Ref`
/// that doesn't exist in a fresh isolate).
///
/// [data] is the `data` map from the FCM `RemoteMessage`, expected to carry
/// `request_id` (String) and `session_id` (the *server* stock count
/// session id, not any local id).
Future<void> handleCacheDumpRequest(Map<String, dynamic> data) async {
  final receivedAt = DateTime.now();
  final requestId = data['request_id'] as String?;
  final sessionServerId = _asInt(data['session_id']);

  // Logged unconditionally, before any validation - this push is
  // best-effort and can be delayed or dropped entirely by the OS (battery
  // optimization / Low Power Mode / app not running), so confirming it was
  // actually received on-device at all is the main thing worth being able
  // to check later, separate from whether we go on to report successfully.
  // developer.log only reaches an attached debugger though, which won't be
  // the case for most real background deliveries - see received_at below
  // for the copy of this that actually reaches the support staff who
  // requested the dump.
  developer.log(
    '[DeviceCacheDump] Received cache_dump_request at '
    '${receivedAt.toIso8601String()} - request_id=$requestId, '
    'session_id=$sessionServerId, raw=$data',
    name: 'DeviceCacheDump',
  );

  if (requestId == null || requestId.isEmpty || sessionServerId == null) {
    developer.log(
      '[DeviceCacheDump] Malformed push data, dropping: $data',
      name: 'DeviceCacheDump',
    );
    return;
  }

  try {
    final payload = await _buildPayload(sessionServerId)
      ..['received_at'] = receivedAt.toIso8601String();
    await _report(requestId: requestId, payload: payload);
  } catch (e, st) {
    // Best-effort and silent by design - there's no user-facing surface to
    // show an error on, and the backend request simply reads back as
    // "expired" (10 minutes after creation) if we never report.
    developer.log(
      '[DeviceCacheDump] Failed to handle request $requestId: $e',
      name: 'DeviceCacheDump',
      error: e,
      stackTrace: st,
    );
  }
}

int? _asInt(Object? value) {
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}

/// Reads whatever this device has cached locally for [sessionServerId] and
/// shapes it into a payload useful for a human comparing it against the
/// server's view of the same session. The shape here is entirely our own
/// call - the backend stores it as-is and never validates or merges it
/// into any live table.
Future<Map<String, dynamic>> _buildPayload(int sessionServerId) async {
  final isar = await IsarDatabase.getInstance();
  final localDataSource = StockTakeLocalDataSource(isar);

  final session = await localDataSource.getSessionByServerId(sessionServerId);
  if (session == null) {
    // Report an explanatory empty payload rather than silently dropping -
    // silence looks identical to "the push never arrived" from the staff
    // side, and only one of those is actionable. This is the expected,
    // correct outcome when the session was already fully synced, or
    // belongs to a different device the agent used.
    return {
      'found': false,
      'reason': 'No local record for this session on this device',
    };
  }

  final items = await localDataSource.getSessionItems(session.localId);
  final itemPayloads = <Map<String, dynamic>>[];
  var totalSerials = 0;
  var pendingSerials = 0;

  for (final item in items) {
    final serials = await localDataSource.getItemSerials(item.localId);
    totalSerials += serials.length;
    pendingSerials += serials
        .where((s) => s.syncState != SyncState.synced)
        .length;

    itemPayloads.add({
      'item_code': item.itemCode,
      'item_name': item.itemName,
      'model_number': item.modelNumber,
      'counted_quantity': item.serialCount,
      'min_stock_level': item.minStockLevel,
      'max_stock_level': item.maxStockLevel,
      'status': item.status.name,
      'sync_state': item.syncState.name,
      'sync_error': item.syncError,
      'server_id': item.serverId,
      'started_at': item.startedAt.toIso8601String(),
      'updated_at': item.updatedAt.toIso8601String(),
      'serials': serials
          .map(
            (s) => {
              'serial_number': s.serialNumberRaw,
              'status': s.status.name,
              'sync_state': s.syncState.name,
              'sync_error': s.syncError,
              'server_id': s.serverId,
              'scanned_at': s.scannedAt.toIso8601String(),
              'device_scan_id': s.deviceScanId,
            },
          )
          .toList(),
    });
  }

  return {
    'found': true,
    'session': {
      'local_id': session.localId,
      'server_id': session.serverId,
      'status': session.status.name,
      'sync_state': session.syncState.name,
      'sync_error': session.syncError,
      'outlet_code': session.outletCode,
      'outlet_name': session.outletName,
      'warehouse_id': session.warehouseId,
      'warehouse_name': session.warehouseName,
      'total_products': session.totalProducts,
      'total_serials': session.totalSerials,
      'started_at': session.startedAt.toIso8601String(),
      'completed_at': session.completedAt?.toIso8601String(),
      'cancelled_at': session.cancelledAt?.toIso8601String(),
      'last_synced_at': session.lastSyncedAt?.toIso8601String(),
    },
    'item_count': items.length,
    'serial_count': totalSerials,
    'pending_serial_count': pendingSerials,
    'items': itemPayloads,
  };
}

Future<void> _report({
  required String requestId,
  required Map<String, dynamic> payload,
}) async {
  final apiBaseUrl = resolveIsolateApiBaseUrl(resolveIsolateRegion());
  final accessToken = await resolveIsolateAccessToken(apiBaseUrl);
  if (accessToken == null || accessToken.isEmpty) {
    developer.log(
      '[DeviceCacheDump] No usable access token, cannot report $requestId',
      name: 'DeviceCacheDump',
    );
    return;
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      headers: {'Authorization': 'Bearer $accessToken'},
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  try {
    await dio.post(
      ApiEndpoints.deviceCacheReport(requestId),
      data: {'payload': payload},
    );
    developer.log(
      '[DeviceCacheDump] Reported $requestId',
      name: 'DeviceCacheDump',
    );
  } on DioException catch (e) {
    final status = e.response?.statusCode;
    // 403 - not addressed to the currently logged-in user (e.g. someone
    // logged out/in between the push being sent and handled) - and 404 -
    // unknown/expired request_id - are both explicitly documented as safe
    // to silently drop; anything else is worth the log above via rethrow.
    if (status == 403 || status == 404) {
      developer.log(
        '[DeviceCacheDump] Dropping $requestId ($status)',
        name: 'DeviceCacheDump',
      );
      return;
    }
    rethrow;
  }
}
