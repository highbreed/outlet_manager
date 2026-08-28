// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_ping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LocationPing _$LocationPingFromJson(Map<String, dynamic> json) {
  return _LocationPing.fromJson(json);
}

/// @nodoc
mixin _$LocationPing {
  /// Local UUID for deduplication
  String get localId => throw _privateConstructorUsedError;

  /// Backend ping_id after sync (null until synced)
  int? get serverId =>
      throw _privateConstructorUsedError; // === Location Data ===
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get accuracyMeters => throw _privateConstructorUsedError;
  double? get altitudeMeters => throw _privateConstructorUsedError;
  double? get speedMps => throw _privateConstructorUsedError;
  double? get headingDegrees =>
      throw _privateConstructorUsedError; // === Device Context ===
  /// Battery level 0-100
  int? get batteryLevel => throw _privateConstructorUsedError;
  bool? get isCharging => throw _privateConstructorUsedError;

  /// Network type: wifi, cellular, none
  String? get networkType =>
      throw _privateConstructorUsedError; // === Tracking Metadata ===
  PingSource get pingSource => throw _privateConstructorUsedError;

  /// Device time when captured
  DateTime get recordedAt => throw _privateConstructorUsedError;

  /// When successfully sent to server
  DateTime? get syncedAt =>
      throw _privateConstructorUsedError; // === Server Response ===
  /// Server-suggested interval for next ping
  int? get nextPingSeconds => throw _privateConstructorUsedError;
  LocationPingSyncState get syncState => throw _privateConstructorUsedError;

  /// Serializes this LocationPing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationPing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationPingCopyWith<LocationPing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPingCopyWith<$Res> {
  factory $LocationPingCopyWith(
    LocationPing value,
    $Res Function(LocationPing) then,
  ) = _$LocationPingCopyWithImpl<$Res, LocationPing>;
  @useResult
  $Res call({
    String localId,
    int? serverId,
    double latitude,
    double longitude,
    double accuracyMeters,
    double? altitudeMeters,
    double? speedMps,
    double? headingDegrees,
    int? batteryLevel,
    bool? isCharging,
    String? networkType,
    PingSource pingSource,
    DateTime recordedAt,
    DateTime? syncedAt,
    int? nextPingSeconds,
    LocationPingSyncState syncState,
  });
}

/// @nodoc
class _$LocationPingCopyWithImpl<$Res, $Val extends LocationPing>
    implements $LocationPingCopyWith<$Res> {
  _$LocationPingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationPing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracyMeters = null,
    Object? altitudeMeters = freezed,
    Object? speedMps = freezed,
    Object? headingDegrees = freezed,
    Object? batteryLevel = freezed,
    Object? isCharging = freezed,
    Object? networkType = freezed,
    Object? pingSource = null,
    Object? recordedAt = null,
    Object? syncedAt = freezed,
    Object? nextPingSeconds = freezed,
    Object? syncState = null,
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
                      as int?,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            accuracyMeters: null == accuracyMeters
                ? _value.accuracyMeters
                : accuracyMeters // ignore: cast_nullable_to_non_nullable
                      as double,
            altitudeMeters: freezed == altitudeMeters
                ? _value.altitudeMeters
                : altitudeMeters // ignore: cast_nullable_to_non_nullable
                      as double?,
            speedMps: freezed == speedMps
                ? _value.speedMps
                : speedMps // ignore: cast_nullable_to_non_nullable
                      as double?,
            headingDegrees: freezed == headingDegrees
                ? _value.headingDegrees
                : headingDegrees // ignore: cast_nullable_to_non_nullable
                      as double?,
            batteryLevel: freezed == batteryLevel
                ? _value.batteryLevel
                : batteryLevel // ignore: cast_nullable_to_non_nullable
                      as int?,
            isCharging: freezed == isCharging
                ? _value.isCharging
                : isCharging // ignore: cast_nullable_to_non_nullable
                      as bool?,
            networkType: freezed == networkType
                ? _value.networkType
                : networkType // ignore: cast_nullable_to_non_nullable
                      as String?,
            pingSource: null == pingSource
                ? _value.pingSource
                : pingSource // ignore: cast_nullable_to_non_nullable
                      as PingSource,
            recordedAt: null == recordedAt
                ? _value.recordedAt
                : recordedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            syncedAt: freezed == syncedAt
                ? _value.syncedAt
                : syncedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            nextPingSeconds: freezed == nextPingSeconds
                ? _value.nextPingSeconds
                : nextPingSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            syncState: null == syncState
                ? _value.syncState
                : syncState // ignore: cast_nullable_to_non_nullable
                      as LocationPingSyncState,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationPingImplCopyWith<$Res>
    implements $LocationPingCopyWith<$Res> {
  factory _$$LocationPingImplCopyWith(
    _$LocationPingImpl value,
    $Res Function(_$LocationPingImpl) then,
  ) = __$$LocationPingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String localId,
    int? serverId,
    double latitude,
    double longitude,
    double accuracyMeters,
    double? altitudeMeters,
    double? speedMps,
    double? headingDegrees,
    int? batteryLevel,
    bool? isCharging,
    String? networkType,
    PingSource pingSource,
    DateTime recordedAt,
    DateTime? syncedAt,
    int? nextPingSeconds,
    LocationPingSyncState syncState,
  });
}

/// @nodoc
class __$$LocationPingImplCopyWithImpl<$Res>
    extends _$LocationPingCopyWithImpl<$Res, _$LocationPingImpl>
    implements _$$LocationPingImplCopyWith<$Res> {
  __$$LocationPingImplCopyWithImpl(
    _$LocationPingImpl _value,
    $Res Function(_$LocationPingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationPing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracyMeters = null,
    Object? altitudeMeters = freezed,
    Object? speedMps = freezed,
    Object? headingDegrees = freezed,
    Object? batteryLevel = freezed,
    Object? isCharging = freezed,
    Object? networkType = freezed,
    Object? pingSource = null,
    Object? recordedAt = null,
    Object? syncedAt = freezed,
    Object? nextPingSeconds = freezed,
    Object? syncState = null,
  }) {
    return _then(
      _$LocationPingImpl(
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        serverId: freezed == serverId
            ? _value.serverId
            : serverId // ignore: cast_nullable_to_non_nullable
                  as int?,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        accuracyMeters: null == accuracyMeters
            ? _value.accuracyMeters
            : accuracyMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        altitudeMeters: freezed == altitudeMeters
            ? _value.altitudeMeters
            : altitudeMeters // ignore: cast_nullable_to_non_nullable
                  as double?,
        speedMps: freezed == speedMps
            ? _value.speedMps
            : speedMps // ignore: cast_nullable_to_non_nullable
                  as double?,
        headingDegrees: freezed == headingDegrees
            ? _value.headingDegrees
            : headingDegrees // ignore: cast_nullable_to_non_nullable
                  as double?,
        batteryLevel: freezed == batteryLevel
            ? _value.batteryLevel
            : batteryLevel // ignore: cast_nullable_to_non_nullable
                  as int?,
        isCharging: freezed == isCharging
            ? _value.isCharging
            : isCharging // ignore: cast_nullable_to_non_nullable
                  as bool?,
        networkType: freezed == networkType
            ? _value.networkType
            : networkType // ignore: cast_nullable_to_non_nullable
                  as String?,
        pingSource: null == pingSource
            ? _value.pingSource
            : pingSource // ignore: cast_nullable_to_non_nullable
                  as PingSource,
        recordedAt: null == recordedAt
            ? _value.recordedAt
            : recordedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        syncedAt: freezed == syncedAt
            ? _value.syncedAt
            : syncedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        nextPingSeconds: freezed == nextPingSeconds
            ? _value.nextPingSeconds
            : nextPingSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        syncState: null == syncState
            ? _value.syncState
            : syncState // ignore: cast_nullable_to_non_nullable
                  as LocationPingSyncState,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationPingImpl implements _LocationPing {
  const _$LocationPingImpl({
    required this.localId,
    this.serverId,
    required this.latitude,
    required this.longitude,
    required this.accuracyMeters,
    this.altitudeMeters,
    this.speedMps,
    this.headingDegrees,
    this.batteryLevel,
    this.isCharging,
    this.networkType,
    required this.pingSource,
    required this.recordedAt,
    this.syncedAt,
    this.nextPingSeconds,
    this.syncState = LocationPingSyncState.pending,
  });

  factory _$LocationPingImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationPingImplFromJson(json);

  /// Local UUID for deduplication
  @override
  final String localId;

  /// Backend ping_id after sync (null until synced)
  @override
  final int? serverId;
  // === Location Data ===
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double accuracyMeters;
  @override
  final double? altitudeMeters;
  @override
  final double? speedMps;
  @override
  final double? headingDegrees;
  // === Device Context ===
  /// Battery level 0-100
  @override
  final int? batteryLevel;
  @override
  final bool? isCharging;

  /// Network type: wifi, cellular, none
  @override
  final String? networkType;
  // === Tracking Metadata ===
  @override
  final PingSource pingSource;

  /// Device time when captured
  @override
  final DateTime recordedAt;

  /// When successfully sent to server
  @override
  final DateTime? syncedAt;
  // === Server Response ===
  /// Server-suggested interval for next ping
  @override
  final int? nextPingSeconds;
  @override
  @JsonKey()
  final LocationPingSyncState syncState;

  @override
  String toString() {
    return 'LocationPing(localId: $localId, serverId: $serverId, latitude: $latitude, longitude: $longitude, accuracyMeters: $accuracyMeters, altitudeMeters: $altitudeMeters, speedMps: $speedMps, headingDegrees: $headingDegrees, batteryLevel: $batteryLevel, isCharging: $isCharging, networkType: $networkType, pingSource: $pingSource, recordedAt: $recordedAt, syncedAt: $syncedAt, nextPingSeconds: $nextPingSeconds, syncState: $syncState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPingImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.accuracyMeters, accuracyMeters) ||
                other.accuracyMeters == accuracyMeters) &&
            (identical(other.altitudeMeters, altitudeMeters) ||
                other.altitudeMeters == altitudeMeters) &&
            (identical(other.speedMps, speedMps) ||
                other.speedMps == speedMps) &&
            (identical(other.headingDegrees, headingDegrees) ||
                other.headingDegrees == headingDegrees) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.isCharging, isCharging) ||
                other.isCharging == isCharging) &&
            (identical(other.networkType, networkType) ||
                other.networkType == networkType) &&
            (identical(other.pingSource, pingSource) ||
                other.pingSource == pingSource) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.syncedAt, syncedAt) ||
                other.syncedAt == syncedAt) &&
            (identical(other.nextPingSeconds, nextPingSeconds) ||
                other.nextPingSeconds == nextPingSeconds) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    localId,
    serverId,
    latitude,
    longitude,
    accuracyMeters,
    altitudeMeters,
    speedMps,
    headingDegrees,
    batteryLevel,
    isCharging,
    networkType,
    pingSource,
    recordedAt,
    syncedAt,
    nextPingSeconds,
    syncState,
  );

  /// Create a copy of LocationPing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPingImplCopyWith<_$LocationPingImpl> get copyWith =>
      __$$LocationPingImplCopyWithImpl<_$LocationPingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationPingImplToJson(this);
  }
}

abstract class _LocationPing implements LocationPing {
  const factory _LocationPing({
    required final String localId,
    final int? serverId,
    required final double latitude,
    required final double longitude,
    required final double accuracyMeters,
    final double? altitudeMeters,
    final double? speedMps,
    final double? headingDegrees,
    final int? batteryLevel,
    final bool? isCharging,
    final String? networkType,
    required final PingSource pingSource,
    required final DateTime recordedAt,
    final DateTime? syncedAt,
    final int? nextPingSeconds,
    final LocationPingSyncState syncState,
  }) = _$LocationPingImpl;

  factory _LocationPing.fromJson(Map<String, dynamic> json) =
      _$LocationPingImpl.fromJson;

  /// Local UUID for deduplication
  @override
  String get localId;

  /// Backend ping_id after sync (null until synced)
  @override
  int? get serverId; // === Location Data ===
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get accuracyMeters;
  @override
  double? get altitudeMeters;
  @override
  double? get speedMps;
  @override
  double? get headingDegrees; // === Device Context ===
  /// Battery level 0-100
  @override
  int? get batteryLevel;
  @override
  bool? get isCharging;

  /// Network type: wifi, cellular, none
  @override
  String? get networkType; // === Tracking Metadata ===
  @override
  PingSource get pingSource;

  /// Device time when captured
  @override
  DateTime get recordedAt;

  /// When successfully sent to server
  @override
  DateTime? get syncedAt; // === Server Response ===
  /// Server-suggested interval for next ping
  @override
  int? get nextPingSeconds;
  @override
  LocationPingSyncState get syncState;

  /// Create a copy of LocationPing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationPingImplCopyWith<_$LocationPingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationPingResponse _$LocationPingResponseFromJson(Map<String, dynamic> json) {
  return _LocationPingResponse.fromJson(json);
}

/// @nodoc
mixin _$LocationPingResponse {
  bool get success => throw _privateConstructorUsedError;
  int get pingId => throw _privateConstructorUsedError;
  int? get nextPingSeconds => throw _privateConstructorUsedError;
  DateTime get serverTime => throw _privateConstructorUsedError;
  bool get isDuplicate => throw _privateConstructorUsedError;

  /// Serializes this LocationPingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationPingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationPingResponseCopyWith<LocationPingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPingResponseCopyWith<$Res> {
  factory $LocationPingResponseCopyWith(
    LocationPingResponse value,
    $Res Function(LocationPingResponse) then,
  ) = _$LocationPingResponseCopyWithImpl<$Res, LocationPingResponse>;
  @useResult
  $Res call({
    bool success,
    int pingId,
    int? nextPingSeconds,
    DateTime serverTime,
    bool isDuplicate,
  });
}

/// @nodoc
class _$LocationPingResponseCopyWithImpl<
  $Res,
  $Val extends LocationPingResponse
>
    implements $LocationPingResponseCopyWith<$Res> {
  _$LocationPingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationPingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? pingId = null,
    Object? nextPingSeconds = freezed,
    Object? serverTime = null,
    Object? isDuplicate = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            pingId: null == pingId
                ? _value.pingId
                : pingId // ignore: cast_nullable_to_non_nullable
                      as int,
            nextPingSeconds: freezed == nextPingSeconds
                ? _value.nextPingSeconds
                : nextPingSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
            serverTime: null == serverTime
                ? _value.serverTime
                : serverTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isDuplicate: null == isDuplicate
                ? _value.isDuplicate
                : isDuplicate // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationPingResponseImplCopyWith<$Res>
    implements $LocationPingResponseCopyWith<$Res> {
  factory _$$LocationPingResponseImplCopyWith(
    _$LocationPingResponseImpl value,
    $Res Function(_$LocationPingResponseImpl) then,
  ) = __$$LocationPingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    int pingId,
    int? nextPingSeconds,
    DateTime serverTime,
    bool isDuplicate,
  });
}

/// @nodoc
class __$$LocationPingResponseImplCopyWithImpl<$Res>
    extends _$LocationPingResponseCopyWithImpl<$Res, _$LocationPingResponseImpl>
    implements _$$LocationPingResponseImplCopyWith<$Res> {
  __$$LocationPingResponseImplCopyWithImpl(
    _$LocationPingResponseImpl _value,
    $Res Function(_$LocationPingResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationPingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? pingId = null,
    Object? nextPingSeconds = freezed,
    Object? serverTime = null,
    Object? isDuplicate = null,
  }) {
    return _then(
      _$LocationPingResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        pingId: null == pingId
            ? _value.pingId
            : pingId // ignore: cast_nullable_to_non_nullable
                  as int,
        nextPingSeconds: freezed == nextPingSeconds
            ? _value.nextPingSeconds
            : nextPingSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
        serverTime: null == serverTime
            ? _value.serverTime
            : serverTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isDuplicate: null == isDuplicate
            ? _value.isDuplicate
            : isDuplicate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationPingResponseImpl implements _LocationPingResponse {
  const _$LocationPingResponseImpl({
    required this.success,
    required this.pingId,
    this.nextPingSeconds,
    required this.serverTime,
    required this.isDuplicate,
  });

  factory _$LocationPingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationPingResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final int pingId;
  @override
  final int? nextPingSeconds;
  @override
  final DateTime serverTime;
  @override
  final bool isDuplicate;

  @override
  String toString() {
    return 'LocationPingResponse(success: $success, pingId: $pingId, nextPingSeconds: $nextPingSeconds, serverTime: $serverTime, isDuplicate: $isDuplicate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPingResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.pingId, pingId) || other.pingId == pingId) &&
            (identical(other.nextPingSeconds, nextPingSeconds) ||
                other.nextPingSeconds == nextPingSeconds) &&
            (identical(other.serverTime, serverTime) ||
                other.serverTime == serverTime) &&
            (identical(other.isDuplicate, isDuplicate) ||
                other.isDuplicate == isDuplicate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    pingId,
    nextPingSeconds,
    serverTime,
    isDuplicate,
  );

  /// Create a copy of LocationPingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPingResponseImplCopyWith<_$LocationPingResponseImpl>
  get copyWith =>
      __$$LocationPingResponseImplCopyWithImpl<_$LocationPingResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationPingResponseImplToJson(this);
  }
}

abstract class _LocationPingResponse implements LocationPingResponse {
  const factory _LocationPingResponse({
    required final bool success,
    required final int pingId,
    final int? nextPingSeconds,
    required final DateTime serverTime,
    required final bool isDuplicate,
  }) = _$LocationPingResponseImpl;

  factory _LocationPingResponse.fromJson(Map<String, dynamic> json) =
      _$LocationPingResponseImpl.fromJson;

  @override
  bool get success;
  @override
  int get pingId;
  @override
  int? get nextPingSeconds;
  @override
  DateTime get serverTime;
  @override
  bool get isDuplicate;

  /// Create a copy of LocationPingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationPingResponseImplCopyWith<_$LocationPingResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
