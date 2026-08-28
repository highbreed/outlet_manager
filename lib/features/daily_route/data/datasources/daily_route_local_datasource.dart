import 'package:isar_community/isar.dart';

import '../../../../core/database/isar_database.dart';
import '../models/daily_route_model.dart';
import '../models/outlet_visit_model.dart' as visit_model;
import '../models/geofence_override_model.dart' as override_model;

// Type aliases for cleaner code
typedef OutletVisitModel = visit_model.OutletVisitModel;
typedef VisitStatusModel = visit_model.VisitStatusModel;
typedef GeofenceOverrideModel = override_model.GeofenceOverrideModel;
typedef GeofenceOverrideStatusModel =
    override_model.GeofenceOverrideStatusModel;

/// Local data source for daily route operations using Isar.
///
/// Handles all local database CRUD operations for routes, visits, and overrides.
abstract class DailyRouteLocalDataSource {
  // === Daily Route Operations ===

  /// Get route by local ID
  Future<DailyRouteModel?> getRouteByLocalId(String localId);

  /// Get route by server ID
  Future<DailyRouteModel?> getRouteByServerId(String serverId);

  /// Get route for a specific date and agent
  Future<DailyRouteModel?> getRouteForDate(String agentId, DateTime date);

  /// Get unclosed route (activated or in_progress)
  Future<DailyRouteModel?> getUnclosedRoute(String agentId);

  /// Save or update a route (returns Isar ID)
  Future<int> saveRoute(DailyRouteModel route);

  /// Delete route by local ID
  Future<bool> deleteRoute(String localId);

  /// Get routes needing sync
  Future<List<DailyRouteModel>> getRoutesNeedingSync();

  // === Outlet Visit Operations ===

  /// Get visit by local ID
  Future<OutletVisitModel?> getVisitByLocalId(String localId);

  /// Get visit by server ID
  Future<OutletVisitModel?> getVisitByServerId(String serverId);

  /// Get all visits for a route
  Future<List<OutletVisitModel>> getVisitsForRoute(String routeLocalId);

  /// Get active visit (in_progress status)
  Future<OutletVisitModel?> getActiveVisit(String routeLocalId);

  /// Save or update a visit (returns Isar ID)
  Future<int> saveVisit(OutletVisitModel visit);

  /// Save multiple visits in a transaction
  Future<void> saveVisits(List<OutletVisitModel> visits);

  /// Delete visit by local ID
  Future<bool> deleteVisit(String localId);

  /// Get visits needing sync
  Future<List<OutletVisitModel>> getVisitsNeedingSync();

  // === Geofence Override Operations ===

  /// Get override by local ID
  Future<GeofenceOverrideModel?> getOverrideByLocalId(String localId);

  /// Get pending override for a visit
  Future<GeofenceOverrideModel?> getPendingOverrideForVisit(
    String visitLocalId,
  );

  /// Get the most recent override for a visit regardless of status
  Future<GeofenceOverrideModel?> getLatestOverrideForVisit(
    String visitLocalId,
  );

  /// Save or update an override request
  Future<int> saveOverride(GeofenceOverrideModel override);

  /// Get overrides needing sync
  Future<List<GeofenceOverrideModel>> getOverridesNeedingSync();
}

/// Implementation of [DailyRouteLocalDataSource] using Isar database.
class DailyRouteLocalDataSourceImpl implements DailyRouteLocalDataSource {
  Future<Isar> get _isar => IsarDatabase.getInstance();

  // === Daily Route Operations ===

  @override
  Future<DailyRouteModel?> getRouteByLocalId(String localId) async {
    final isar = await _isar;
    return isar.dailyRouteModels.where().localIdEqualTo(localId).findFirst();
  }

  @override
  Future<DailyRouteModel?> getRouteByServerId(String serverId) async {
    final isar = await _isar;
    return isar.dailyRouteModels.where().serverIdEqualTo(serverId).findFirst();
  }

  @override
  Future<DailyRouteModel?> getRouteForDate(
    String agentId,
    DateTime date,
  ) async {
    final isar = await _isar;

    // Normalize to start of day
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return isar.dailyRouteModels
        .where()
        .salesAgentIdEqualTo(agentId)
        .filter()
        .routeDateBetween(startOfDay, endOfDay, includeUpper: false)
        .findFirst();
  }

  @override
  Future<DailyRouteModel?> getUnclosedRoute(String agentId) async {
    final isar = await _isar;
    return isar.dailyRouteModels
        .where()
        .salesAgentIdEqualTo(agentId)
        .filter()
        .statusEqualTo(DailyRouteStatusModel.activated)
        .or()
        .statusEqualTo(DailyRouteStatusModel.inProgress)
        .findFirst();
  }

  @override
  Future<int> saveRoute(DailyRouteModel route) async {
    final isar = await _isar;

    // Check if exists by localId to get existing Isar ID
    final existing = await getRouteByLocalId(route.localId);
    if (existing != null) {
      route.id = existing.id;
    }

    return isar.writeTxn(() => isar.dailyRouteModels.put(route));
  }

  @override
  Future<bool> deleteRoute(String localId) async {
    final isar = await _isar;
    final route = await getRouteByLocalId(localId);
    if (route == null || route.id == null) return false;

    return isar.writeTxn(() => isar.dailyRouteModels.delete(route.id!));
  }

  @override
  Future<List<DailyRouteModel>> getRoutesNeedingSync() async {
    final isar = await _isar;
    return isar.dailyRouteModels
        .where()
        .filter()
        .syncStateEqualTo(SyncStateModel.localOnly)
        .or()
        .syncStateEqualTo(SyncStateModel.syncFailed)
        .findAll();
  }

  // === Outlet Visit Operations ===

  @override
  Future<OutletVisitModel?> getVisitByLocalId(String localId) async {
    final isar = await _isar;
    return isar.outletVisitModels.where().localIdEqualTo(localId).findFirst();
  }

  @override
  Future<OutletVisitModel?> getVisitByServerId(String serverId) async {
    final isar = await _isar;
    return isar.outletVisitModels.where().serverIdEqualTo(serverId).findFirst();
  }

  @override
  Future<List<OutletVisitModel>> getVisitsForRoute(String routeLocalId) async {
    final isar = await _isar;
    return isar.outletVisitModels
        .where()
        .dailyRouteLocalIdEqualTo(routeLocalId)
        .sortByVisitOrder()
        .findAll();
  }

  @override
  Future<OutletVisitModel?> getActiveVisit(String routeLocalId) async {
    final isar = await _isar;
    return isar.outletVisitModels
        .where()
        .dailyRouteLocalIdEqualTo(routeLocalId)
        .filter()
        .statusEqualTo(VisitStatusModel.inProgress)
        .findFirst();
  }

  @override
  Future<int> saveVisit(OutletVisitModel visit) async {
    final isar = await _isar;

    // Check if exists by localId to get existing Isar ID
    final existing = await getVisitByLocalId(visit.localId);
    if (existing != null) {
      visit.id = existing.id;
    }

    return isar.writeTxn(() => isar.outletVisitModels.put(visit));
  }

  @override
  Future<void> saveVisits(List<OutletVisitModel> visits) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      for (final visit in visits) {
        final existing = await isar.outletVisitModels
            .where()
            .localIdEqualTo(visit.localId)
            .findFirst();
        if (existing != null) {
          visit.id = existing.id;
        }
      }
      await isar.outletVisitModels.putAll(visits);
    });
  }

  @override
  Future<bool> deleteVisit(String localId) async {
    final isar = await _isar;
    final visit = await getVisitByLocalId(localId);
    if (visit == null || visit.id == null) return false;

    return isar.writeTxn(() => isar.outletVisitModels.delete(visit.id!));
  }

  @override
  Future<List<OutletVisitModel>> getVisitsNeedingSync() async {
    final isar = await _isar;
    return isar.outletVisitModels
        .where()
        .filter()
        .syncStateEqualTo(visit_model.SyncStateModel.localOnly)
        .or()
        .syncStateEqualTo(visit_model.SyncStateModel.syncFailed)
        .findAll();
  }

  // === Geofence Override Operations ===

  @override
  Future<GeofenceOverrideModel?> getOverrideByLocalId(String localId) async {
    final isar = await _isar;
    return isar.geofenceOverrideModels
        .where()
        .localIdEqualTo(localId)
        .findFirst();
  }

  @override
  Future<GeofenceOverrideModel?> getPendingOverrideForVisit(
    String visitLocalId,
  ) async {
    final isar = await _isar;
    return isar.geofenceOverrideModels
        .where()
        .outletVisitLocalIdEqualTo(visitLocalId)
        .filter()
        .statusEqualTo(GeofenceOverrideStatusModel.pending)
        .findFirst();
  }

  @override
  Future<GeofenceOverrideModel?> getLatestOverrideForVisit(
    String visitLocalId,
  ) async {
    final isar = await _isar;
    return isar.geofenceOverrideModels
        .where()
        .outletVisitLocalIdEqualTo(visitLocalId)
        .sortByCreatedAtDesc()
        .findFirst();
  }

  @override
  Future<int> saveOverride(GeofenceOverrideModel override) async {
    final isar = await _isar;

    final existing = await getOverrideByLocalId(override.localId);
    if (existing != null) {
      override.id = existing.id;
    }

    return isar.writeTxn(() => isar.geofenceOverrideModels.put(override));
  }

  @override
  Future<List<GeofenceOverrideModel>> getOverridesNeedingSync() async {
    final isar = await _isar;
    return isar.geofenceOverrideModels
        .where()
        .filter()
        .syncStateEqualTo(override_model.SyncStateModel.localOnly)
        .or()
        .syncStateEqualTo(override_model.SyncStateModel.syncFailed)
        .findAll();
  }
}
