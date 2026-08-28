// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyRoute _$DailyRouteFromJson(Map<String, dynamic> json) {
  return _DailyRoute.fromJson(json);
}

/// @nodoc
mixin _$DailyRoute {
  /// Local UUID for offline-first operations
  String get localId => throw _privateConstructorUsedError;

  /// Backend route ID (null until synced)
  String? get serverId => throw _privateConstructorUsedError;

  /// Agent this route belongs to
  String get salesAgentId => throw _privateConstructorUsedError;

  /// Date of the route (YYYY-MM-DD, no time component)
  DateTime get routeDate => throw _privateConstructorUsedError;

  /// Day of week (0=Monday, 6=Sunday)
  int get dayOfWeek => throw _privateConstructorUsedError;

  /// Current status of the route
  DailyRouteStatus get status =>
      throw _privateConstructorUsedError; // === Timestamps ===
  /// When the route was activated by the agent
  DateTime? get activatedAt => throw _privateConstructorUsedError;

  /// First clock-in time of the day
  DateTime? get firstClockInAt => throw _privateConstructorUsedError;

  /// Last clock-out time of the day
  DateTime? get lastClockOutAt => throw _privateConstructorUsedError;

  /// When the route was closed
  DateTime? get closedAt =>
      throw _privateConstructorUsedError; // === Progress Tracking ===
  /// Total number of scheduled visits
  int get totalScheduled => throw _privateConstructorUsedError;

  /// Number of completed visits
  int get completedCount => throw _privateConstructorUsedError;

  /// Number of skipped visits
  int get skippedCount => throw _privateConstructorUsedError;

  /// Number of visits currently in progress (should be 0 or 1)
  int get inProgressCount => throw _privateConstructorUsedError;

  /// Total time spent on visits (minutes)
  int get totalVisitTimeMins =>
      throw _privateConstructorUsedError; // === Closing Details ===
  /// Notes provided when closing the route
  String? get closingNotes => throw _privateConstructorUsedError;

  /// User who closed the route (usually the agent)
  String? get closedByUserId =>
      throw _privateConstructorUsedError; // === Force Close (Supervisor/Manager action) ===
  /// Whether route was force-closed by supervisor/manager
  bool get forceClosed => throw _privateConstructorUsedError;

  /// User who force-closed the route
  String? get forceClosedByUserId => throw _privateConstructorUsedError;

  /// When the route was force-closed
  DateTime? get forceClosedAt => throw _privateConstructorUsedError;

  /// Reason for force-closing
  String? get forceCloseReason =>
      throw _privateConstructorUsedError; // === Sync State ===
  /// Current sync state with backend
  SyncState get syncState => throw _privateConstructorUsedError;

  /// Last sync error message (if any)
  String? get syncError => throw _privateConstructorUsedError;

  /// Timestamp of last successful sync
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;

  /// Serializes this DailyRoute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyRouteCopyWith<DailyRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyRouteCopyWith<$Res> {
  factory $DailyRouteCopyWith(
    DailyRoute value,
    $Res Function(DailyRoute) then,
  ) = _$DailyRouteCopyWithImpl<$Res, DailyRoute>;
  @useResult
  $Res call({
    String localId,
    String? serverId,
    String salesAgentId,
    DateTime routeDate,
    int dayOfWeek,
    DailyRouteStatus status,
    DateTime? activatedAt,
    DateTime? firstClockInAt,
    DateTime? lastClockOutAt,
    DateTime? closedAt,
    int totalScheduled,
    int completedCount,
    int skippedCount,
    int inProgressCount,
    int totalVisitTimeMins,
    String? closingNotes,
    String? closedByUserId,
    bool forceClosed,
    String? forceClosedByUserId,
    DateTime? forceClosedAt,
    String? forceCloseReason,
    SyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
  });
}

/// @nodoc
class _$DailyRouteCopyWithImpl<$Res, $Val extends DailyRoute>
    implements $DailyRouteCopyWith<$Res> {
  _$DailyRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? salesAgentId = null,
    Object? routeDate = null,
    Object? dayOfWeek = null,
    Object? status = null,
    Object? activatedAt = freezed,
    Object? firstClockInAt = freezed,
    Object? lastClockOutAt = freezed,
    Object? closedAt = freezed,
    Object? totalScheduled = null,
    Object? completedCount = null,
    Object? skippedCount = null,
    Object? inProgressCount = null,
    Object? totalVisitTimeMins = null,
    Object? closingNotes = freezed,
    Object? closedByUserId = freezed,
    Object? forceClosed = null,
    Object? forceClosedByUserId = freezed,
    Object? forceClosedAt = freezed,
    Object? forceCloseReason = freezed,
    Object? syncState = null,
    Object? syncError = freezed,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            localId: null == localId
                ? _value.localId
                : localId // ignore: cast_nullable_to_non_nullable
                      as String,
            serverId: freezed == serverId
                ? _value.serverId
                : serverId // ignore: cast_nullable_to_non_nullable
                      as String?,
            salesAgentId: null == salesAgentId
                ? _value.salesAgentId
                : salesAgentId // ignore: cast_nullable_to_non_nullable
                      as String,
            routeDate: null == routeDate
                ? _value.routeDate
                : routeDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            dayOfWeek: null == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as DailyRouteStatus,
            activatedAt: freezed == activatedAt
                ? _value.activatedAt
                : activatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            firstClockInAt: freezed == firstClockInAt
                ? _value.firstClockInAt
                : firstClockInAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastClockOutAt: freezed == lastClockOutAt
                ? _value.lastClockOutAt
                : lastClockOutAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            closedAt: freezed == closedAt
                ? _value.closedAt
                : closedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            totalScheduled: null == totalScheduled
                ? _value.totalScheduled
                : totalScheduled // ignore: cast_nullable_to_non_nullable
                      as int,
            completedCount: null == completedCount
                ? _value.completedCount
                : completedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            skippedCount: null == skippedCount
                ? _value.skippedCount
                : skippedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            inProgressCount: null == inProgressCount
                ? _value.inProgressCount
                : inProgressCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalVisitTimeMins: null == totalVisitTimeMins
                ? _value.totalVisitTimeMins
                : totalVisitTimeMins // ignore: cast_nullable_to_non_nullable
                      as int,
            closingNotes: freezed == closingNotes
                ? _value.closingNotes
                : closingNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            closedByUserId: freezed == closedByUserId
                ? _value.closedByUserId
                : closedByUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
            forceClosed: null == forceClosed
                ? _value.forceClosed
                : forceClosed // ignore: cast_nullable_to_non_nullable
                      as bool,
            forceClosedByUserId: freezed == forceClosedByUserId
                ? _value.forceClosedByUserId
                : forceClosedByUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
            forceClosedAt: freezed == forceClosedAt
                ? _value.forceClosedAt
                : forceClosedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            forceCloseReason: freezed == forceCloseReason
                ? _value.forceCloseReason
                : forceCloseReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            syncState: null == syncState
                ? _value.syncState
                : syncState // ignore: cast_nullable_to_non_nullable
                      as SyncState,
            syncError: freezed == syncError
                ? _value.syncError
                : syncError // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastSyncedAt: freezed == lastSyncedAt
                ? _value.lastSyncedAt
                : lastSyncedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyRouteImplCopyWith<$Res>
    implements $DailyRouteCopyWith<$Res> {
  factory _$$DailyRouteImplCopyWith(
    _$DailyRouteImpl value,
    $Res Function(_$DailyRouteImpl) then,
  ) = __$$DailyRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String localId,
    String? serverId,
    String salesAgentId,
    DateTime routeDate,
    int dayOfWeek,
    DailyRouteStatus status,
    DateTime? activatedAt,
    DateTime? firstClockInAt,
    DateTime? lastClockOutAt,
    DateTime? closedAt,
    int totalScheduled,
    int completedCount,
    int skippedCount,
    int inProgressCount,
    int totalVisitTimeMins,
    String? closingNotes,
    String? closedByUserId,
    bool forceClosed,
    String? forceClosedByUserId,
    DateTime? forceClosedAt,
    String? forceCloseReason,
    SyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
  });
}

/// @nodoc
class __$$DailyRouteImplCopyWithImpl<$Res>
    extends _$DailyRouteCopyWithImpl<$Res, _$DailyRouteImpl>
    implements _$$DailyRouteImplCopyWith<$Res> {
  __$$DailyRouteImplCopyWithImpl(
    _$DailyRouteImpl _value,
    $Res Function(_$DailyRouteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? salesAgentId = null,
    Object? routeDate = null,
    Object? dayOfWeek = null,
    Object? status = null,
    Object? activatedAt = freezed,
    Object? firstClockInAt = freezed,
    Object? lastClockOutAt = freezed,
    Object? closedAt = freezed,
    Object? totalScheduled = null,
    Object? completedCount = null,
    Object? skippedCount = null,
    Object? inProgressCount = null,
    Object? totalVisitTimeMins = null,
    Object? closingNotes = freezed,
    Object? closedByUserId = freezed,
    Object? forceClosed = null,
    Object? forceClosedByUserId = freezed,
    Object? forceClosedAt = freezed,
    Object? forceCloseReason = freezed,
    Object? syncState = null,
    Object? syncError = freezed,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(
      _$DailyRouteImpl(
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        serverId: freezed == serverId
            ? _value.serverId
            : serverId // ignore: cast_nullable_to_non_nullable
                  as String?,
        salesAgentId: null == salesAgentId
            ? _value.salesAgentId
            : salesAgentId // ignore: cast_nullable_to_non_nullable
                  as String,
        routeDate: null == routeDate
            ? _value.routeDate
            : routeDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        dayOfWeek: null == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as DailyRouteStatus,
        activatedAt: freezed == activatedAt
            ? _value.activatedAt
            : activatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        firstClockInAt: freezed == firstClockInAt
            ? _value.firstClockInAt
            : firstClockInAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastClockOutAt: freezed == lastClockOutAt
            ? _value.lastClockOutAt
            : lastClockOutAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        closedAt: freezed == closedAt
            ? _value.closedAt
            : closedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        totalScheduled: null == totalScheduled
            ? _value.totalScheduled
            : totalScheduled // ignore: cast_nullable_to_non_nullable
                  as int,
        completedCount: null == completedCount
            ? _value.completedCount
            : completedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        skippedCount: null == skippedCount
            ? _value.skippedCount
            : skippedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        inProgressCount: null == inProgressCount
            ? _value.inProgressCount
            : inProgressCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalVisitTimeMins: null == totalVisitTimeMins
            ? _value.totalVisitTimeMins
            : totalVisitTimeMins // ignore: cast_nullable_to_non_nullable
                  as int,
        closingNotes: freezed == closingNotes
            ? _value.closingNotes
            : closingNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        closedByUserId: freezed == closedByUserId
            ? _value.closedByUserId
            : closedByUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
        forceClosed: null == forceClosed
            ? _value.forceClosed
            : forceClosed // ignore: cast_nullable_to_non_nullable
                  as bool,
        forceClosedByUserId: freezed == forceClosedByUserId
            ? _value.forceClosedByUserId
            : forceClosedByUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
        forceClosedAt: freezed == forceClosedAt
            ? _value.forceClosedAt
            : forceClosedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        forceCloseReason: freezed == forceCloseReason
            ? _value.forceCloseReason
            : forceCloseReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncState: null == syncState
            ? _value.syncState
            : syncState // ignore: cast_nullable_to_non_nullable
                  as SyncState,
        syncError: freezed == syncError
            ? _value.syncError
            : syncError // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastSyncedAt: freezed == lastSyncedAt
            ? _value.lastSyncedAt
            : lastSyncedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyRouteImpl implements _DailyRoute {
  const _$DailyRouteImpl({
    required this.localId,
    this.serverId,
    required this.salesAgentId,
    required this.routeDate,
    required this.dayOfWeek,
    required this.status,
    this.activatedAt,
    this.firstClockInAt,
    this.lastClockOutAt,
    this.closedAt,
    this.totalScheduled = 0,
    this.completedCount = 0,
    this.skippedCount = 0,
    this.inProgressCount = 0,
    this.totalVisitTimeMins = 0,
    this.closingNotes,
    this.closedByUserId,
    this.forceClosed = false,
    this.forceClosedByUserId,
    this.forceClosedAt,
    this.forceCloseReason,
    this.syncState = SyncState.localOnly,
    this.syncError,
    this.lastSyncedAt,
  });

  factory _$DailyRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyRouteImplFromJson(json);

  /// Local UUID for offline-first operations
  @override
  final String localId;

  /// Backend route ID (null until synced)
  @override
  final String? serverId;

  /// Agent this route belongs to
  @override
  final String salesAgentId;

  /// Date of the route (YYYY-MM-DD, no time component)
  @override
  final DateTime routeDate;

  /// Day of week (0=Monday, 6=Sunday)
  @override
  final int dayOfWeek;

  /// Current status of the route
  @override
  final DailyRouteStatus status;
  // === Timestamps ===
  /// When the route was activated by the agent
  @override
  final DateTime? activatedAt;

  /// First clock-in time of the day
  @override
  final DateTime? firstClockInAt;

  /// Last clock-out time of the day
  @override
  final DateTime? lastClockOutAt;

  /// When the route was closed
  @override
  final DateTime? closedAt;
  // === Progress Tracking ===
  /// Total number of scheduled visits
  @override
  @JsonKey()
  final int totalScheduled;

  /// Number of completed visits
  @override
  @JsonKey()
  final int completedCount;

  /// Number of skipped visits
  @override
  @JsonKey()
  final int skippedCount;

  /// Number of visits currently in progress (should be 0 or 1)
  @override
  @JsonKey()
  final int inProgressCount;

  /// Total time spent on visits (minutes)
  @override
  @JsonKey()
  final int totalVisitTimeMins;
  // === Closing Details ===
  /// Notes provided when closing the route
  @override
  final String? closingNotes;

  /// User who closed the route (usually the agent)
  @override
  final String? closedByUserId;
  // === Force Close (Supervisor/Manager action) ===
  /// Whether route was force-closed by supervisor/manager
  @override
  @JsonKey()
  final bool forceClosed;

  /// User who force-closed the route
  @override
  final String? forceClosedByUserId;

  /// When the route was force-closed
  @override
  final DateTime? forceClosedAt;

  /// Reason for force-closing
  @override
  final String? forceCloseReason;
  // === Sync State ===
  /// Current sync state with backend
  @override
  @JsonKey()
  final SyncState syncState;

  /// Last sync error message (if any)
  @override
  final String? syncError;

  /// Timestamp of last successful sync
  @override
  final DateTime? lastSyncedAt;

  @override
  String toString() {
    return 'DailyRoute(localId: $localId, serverId: $serverId, salesAgentId: $salesAgentId, routeDate: $routeDate, dayOfWeek: $dayOfWeek, status: $status, activatedAt: $activatedAt, firstClockInAt: $firstClockInAt, lastClockOutAt: $lastClockOutAt, closedAt: $closedAt, totalScheduled: $totalScheduled, completedCount: $completedCount, skippedCount: $skippedCount, inProgressCount: $inProgressCount, totalVisitTimeMins: $totalVisitTimeMins, closingNotes: $closingNotes, closedByUserId: $closedByUserId, forceClosed: $forceClosed, forceClosedByUserId: $forceClosedByUserId, forceClosedAt: $forceClosedAt, forceCloseReason: $forceCloseReason, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyRouteImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.salesAgentId, salesAgentId) ||
                other.salesAgentId == salesAgentId) &&
            (identical(other.routeDate, routeDate) ||
                other.routeDate == routeDate) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activatedAt, activatedAt) ||
                other.activatedAt == activatedAt) &&
            (identical(other.firstClockInAt, firstClockInAt) ||
                other.firstClockInAt == firstClockInAt) &&
            (identical(other.lastClockOutAt, lastClockOutAt) ||
                other.lastClockOutAt == lastClockOutAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.totalScheduled, totalScheduled) ||
                other.totalScheduled == totalScheduled) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.skippedCount, skippedCount) ||
                other.skippedCount == skippedCount) &&
            (identical(other.inProgressCount, inProgressCount) ||
                other.inProgressCount == inProgressCount) &&
            (identical(other.totalVisitTimeMins, totalVisitTimeMins) ||
                other.totalVisitTimeMins == totalVisitTimeMins) &&
            (identical(other.closingNotes, closingNotes) ||
                other.closingNotes == closingNotes) &&
            (identical(other.closedByUserId, closedByUserId) ||
                other.closedByUserId == closedByUserId) &&
            (identical(other.forceClosed, forceClosed) ||
                other.forceClosed == forceClosed) &&
            (identical(other.forceClosedByUserId, forceClosedByUserId) ||
                other.forceClosedByUserId == forceClosedByUserId) &&
            (identical(other.forceClosedAt, forceClosedAt) ||
                other.forceClosedAt == forceClosedAt) &&
            (identical(other.forceCloseReason, forceCloseReason) ||
                other.forceCloseReason == forceCloseReason) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState) &&
            (identical(other.syncError, syncError) ||
                other.syncError == syncError) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    localId,
    serverId,
    salesAgentId,
    routeDate,
    dayOfWeek,
    status,
    activatedAt,
    firstClockInAt,
    lastClockOutAt,
    closedAt,
    totalScheduled,
    completedCount,
    skippedCount,
    inProgressCount,
    totalVisitTimeMins,
    closingNotes,
    closedByUserId,
    forceClosed,
    forceClosedByUserId,
    forceClosedAt,
    forceCloseReason,
    syncState,
    syncError,
    lastSyncedAt,
  ]);

  /// Create a copy of DailyRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyRouteImplCopyWith<_$DailyRouteImpl> get copyWith =>
      __$$DailyRouteImplCopyWithImpl<_$DailyRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyRouteImplToJson(this);
  }
}

abstract class _DailyRoute implements DailyRoute {
  const factory _DailyRoute({
    required final String localId,
    final String? serverId,
    required final String salesAgentId,
    required final DateTime routeDate,
    required final int dayOfWeek,
    required final DailyRouteStatus status,
    final DateTime? activatedAt,
    final DateTime? firstClockInAt,
    final DateTime? lastClockOutAt,
    final DateTime? closedAt,
    final int totalScheduled,
    final int completedCount,
    final int skippedCount,
    final int inProgressCount,
    final int totalVisitTimeMins,
    final String? closingNotes,
    final String? closedByUserId,
    final bool forceClosed,
    final String? forceClosedByUserId,
    final DateTime? forceClosedAt,
    final String? forceCloseReason,
    final SyncState syncState,
    final String? syncError,
    final DateTime? lastSyncedAt,
  }) = _$DailyRouteImpl;

  factory _DailyRoute.fromJson(Map<String, dynamic> json) =
      _$DailyRouteImpl.fromJson;

  /// Local UUID for offline-first operations
  @override
  String get localId;

  /// Backend route ID (null until synced)
  @override
  String? get serverId;

  /// Agent this route belongs to
  @override
  String get salesAgentId;

  /// Date of the route (YYYY-MM-DD, no time component)
  @override
  DateTime get routeDate;

  /// Day of week (0=Monday, 6=Sunday)
  @override
  int get dayOfWeek;

  /// Current status of the route
  @override
  DailyRouteStatus get status; // === Timestamps ===
  /// When the route was activated by the agent
  @override
  DateTime? get activatedAt;

  /// First clock-in time of the day
  @override
  DateTime? get firstClockInAt;

  /// Last clock-out time of the day
  @override
  DateTime? get lastClockOutAt;

  /// When the route was closed
  @override
  DateTime? get closedAt; // === Progress Tracking ===
  /// Total number of scheduled visits
  @override
  int get totalScheduled;

  /// Number of completed visits
  @override
  int get completedCount;

  /// Number of skipped visits
  @override
  int get skippedCount;

  /// Number of visits currently in progress (should be 0 or 1)
  @override
  int get inProgressCount;

  /// Total time spent on visits (minutes)
  @override
  int get totalVisitTimeMins; // === Closing Details ===
  /// Notes provided when closing the route
  @override
  String? get closingNotes;

  /// User who closed the route (usually the agent)
  @override
  String? get closedByUserId; // === Force Close (Supervisor/Manager action) ===
  /// Whether route was force-closed by supervisor/manager
  @override
  bool get forceClosed;

  /// User who force-closed the route
  @override
  String? get forceClosedByUserId;

  /// When the route was force-closed
  @override
  DateTime? get forceClosedAt;

  /// Reason for force-closing
  @override
  String? get forceCloseReason; // === Sync State ===
  /// Current sync state with backend
  @override
  SyncState get syncState;

  /// Last sync error message (if any)
  @override
  String? get syncError;

  /// Timestamp of last successful sync
  @override
  DateTime? get lastSyncedAt;

  /// Create a copy of DailyRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyRouteImplCopyWith<_$DailyRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
