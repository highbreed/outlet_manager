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

class IsarDatabase {
  static Isar? _instance;

  static Future<Isar> getInstance() async {
    if (_instance != null) return _instance!;

    final dir = await getApplicationDocumentsDirectory();

    _instance = await Isar.open(
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
      ],
      directory: dir.path,
      name: 'outlet_manager',
    );

    return _instance!;
  }

  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
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
