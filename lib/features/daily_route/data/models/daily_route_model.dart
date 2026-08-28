import 'package:isar_community/isar.dart';

part 'daily_route_model.g.dart';

/// Isar collection for daily routes.
///
/// Local mirror of backend `daily_routes` table.
/// One route per agent per date.
@collection
class DailyRouteModel {
  Id? id;

  /// Local UUID for offline-first operations
  @Index(unique: true)
  late String localId;

  /// Backend route ID (null until synced)
  @Index()
  String? serverId;

  /// Agent this route belongs to
  @Index()
  late String salesAgentId;

  /// Date of the route (stored as milliseconds since epoch)
  @Index()
  late DateTime routeDate;

  /// Day of week (0=Monday, 6=Sunday)
  late int dayOfWeek;

  /// Current status of the route
  @Enumerated(EnumType.name)
  late DailyRouteStatusModel status;

  // === Timestamps ===

  DateTime? activatedAt;
  DateTime? firstClockInAt;
  DateTime? lastClockOutAt;
  DateTime? closedAt;

  // === Progress Tracking ===

  late int totalScheduled;
  late int completedCount;
  late int skippedCount;
  late int inProgressCount;
  late int totalVisitTimeMins;

  // === Closing Details ===

  String? closingNotes;
  String? closedByUserId;

  // === Force Close ===

  late bool forceClosed;
  String? forceClosedByUserId;
  DateTime? forceClosedAt;
  String? forceCloseReason;

  // === Sync State ===

  @Enumerated(EnumType.name)
  late SyncStateModel syncState;

  String? syncError;
  DateTime? lastSyncedAt;

  // === Timestamps ===
  late DateTime createdAt;
  late DateTime updatedAt;
}

/// Status of a daily route (Isar enum)
enum DailyRouteStatusModel {
  pending,
  activated,
  inProgress,
  closed,
  forceClosed,
}

/// Sync state for offline-first operations (Isar enum)
enum SyncStateModel { localOnly, syncing, synced, syncFailed, needsAttention }
