// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet_visit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OutletVisit _$OutletVisitFromJson(Map<String, dynamic> json) {
  return _OutletVisit.fromJson(json);
}

/// @nodoc
mixin _$OutletVisit {
  /// Local UUID for offline-first operations
  String get localId => throw _privateConstructorUsedError;

  /// Backend visit ID (null until synced)
  String? get serverId =>
      throw _privateConstructorUsedError; // === Route Linkage ===
  /// Local ID of the parent daily route
  String get dailyRouteLocalId => throw _privateConstructorUsedError;

  /// Server ID of the parent daily route (null until route synced)
  String? get dailyRouteServerId =>
      throw _privateConstructorUsedError; // === Outlet Information ===
  /// Customer/Outlet ID from backend
  String get outletId => throw _privateConstructorUsedError;

  /// Outlet code (e.g., "CL000001")
  String get outletCode => throw _privateConstructorUsedError;

  /// Outlet display name
  String get outletName => throw _privateConstructorUsedError;

  /// Outlet GPS latitude
  double get outletLatitude => throw _privateConstructorUsedError;

  /// Outlet GPS longitude
  double get outletLongitude => throw _privateConstructorUsedError;

  /// Geofence radius for this outlet (meters)
  double get geofenceRadiusMeters =>
      throw _privateConstructorUsedError; // === Schedule Information ===
  /// Server ID of the schedule this visit was generated from
  String? get scheduleServerId => throw _privateConstructorUsedError;

  /// Order in the route (1, 2, 3, ...)
  int get visitOrder => throw _privateConstructorUsedError;

  /// Scheduled clock-in time (time of day)
  String? get scheduledClockIn => throw _privateConstructorUsedError;

  /// Scheduled clock-out time (time of day)
  String? get scheduledClockOut => throw _privateConstructorUsedError;

  /// Allocated time for this visit (minutes)
  int get allocatedMinutes => throw _privateConstructorUsedError;

  /// Visit priority (1=must visit, 2=important, 3=flexible)
  int get visitPriority =>
      throw _privateConstructorUsedError; // === Visit Type ===
  /// Whether this is a scheduled or ad-hoc visit
  VisitType get visitType =>
      throw _privateConstructorUsedError; // === Status & Timing ===
  /// Current status of the visit
  VisitStatus get status => throw _privateConstructorUsedError;

  /// Actual clock-in timestamp
  DateTime? get actualClockIn => throw _privateConstructorUsedError;

  /// Actual clock-out timestamp
  DateTime? get actualClockOut => throw _privateConstructorUsedError;

  /// Calculated visit duration (minutes)
  int? get visitDurationMins =>
      throw _privateConstructorUsedError; // === Location Data ===
  /// GPS latitude at clock-in
  double? get clockInLatitude => throw _privateConstructorUsedError;

  /// GPS longitude at clock-in
  double? get clockInLongitude => throw _privateConstructorUsedError;

  /// GPS accuracy at clock-in (meters)
  double? get clockInAccuracyMeters => throw _privateConstructorUsedError;

  /// Distance from outlet at clock-in (meters)
  double? get clockInDistanceMeters => throw _privateConstructorUsedError;

  /// GPS latitude at clock-out
  double? get clockOutLatitude => throw _privateConstructorUsedError;

  /// GPS longitude at clock-out
  double? get clockOutLongitude => throw _privateConstructorUsedError;

  /// GPS accuracy at clock-out (meters)
  double? get clockOutAccuracyMeters => throw _privateConstructorUsedError;

  /// Distance from outlet at clock-out (meters)
  double? get clockOutDistanceMeters =>
      throw _privateConstructorUsedError; // === Geofence Override ===
  /// Whether geofence was overridden for this visit
  bool get geofenceOverride => throw _privateConstructorUsedError;

  /// ID of the approved override request (if any)
  String? get overrideRequestId =>
      throw _privateConstructorUsedError; // === Skip Information ===
  /// ID of the skip reason (from SkipReasonCache)
  int? get skipReasonId => throw _privateConstructorUsedError;

  /// Skip reason code (e.g., "CLOSED", "OUT_OF_STOCK")
  String? get skipReasonCode => throw _privateConstructorUsedError;

  /// Additional notes for skip
  String? get skipNotes => throw _privateConstructorUsedError; // === Notes ===
  /// Notes entered at clock-in
  String? get clockInNotes => throw _privateConstructorUsedError;

  /// Notes entered at clock-out
  String? get clockOutNotes => throw _privateConstructorUsedError;

  /// General visit notes
  String? get visitNotes =>
      throw _privateConstructorUsedError; // === Sync State ===
  /// Current sync state with backend
  SyncState get syncState => throw _privateConstructorUsedError;

  /// Last sync error message (if any)
  String? get syncError => throw _privateConstructorUsedError;

  /// Timestamp of last successful sync
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;

  /// Serializes this OutletVisit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutletVisit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutletVisitCopyWith<OutletVisit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletVisitCopyWith<$Res> {
  factory $OutletVisitCopyWith(
    OutletVisit value,
    $Res Function(OutletVisit) then,
  ) = _$OutletVisitCopyWithImpl<$Res, OutletVisit>;
  @useResult
  $Res call({
    String localId,
    String? serverId,
    String dailyRouteLocalId,
    String? dailyRouteServerId,
    String outletId,
    String outletCode,
    String outletName,
    double outletLatitude,
    double outletLongitude,
    double geofenceRadiusMeters,
    String? scheduleServerId,
    int visitOrder,
    String? scheduledClockIn,
    String? scheduledClockOut,
    int allocatedMinutes,
    int visitPriority,
    VisitType visitType,
    VisitStatus status,
    DateTime? actualClockIn,
    DateTime? actualClockOut,
    int? visitDurationMins,
    double? clockInLatitude,
    double? clockInLongitude,
    double? clockInAccuracyMeters,
    double? clockInDistanceMeters,
    double? clockOutLatitude,
    double? clockOutLongitude,
    double? clockOutAccuracyMeters,
    double? clockOutDistanceMeters,
    bool geofenceOverride,
    String? overrideRequestId,
    int? skipReasonId,
    String? skipReasonCode,
    String? skipNotes,
    String? clockInNotes,
    String? clockOutNotes,
    String? visitNotes,
    SyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
  });
}

/// @nodoc
class _$OutletVisitCopyWithImpl<$Res, $Val extends OutletVisit>
    implements $OutletVisitCopyWith<$Res> {
  _$OutletVisitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutletVisit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? dailyRouteLocalId = null,
    Object? dailyRouteServerId = freezed,
    Object? outletId = null,
    Object? outletCode = null,
    Object? outletName = null,
    Object? outletLatitude = null,
    Object? outletLongitude = null,
    Object? geofenceRadiusMeters = null,
    Object? scheduleServerId = freezed,
    Object? visitOrder = null,
    Object? scheduledClockIn = freezed,
    Object? scheduledClockOut = freezed,
    Object? allocatedMinutes = null,
    Object? visitPriority = null,
    Object? visitType = null,
    Object? status = null,
    Object? actualClockIn = freezed,
    Object? actualClockOut = freezed,
    Object? visitDurationMins = freezed,
    Object? clockInLatitude = freezed,
    Object? clockInLongitude = freezed,
    Object? clockInAccuracyMeters = freezed,
    Object? clockInDistanceMeters = freezed,
    Object? clockOutLatitude = freezed,
    Object? clockOutLongitude = freezed,
    Object? clockOutAccuracyMeters = freezed,
    Object? clockOutDistanceMeters = freezed,
    Object? geofenceOverride = null,
    Object? overrideRequestId = freezed,
    Object? skipReasonId = freezed,
    Object? skipReasonCode = freezed,
    Object? skipNotes = freezed,
    Object? clockInNotes = freezed,
    Object? clockOutNotes = freezed,
    Object? visitNotes = freezed,
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
            dailyRouteLocalId: null == dailyRouteLocalId
                ? _value.dailyRouteLocalId
                : dailyRouteLocalId // ignore: cast_nullable_to_non_nullable
                      as String,
            dailyRouteServerId: freezed == dailyRouteServerId
                ? _value.dailyRouteServerId
                : dailyRouteServerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            outletId: null == outletId
                ? _value.outletId
                : outletId // ignore: cast_nullable_to_non_nullable
                      as String,
            outletCode: null == outletCode
                ? _value.outletCode
                : outletCode // ignore: cast_nullable_to_non_nullable
                      as String,
            outletName: null == outletName
                ? _value.outletName
                : outletName // ignore: cast_nullable_to_non_nullable
                      as String,
            outletLatitude: null == outletLatitude
                ? _value.outletLatitude
                : outletLatitude // ignore: cast_nullable_to_non_nullable
                      as double,
            outletLongitude: null == outletLongitude
                ? _value.outletLongitude
                : outletLongitude // ignore: cast_nullable_to_non_nullable
                      as double,
            geofenceRadiusMeters: null == geofenceRadiusMeters
                ? _value.geofenceRadiusMeters
                : geofenceRadiusMeters // ignore: cast_nullable_to_non_nullable
                      as double,
            scheduleServerId: freezed == scheduleServerId
                ? _value.scheduleServerId
                : scheduleServerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            visitOrder: null == visitOrder
                ? _value.visitOrder
                : visitOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            scheduledClockIn: freezed == scheduledClockIn
                ? _value.scheduledClockIn
                : scheduledClockIn // ignore: cast_nullable_to_non_nullable
                      as String?,
            scheduledClockOut: freezed == scheduledClockOut
                ? _value.scheduledClockOut
                : scheduledClockOut // ignore: cast_nullable_to_non_nullable
                      as String?,
            allocatedMinutes: null == allocatedMinutes
                ? _value.allocatedMinutes
                : allocatedMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            visitPriority: null == visitPriority
                ? _value.visitPriority
                : visitPriority // ignore: cast_nullable_to_non_nullable
                      as int,
            visitType: null == visitType
                ? _value.visitType
                : visitType // ignore: cast_nullable_to_non_nullable
                      as VisitType,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as VisitStatus,
            actualClockIn: freezed == actualClockIn
                ? _value.actualClockIn
                : actualClockIn // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            actualClockOut: freezed == actualClockOut
                ? _value.actualClockOut
                : actualClockOut // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            visitDurationMins: freezed == visitDurationMins
                ? _value.visitDurationMins
                : visitDurationMins // ignore: cast_nullable_to_non_nullable
                      as int?,
            clockInLatitude: freezed == clockInLatitude
                ? _value.clockInLatitude
                : clockInLatitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            clockInLongitude: freezed == clockInLongitude
                ? _value.clockInLongitude
                : clockInLongitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            clockInAccuracyMeters: freezed == clockInAccuracyMeters
                ? _value.clockInAccuracyMeters
                : clockInAccuracyMeters // ignore: cast_nullable_to_non_nullable
                      as double?,
            clockInDistanceMeters: freezed == clockInDistanceMeters
                ? _value.clockInDistanceMeters
                : clockInDistanceMeters // ignore: cast_nullable_to_non_nullable
                      as double?,
            clockOutLatitude: freezed == clockOutLatitude
                ? _value.clockOutLatitude
                : clockOutLatitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            clockOutLongitude: freezed == clockOutLongitude
                ? _value.clockOutLongitude
                : clockOutLongitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            clockOutAccuracyMeters: freezed == clockOutAccuracyMeters
                ? _value.clockOutAccuracyMeters
                : clockOutAccuracyMeters // ignore: cast_nullable_to_non_nullable
                      as double?,
            clockOutDistanceMeters: freezed == clockOutDistanceMeters
                ? _value.clockOutDistanceMeters
                : clockOutDistanceMeters // ignore: cast_nullable_to_non_nullable
                      as double?,
            geofenceOverride: null == geofenceOverride
                ? _value.geofenceOverride
                : geofenceOverride // ignore: cast_nullable_to_non_nullable
                      as bool,
            overrideRequestId: freezed == overrideRequestId
                ? _value.overrideRequestId
                : overrideRequestId // ignore: cast_nullable_to_non_nullable
                      as String?,
            skipReasonId: freezed == skipReasonId
                ? _value.skipReasonId
                : skipReasonId // ignore: cast_nullable_to_non_nullable
                      as int?,
            skipReasonCode: freezed == skipReasonCode
                ? _value.skipReasonCode
                : skipReasonCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            skipNotes: freezed == skipNotes
                ? _value.skipNotes
                : skipNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            clockInNotes: freezed == clockInNotes
                ? _value.clockInNotes
                : clockInNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            clockOutNotes: freezed == clockOutNotes
                ? _value.clockOutNotes
                : clockOutNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            visitNotes: freezed == visitNotes
                ? _value.visitNotes
                : visitNotes // ignore: cast_nullable_to_non_nullable
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
abstract class _$$OutletVisitImplCopyWith<$Res>
    implements $OutletVisitCopyWith<$Res> {
  factory _$$OutletVisitImplCopyWith(
    _$OutletVisitImpl value,
    $Res Function(_$OutletVisitImpl) then,
  ) = __$$OutletVisitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String localId,
    String? serverId,
    String dailyRouteLocalId,
    String? dailyRouteServerId,
    String outletId,
    String outletCode,
    String outletName,
    double outletLatitude,
    double outletLongitude,
    double geofenceRadiusMeters,
    String? scheduleServerId,
    int visitOrder,
    String? scheduledClockIn,
    String? scheduledClockOut,
    int allocatedMinutes,
    int visitPriority,
    VisitType visitType,
    VisitStatus status,
    DateTime? actualClockIn,
    DateTime? actualClockOut,
    int? visitDurationMins,
    double? clockInLatitude,
    double? clockInLongitude,
    double? clockInAccuracyMeters,
    double? clockInDistanceMeters,
    double? clockOutLatitude,
    double? clockOutLongitude,
    double? clockOutAccuracyMeters,
    double? clockOutDistanceMeters,
    bool geofenceOverride,
    String? overrideRequestId,
    int? skipReasonId,
    String? skipReasonCode,
    String? skipNotes,
    String? clockInNotes,
    String? clockOutNotes,
    String? visitNotes,
    SyncState syncState,
    String? syncError,
    DateTime? lastSyncedAt,
  });
}

/// @nodoc
class __$$OutletVisitImplCopyWithImpl<$Res>
    extends _$OutletVisitCopyWithImpl<$Res, _$OutletVisitImpl>
    implements _$$OutletVisitImplCopyWith<$Res> {
  __$$OutletVisitImplCopyWithImpl(
    _$OutletVisitImpl _value,
    $Res Function(_$OutletVisitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutletVisit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? dailyRouteLocalId = null,
    Object? dailyRouteServerId = freezed,
    Object? outletId = null,
    Object? outletCode = null,
    Object? outletName = null,
    Object? outletLatitude = null,
    Object? outletLongitude = null,
    Object? geofenceRadiusMeters = null,
    Object? scheduleServerId = freezed,
    Object? visitOrder = null,
    Object? scheduledClockIn = freezed,
    Object? scheduledClockOut = freezed,
    Object? allocatedMinutes = null,
    Object? visitPriority = null,
    Object? visitType = null,
    Object? status = null,
    Object? actualClockIn = freezed,
    Object? actualClockOut = freezed,
    Object? visitDurationMins = freezed,
    Object? clockInLatitude = freezed,
    Object? clockInLongitude = freezed,
    Object? clockInAccuracyMeters = freezed,
    Object? clockInDistanceMeters = freezed,
    Object? clockOutLatitude = freezed,
    Object? clockOutLongitude = freezed,
    Object? clockOutAccuracyMeters = freezed,
    Object? clockOutDistanceMeters = freezed,
    Object? geofenceOverride = null,
    Object? overrideRequestId = freezed,
    Object? skipReasonId = freezed,
    Object? skipReasonCode = freezed,
    Object? skipNotes = freezed,
    Object? clockInNotes = freezed,
    Object? clockOutNotes = freezed,
    Object? visitNotes = freezed,
    Object? syncState = null,
    Object? syncError = freezed,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(
      _$OutletVisitImpl(
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        serverId: freezed == serverId
            ? _value.serverId
            : serverId // ignore: cast_nullable_to_non_nullable
                  as String?,
        dailyRouteLocalId: null == dailyRouteLocalId
            ? _value.dailyRouteLocalId
            : dailyRouteLocalId // ignore: cast_nullable_to_non_nullable
                  as String,
        dailyRouteServerId: freezed == dailyRouteServerId
            ? _value.dailyRouteServerId
            : dailyRouteServerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        outletId: null == outletId
            ? _value.outletId
            : outletId // ignore: cast_nullable_to_non_nullable
                  as String,
        outletCode: null == outletCode
            ? _value.outletCode
            : outletCode // ignore: cast_nullable_to_non_nullable
                  as String,
        outletName: null == outletName
            ? _value.outletName
            : outletName // ignore: cast_nullable_to_non_nullable
                  as String,
        outletLatitude: null == outletLatitude
            ? _value.outletLatitude
            : outletLatitude // ignore: cast_nullable_to_non_nullable
                  as double,
        outletLongitude: null == outletLongitude
            ? _value.outletLongitude
            : outletLongitude // ignore: cast_nullable_to_non_nullable
                  as double,
        geofenceRadiusMeters: null == geofenceRadiusMeters
            ? _value.geofenceRadiusMeters
            : geofenceRadiusMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        scheduleServerId: freezed == scheduleServerId
            ? _value.scheduleServerId
            : scheduleServerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        visitOrder: null == visitOrder
            ? _value.visitOrder
            : visitOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        scheduledClockIn: freezed == scheduledClockIn
            ? _value.scheduledClockIn
            : scheduledClockIn // ignore: cast_nullable_to_non_nullable
                  as String?,
        scheduledClockOut: freezed == scheduledClockOut
            ? _value.scheduledClockOut
            : scheduledClockOut // ignore: cast_nullable_to_non_nullable
                  as String?,
        allocatedMinutes: null == allocatedMinutes
            ? _value.allocatedMinutes
            : allocatedMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        visitPriority: null == visitPriority
            ? _value.visitPriority
            : visitPriority // ignore: cast_nullable_to_non_nullable
                  as int,
        visitType: null == visitType
            ? _value.visitType
            : visitType // ignore: cast_nullable_to_non_nullable
                  as VisitType,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as VisitStatus,
        actualClockIn: freezed == actualClockIn
            ? _value.actualClockIn
            : actualClockIn // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        actualClockOut: freezed == actualClockOut
            ? _value.actualClockOut
            : actualClockOut // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        visitDurationMins: freezed == visitDurationMins
            ? _value.visitDurationMins
            : visitDurationMins // ignore: cast_nullable_to_non_nullable
                  as int?,
        clockInLatitude: freezed == clockInLatitude
            ? _value.clockInLatitude
            : clockInLatitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        clockInLongitude: freezed == clockInLongitude
            ? _value.clockInLongitude
            : clockInLongitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        clockInAccuracyMeters: freezed == clockInAccuracyMeters
            ? _value.clockInAccuracyMeters
            : clockInAccuracyMeters // ignore: cast_nullable_to_non_nullable
                  as double?,
        clockInDistanceMeters: freezed == clockInDistanceMeters
            ? _value.clockInDistanceMeters
            : clockInDistanceMeters // ignore: cast_nullable_to_non_nullable
                  as double?,
        clockOutLatitude: freezed == clockOutLatitude
            ? _value.clockOutLatitude
            : clockOutLatitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        clockOutLongitude: freezed == clockOutLongitude
            ? _value.clockOutLongitude
            : clockOutLongitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        clockOutAccuracyMeters: freezed == clockOutAccuracyMeters
            ? _value.clockOutAccuracyMeters
            : clockOutAccuracyMeters // ignore: cast_nullable_to_non_nullable
                  as double?,
        clockOutDistanceMeters: freezed == clockOutDistanceMeters
            ? _value.clockOutDistanceMeters
            : clockOutDistanceMeters // ignore: cast_nullable_to_non_nullable
                  as double?,
        geofenceOverride: null == geofenceOverride
            ? _value.geofenceOverride
            : geofenceOverride // ignore: cast_nullable_to_non_nullable
                  as bool,
        overrideRequestId: freezed == overrideRequestId
            ? _value.overrideRequestId
            : overrideRequestId // ignore: cast_nullable_to_non_nullable
                  as String?,
        skipReasonId: freezed == skipReasonId
            ? _value.skipReasonId
            : skipReasonId // ignore: cast_nullable_to_non_nullable
                  as int?,
        skipReasonCode: freezed == skipReasonCode
            ? _value.skipReasonCode
            : skipReasonCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        skipNotes: freezed == skipNotes
            ? _value.skipNotes
            : skipNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        clockInNotes: freezed == clockInNotes
            ? _value.clockInNotes
            : clockInNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        clockOutNotes: freezed == clockOutNotes
            ? _value.clockOutNotes
            : clockOutNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        visitNotes: freezed == visitNotes
            ? _value.visitNotes
            : visitNotes // ignore: cast_nullable_to_non_nullable
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
class _$OutletVisitImpl implements _OutletVisit {
  const _$OutletVisitImpl({
    required this.localId,
    this.serverId,
    required this.dailyRouteLocalId,
    this.dailyRouteServerId,
    required this.outletId,
    required this.outletCode,
    required this.outletName,
    required this.outletLatitude,
    required this.outletLongitude,
    this.geofenceRadiusMeters = 200.0,
    this.scheduleServerId,
    required this.visitOrder,
    this.scheduledClockIn,
    this.scheduledClockOut,
    required this.allocatedMinutes,
    this.visitPriority = 2,
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
    this.geofenceOverride = false,
    this.overrideRequestId,
    this.skipReasonId,
    this.skipReasonCode,
    this.skipNotes,
    this.clockInNotes,
    this.clockOutNotes,
    this.visitNotes,
    this.syncState = SyncState.localOnly,
    this.syncError,
    this.lastSyncedAt,
  });

  factory _$OutletVisitImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutletVisitImplFromJson(json);

  /// Local UUID for offline-first operations
  @override
  final String localId;

  /// Backend visit ID (null until synced)
  @override
  final String? serverId;
  // === Route Linkage ===
  /// Local ID of the parent daily route
  @override
  final String dailyRouteLocalId;

  /// Server ID of the parent daily route (null until route synced)
  @override
  final String? dailyRouteServerId;
  // === Outlet Information ===
  /// Customer/Outlet ID from backend
  @override
  final String outletId;

  /// Outlet code (e.g., "CL000001")
  @override
  final String outletCode;

  /// Outlet display name
  @override
  final String outletName;

  /// Outlet GPS latitude
  @override
  final double outletLatitude;

  /// Outlet GPS longitude
  @override
  final double outletLongitude;

  /// Geofence radius for this outlet (meters)
  @override
  @JsonKey()
  final double geofenceRadiusMeters;
  // === Schedule Information ===
  /// Server ID of the schedule this visit was generated from
  @override
  final String? scheduleServerId;

  /// Order in the route (1, 2, 3, ...)
  @override
  final int visitOrder;

  /// Scheduled clock-in time (time of day)
  @override
  final String? scheduledClockIn;

  /// Scheduled clock-out time (time of day)
  @override
  final String? scheduledClockOut;

  /// Allocated time for this visit (minutes)
  @override
  final int allocatedMinutes;

  /// Visit priority (1=must visit, 2=important, 3=flexible)
  @override
  @JsonKey()
  final int visitPriority;
  // === Visit Type ===
  /// Whether this is a scheduled or ad-hoc visit
  @override
  final VisitType visitType;
  // === Status & Timing ===
  /// Current status of the visit
  @override
  final VisitStatus status;

  /// Actual clock-in timestamp
  @override
  final DateTime? actualClockIn;

  /// Actual clock-out timestamp
  @override
  final DateTime? actualClockOut;

  /// Calculated visit duration (minutes)
  @override
  final int? visitDurationMins;
  // === Location Data ===
  /// GPS latitude at clock-in
  @override
  final double? clockInLatitude;

  /// GPS longitude at clock-in
  @override
  final double? clockInLongitude;

  /// GPS accuracy at clock-in (meters)
  @override
  final double? clockInAccuracyMeters;

  /// Distance from outlet at clock-in (meters)
  @override
  final double? clockInDistanceMeters;

  /// GPS latitude at clock-out
  @override
  final double? clockOutLatitude;

  /// GPS longitude at clock-out
  @override
  final double? clockOutLongitude;

  /// GPS accuracy at clock-out (meters)
  @override
  final double? clockOutAccuracyMeters;

  /// Distance from outlet at clock-out (meters)
  @override
  final double? clockOutDistanceMeters;
  // === Geofence Override ===
  /// Whether geofence was overridden for this visit
  @override
  @JsonKey()
  final bool geofenceOverride;

  /// ID of the approved override request (if any)
  @override
  final String? overrideRequestId;
  // === Skip Information ===
  /// ID of the skip reason (from SkipReasonCache)
  @override
  final int? skipReasonId;

  /// Skip reason code (e.g., "CLOSED", "OUT_OF_STOCK")
  @override
  final String? skipReasonCode;

  /// Additional notes for skip
  @override
  final String? skipNotes;
  // === Notes ===
  /// Notes entered at clock-in
  @override
  final String? clockInNotes;

  /// Notes entered at clock-out
  @override
  final String? clockOutNotes;

  /// General visit notes
  @override
  final String? visitNotes;
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
    return 'OutletVisit(localId: $localId, serverId: $serverId, dailyRouteLocalId: $dailyRouteLocalId, dailyRouteServerId: $dailyRouteServerId, outletId: $outletId, outletCode: $outletCode, outletName: $outletName, outletLatitude: $outletLatitude, outletLongitude: $outletLongitude, geofenceRadiusMeters: $geofenceRadiusMeters, scheduleServerId: $scheduleServerId, visitOrder: $visitOrder, scheduledClockIn: $scheduledClockIn, scheduledClockOut: $scheduledClockOut, allocatedMinutes: $allocatedMinutes, visitPriority: $visitPriority, visitType: $visitType, status: $status, actualClockIn: $actualClockIn, actualClockOut: $actualClockOut, visitDurationMins: $visitDurationMins, clockInLatitude: $clockInLatitude, clockInLongitude: $clockInLongitude, clockInAccuracyMeters: $clockInAccuracyMeters, clockInDistanceMeters: $clockInDistanceMeters, clockOutLatitude: $clockOutLatitude, clockOutLongitude: $clockOutLongitude, clockOutAccuracyMeters: $clockOutAccuracyMeters, clockOutDistanceMeters: $clockOutDistanceMeters, geofenceOverride: $geofenceOverride, overrideRequestId: $overrideRequestId, skipReasonId: $skipReasonId, skipReasonCode: $skipReasonCode, skipNotes: $skipNotes, clockInNotes: $clockInNotes, clockOutNotes: $clockOutNotes, visitNotes: $visitNotes, syncState: $syncState, syncError: $syncError, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletVisitImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.dailyRouteLocalId, dailyRouteLocalId) ||
                other.dailyRouteLocalId == dailyRouteLocalId) &&
            (identical(other.dailyRouteServerId, dailyRouteServerId) ||
                other.dailyRouteServerId == dailyRouteServerId) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.outletCode, outletCode) ||
                other.outletCode == outletCode) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.outletLatitude, outletLatitude) ||
                other.outletLatitude == outletLatitude) &&
            (identical(other.outletLongitude, outletLongitude) ||
                other.outletLongitude == outletLongitude) &&
            (identical(other.geofenceRadiusMeters, geofenceRadiusMeters) ||
                other.geofenceRadiusMeters == geofenceRadiusMeters) &&
            (identical(other.scheduleServerId, scheduleServerId) ||
                other.scheduleServerId == scheduleServerId) &&
            (identical(other.visitOrder, visitOrder) ||
                other.visitOrder == visitOrder) &&
            (identical(other.scheduledClockIn, scheduledClockIn) ||
                other.scheduledClockIn == scheduledClockIn) &&
            (identical(other.scheduledClockOut, scheduledClockOut) ||
                other.scheduledClockOut == scheduledClockOut) &&
            (identical(other.allocatedMinutes, allocatedMinutes) ||
                other.allocatedMinutes == allocatedMinutes) &&
            (identical(other.visitPriority, visitPriority) ||
                other.visitPriority == visitPriority) &&
            (identical(other.visitType, visitType) ||
                other.visitType == visitType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.actualClockIn, actualClockIn) ||
                other.actualClockIn == actualClockIn) &&
            (identical(other.actualClockOut, actualClockOut) ||
                other.actualClockOut == actualClockOut) &&
            (identical(other.visitDurationMins, visitDurationMins) ||
                other.visitDurationMins == visitDurationMins) &&
            (identical(other.clockInLatitude, clockInLatitude) ||
                other.clockInLatitude == clockInLatitude) &&
            (identical(other.clockInLongitude, clockInLongitude) ||
                other.clockInLongitude == clockInLongitude) &&
            (identical(other.clockInAccuracyMeters, clockInAccuracyMeters) ||
                other.clockInAccuracyMeters == clockInAccuracyMeters) &&
            (identical(other.clockInDistanceMeters, clockInDistanceMeters) ||
                other.clockInDistanceMeters == clockInDistanceMeters) &&
            (identical(other.clockOutLatitude, clockOutLatitude) ||
                other.clockOutLatitude == clockOutLatitude) &&
            (identical(other.clockOutLongitude, clockOutLongitude) ||
                other.clockOutLongitude == clockOutLongitude) &&
            (identical(other.clockOutAccuracyMeters, clockOutAccuracyMeters) ||
                other.clockOutAccuracyMeters == clockOutAccuracyMeters) &&
            (identical(other.clockOutDistanceMeters, clockOutDistanceMeters) ||
                other.clockOutDistanceMeters == clockOutDistanceMeters) &&
            (identical(other.geofenceOverride, geofenceOverride) ||
                other.geofenceOverride == geofenceOverride) &&
            (identical(other.overrideRequestId, overrideRequestId) ||
                other.overrideRequestId == overrideRequestId) &&
            (identical(other.skipReasonId, skipReasonId) ||
                other.skipReasonId == skipReasonId) &&
            (identical(other.skipReasonCode, skipReasonCode) ||
                other.skipReasonCode == skipReasonCode) &&
            (identical(other.skipNotes, skipNotes) ||
                other.skipNotes == skipNotes) &&
            (identical(other.clockInNotes, clockInNotes) ||
                other.clockInNotes == clockInNotes) &&
            (identical(other.clockOutNotes, clockOutNotes) ||
                other.clockOutNotes == clockOutNotes) &&
            (identical(other.visitNotes, visitNotes) ||
                other.visitNotes == visitNotes) &&
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
    dailyRouteLocalId,
    dailyRouteServerId,
    outletId,
    outletCode,
    outletName,
    outletLatitude,
    outletLongitude,
    geofenceRadiusMeters,
    scheduleServerId,
    visitOrder,
    scheduledClockIn,
    scheduledClockOut,
    allocatedMinutes,
    visitPriority,
    visitType,
    status,
    actualClockIn,
    actualClockOut,
    visitDurationMins,
    clockInLatitude,
    clockInLongitude,
    clockInAccuracyMeters,
    clockInDistanceMeters,
    clockOutLatitude,
    clockOutLongitude,
    clockOutAccuracyMeters,
    clockOutDistanceMeters,
    geofenceOverride,
    overrideRequestId,
    skipReasonId,
    skipReasonCode,
    skipNotes,
    clockInNotes,
    clockOutNotes,
    visitNotes,
    syncState,
    syncError,
    lastSyncedAt,
  ]);

  /// Create a copy of OutletVisit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletVisitImplCopyWith<_$OutletVisitImpl> get copyWith =>
      __$$OutletVisitImplCopyWithImpl<_$OutletVisitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletVisitImplToJson(this);
  }
}

abstract class _OutletVisit implements OutletVisit {
  const factory _OutletVisit({
    required final String localId,
    final String? serverId,
    required final String dailyRouteLocalId,
    final String? dailyRouteServerId,
    required final String outletId,
    required final String outletCode,
    required final String outletName,
    required final double outletLatitude,
    required final double outletLongitude,
    final double geofenceRadiusMeters,
    final String? scheduleServerId,
    required final int visitOrder,
    final String? scheduledClockIn,
    final String? scheduledClockOut,
    required final int allocatedMinutes,
    final int visitPriority,
    required final VisitType visitType,
    required final VisitStatus status,
    final DateTime? actualClockIn,
    final DateTime? actualClockOut,
    final int? visitDurationMins,
    final double? clockInLatitude,
    final double? clockInLongitude,
    final double? clockInAccuracyMeters,
    final double? clockInDistanceMeters,
    final double? clockOutLatitude,
    final double? clockOutLongitude,
    final double? clockOutAccuracyMeters,
    final double? clockOutDistanceMeters,
    final bool geofenceOverride,
    final String? overrideRequestId,
    final int? skipReasonId,
    final String? skipReasonCode,
    final String? skipNotes,
    final String? clockInNotes,
    final String? clockOutNotes,
    final String? visitNotes,
    final SyncState syncState,
    final String? syncError,
    final DateTime? lastSyncedAt,
  }) = _$OutletVisitImpl;

  factory _OutletVisit.fromJson(Map<String, dynamic> json) =
      _$OutletVisitImpl.fromJson;

  /// Local UUID for offline-first operations
  @override
  String get localId;

  /// Backend visit ID (null until synced)
  @override
  String? get serverId; // === Route Linkage ===
  /// Local ID of the parent daily route
  @override
  String get dailyRouteLocalId;

  /// Server ID of the parent daily route (null until route synced)
  @override
  String? get dailyRouteServerId; // === Outlet Information ===
  /// Customer/Outlet ID from backend
  @override
  String get outletId;

  /// Outlet code (e.g., "CL000001")
  @override
  String get outletCode;

  /// Outlet display name
  @override
  String get outletName;

  /// Outlet GPS latitude
  @override
  double get outletLatitude;

  /// Outlet GPS longitude
  @override
  double get outletLongitude;

  /// Geofence radius for this outlet (meters)
  @override
  double get geofenceRadiusMeters; // === Schedule Information ===
  /// Server ID of the schedule this visit was generated from
  @override
  String? get scheduleServerId;

  /// Order in the route (1, 2, 3, ...)
  @override
  int get visitOrder;

  /// Scheduled clock-in time (time of day)
  @override
  String? get scheduledClockIn;

  /// Scheduled clock-out time (time of day)
  @override
  String? get scheduledClockOut;

  /// Allocated time for this visit (minutes)
  @override
  int get allocatedMinutes;

  /// Visit priority (1=must visit, 2=important, 3=flexible)
  @override
  int get visitPriority; // === Visit Type ===
  /// Whether this is a scheduled or ad-hoc visit
  @override
  VisitType get visitType; // === Status & Timing ===
  /// Current status of the visit
  @override
  VisitStatus get status;

  /// Actual clock-in timestamp
  @override
  DateTime? get actualClockIn;

  /// Actual clock-out timestamp
  @override
  DateTime? get actualClockOut;

  /// Calculated visit duration (minutes)
  @override
  int? get visitDurationMins; // === Location Data ===
  /// GPS latitude at clock-in
  @override
  double? get clockInLatitude;

  /// GPS longitude at clock-in
  @override
  double? get clockInLongitude;

  /// GPS accuracy at clock-in (meters)
  @override
  double? get clockInAccuracyMeters;

  /// Distance from outlet at clock-in (meters)
  @override
  double? get clockInDistanceMeters;

  /// GPS latitude at clock-out
  @override
  double? get clockOutLatitude;

  /// GPS longitude at clock-out
  @override
  double? get clockOutLongitude;

  /// GPS accuracy at clock-out (meters)
  @override
  double? get clockOutAccuracyMeters;

  /// Distance from outlet at clock-out (meters)
  @override
  double? get clockOutDistanceMeters; // === Geofence Override ===
  /// Whether geofence was overridden for this visit
  @override
  bool get geofenceOverride;

  /// ID of the approved override request (if any)
  @override
  String? get overrideRequestId; // === Skip Information ===
  /// ID of the skip reason (from SkipReasonCache)
  @override
  int? get skipReasonId;

  /// Skip reason code (e.g., "CLOSED", "OUT_OF_STOCK")
  @override
  String? get skipReasonCode;

  /// Additional notes for skip
  @override
  String? get skipNotes; // === Notes ===
  /// Notes entered at clock-in
  @override
  String? get clockInNotes;

  /// Notes entered at clock-out
  @override
  String? get clockOutNotes;

  /// General visit notes
  @override
  String? get visitNotes; // === Sync State ===
  /// Current sync state with backend
  @override
  SyncState get syncState;

  /// Last sync error message (if any)
  @override
  String? get syncError;

  /// Timestamp of last successful sync
  @override
  DateTime? get lastSyncedAt;

  /// Create a copy of OutletVisit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletVisitImplCopyWith<_$OutletVisitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
