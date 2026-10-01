import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/attachment_model.dart';
import 'models/clock_in_session_model.dart';
import 'models/clock_session_event_model.dart';
import 'models/entity_id_map_model.dart';
import 'models/permission_cache_model.dart';
import 'models/price_cache_model.dart';
import 'models/route_activation_model.dart';
import 'models/route_model.dart';
import 'models/stock_take_entry_model.dart';
import 'models/sync_operation_model.dart';

// Daily Route Feature Models
import '../../features/daily_route/data/models/daily_route_model.dart';
import '../../features/daily_route/data/models/outlet_visit_model.dart';
import '../../features/daily_route/data/models/geofence_override_model.dart';

// Location Tracking Feature Models
import '../../features/location_tracking/data/models/location_ping_model.dart';

// Visit Schedules Feature Models
import '../../features/visit_schedules/data/models/visit_schedule_model.dart';

// Stock Take Feature Models
import '../../features/stock_take/data/models/agent_brand_model.dart';
import '../../features/stock_take/data/models/customer_product_model.dart';
import '../../features/stock_take/data/models/warehouse_model.dart';
import '../../features/stock_take/data/models/stock_take_session_model.dart';
import '../../features/stock_take/data/models/stock_take_item_model.dart';
import '../../features/stock_take/data/models/serial_number_entry_model.dart';

// Item Groups Feature Models
import '../../features/item_groups/data/models/item_group_model.dart';

// Shelf Share Feature Models
import '../../features/shelf_share/data/models/shelf_share_session_model.dart';

// Facings Count Feature Models
import '../../features/facings_count/data/models/facings_count_model.dart';

// Daily Sales Feature Models
import '../../features/daily_sales/data/models/daily_sale_model.dart';

// Outlet Mapping Feature Models
import '../../features/outlet_mapping/data/models/mapping_session_model.dart';
import '../../features/outlet_mapping/data/models/mapping_sample_model.dart';

class IsarDatabase {
  static Isar? _instance;

  // A caller wrapping getInstance() in Future.timeout() (see
  // AppInitializationService._initializeDatabase) only stops *waiting* on
  // Isar.open() — it doesn't cancel the underlying native call, which keeps
  // running. Without this cache, a retry after that timeout would call
  // Isar.open() a second time for the same name while the first call is
  // still in flight: at best wasted work, at worst a race at the native
  // mdbx layer or an `IsarError('Instance has already been opened.')` once
  // the orphaned first call eventually completes. Caching the in-flight
  // Future means every caller — the timed-out phase, a retry, any other
  // getInstance() call made while opening is still in progress — awaits
  // the one real open attempt instead of starting a new one. This also
  // means a retry after a merely-slow (not truly hung) open resolves
  // near-instantly once that original call finally finishes.
  static Future<Isar>? _openingFuture;

  static Future<Isar> getInstance() {
    if (_instance != null) return Future.value(_instance!);
    return _openingFuture ??= _open();
  }

  // Field-reported regression (2026-09-30, the day after the
  // isar_community 3.3.2 upgrade shipped — see that migration's commit).
  // Two different devices hit two different symptoms of the same
  // underlying cause: one got "IsarError: Cannot open Environment:
  // MdbxError (11). Try again" (mdbx's EAGAIN — "locked by someone else,
  // try again", not corruption); another just hung until
  // AppInitializationService's phase timeout killed it ("TimeoutException
  // ... Future not completed"). Both are consistent with lock contention
  // on the same on-disk mdbx environment, opened from more than one
  // isolate/engine independently: `backgroundGeolocationHeadlessTask` (see
  // background_geolocation_service.dart) runs in "a fresh, minimal engine
  // that never ran this app's own main()" on every 5-minute heartbeat
  // while fully terminated, and calls IsarDatabase.getInstance() from THAT
  // isolate — which has its own separate static `_instance`/
  // `_openingFuture` (Dart statics aren't shared across isolates), so it
  // always calls Isar.open() fresh rather than reusing the main engine's
  // already-open handle. If that headless open ever overlaps with the
  // main app's own startup open, mdbx serializes the two: the loser either
  // gets an immediate EAGAIN or blocks until the winner closes.
  //
  // Only the fast-throwing EAGAIN case is retried HERE, immediately and
  // safely — the previous attempt has genuinely completed (thrown) before
  // the next one starts, so there's no risk of two concurrent native
  // Isar.open() calls for the same name in this isolate. The hang case is
  // deliberately NOT handled by abandoning-and-retrying an attempt from
  // here: per this class's own `_openingFuture` doc comment, a Dart-level
  // timeout doesn't cancel the underlying native call, so racing a second
  // attempt on top of a still-running first one risks exactly the
  // `IsarError('Instance has already been opened.')` collision that cache
  // exists to prevent. The hang case is instead handled by
  // AppInitializationService giving the one real, legitimately-slow
  // attempt more time before its outer phase timeout gives up — see that
  // file's own comment on the database phase.
  static const _lockRetryAttempts = 4;
  static const _lockRetryBaseDelay = Duration(milliseconds: 500);

  static bool _isTransientLockError(Object e) =>
      e.toString().contains('Cannot open Environment') ||
      e.toString().contains('MdbxError');

  static Future<Isar> _open() async {
    try {
      final dir = await getApplicationDocumentsDirectory();

      Isar isar;
      var attempt = 0;
      while (true) {
        try {
          isar = await _openIsar(dir.path);
          break;
        } catch (e) {
          attempt++;
          if (attempt >= _lockRetryAttempts || !_isTransientLockError(e)) {
            rethrow;
          }
          await Future.delayed(_lockRetryBaseDelay * attempt);
        }
      }

      _instance = isar;
      return isar;
    } finally {
      // Whether it succeeded or threw, this attempt is no longer "in
      // flight" — a future getInstance() call (e.g. the next retry) should
      // start a fresh attempt rather than replaying a failed one forever.
      _openingFuture = null;
    }
  }

  static Future<Isar> _openIsar(String directoryPath) {
    return Isar.open(
      [
        ClockInSessionModelSchema,
        ClockSessionEventModelSchema,
        EntityIdMapModelSchema,
        SyncOperationModelSchema,
        AttachmentModelSchema,
        PermissionCacheModelSchema,
        PriceCacheModelSchema,
        StockTakeEntryModelSchema,
        RouteModelSchema,
        RouteActivationModelSchema,
        // Daily Route Feature Collections
        DailyRouteModelSchema,
        OutletVisitModelSchema,
        GeofenceOverrideModelSchema,
        // Location Tracking Feature Collections
        LocationPingModelSchema,
        // Visit Schedules Feature Collections
        VisitScheduleModelSchema,
        // Stock Take Feature Collections
        AgentBrandModelSchema,
        CustomerProductModelSchema,
        WarehouseModelSchema,
        StockTakeSessionModelSchema,
        StockTakeItemModelSchema,
        SerialNumberEntryModelSchema,
        // Item Groups Feature Collections
        ItemGroupModelSchema,
        // Shelf Share Feature Collections
        ShelfShareSessionModelSchema,
        // Facings Count Feature Collections
        FacingsCountModelSchema,
        // Daily Sales Feature Collections
        DailySaleModelSchema,
        // Outlet Mapping Feature Collections
        MappingSessionModelSchema,
        MappingSampleModelSchema,
      ],
      directory: directoryPath,
      name: 'outlet_manager',
    );
  }

  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
    _openingFuture = null;
  }

  /// Clear all data (for testing or logout)
  static Future<void> clearAll() async {
    final isar = await getInstance();
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }

  // ==================== PERMISSION CACHE ====================

  /// Get permission cache
  Future<PermissionCacheModel?> getPermissionCache() async {
    final isar = await getInstance();
    return isar.permissionCacheModels.where().findFirst();
  }

  /// Save permission cache
  Future<void> savePermissionCache(PermissionCacheModel cache) async {
    final isar = await getInstance();
    await isar.writeTxn(() async {
      await isar.permissionCacheModels.clear();
      await isar.permissionCacheModels.put(cache);
    });
  }

  /// Clear permission cache
  Future<void> clearPermissionCache() async {
    final isar = await getInstance();
    await isar.writeTxn(() async {
      await isar.permissionCacheModels.clear();
    });
  }

  // ==================== STOCK TAKE ====================

  /// Clear stock take reference caches (agent brands, customer products,
  /// warehouses) on logout so a different user logging in on the same
  /// device never briefly sees the previous user's cached catalogue.
  ///
  /// Deliberately does NOT touch session/item/serial collections: those
  /// hold offline-first stock count data that may not be synced to the
  /// server yet, and are already scoped to the logged-in agent at query
  /// time (see StockTakeLocalDataSource.getActiveSessions /
  /// getAllActiveSessions), so leaving them in place is safe.
  static Future<void> clearStockTakeCache() async {
    final isar = await getInstance();
    await isar.writeTxn(() async {
      await isar.agentBrandModels.clear();
      await isar.customerProductModels.clear();
      await isar.warehouseModels.clear();
    });
  }
}
