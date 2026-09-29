import 'package:freezed_annotation/freezed_annotation.dart';

import 'daily_route.dart';

part 'geofence_override_request.freezed.dart';
part 'geofence_override_request.g.dart';

/// Geofence override request entity.
///
/// When an agent is outside the geofence radius but needs to clock in,
/// they can request an override from their supervisor.
///
/// **Lifecycle:**
/// ```
/// pending → approved → (agent can clock in)
///    ↓
/// rejected/expired
/// ```
///
/// **Backend Alignment:**
/// - Request: `POST /api/v1/visits/{visit_id}/request-override`
/// - List pending: `GET /api/v1/visits/geofence-overrides/pending`
/// - Approve: `POST /api/v1/visits/geofence-overrides/{id}/approve`
/// - Reject: `POST /api/v1/visits/geofence-overrides/{id}/reject`
/// - Default expiry: 15 minutes
@freezed
abstract class GeofenceOverrideRequest with _$GeofenceOverrideRequest {
  const factory GeofenceOverrideRequest({
    /// Local UUID for offline-first operations
    required String localId,

    /// Backend override request ID (null until synced)
    String? serverId,

    // === Visit Reference ===

    /// Local ID of the visit this override is for
    required String outletVisitLocalId,

    /// Server ID of the visit (null until visit synced)
    String? outletVisitServerId,

    // === Request Details ===

    /// User who requested the override (agent)
    required String requestedByUserId,

    /// Agent's name (for display in supervisor UI)
    String? requestedByName,

    /// When the override was requested
    required DateTime requestedAt,

    /// Agent's reason for the request
    required String reason,

    // === Location at Request Time ===

    /// GPS latitude when requesting
    required double requestLatitude,

    /// GPS longitude when requesting
    required double requestLongitude,

    /// GPS accuracy when requesting (meters)
    required double requestAccuracyMeters,

    /// Distance from outlet when requesting (meters)
    required double distanceFromOutlet,

    // === Outlet Info (for supervisor display) ===

    /// Outlet name
    String? outletName,

    /// Outlet code
    String? outletCode,

    // === Status ===

    /// Current status of the request
    required GeofenceOverrideStatus status,

    /// When the request expires (default 15 min from request)
    required DateTime expiresAt,

    // === Decision Details (filled when approved/rejected) ===

    /// User who made the decision (supervisor)
    String? decidedByUserId,

    /// Supervisor's name
    String? decidedByName,

    /// When the decision was made
    DateTime? decidedAt,

    /// Notes from the supervisor
    String? decisionNotes,

    // === Sync State ===

    /// Current sync state with backend
    @Default(SyncState.localOnly) SyncState syncState,

    /// Last sync error message (if any)
    String? syncError,
  }) = _GeofenceOverrideRequest;

  factory GeofenceOverrideRequest.fromJson(Map<String, dynamic> json) =>
      _$GeofenceOverrideRequestFromJson(json);
}

/// Status of a geofence override request
enum GeofenceOverrideStatus {
  /// Awaiting supervisor decision
  pending,

  /// Approved by supervisor, agent can clock in
  approved,

  /// Rejected by supervisor
  rejected,

  /// Request expired (15 min default)
  expired,
}

/// Extension methods for GeofenceOverrideRequest
extension GeofenceOverrideRequestX on GeofenceOverrideRequest {
  /// Whether the request is still pending a decision
  bool get isPending => status == GeofenceOverrideStatus.pending;

  /// Whether the request was approved
  bool get isApproved => status == GeofenceOverrideStatus.approved;

  /// Whether the request was rejected
  bool get isRejected => status == GeofenceOverrideStatus.rejected;

  /// Whether the request has expired
  bool get isExpired => status == GeofenceOverrideStatus.expired;

  /// Whether the request is in a terminal state
  bool get isTerminal =>
      status == GeofenceOverrideStatus.approved ||
      status == GeofenceOverrideStatus.rejected ||
      status == GeofenceOverrideStatus.expired;

  /// Check if the request has expired based on current time
  bool hasExpired(DateTime now) {
    return now.isAfter(expiresAt);
  }

  /// Time remaining until expiry
  Duration timeRemaining(DateTime now) {
    if (hasExpired(now)) return Duration.zero;
    return expiresAt.difference(now);
  }

  /// Human-readable status text
  String get statusText {
    switch (status) {
      case GeofenceOverrideStatus.pending:
        return 'Waiting for Approval';
      case GeofenceOverrideStatus.approved:
        return 'Approved';
      case GeofenceOverrideStatus.rejected:
        return 'Rejected';
      case GeofenceOverrideStatus.expired:
        return 'Expired';
    }
  }

  /// Distance formatted for display
  String get distanceText {
    if (distanceFromOutlet < 1000) {
      return '${distanceFromOutlet.round()}m away';
    } else {
      return '${(distanceFromOutlet / 1000).toStringAsFixed(1)}km away';
    }
  }
}
