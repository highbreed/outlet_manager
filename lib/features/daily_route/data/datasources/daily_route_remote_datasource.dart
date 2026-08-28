import 'package:dio/dio.dart';

import '../../domain/entities/daily_route.dart';
import '../../domain/entities/outlet_visit.dart';
import '../../domain/entities/geofence_override_request.dart';
import '../../domain/entities/day_status.dart';
import '../../domain/usecases/get_todays_route_usecase.dart';

/// Remote data source for daily route operations.
///
/// Connects to the backend API at `/api/v1/visits/`.
abstract class DailyRouteRemoteDataSource {
  // === Route Operations ===

  /// Activate today's route
  /// POST /routes/activate
  Future<DailyRouteResponse> activateRoute();

  /// Get today's route with visits
  /// GET /routes/today
  Future<DailyRouteWithVisitsResponse> getTodaysRoute();

  /// Get pending routes (unclosed routes from previous dates)
  /// GET /routes/pending
  Future<List<PendingRouteResponse>> getPendingRoutes();

  /// Get a specific route by ID with its visits
  /// GET /routes/{route_id}
  Future<DailyRouteWithVisitsResponse> getRouteById(String routeId);

  /// Single-call snapshot of the agent's day: blocked / not scheduled /
  /// not activated / active / at outlet / in transit / completed. Meant to
  /// be polled — replaces stitching `/routes/today` + `/routes/pending` +
  /// 404 handling together, and is the cheapest way to notice server-side
  /// changes (e.g. a supervisor force-closing the route).
  /// GET /routes/day-status
  Future<DayStatusResponse> getDayStatus();

  /// Close a route
  /// POST /routes/{route_id}/close
  Future<DailyRouteResponse> closeRoute(
    String routeId, {
    String? closingNotes,
    List<Map<String, dynamic>>? skippedVisits,
  });

  /// Force close a route (admin only)
  /// POST /routes/{route_id}/force-close
  Future<DailyRouteResponse> forceCloseRoute(
    String routeId, {
    required String reason,
    String? notes,
  });

  // === Visit Operations ===

  /// Clock in to a visit
  /// POST /{visit_id}/clock-in
  Future<OutletVisitResponse> clockIn(
    String visitId, {
    required double latitude,
    required double longitude,
    required double accuracy,
    String? notes,
    String? overrideRequestId,
  });

  /// Clock out from a visit
  /// POST /{visit_id}/clock-out
  Future<OutletVisitResponse> clockOut(
    String visitId, {
    required double latitude,
    required double longitude,
    required double accuracy,
    String? notes,
  });

  /// Skip a visit
  /// POST /{visit_id}/skip
  Future<OutletVisitResponse> skipVisit(
    String visitId, {
    required int reasonId,
    String? notes,
  });

  // === Override Operations ===

  /// Request geofence override
  /// POST /{visit_id}/request-override
  Future<GeofenceOverrideResponse> requestOverride(
    String visitId, {
    required double latitude,
    required double longitude,
    required double accuracy,
    required String reason,
  });

  /// Get pending override status
  /// GET /overrides/{request_id}
  Future<GeofenceOverrideResponse> getOverrideStatus(String requestId);

  // === Admin Operations ===

  /// Get skip reasons
  /// GET /skip-reasons
  Future<List<SkipReasonResponse>> getSkipReasons();
}

/// Implementation of [DailyRouteRemoteDataSource] using Dio.
class DailyRouteRemoteDataSourceImpl implements DailyRouteRemoteDataSource {
  final Dio _dio;

  // Note: apiBaseUrl already includes /api/v1, so we only need the resource path
  static const String _basePath = '/visits';

  DailyRouteRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  // === Route Operations ===

  @override
  Future<DailyRouteResponse> activateRoute() async {
    final response = await _dio.post('$_basePath/routes/activate');
    return DailyRouteResponse.fromJson(response.data);
  }

  @override
  Future<DailyRouteWithVisitsResponse> getTodaysRoute() async {
    final response = await _dio.get('$_basePath/routes/today');
    return DailyRouteWithVisitsResponse.fromJson(response.data);
  }

  @override
  Future<List<PendingRouteResponse>> getPendingRoutes() async {
    final response = await _dio.get('$_basePath/routes/pending');
    final List<dynamic> data = response.data as List<dynamic>;
    return data
        .map(
          (json) => PendingRouteResponse.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<DailyRouteWithVisitsResponse> getRouteById(String routeId) async {
    final response = await _dio.get('$_basePath/routes/$routeId');
    return DailyRouteWithVisitsResponse.fromJson(response.data);
  }

  @override
  Future<DayStatusResponse> getDayStatus() async {
    final response = await _dio.get('$_basePath/routes/day-status');
    return DayStatusResponse.fromJson(response.data);
  }

  @override
  Future<DailyRouteResponse> closeRoute(
    String routeId, {
    String? closingNotes,
    List<Map<String, dynamic>>? skippedVisits,
  }) async {
    final response = await _dio.post(
      '$_basePath/routes/$routeId/close',
      data: {
        if (closingNotes != null) 'closing_notes': closingNotes,
        if (skippedVisits != null) 'skipped_visits': skippedVisits,
      },
    );
    return DailyRouteResponse.fromJson(response.data);
  }

  @override
  Future<DailyRouteResponse> forceCloseRoute(
    String routeId, {
    required String reason,
    String? notes,
  }) async {
    final response = await _dio.post(
      '$_basePath/routes/$routeId/force-close',
      data: {'reason': reason, if (notes != null) 'notes': notes},
    );
    return DailyRouteResponse.fromJson(response.data);
  }

  // === Visit Operations ===

  @override
  Future<OutletVisitResponse> clockIn(
    String visitId, {
    required double latitude,
    required double longitude,
    required double accuracy,
    String? notes,
    String? overrideRequestId,
  }) async {
    final response = await _dio.post(
      '$_basePath/$visitId/clock-in',
      data: {
        'latitude': latitude,
        'longitude': longitude,
        'accuracy_meters': accuracy,
        if (notes != null) 'notes': notes,
        if (overrideRequestId != null) 'override_request_id': overrideRequestId,
      },
    );
    return OutletVisitResponse.fromJson(response.data);
  }

  @override
  Future<OutletVisitResponse> clockOut(
    String visitId, {
    required double latitude,
    required double longitude,
    required double accuracy,
    String? notes,
  }) async {
    final response = await _dio.post(
      '$_basePath/$visitId/clock-out',
      data: {
        'latitude': latitude,
        'longitude': longitude,
        'accuracy_meters': accuracy,
        if (notes != null) 'notes': notes,
      },
    );
    return OutletVisitResponse.fromJson(response.data);
  }

  @override
  Future<OutletVisitResponse> skipVisit(
    String visitId, {
    required int reasonId,
    String? notes,
  }) async {
    final response = await _dio.post(
      '$_basePath/$visitId/skip',
      data: {'reason_id': reasonId, if (notes != null) 'notes': notes},
    );
    return OutletVisitResponse.fromJson(response.data);
  }

  // === Override Operations ===

  @override
  Future<GeofenceOverrideResponse> requestOverride(
    String visitId, {
    required double latitude,
    required double longitude,
    required double accuracy,
    required String reason,
  }) async {
    final response = await _dio.post(
      '$_basePath/$visitId/request-override',
      data: {
        'latitude': latitude,
        'longitude': longitude,
        'accuracy': accuracy,
        'reason': reason,
      },
    );
    return GeofenceOverrideResponse.fromJson(response.data);
  }

  @override
  Future<GeofenceOverrideResponse> getOverrideStatus(String requestId) async {
    final response = await _dio.get('$_basePath/geofence-overrides/$requestId');
    return GeofenceOverrideResponse.fromJson(response.data);
  }

  // === Admin Operations ===

  @override
  Future<List<SkipReasonResponse>> getSkipReasons() async {
    final response = await _dio.get('$_basePath/skip-reasons');
    final List<dynamic> data = response.data;
    return data.map((json) => SkipReasonResponse.fromJson(json)).toList();
  }
}

// ==================== Response DTOs ====================

/// Response DTO for daily route API responses.
class DailyRouteResponse {
  final String id;
  final String salesAgentId;
  final String routeDate;
  final int dayOfWeek;
  final String status;
  final String? activatedAt;
  final String? firstClockInAt;
  final String? lastClockOutAt;
  final String? closedAt;
  final int totalScheduled;
  final int completedCount;
  final int skippedCount;
  final int inProgressCount;
  final int totalVisitTimeMins;
  final String? closingNotes;
  final String? closedByUserId;
  final bool forceClosed;
  final String? forceClosedByUserId;
  final String? forceClosedAt;
  final String? forceCloseReason;
  final String createdAt;
  final String updatedAt;

  DailyRouteResponse({
    required this.id,
    required this.salesAgentId,
    required this.routeDate,
    required this.dayOfWeek,
    required this.status,
    this.activatedAt,
    this.firstClockInAt,
    this.lastClockOutAt,
    this.closedAt,
    required this.totalScheduled,
    required this.completedCount,
    required this.skippedCount,
    required this.inProgressCount,
    required this.totalVisitTimeMins,
    this.closingNotes,
    this.closedByUserId,
    required this.forceClosed,
    this.forceClosedByUserId,
    this.forceClosedAt,
    this.forceCloseReason,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DailyRouteResponse.fromJson(Map<String, dynamic> json) {
    // Compute dayOfWeek from route_date if not provided
    final routeDateStr = json['route_date'] as String;
    int dayOfWeek = json['day_of_week'] as int? ?? 0;
    if (dayOfWeek == 0) {
      try {
        final routeDate = DateTime.parse(routeDateStr);
        dayOfWeek = routeDate.weekday; // 1=Monday, 7=Sunday
      } catch (_) {
        dayOfWeek = 0;
      }
    }

    return DailyRouteResponse(
      id: json['id'].toString(),
      salesAgentId: json['sales_agent_id'].toString(),
      routeDate: routeDateStr,
      dayOfWeek: dayOfWeek,
      status: json['status'] as String? ?? 'pending',
      activatedAt: json['activated_at'] as String?,
      firstClockInAt: json['first_clock_in_at'] as String?,
      lastClockOutAt: json['last_clock_out_at'] as String?,
      closedAt: json['closed_at'] as String?,
      totalScheduled: json['total_scheduled'] as int? ?? 0,
      completedCount: json['completed_count'] as int? ?? 0,
      skippedCount: json['skipped_count'] as int? ?? 0,
      inProgressCount: json['in_progress_count'] as int? ?? 0,
      totalVisitTimeMins: json['total_visit_time_mins'] as int? ?? 0,
      closingNotes: json['closing_notes'] as String?,
      closedByUserId: json['closed_by_user_id']?.toString(),
      forceClosed:
          json['force_closed'] as bool? ?? (json['force_closed_at'] != null),
      forceClosedByUserId: json['force_closed_by_user_id']?.toString(),
      forceClosedAt: json['force_closed_at'] as String?,
      forceCloseReason: json['force_close_reason'] as String?,
      createdAt:
          json['created_at'] as String? ?? DateTime.now().toIso8601String(),
      updatedAt:
          json['updated_at'] as String? ?? DateTime.now().toIso8601String(),
    );
  }

  /// Convert to domain entity
  DailyRoute toDomain(String localId) {
    return DailyRoute(
      localId: localId,
      serverId: id,
      salesAgentId: salesAgentId,
      routeDate: DateTime.parse(routeDate),
      dayOfWeek: dayOfWeek,
      status: _parseStatus(status),
      activatedAt: activatedAt != null ? DateTime.parse(activatedAt!) : null,
      firstClockInAt: firstClockInAt != null
          ? DateTime.parse(firstClockInAt!)
          : null,
      lastClockOutAt: lastClockOutAt != null
          ? DateTime.parse(lastClockOutAt!)
          : null,
      closedAt: closedAt != null ? DateTime.parse(closedAt!) : null,
      totalScheduled: totalScheduled,
      completedCount: completedCount,
      skippedCount: skippedCount,
      inProgressCount: inProgressCount,
      totalVisitTimeMins: totalVisitTimeMins,
      closingNotes: closingNotes,
      closedByUserId: closedByUserId,
      forceClosed: forceClosed,
      forceClosedByUserId: forceClosedByUserId,
      forceClosedAt: forceClosedAt != null
          ? DateTime.parse(forceClosedAt!)
          : null,
      forceCloseReason: forceCloseReason,
      syncState: SyncState.synced,
      lastSyncedAt: DateTime.now(),
    );
  }

  DailyRouteStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return DailyRouteStatus.pending;
      case 'activated':
        return DailyRouteStatus.activated;
      case 'in_progress':
        return DailyRouteStatus.inProgress;
      case 'closed':
        return DailyRouteStatus.closed;
      case 'force_closed':
        return DailyRouteStatus.forceClosed;
      default:
        return DailyRouteStatus.pending;
    }
  }
}

/// Response DTO for route with visits
class DailyRouteWithVisitsResponse {
  final DailyRouteResponse route;
  final List<OutletVisitResponse> visits;

  DailyRouteWithVisitsResponse({required this.route, required this.visits});

  factory DailyRouteWithVisitsResponse.fromJson(Map<String, dynamic> json) {
    // The API returns the route fields at root level with visits as nested array
    final visits = json['visits'] as List<dynamic>? ?? [];
    return DailyRouteWithVisitsResponse(
      route: DailyRouteResponse.fromJson(json),
      visits: visits
          .map((v) => OutletVisitResponse.fromJson(v as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Response DTO for outlet visit API responses.
class OutletVisitResponse {
  final String id;
  final String dailyRouteId;
  final String outletId;
  final String outletCode;
  final String outletName;
  final double outletLatitude;
  final double outletLongitude;
  final double geofenceRadiusMeters;
  final String? scheduleId;
  final int visitOrder;
  final String? scheduledClockIn;
  final String? scheduledClockOut;
  final int allocatedMinutes;
  final int visitPriority;
  final String visitType;
  final String status;
  final String? actualClockIn;
  final String? actualClockOut;
  final int? visitDurationMins;
  final double? clockInLatitude;
  final double? clockInLongitude;
  final double? clockInAccuracyMeters;
  final double? clockInDistanceMeters;
  final double? clockOutLatitude;
  final double? clockOutLongitude;
  final double? clockOutAccuracyMeters;
  final double? clockOutDistanceMeters;
  final bool geofenceOverride;
  final String? overrideRequestId;
  final int? skipReasonId;
  final String? skipReasonCode;
  final String? skipNotes;
  final String? clockInNotes;
  final String? clockOutNotes;
  final String? visitNotes;
  final String createdAt;
  final String updatedAt;

  OutletVisitResponse({
    required this.id,
    required this.dailyRouteId,
    required this.outletId,
    required this.outletCode,
    required this.outletName,
    required this.outletLatitude,
    required this.outletLongitude,
    required this.geofenceRadiusMeters,
    this.scheduleId,
    required this.visitOrder,
    this.scheduledClockIn,
    this.scheduledClockOut,
    required this.allocatedMinutes,
    required this.visitPriority,
    required this.visitType,
    required this.status,
    this.actualClockIn,
    this.actualClockOut,
    this.visitDurationMins,
    this.clockInLatitude,
    this.clockInLongitude,
    this.clockInAccuracyMeters,
    this.clockInDistanceMeters,
    this.clockOutLatitude,
    this.clockOutLongitude,
    this.clockOutAccuracyMeters,
    this.clockOutDistanceMeters,
    required this.geofenceOverride,
    this.overrideRequestId,
    this.skipReasonId,
    this.skipReasonCode,
    this.skipNotes,
    this.clockInNotes,
    this.clockOutNotes,
    this.visitNotes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OutletVisitResponse.fromJson(Map<String, dynamic> json) {
    // Map API field names to our model (API uses customer_*, we use outlet_*)
    // Helper to parse coordinates that may come as String or num
    double? parseCoordinate(dynamic value) {
      if (value == null) return null;
      if (value is num) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    return OutletVisitResponse(
      id: json['id'].toString(),
      dailyRouteId: json['daily_route_id'].toString(),
      // API uses customer_id, card_code, customer_name
      outletId: (json['outlet_id'] ?? json['customer_id'])?.toString() ?? '',
      outletCode: (json['outlet_code'] ?? json['card_code']) as String? ?? '',
      outletName:
          (json['outlet_name'] ?? json['customer_name']) as String? ??
          'Unknown Outlet',
      // Outlet coordinates - API returns as strings like "-4.04360000"
      outletLatitude:
          parseCoordinate(
            json['outlet_latitude'] ??
                json['customer_latitude'] ??
                json['latitude'],
          ) ??
          0.0,
      outletLongitude:
          parseCoordinate(
            json['outlet_longitude'] ??
                json['customer_longitude'] ??
                json['longitude'],
          ) ??
          0.0,
      geofenceRadiusMeters:
          parseCoordinate(
            json['geofence_radius_meters'] ??
                json['geofence_radius'] ??
                json['radius'],
          ) ??
          200.0,
      scheduleId: json['schedule_id']?.toString(),
      visitOrder: json['visit_order'] as int? ?? 0,
      scheduledClockIn: json['scheduled_clock_in'] as String?,
      scheduledClockOut: json['scheduled_clock_out'] as String?,
      // allocated_minutes may not be in response
      allocatedMinutes: json['allocated_minutes'] as int? ?? 60,
      visitPriority: json['visit_priority'] as int? ?? 0,
      visitType: json['visit_type'] as String? ?? 'scheduled',
      status: json['status'] as String? ?? 'pending',
      actualClockIn: json['actual_clock_in'] as String?,
      actualClockOut: json['actual_clock_out'] as String?,
      visitDurationMins: json['visit_duration_mins'] as int?,
      clockInLatitude: parseCoordinate(json['clock_in_latitude']),
      clockInLongitude: parseCoordinate(json['clock_in_longitude']),
      clockInAccuracyMeters: parseCoordinate(json['clock_in_accuracy_meters']),
      clockInDistanceMeters: parseCoordinate(
        json['clock_in_distance_meters'] ?? json['clock_in_distance_m'],
      ),
      clockOutLatitude: parseCoordinate(json['clock_out_latitude']),
      clockOutLongitude: parseCoordinate(json['clock_out_longitude']),
      clockOutAccuracyMeters: parseCoordinate(
        json['clock_out_accuracy_meters'],
      ),
      clockOutDistanceMeters: parseCoordinate(
        json['clock_out_distance_meters'] ?? json['clock_out_distance_m'],
      ),
      geofenceOverride: json['geofence_override'] as bool? ?? false,
      overrideRequestId: json['override_request_id']?.toString(),
      skipReasonId: json['skip_reason_id'] as int?,
      skipReasonCode:
          (json['skip_reason_code'] ?? json['skip_reason_name']) as String?,
      skipNotes: json['skip_notes'] as String?,
      clockInNotes: json['clock_in_notes'] as String?,
      clockOutNotes: json['clock_out_notes'] as String?,
      visitNotes: json['visit_notes'] as String?,
      createdAt:
          json['created_at'] as String? ?? DateTime.now().toIso8601String(),
      updatedAt:
          json['updated_at'] as String? ?? DateTime.now().toIso8601String(),
    );
  }

  /// Convert to domain entity
  OutletVisit toDomain(String localId, String routeLocalId) {
    return OutletVisit(
      localId: localId,
      serverId: id,
      dailyRouteLocalId: routeLocalId,
      dailyRouteServerId: dailyRouteId,
      outletId: outletId,
      outletCode: outletCode,
      outletName: outletName,
      outletLatitude: outletLatitude,
      outletLongitude: outletLongitude,
      geofenceRadiusMeters: geofenceRadiusMeters,
      scheduleServerId: scheduleId,
      visitOrder: visitOrder,
      scheduledClockIn: scheduledClockIn,
      scheduledClockOut: scheduledClockOut,
      allocatedMinutes: allocatedMinutes,
      visitPriority: visitPriority,
      visitType: _parseVisitType(visitType),
      status: _parseStatus(status),
      actualClockIn: actualClockIn != null
          ? DateTime.parse(actualClockIn!)
          : null,
      actualClockOut: actualClockOut != null
          ? DateTime.parse(actualClockOut!)
          : null,
      visitDurationMins: visitDurationMins,
      clockInLatitude: clockInLatitude,
      clockInLongitude: clockInLongitude,
      clockInAccuracyMeters: clockInAccuracyMeters,
      clockInDistanceMeters: clockInDistanceMeters,
      clockOutLatitude: clockOutLatitude,
      clockOutLongitude: clockOutLongitude,
      clockOutAccuracyMeters: clockOutAccuracyMeters,
      clockOutDistanceMeters: clockOutDistanceMeters,
      geofenceOverride: geofenceOverride,
      overrideRequestId: overrideRequestId,
      skipReasonId: skipReasonId,
      skipReasonCode: skipReasonCode,
      skipNotes: skipNotes,
      clockInNotes: clockInNotes,
      clockOutNotes: clockOutNotes,
      visitNotes: visitNotes,
      syncState: SyncState.synced,
      lastSyncedAt: DateTime.now(),
    );
  }

  VisitStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return VisitStatus.pending;
      case 'in_progress':
        return VisitStatus.inProgress;
      case 'completed':
        return VisitStatus.completed;
      case 'skipped':
        return VisitStatus.skipped;
      default:
        return VisitStatus.pending;
    }
  }

  VisitType _parseVisitType(String type) {
    switch (type.toLowerCase()) {
      case 'scheduled':
        return VisitType.scheduled;
      case 'ad_hoc':
        return VisitType.adHoc;
      default:
        return VisitType.scheduled;
    }
  }
}

/// Response DTO for geofence override requests.
///
/// The API returns distance_from_outlet as a String, and uses customer_name /
/// card_code for outlet info. Location fields (lat/lon/accuracy) are NOT
/// returned by the API — callers must supply them via toDomain().
class GeofenceOverrideResponse {
  final String id;
  final String outletVisitId;
  final String requestedByUserId;
  final String? requestedByName;
  final String requestedAt;
  final String reason;
  final double distanceFromOutlet;
  final String? outletName;
  final String? outletCode;
  final String status;
  final String expiresAt;
  final String? decidedByUserId;
  final String? decidedByName;
  final String? decidedAt;
  final String? decisionNotes;
  final String createdAt;

  GeofenceOverrideResponse({
    required this.id,
    required this.outletVisitId,
    required this.requestedByUserId,
    this.requestedByName,
    required this.requestedAt,
    required this.reason,
    required this.distanceFromOutlet,
    this.outletName,
    this.outletCode,
    required this.status,
    required this.expiresAt,
    this.decidedByUserId,
    this.decidedByName,
    this.decidedAt,
    this.decisionNotes,
    required this.createdAt,
  });

  factory GeofenceOverrideResponse.fromJson(Map<String, dynamic> json) {
    // distance_from_outlet comes back as a String (e.g. "150.5") from the API.
    double parseDistance(dynamic v) {
      if (v == null) return 0.0;
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0.0;
      return 0.0;
    }

    return GeofenceOverrideResponse(
      id: json['id'].toString(),
      outletVisitId: json['outlet_visit_id'].toString(),
      requestedByUserId: json['requested_by_user_id'].toString(),
      requestedByName: json['requested_by_name'] as String?,
      requestedAt: json['requested_at'] as String,
      reason: json['reason'] as String,
      distanceFromOutlet: parseDistance(json['distance_from_outlet']),
      // API uses customer_name / card_code; fall back to outlet_* variants.
      outletName: (json['customer_name'] ?? json['outlet_name']) as String?,
      outletCode: (json['card_code'] ?? json['outlet_code']) as String?,
      status: json['status'] as String? ?? 'pending',
      expiresAt: json['expires_at'] as String? ?? DateTime.now().add(const Duration(minutes: 15)).toIso8601String(),
      decidedByUserId: json['decided_by_user_id']?.toString(),
      decidedByName: json['decided_by_name'] as String?,
      decidedAt: json['decided_at'] as String?,
      decisionNotes: json['decision_notes'] as String?,
      createdAt: json['created_at'] as String? ?? DateTime.now().toIso8601String(),
    );
  }

  /// Convert to domain entity.
  ///
  /// [requestLatitude], [requestLongitude], [requestAccuracyMeters] must be
  /// supplied by the caller because the API does not return them.
  GeofenceOverrideRequest toDomain(
    String localId,
    String visitLocalId, {
    double requestLatitude = 0.0,
    double requestLongitude = 0.0,
    double requestAccuracyMeters = 0.0,
  }) {
    return GeofenceOverrideRequest(
      localId: localId,
      serverId: id,
      outletVisitLocalId: visitLocalId,
      outletVisitServerId: outletVisitId,
      requestedByUserId: requestedByUserId,
      requestedByName: requestedByName,
      requestedAt: DateTime.parse(requestedAt),
      reason: reason,
      requestLatitude: requestLatitude,
      requestLongitude: requestLongitude,
      requestAccuracyMeters: requestAccuracyMeters,
      distanceFromOutlet: distanceFromOutlet,
      outletName: outletName,
      outletCode: outletCode,
      status: _parseStatus(status),
      expiresAt: DateTime.parse(expiresAt),
      decidedByUserId: decidedByUserId,
      decidedByName: decidedByName,
      decidedAt: decidedAt != null ? DateTime.parse(decidedAt!) : null,
      decisionNotes: decisionNotes,
      syncState: SyncState.synced,
    );
  }

  GeofenceOverrideStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return GeofenceOverrideStatus.pending;
      case 'approved':
        return GeofenceOverrideStatus.approved;
      case 'rejected':
        return GeofenceOverrideStatus.rejected;
      case 'expired':
        return GeofenceOverrideStatus.expired;
      default:
        return GeofenceOverrideStatus.pending;
    }
  }
}

/// Response DTO for skip reasons.
class SkipReasonResponse {
  final int id;
  final String code;
  final String label;
  final bool requiresNotes;
  final bool isActive;

  SkipReasonResponse({
    required this.id,
    required this.code,
    required this.label,
    required this.requiresNotes,
    required this.isActive,
  });

  factory SkipReasonResponse.fromJson(Map<String, dynamic> json) {
    return SkipReasonResponse(
      id: json['id'] as int,
      code: json['code'] as String,
      label: json['label'] as String,
      requiresNotes: json['requires_notes'] as bool,
      isActive: json['is_active'] as bool,
    );
  }
}

/// Response DTO for pending routes from GET /api/v1/visits/routes/pending
class PendingRouteResponse {
  final int id;
  final int salesAgentId;
  final String routeDate;
  final String status;
  final int totalScheduled;
  final int completedCount;
  final int skippedCount;
  final String? activatedAt;
  final String? closedAt;

  PendingRouteResponse({
    required this.id,
    required this.salesAgentId,
    required this.routeDate,
    required this.status,
    required this.totalScheduled,
    required this.completedCount,
    required this.skippedCount,
    this.activatedAt,
    this.closedAt,
  });

  factory PendingRouteResponse.fromJson(Map<String, dynamic> json) {
    return PendingRouteResponse(
      id: json['id'] as int,
      salesAgentId: json['sales_agent_id'] as int,
      routeDate: json['route_date'] as String,
      status: json['status'] as String,
      totalScheduled: json['total_scheduled'] as int,
      completedCount: json['completed_count'] as int,
      skippedCount: json['skipped_count'] as int,
      activatedAt: json['activated_at'] as String?,
      closedAt: json['closed_at'] as String?,
    );
  }

  /// Check if this route is from a previous date (not today)
  bool isPreviousDate() {
    try {
      final routeDateTime = DateTime.parse(routeDate);
      final today = DateTime.now();
      return routeDateTime.year != today.year ||
          routeDateTime.month != today.month ||
          routeDateTime.day != today.day;
    } catch (_) {
      return false;
    }
  }

  DailyRouteStatus toDomainStatus() {
    switch (status.toLowerCase()) {
      case 'pending':
        return DailyRouteStatus.pending;
      case 'activated':
        return DailyRouteStatus.activated;
      case 'in_progress':
        return DailyRouteStatus.inProgress;
      case 'closed':
        return DailyRouteStatus.closed;
      case 'force_closed':
        return DailyRouteStatus.forceClosed;
      default:
        return DailyRouteStatus.pending;
    }
  }

  BlockedRouteSummary toDomain() => BlockedRouteSummary(
    id: id.toString(),
    routeDate: DateTime.parse(routeDate),
    status: toDomainStatus(),
    totalScheduled: totalScheduled,
    completedCount: completedCount,
    skippedCount: skippedCount,
  );
}

/// Response DTO for a single entry in `scheduled_stops` — a schedule-derived
/// stop for today, present only pre-activation (`DayStatus.notActivated`).
class ScheduledStopResponse {
  final int id;
  final int customerId;
  final String cardCode;
  final int visitOrder;
  final int visitPriority;
  final String? scheduledClockIn;
  final String? scheduledClockOut;

  /// Nullable per the API contract: resolution falls back to a live SAP
  /// HANA lookup, which can be unreachable — the frontend must render
  /// defensively (fall back to [cardCode]), this is not an error condition.
  final String? customerName;

  ScheduledStopResponse({
    required this.id,
    required this.customerId,
    required this.cardCode,
    required this.visitOrder,
    required this.visitPriority,
    this.scheduledClockIn,
    this.scheduledClockOut,
    this.customerName,
  });

  factory ScheduledStopResponse.fromJson(Map<String, dynamic> json) {
    return ScheduledStopResponse(
      id: json['id'] as int,
      customerId: json['customer_id'] as int,
      cardCode: json['card_code'] as String? ?? '',
      visitOrder: json['visit_order'] as int? ?? 0,
      visitPriority: json['visit_priority'] as int? ?? 2,
      scheduledClockIn: json['scheduled_clock_in'] as String?,
      scheduledClockOut: json['scheduled_clock_out'] as String?,
      customerName: json['customer_name'] as String?,
    );
  }

  ScheduledStop toDomain() => ScheduledStop(
    id: id,
    customerId: customerId.toString(),
    outletCode: cardCode,
    outletName: customerName ?? cardCode,
    visitOrder: visitOrder,
    visitPriority: visitPriority,
    scheduledClockIn: scheduledClockIn,
    scheduledClockOut: scheduledClockOut,
  );
}

/// Response DTO for `GET /visits/routes/day-status` — a single-call
/// snapshot of the agent's day (blocked / not scheduled / not activated /
/// active / at outlet / in transit / completed). See [DayStatusInfo].
class DayStatusResponse {
  final String status;
  final String message;
  final String routeDate;
  final bool canActivate;
  final PendingRouteResponse? blockedRoute;
  final List<ScheduledStopResponse> scheduledStops;
  final DailyRouteWithVisitsResponse? route;

  DayStatusResponse({
    required this.status,
    required this.message,
    required this.routeDate,
    required this.canActivate,
    this.blockedRoute,
    this.scheduledStops = const [],
    this.route,
  });

  factory DayStatusResponse.fromJson(Map<String, dynamic> json) {
    return DayStatusResponse(
      status: json['status'] as String,
      message: json['message'] as String? ?? '',
      routeDate: json['route_date'] as String,
      canActivate: json['can_activate'] as bool? ?? false,
      blockedRoute: json['blocked_route'] != null
          ? PendingRouteResponse.fromJson(
              json['blocked_route'] as Map<String, dynamic>,
            )
          : null,
      scheduledStops: (json['scheduled_stops'] as List<dynamic>? ?? [])
          .map(
            (s) =>
                ScheduledStopResponse.fromJson(s as Map<String, dynamic>),
          )
          .toList(),
      route: json['route'] != null
          ? DailyRouteWithVisitsResponse.fromJson(
              json['route'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  DayStatus _parseStatus() {
    switch (status) {
      case 'blocked':
        return DayStatus.blocked;
      case 'not_scheduled':
        return DayStatus.notScheduled;
      case 'not_activated':
        return DayStatus.notActivated;
      case 'active':
        return DayStatus.active;
      case 'at_outlet':
        return DayStatus.atOutlet;
      case 'in_transit':
        return DayStatus.inTransit;
      case 'completed':
        return DayStatus.completed;
      default:
        return DayStatus.notScheduled;
    }
  }

  DayStatusInfo toDomain() {
    DailyRouteWithVisits? routeWithVisits;
    final routeResponse = route;
    if (routeResponse != null) {
      // These are ephemeral (not persisted to Isar) — the server id is a
      // stable, unique-enough localId for a value that only lives for the
      // duration of this poll response.
      final routeLocalId = routeResponse.route.id;
      routeWithVisits = DailyRouteWithVisits(
        route: routeResponse.route.toDomain(routeLocalId),
        visits: routeResponse.visits
            .map((v) => v.toDomain(v.id, routeLocalId))
            .toList(),
      );
    }

    return DayStatusInfo(
      status: _parseStatus(),
      message: message,
      routeDate: DateTime.parse(routeDate),
      canActivate: canActivate,
      blockedRoute: blockedRoute?.toDomain(),
      scheduledStops: scheduledStops.map((s) => s.toDomain()).toList(),
      route: routeWithVisits,
    );
  }
}
