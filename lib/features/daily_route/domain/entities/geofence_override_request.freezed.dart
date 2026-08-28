// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geofence_override_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GeofenceOverrideRequest _$GeofenceOverrideRequestFromJson(
  Map<String, dynamic> json,
) {
  return _GeofenceOverrideRequest.fromJson(json);
}

/// @nodoc
mixin _$GeofenceOverrideRequest {
  /// Local UUID for offline-first operations
  String get localId => throw _privateConstructorUsedError;

  /// Backend override request ID (null until synced)
  String? get serverId =>
      throw _privateConstructorUsedError; // === Visit Reference ===
  /// Local ID of the visit this override is for
  String get outletVisitLocalId => throw _privateConstructorUsedError;

  /// Server ID of the visit (null until visit synced)
  String? get outletVisitServerId =>
      throw _privateConstructorUsedError; // === Request Details ===
  /// User who requested the override (agent)
  String get requestedByUserId => throw _privateConstructorUsedError;

  /// Agent's name (for display in supervisor UI)
  String? get requestedByName => throw _privateConstructorUsedError;

  /// When the override was requested
  DateTime get requestedAt => throw _privateConstructorUsedError;

  /// Agent's reason for the request
  String get reason =>
      throw _privateConstructorUsedError; // === Location at Request Time ===
  /// GPS latitude when requesting
  double get requestLatitude => throw _privateConstructorUsedError;

  /// GPS longitude when requesting
  double get requestLongitude => throw _privateConstructorUsedError;

  /// GPS accuracy when requesting (meters)
  double get requestAccuracyMeters => throw _privateConstructorUsedError;

  /// Distance from outlet when requesting (meters)
  double get distanceFromOutlet =>
      throw _privateConstructorUsedError; // === Outlet Info (for supervisor display) ===
  /// Outlet name
  String? get outletName => throw _privateConstructorUsedError;

  /// Outlet code
  String? get outletCode =>
      throw _privateConstructorUsedError; // === Status ===
  /// Current status of the request
  GeofenceOverrideStatus get status => throw _privateConstructorUsedError;

  /// When the request expires (default 15 min from request)
  DateTime get expiresAt =>
      throw _privateConstructorUsedError; // === Decision Details (filled when approved/rejected) ===
  /// User who made the decision (supervisor)
  String? get decidedByUserId => throw _privateConstructorUsedError;

  /// Supervisor's name
  String? get decidedByName => throw _privateConstructorUsedError;

  /// When the decision was made
  DateTime? get decidedAt => throw _privateConstructorUsedError;

  /// Notes from the supervisor
  String? get decisionNotes =>
      throw _privateConstructorUsedError; // === Sync State ===
  /// Current sync state with backend
  SyncState get syncState => throw _privateConstructorUsedError;

  /// Last sync error message (if any)
  String? get syncError => throw _privateConstructorUsedError;

  /// Serializes this GeofenceOverrideRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeofenceOverrideRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeofenceOverrideRequestCopyWith<GeofenceOverrideRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeofenceOverrideRequestCopyWith<$Res> {
  factory $GeofenceOverrideRequestCopyWith(
    GeofenceOverrideRequest value,
    $Res Function(GeofenceOverrideRequest) then,
  ) = _$GeofenceOverrideRequestCopyWithImpl<$Res, GeofenceOverrideRequest>;
  @useResult
  $Res call({
    String localId,
    String? serverId,
    String outletVisitLocalId,
    String? outletVisitServerId,
    String requestedByUserId,
    String? requestedByName,
    DateTime requestedAt,
    String reason,
    double requestLatitude,
    double requestLongitude,
    double requestAccuracyMeters,
    double distanceFromOutlet,
    String? outletName,
    String? outletCode,
    GeofenceOverrideStatus status,
    DateTime expiresAt,
    String? decidedByUserId,
    String? decidedByName,
    DateTime? decidedAt,
    String? decisionNotes,
    SyncState syncState,
    String? syncError,
  });
}

/// @nodoc
class _$GeofenceOverrideRequestCopyWithImpl<
  $Res,
  $Val extends GeofenceOverrideRequest
>
    implements $GeofenceOverrideRequestCopyWith<$Res> {
  _$GeofenceOverrideRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeofenceOverrideRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? outletVisitLocalId = null,
    Object? outletVisitServerId = freezed,
    Object? requestedByUserId = null,
    Object? requestedByName = freezed,
    Object? requestedAt = null,
    Object? reason = null,
    Object? requestLatitude = null,
    Object? requestLongitude = null,
    Object? requestAccuracyMeters = null,
    Object? distanceFromOutlet = null,
    Object? outletName = freezed,
    Object? outletCode = freezed,
    Object? status = null,
    Object? expiresAt = null,
    Object? decidedByUserId = freezed,
    Object? decidedByName = freezed,
    Object? decidedAt = freezed,
    Object? decisionNotes = freezed,
    Object? syncState = null,
    Object? syncError = freezed,
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
            outletVisitLocalId: null == outletVisitLocalId
                ? _value.outletVisitLocalId
                : outletVisitLocalId // ignore: cast_nullable_to_non_nullable
                      as String,
            outletVisitServerId: freezed == outletVisitServerId
                ? _value.outletVisitServerId
                : outletVisitServerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            requestedByUserId: null == requestedByUserId
                ? _value.requestedByUserId
                : requestedByUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            requestedByName: freezed == requestedByName
                ? _value.requestedByName
                : requestedByName // ignore: cast_nullable_to_non_nullable
                      as String?,
            requestedAt: null == requestedAt
                ? _value.requestedAt
                : requestedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
            requestLatitude: null == requestLatitude
                ? _value.requestLatitude
                : requestLatitude // ignore: cast_nullable_to_non_nullable
                      as double,
            requestLongitude: null == requestLongitude
                ? _value.requestLongitude
                : requestLongitude // ignore: cast_nullable_to_non_nullable
                      as double,
            requestAccuracyMeters: null == requestAccuracyMeters
                ? _value.requestAccuracyMeters
                : requestAccuracyMeters // ignore: cast_nullable_to_non_nullable
                      as double,
            distanceFromOutlet: null == distanceFromOutlet
                ? _value.distanceFromOutlet
                : distanceFromOutlet // ignore: cast_nullable_to_non_nullable
                      as double,
            outletName: freezed == outletName
                ? _value.outletName
                : outletName // ignore: cast_nullable_to_non_nullable
                      as String?,
            outletCode: freezed == outletCode
                ? _value.outletCode
                : outletCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as GeofenceOverrideStatus,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            decidedByUserId: freezed == decidedByUserId
                ? _value.decidedByUserId
                : decidedByUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
            decidedByName: freezed == decidedByName
                ? _value.decidedByName
                : decidedByName // ignore: cast_nullable_to_non_nullable
                      as String?,
            decidedAt: freezed == decidedAt
                ? _value.decidedAt
                : decidedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            decisionNotes: freezed == decisionNotes
                ? _value.decisionNotes
                : decisionNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            syncState: null == syncState
                ? _value.syncState
                : syncState // ignore: cast_nullable_to_non_nullable
                      as SyncState,
            syncError: freezed == syncError
                ? _value.syncError
                : syncError // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeofenceOverrideRequestImplCopyWith<$Res>
    implements $GeofenceOverrideRequestCopyWith<$Res> {
  factory _$$GeofenceOverrideRequestImplCopyWith(
    _$GeofenceOverrideRequestImpl value,
    $Res Function(_$GeofenceOverrideRequestImpl) then,
  ) = __$$GeofenceOverrideRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String localId,
    String? serverId,
    String outletVisitLocalId,
    String? outletVisitServerId,
    String requestedByUserId,
    String? requestedByName,
    DateTime requestedAt,
    String reason,
    double requestLatitude,
    double requestLongitude,
    double requestAccuracyMeters,
    double distanceFromOutlet,
    String? outletName,
    String? outletCode,
    GeofenceOverrideStatus status,
    DateTime expiresAt,
    String? decidedByUserId,
    String? decidedByName,
    DateTime? decidedAt,
    String? decisionNotes,
    SyncState syncState,
    String? syncError,
  });
}

/// @nodoc
class __$$GeofenceOverrideRequestImplCopyWithImpl<$Res>
    extends
        _$GeofenceOverrideRequestCopyWithImpl<
          $Res,
          _$GeofenceOverrideRequestImpl
        >
    implements _$$GeofenceOverrideRequestImplCopyWith<$Res> {
  __$$GeofenceOverrideRequestImplCopyWithImpl(
    _$GeofenceOverrideRequestImpl _value,
    $Res Function(_$GeofenceOverrideRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeofenceOverrideRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? outletVisitLocalId = null,
    Object? outletVisitServerId = freezed,
    Object? requestedByUserId = null,
    Object? requestedByName = freezed,
    Object? requestedAt = null,
    Object? reason = null,
    Object? requestLatitude = null,
    Object? requestLongitude = null,
    Object? requestAccuracyMeters = null,
    Object? distanceFromOutlet = null,
    Object? outletName = freezed,
    Object? outletCode = freezed,
    Object? status = null,
    Object? expiresAt = null,
    Object? decidedByUserId = freezed,
    Object? decidedByName = freezed,
    Object? decidedAt = freezed,
    Object? decisionNotes = freezed,
    Object? syncState = null,
    Object? syncError = freezed,
  }) {
    return _then(
      _$GeofenceOverrideRequestImpl(
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        serverId: freezed == serverId
            ? _value.serverId
            : serverId // ignore: cast_nullable_to_non_nullable
                  as String?,
        outletVisitLocalId: null == outletVisitLocalId
            ? _value.outletVisitLocalId
            : outletVisitLocalId // ignore: cast_nullable_to_non_nullable
                  as String,
        outletVisitServerId: freezed == outletVisitServerId
            ? _value.outletVisitServerId
            : outletVisitServerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        requestedByUserId: null == requestedByUserId
            ? _value.requestedByUserId
            : requestedByUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        requestedByName: freezed == requestedByName
            ? _value.requestedByName
            : requestedByName // ignore: cast_nullable_to_non_nullable
                  as String?,
        requestedAt: null == requestedAt
            ? _value.requestedAt
            : requestedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
        requestLatitude: null == requestLatitude
            ? _value.requestLatitude
            : requestLatitude // ignore: cast_nullable_to_non_nullable
                  as double,
        requestLongitude: null == requestLongitude
            ? _value.requestLongitude
            : requestLongitude // ignore: cast_nullable_to_non_nullable
                  as double,
        requestAccuracyMeters: null == requestAccuracyMeters
            ? _value.requestAccuracyMeters
            : requestAccuracyMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        distanceFromOutlet: null == distanceFromOutlet
            ? _value.distanceFromOutlet
            : distanceFromOutlet // ignore: cast_nullable_to_non_nullable
                  as double,
        outletName: freezed == outletName
            ? _value.outletName
            : outletName // ignore: cast_nullable_to_non_nullable
                  as String?,
        outletCode: freezed == outletCode
            ? _value.outletCode
            : outletCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as GeofenceOverrideStatus,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        decidedByUserId: freezed == decidedByUserId
            ? _value.decidedByUserId
            : decidedByUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
        decidedByName: freezed == decidedByName
            ? _value.decidedByName
            : decidedByName // ignore: cast_nullable_to_non_nullable
                  as String?,
        decidedAt: freezed == decidedAt
            ? _value.decidedAt
            : decidedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        decisionNotes: freezed == decisionNotes
            ? _value.decisionNotes
            : decisionNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncState: null == syncState
            ? _value.syncState
            : syncState // ignore: cast_nullable_to_non_nullable
                  as SyncState,
        syncError: freezed == syncError
            ? _value.syncError
            : syncError // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GeofenceOverrideRequestImpl implements _GeofenceOverrideRequest {
  const _$GeofenceOverrideRequestImpl({
    required this.localId,
    this.serverId,
    required this.outletVisitLocalId,
    this.outletVisitServerId,
    required this.requestedByUserId,
    this.requestedByName,
    required this.requestedAt,
    required this.reason,
    required this.requestLatitude,
    required this.requestLongitude,
    required this.requestAccuracyMeters,
    required this.distanceFromOutlet,
    this.outletName,
    this.outletCode,
    required this.status,
    required this.expiresAt,
    this.decidedByUserId,
    this.decidedByName,
    this.decidedAt,
    this.decisionNotes,
    this.syncState = SyncState.localOnly,
    this.syncError,
  });

  factory _$GeofenceOverrideRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeofenceOverrideRequestImplFromJson(json);

  /// Local UUID for offline-first operations
  @override
  final String localId;

  /// Backend override request ID (null until synced)
  @override
  final String? serverId;
  // === Visit Reference ===
  /// Local ID of the visit this override is for
  @override
  final String outletVisitLocalId;

  /// Server ID of the visit (null until visit synced)
  @override
  final String? outletVisitServerId;
  // === Request Details ===
  /// User who requested the override (agent)
  @override
  final String requestedByUserId;

  /// Agent's name (for display in supervisor UI)
  @override
  final String? requestedByName;

  /// When the override was requested
  @override
  final DateTime requestedAt;

  /// Agent's reason for the request
  @override
  final String reason;
  // === Location at Request Time ===
  /// GPS latitude when requesting
  @override
  final double requestLatitude;

  /// GPS longitude when requesting
  @override
  final double requestLongitude;

  /// GPS accuracy when requesting (meters)
  @override
  final double requestAccuracyMeters;

  /// Distance from outlet when requesting (meters)
  @override
  final double distanceFromOutlet;
  // === Outlet Info (for supervisor display) ===
  /// Outlet name
  @override
  final String? outletName;

  /// Outlet code
  @override
  final String? outletCode;
  // === Status ===
  /// Current status of the request
  @override
  final GeofenceOverrideStatus status;

  /// When the request expires (default 15 min from request)
  @override
  final DateTime expiresAt;
  // === Decision Details (filled when approved/rejected) ===
  /// User who made the decision (supervisor)
  @override
  final String? decidedByUserId;

  /// Supervisor's name
  @override
  final String? decidedByName;

  /// When the decision was made
  @override
  final DateTime? decidedAt;

  /// Notes from the supervisor
  @override
  final String? decisionNotes;
  // === Sync State ===
  /// Current sync state with backend
  @override
  @JsonKey()
  final SyncState syncState;

  /// Last sync error message (if any)
  @override
  final String? syncError;

  @override
  String toString() {
    return 'GeofenceOverrideRequest(localId: $localId, serverId: $serverId, outletVisitLocalId: $outletVisitLocalId, outletVisitServerId: $outletVisitServerId, requestedByUserId: $requestedByUserId, requestedByName: $requestedByName, requestedAt: $requestedAt, reason: $reason, requestLatitude: $requestLatitude, requestLongitude: $requestLongitude, requestAccuracyMeters: $requestAccuracyMeters, distanceFromOutlet: $distanceFromOutlet, outletName: $outletName, outletCode: $outletCode, status: $status, expiresAt: $expiresAt, decidedByUserId: $decidedByUserId, decidedByName: $decidedByName, decidedAt: $decidedAt, decisionNotes: $decisionNotes, syncState: $syncState, syncError: $syncError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeofenceOverrideRequestImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.outletVisitLocalId, outletVisitLocalId) ||
                other.outletVisitLocalId == outletVisitLocalId) &&
            (identical(other.outletVisitServerId, outletVisitServerId) ||
                other.outletVisitServerId == outletVisitServerId) &&
            (identical(other.requestedByUserId, requestedByUserId) ||
                other.requestedByUserId == requestedByUserId) &&
            (identical(other.requestedByName, requestedByName) ||
                other.requestedByName == requestedByName) &&
            (identical(other.requestedAt, requestedAt) ||
                other.requestedAt == requestedAt) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.requestLatitude, requestLatitude) ||
                other.requestLatitude == requestLatitude) &&
            (identical(other.requestLongitude, requestLongitude) ||
                other.requestLongitude == requestLongitude) &&
            (identical(other.requestAccuracyMeters, requestAccuracyMeters) ||
                other.requestAccuracyMeters == requestAccuracyMeters) &&
            (identical(other.distanceFromOutlet, distanceFromOutlet) ||
                other.distanceFromOutlet == distanceFromOutlet) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.outletCode, outletCode) ||
                other.outletCode == outletCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.decidedByUserId, decidedByUserId) ||
                other.decidedByUserId == decidedByUserId) &&
            (identical(other.decidedByName, decidedByName) ||
                other.decidedByName == decidedByName) &&
            (identical(other.decidedAt, decidedAt) ||
                other.decidedAt == decidedAt) &&
            (identical(other.decisionNotes, decisionNotes) ||
                other.decisionNotes == decisionNotes) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState) &&
            (identical(other.syncError, syncError) ||
                other.syncError == syncError));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    localId,
    serverId,
    outletVisitLocalId,
    outletVisitServerId,
    requestedByUserId,
    requestedByName,
    requestedAt,
    reason,
    requestLatitude,
    requestLongitude,
    requestAccuracyMeters,
    distanceFromOutlet,
    outletName,
    outletCode,
    status,
    expiresAt,
    decidedByUserId,
    decidedByName,
    decidedAt,
    decisionNotes,
    syncState,
    syncError,
  ]);

  /// Create a copy of GeofenceOverrideRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeofenceOverrideRequestImplCopyWith<_$GeofenceOverrideRequestImpl>
  get copyWith =>
      __$$GeofenceOverrideRequestImplCopyWithImpl<
        _$GeofenceOverrideRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeofenceOverrideRequestImplToJson(this);
  }
}

abstract class _GeofenceOverrideRequest implements GeofenceOverrideRequest {
  const factory _GeofenceOverrideRequest({
    required final String localId,
    final String? serverId,
    required final String outletVisitLocalId,
    final String? outletVisitServerId,
    required final String requestedByUserId,
    final String? requestedByName,
    required final DateTime requestedAt,
    required final String reason,
    required final double requestLatitude,
    required final double requestLongitude,
    required final double requestAccuracyMeters,
    required final double distanceFromOutlet,
    final String? outletName,
    final String? outletCode,
    required final GeofenceOverrideStatus status,
    required final DateTime expiresAt,
    final String? decidedByUserId,
    final String? decidedByName,
    final DateTime? decidedAt,
    final String? decisionNotes,
    final SyncState syncState,
    final String? syncError,
  }) = _$GeofenceOverrideRequestImpl;

  factory _GeofenceOverrideRequest.fromJson(Map<String, dynamic> json) =
      _$GeofenceOverrideRequestImpl.fromJson;

  /// Local UUID for offline-first operations
  @override
  String get localId;

  /// Backend override request ID (null until synced)
  @override
  String? get serverId; // === Visit Reference ===
  /// Local ID of the visit this override is for
  @override
  String get outletVisitLocalId;

  /// Server ID of the visit (null until visit synced)
  @override
  String? get outletVisitServerId; // === Request Details ===
  /// User who requested the override (agent)
  @override
  String get requestedByUserId;

  /// Agent's name (for display in supervisor UI)
  @override
  String? get requestedByName;

  /// When the override was requested
  @override
  DateTime get requestedAt;

  /// Agent's reason for the request
  @override
  String get reason; // === Location at Request Time ===
  /// GPS latitude when requesting
  @override
  double get requestLatitude;

  /// GPS longitude when requesting
  @override
  double get requestLongitude;

  /// GPS accuracy when requesting (meters)
  @override
  double get requestAccuracyMeters;

  /// Distance from outlet when requesting (meters)
  @override
  double get distanceFromOutlet; // === Outlet Info (for supervisor display) ===
  /// Outlet name
  @override
  String? get outletName;

  /// Outlet code
  @override
  String? get outletCode; // === Status ===
  /// Current status of the request
  @override
  GeofenceOverrideStatus get status;

  /// When the request expires (default 15 min from request)
  @override
  DateTime get expiresAt; // === Decision Details (filled when approved/rejected) ===
  /// User who made the decision (supervisor)
  @override
  String? get decidedByUserId;

  /// Supervisor's name
  @override
  String? get decidedByName;

  /// When the decision was made
  @override
  DateTime? get decidedAt;

  /// Notes from the supervisor
  @override
  String? get decisionNotes; // === Sync State ===
  /// Current sync state with backend
  @override
  SyncState get syncState;

  /// Last sync error message (if any)
  @override
  String? get syncError;

  /// Create a copy of GeofenceOverrideRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeofenceOverrideRequestImplCopyWith<_$GeofenceOverrideRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
