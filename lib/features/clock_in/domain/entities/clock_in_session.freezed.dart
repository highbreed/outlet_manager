// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_in_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClockInSession _$ClockInSessionFromJson(Map<String, dynamic> json) {
  return _ClockInSession.fromJson(json);
}

/// @nodoc
mixin _$ClockInSession {
  String get id => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get outletName => throw _privateConstructorUsedError;
  String get outletCode => throw _privateConstructorUsedError;
  bool get isDeviation => throw _privateConstructorUsedError;
  String? get routeId =>
      throw _privateConstructorUsedError; // Link to assigned route
  DateTime get clockedInAt => throw _privateConstructorUsedError;
  double get clockInLatitude => throw _privateConstructorUsedError;
  double get clockInLongitude => throw _privateConstructorUsedError;
  double get clockInAccuracy =>
      throw _privateConstructorUsedError; // GPS accuracy at clock-in
  int get allocatedMinutes => throw _privateConstructorUsedError;
  ClockInStatus get status =>
      throw _privateConstructorUsedError; // Configuration snapshot (for audit trail)
  double get geofenceRadiusMeters => throw _privateConstructorUsedError;
  int get autoClockoutGraceMinutes =>
      throw _privateConstructorUsedError; // Exit tracking with confirmation
  DateTime? get firstOutsideReadingAt =>
      throw _privateConstructorUsedError; // Initial outside detection
  DateTime? get confirmedExitAt =>
      throw _privateConstructorUsedError; // After 2 readings OR 3 min
  int get consecutiveOutsideReadings =>
      throw _privateConstructorUsedError; // Counter for confirmation
  int get consecutiveInsideReadings =>
      throw _privateConstructorUsedError; // Counter for re-entry
  // Clock-out details
  DateTime? get clockedOutAt => throw _privateConstructorUsedError;
  double? get clockOutLatitude => throw _privateConstructorUsedError;
  double? get clockOutLongitude => throw _privateConstructorUsedError;
  double? get clockOutAccuracy =>
      throw _privateConstructorUsedError; // GPS accuracy at clock-out
  double? get transportExpense => throw _privateConstructorUsedError;
  String? get routeCovered => throw _privateConstructorUsedError;
  bool? get hasOrder => throw _privateConstructorUsedError;
  ClockOutReason? get clockOutReason => throw _privateConstructorUsedError;
  SyncState get syncState => throw _privateConstructorUsedError;

  /// Serializes this ClockInSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClockInSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClockInSessionCopyWith<ClockInSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClockInSessionCopyWith<$Res> {
  factory $ClockInSessionCopyWith(
    ClockInSession value,
    $Res Function(ClockInSession) then,
  ) = _$ClockInSessionCopyWithImpl<$Res, ClockInSession>;
  @useResult
  $Res call({
    String id,
    String outletId,
    String outletName,
    String outletCode,
    bool isDeviation,
    String? routeId,
    DateTime clockedInAt,
    double clockInLatitude,
    double clockInLongitude,
    double clockInAccuracy,
    int allocatedMinutes,
    ClockInStatus status,
    double geofenceRadiusMeters,
    int autoClockoutGraceMinutes,
    DateTime? firstOutsideReadingAt,
    DateTime? confirmedExitAt,
    int consecutiveOutsideReadings,
    int consecutiveInsideReadings,
    DateTime? clockedOutAt,
    double? clockOutLatitude,
    double? clockOutLongitude,
    double? clockOutAccuracy,
    double? transportExpense,
    String? routeCovered,
    bool? hasOrder,
    ClockOutReason? clockOutReason,
    SyncState syncState,
  });
}

/// @nodoc
class _$ClockInSessionCopyWithImpl<$Res, $Val extends ClockInSession>
    implements $ClockInSessionCopyWith<$Res> {
  _$ClockInSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClockInSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? outletId = null,
    Object? outletName = null,
    Object? outletCode = null,
    Object? isDeviation = null,
    Object? routeId = freezed,
    Object? clockedInAt = null,
    Object? clockInLatitude = null,
    Object? clockInLongitude = null,
    Object? clockInAccuracy = null,
    Object? allocatedMinutes = null,
    Object? status = null,
    Object? geofenceRadiusMeters = null,
    Object? autoClockoutGraceMinutes = null,
    Object? firstOutsideReadingAt = freezed,
    Object? confirmedExitAt = freezed,
    Object? consecutiveOutsideReadings = null,
    Object? consecutiveInsideReadings = null,
    Object? clockedOutAt = freezed,
    Object? clockOutLatitude = freezed,
    Object? clockOutLongitude = freezed,
    Object? clockOutAccuracy = freezed,
    Object? transportExpense = freezed,
    Object? routeCovered = freezed,
    Object? hasOrder = freezed,
    Object? clockOutReason = freezed,
    Object? syncState = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            outletId: null == outletId
                ? _value.outletId
                : outletId // ignore: cast_nullable_to_non_nullable
                      as String,
            outletName: null == outletName
                ? _value.outletName
                : outletName // ignore: cast_nullable_to_non_nullable
                      as String,
            outletCode: null == outletCode
                ? _value.outletCode
                : outletCode // ignore: cast_nullable_to_non_nullable
                      as String,
            isDeviation: null == isDeviation
                ? _value.isDeviation
                : isDeviation // ignore: cast_nullable_to_non_nullable
                      as bool,
            routeId: freezed == routeId
                ? _value.routeId
                : routeId // ignore: cast_nullable_to_non_nullable
                      as String?,
            clockedInAt: null == clockedInAt
                ? _value.clockedInAt
                : clockedInAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            clockInLatitude: null == clockInLatitude
                ? _value.clockInLatitude
                : clockInLatitude // ignore: cast_nullable_to_non_nullable
                      as double,
            clockInLongitude: null == clockInLongitude
                ? _value.clockInLongitude
                : clockInLongitude // ignore: cast_nullable_to_non_nullable
                      as double,
            clockInAccuracy: null == clockInAccuracy
                ? _value.clockInAccuracy
                : clockInAccuracy // ignore: cast_nullable_to_non_nullable
                      as double,
            allocatedMinutes: null == allocatedMinutes
                ? _value.allocatedMinutes
                : allocatedMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ClockInStatus,
            geofenceRadiusMeters: null == geofenceRadiusMeters
                ? _value.geofenceRadiusMeters
                : geofenceRadiusMeters // ignore: cast_nullable_to_non_nullable
                      as double,
            autoClockoutGraceMinutes: null == autoClockoutGraceMinutes
                ? _value.autoClockoutGraceMinutes
                : autoClockoutGraceMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            firstOutsideReadingAt: freezed == firstOutsideReadingAt
                ? _value.firstOutsideReadingAt
                : firstOutsideReadingAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            confirmedExitAt: freezed == confirmedExitAt
                ? _value.confirmedExitAt
                : confirmedExitAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            consecutiveOutsideReadings: null == consecutiveOutsideReadings
                ? _value.consecutiveOutsideReadings
                : consecutiveOutsideReadings // ignore: cast_nullable_to_non_nullable
                      as int,
            consecutiveInsideReadings: null == consecutiveInsideReadings
                ? _value.consecutiveInsideReadings
                : consecutiveInsideReadings // ignore: cast_nullable_to_non_nullable
                      as int,
            clockedOutAt: freezed == clockedOutAt
                ? _value.clockedOutAt
                : clockedOutAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            clockOutLatitude: freezed == clockOutLatitude
                ? _value.clockOutLatitude
                : clockOutLatitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            clockOutLongitude: freezed == clockOutLongitude
                ? _value.clockOutLongitude
                : clockOutLongitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            clockOutAccuracy: freezed == clockOutAccuracy
                ? _value.clockOutAccuracy
                : clockOutAccuracy // ignore: cast_nullable_to_non_nullable
                      as double?,
            transportExpense: freezed == transportExpense
                ? _value.transportExpense
                : transportExpense // ignore: cast_nullable_to_non_nullable
                      as double?,
            routeCovered: freezed == routeCovered
                ? _value.routeCovered
                : routeCovered // ignore: cast_nullable_to_non_nullable
                      as String?,
            hasOrder: freezed == hasOrder
                ? _value.hasOrder
                : hasOrder // ignore: cast_nullable_to_non_nullable
                      as bool?,
            clockOutReason: freezed == clockOutReason
                ? _value.clockOutReason
                : clockOutReason // ignore: cast_nullable_to_non_nullable
                      as ClockOutReason?,
            syncState: null == syncState
                ? _value.syncState
                : syncState // ignore: cast_nullable_to_non_nullable
                      as SyncState,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClockInSessionImplCopyWith<$Res>
    implements $ClockInSessionCopyWith<$Res> {
  factory _$$ClockInSessionImplCopyWith(
    _$ClockInSessionImpl value,
    $Res Function(_$ClockInSessionImpl) then,
  ) = __$$ClockInSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String outletId,
    String outletName,
    String outletCode,
    bool isDeviation,
    String? routeId,
    DateTime clockedInAt,
    double clockInLatitude,
    double clockInLongitude,
    double clockInAccuracy,
    int allocatedMinutes,
    ClockInStatus status,
    double geofenceRadiusMeters,
    int autoClockoutGraceMinutes,
    DateTime? firstOutsideReadingAt,
    DateTime? confirmedExitAt,
    int consecutiveOutsideReadings,
    int consecutiveInsideReadings,
    DateTime? clockedOutAt,
    double? clockOutLatitude,
    double? clockOutLongitude,
    double? clockOutAccuracy,
    double? transportExpense,
    String? routeCovered,
    bool? hasOrder,
    ClockOutReason? clockOutReason,
    SyncState syncState,
  });
}

/// @nodoc
class __$$ClockInSessionImplCopyWithImpl<$Res>
    extends _$ClockInSessionCopyWithImpl<$Res, _$ClockInSessionImpl>
    implements _$$ClockInSessionImplCopyWith<$Res> {
  __$$ClockInSessionImplCopyWithImpl(
    _$ClockInSessionImpl _value,
    $Res Function(_$ClockInSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClockInSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? outletId = null,
    Object? outletName = null,
    Object? outletCode = null,
    Object? isDeviation = null,
    Object? routeId = freezed,
    Object? clockedInAt = null,
    Object? clockInLatitude = null,
    Object? clockInLongitude = null,
    Object? clockInAccuracy = null,
    Object? allocatedMinutes = null,
    Object? status = null,
    Object? geofenceRadiusMeters = null,
    Object? autoClockoutGraceMinutes = null,
    Object? firstOutsideReadingAt = freezed,
    Object? confirmedExitAt = freezed,
    Object? consecutiveOutsideReadings = null,
    Object? consecutiveInsideReadings = null,
    Object? clockedOutAt = freezed,
    Object? clockOutLatitude = freezed,
    Object? clockOutLongitude = freezed,
    Object? clockOutAccuracy = freezed,
    Object? transportExpense = freezed,
    Object? routeCovered = freezed,
    Object? hasOrder = freezed,
    Object? clockOutReason = freezed,
    Object? syncState = null,
  }) {
    return _then(
      _$ClockInSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        outletId: null == outletId
            ? _value.outletId
            : outletId // ignore: cast_nullable_to_non_nullable
                  as String,
        outletName: null == outletName
            ? _value.outletName
            : outletName // ignore: cast_nullable_to_non_nullable
                  as String,
        outletCode: null == outletCode
            ? _value.outletCode
            : outletCode // ignore: cast_nullable_to_non_nullable
                  as String,
        isDeviation: null == isDeviation
            ? _value.isDeviation
            : isDeviation // ignore: cast_nullable_to_non_nullable
                  as bool,
        routeId: freezed == routeId
            ? _value.routeId
            : routeId // ignore: cast_nullable_to_non_nullable
                  as String?,
        clockedInAt: null == clockedInAt
            ? _value.clockedInAt
            : clockedInAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        clockInLatitude: null == clockInLatitude
            ? _value.clockInLatitude
            : clockInLatitude // ignore: cast_nullable_to_non_nullable
                  as double,
        clockInLongitude: null == clockInLongitude
            ? _value.clockInLongitude
            : clockInLongitude // ignore: cast_nullable_to_non_nullable
                  as double,
        clockInAccuracy: null == clockInAccuracy
            ? _value.clockInAccuracy
            : clockInAccuracy // ignore: cast_nullable_to_non_nullable
                  as double,
        allocatedMinutes: null == allocatedMinutes
            ? _value.allocatedMinutes
            : allocatedMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ClockInStatus,
        geofenceRadiusMeters: null == geofenceRadiusMeters
            ? _value.geofenceRadiusMeters
            : geofenceRadiusMeters // ignore: cast_nullable_to_non_nullable
                  as double,
        autoClockoutGraceMinutes: null == autoClockoutGraceMinutes
            ? _value.autoClockoutGraceMinutes
            : autoClockoutGraceMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        firstOutsideReadingAt: freezed == firstOutsideReadingAt
            ? _value.firstOutsideReadingAt
            : firstOutsideReadingAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        confirmedExitAt: freezed == confirmedExitAt
            ? _value.confirmedExitAt
            : confirmedExitAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        consecutiveOutsideReadings: null == consecutiveOutsideReadings
            ? _value.consecutiveOutsideReadings
            : consecutiveOutsideReadings // ignore: cast_nullable_to_non_nullable
                  as int,
        consecutiveInsideReadings: null == consecutiveInsideReadings
            ? _value.consecutiveInsideReadings
            : consecutiveInsideReadings // ignore: cast_nullable_to_non_nullable
                  as int,
        clockedOutAt: freezed == clockedOutAt
            ? _value.clockedOutAt
            : clockedOutAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        clockOutLatitude: freezed == clockOutLatitude
            ? _value.clockOutLatitude
            : clockOutLatitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        clockOutLongitude: freezed == clockOutLongitude
            ? _value.clockOutLongitude
            : clockOutLongitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        clockOutAccuracy: freezed == clockOutAccuracy
            ? _value.clockOutAccuracy
            : clockOutAccuracy // ignore: cast_nullable_to_non_nullable
                  as double?,
        transportExpense: freezed == transportExpense
            ? _value.transportExpense
            : transportExpense // ignore: cast_nullable_to_non_nullable
                  as double?,
        routeCovered: freezed == routeCovered
            ? _value.routeCovered
            : routeCovered // ignore: cast_nullable_to_non_nullable
                  as String?,
        hasOrder: freezed == hasOrder
            ? _value.hasOrder
            : hasOrder // ignore: cast_nullable_to_non_nullable
                  as bool?,
        clockOutReason: freezed == clockOutReason
            ? _value.clockOutReason
            : clockOutReason // ignore: cast_nullable_to_non_nullable
                  as ClockOutReason?,
        syncState: null == syncState
            ? _value.syncState
            : syncState // ignore: cast_nullable_to_non_nullable
                  as SyncState,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClockInSessionImpl implements _ClockInSession {
  const _$ClockInSessionImpl({
    required this.id,
    required this.outletId,
    required this.outletName,
    required this.outletCode,
    required this.isDeviation,
    this.routeId,
    required this.clockedInAt,
    required this.clockInLatitude,
    required this.clockInLongitude,
    required this.clockInAccuracy,
    required this.allocatedMinutes,
    required this.status,
    this.geofenceRadiusMeters = 200.0,
    this.autoClockoutGraceMinutes = 10,
    this.firstOutsideReadingAt,
    this.confirmedExitAt,
    this.consecutiveOutsideReadings = 0,
    this.consecutiveInsideReadings = 0,
    this.clockedOutAt,
    this.clockOutLatitude,
    this.clockOutLongitude,
    this.clockOutAccuracy,
    this.transportExpense,
    this.routeCovered,
    this.hasOrder,
    this.clockOutReason,
    this.syncState = SyncState.localOnly,
  });

  factory _$ClockInSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClockInSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String outletId;
  @override
  final String outletName;
  @override
  final String outletCode;
  @override
  final bool isDeviation;
  @override
  final String? routeId;
  // Link to assigned route
  @override
  final DateTime clockedInAt;
  @override
  final double clockInLatitude;
  @override
  final double clockInLongitude;
  @override
  final double clockInAccuracy;
  // GPS accuracy at clock-in
  @override
  final int allocatedMinutes;
  @override
  final ClockInStatus status;
  // Configuration snapshot (for audit trail)
  @override
  @JsonKey()
  final double geofenceRadiusMeters;
  @override
  @JsonKey()
  final int autoClockoutGraceMinutes;
  // Exit tracking with confirmation
  @override
  final DateTime? firstOutsideReadingAt;
  // Initial outside detection
  @override
  final DateTime? confirmedExitAt;
  // After 2 readings OR 3 min
  @override
  @JsonKey()
  final int consecutiveOutsideReadings;
  // Counter for confirmation
  @override
  @JsonKey()
  final int consecutiveInsideReadings;
  // Counter for re-entry
  // Clock-out details
  @override
  final DateTime? clockedOutAt;
  @override
  final double? clockOutLatitude;
  @override
  final double? clockOutLongitude;
  @override
  final double? clockOutAccuracy;
  // GPS accuracy at clock-out
  @override
  final double? transportExpense;
  @override
  final String? routeCovered;
  @override
  final bool? hasOrder;
  @override
  final ClockOutReason? clockOutReason;
  @override
  @JsonKey()
  final SyncState syncState;

  @override
  String toString() {
    return 'ClockInSession(id: $id, outletId: $outletId, outletName: $outletName, outletCode: $outletCode, isDeviation: $isDeviation, routeId: $routeId, clockedInAt: $clockedInAt, clockInLatitude: $clockInLatitude, clockInLongitude: $clockInLongitude, clockInAccuracy: $clockInAccuracy, allocatedMinutes: $allocatedMinutes, status: $status, geofenceRadiusMeters: $geofenceRadiusMeters, autoClockoutGraceMinutes: $autoClockoutGraceMinutes, firstOutsideReadingAt: $firstOutsideReadingAt, confirmedExitAt: $confirmedExitAt, consecutiveOutsideReadings: $consecutiveOutsideReadings, consecutiveInsideReadings: $consecutiveInsideReadings, clockedOutAt: $clockedOutAt, clockOutLatitude: $clockOutLatitude, clockOutLongitude: $clockOutLongitude, clockOutAccuracy: $clockOutAccuracy, transportExpense: $transportExpense, routeCovered: $routeCovered, hasOrder: $hasOrder, clockOutReason: $clockOutReason, syncState: $syncState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClockInSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.outletCode, outletCode) ||
                other.outletCode == outletCode) &&
            (identical(other.isDeviation, isDeviation) ||
                other.isDeviation == isDeviation) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.clockedInAt, clockedInAt) ||
                other.clockedInAt == clockedInAt) &&
            (identical(other.clockInLatitude, clockInLatitude) ||
                other.clockInLatitude == clockInLatitude) &&
            (identical(other.clockInLongitude, clockInLongitude) ||
                other.clockInLongitude == clockInLongitude) &&
            (identical(other.clockInAccuracy, clockInAccuracy) ||
                other.clockInAccuracy == clockInAccuracy) &&
            (identical(other.allocatedMinutes, allocatedMinutes) ||
                other.allocatedMinutes == allocatedMinutes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.geofenceRadiusMeters, geofenceRadiusMeters) ||
                other.geofenceRadiusMeters == geofenceRadiusMeters) &&
            (identical(
                  other.autoClockoutGraceMinutes,
                  autoClockoutGraceMinutes,
                ) ||
                other.autoClockoutGraceMinutes == autoClockoutGraceMinutes) &&
            (identical(other.firstOutsideReadingAt, firstOutsideReadingAt) ||
                other.firstOutsideReadingAt == firstOutsideReadingAt) &&
            (identical(other.confirmedExitAt, confirmedExitAt) ||
                other.confirmedExitAt == confirmedExitAt) &&
            (identical(
                  other.consecutiveOutsideReadings,
                  consecutiveOutsideReadings,
                ) ||
                other.consecutiveOutsideReadings ==
                    consecutiveOutsideReadings) &&
            (identical(
                  other.consecutiveInsideReadings,
                  consecutiveInsideReadings,
                ) ||
                other.consecutiveInsideReadings == consecutiveInsideReadings) &&
            (identical(other.clockedOutAt, clockedOutAt) ||
                other.clockedOutAt == clockedOutAt) &&
            (identical(other.clockOutLatitude, clockOutLatitude) ||
                other.clockOutLatitude == clockOutLatitude) &&
            (identical(other.clockOutLongitude, clockOutLongitude) ||
                other.clockOutLongitude == clockOutLongitude) &&
            (identical(other.clockOutAccuracy, clockOutAccuracy) ||
                other.clockOutAccuracy == clockOutAccuracy) &&
            (identical(other.transportExpense, transportExpense) ||
                other.transportExpense == transportExpense) &&
            (identical(other.routeCovered, routeCovered) ||
                other.routeCovered == routeCovered) &&
            (identical(other.hasOrder, hasOrder) ||
                other.hasOrder == hasOrder) &&
            (identical(other.clockOutReason, clockOutReason) ||
                other.clockOutReason == clockOutReason) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    outletId,
    outletName,
    outletCode,
    isDeviation,
    routeId,
    clockedInAt,
    clockInLatitude,
    clockInLongitude,
    clockInAccuracy,
    allocatedMinutes,
    status,
    geofenceRadiusMeters,
    autoClockoutGraceMinutes,
    firstOutsideReadingAt,
    confirmedExitAt,
    consecutiveOutsideReadings,
    consecutiveInsideReadings,
    clockedOutAt,
    clockOutLatitude,
    clockOutLongitude,
    clockOutAccuracy,
    transportExpense,
    routeCovered,
    hasOrder,
    clockOutReason,
    syncState,
  ]);

  /// Create a copy of ClockInSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClockInSessionImplCopyWith<_$ClockInSessionImpl> get copyWith =>
      __$$ClockInSessionImplCopyWithImpl<_$ClockInSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClockInSessionImplToJson(this);
  }
}

abstract class _ClockInSession implements ClockInSession {
  const factory _ClockInSession({
    required final String id,
    required final String outletId,
    required final String outletName,
    required final String outletCode,
    required final bool isDeviation,
    final String? routeId,
    required final DateTime clockedInAt,
    required final double clockInLatitude,
    required final double clockInLongitude,
    required final double clockInAccuracy,
    required final int allocatedMinutes,
    required final ClockInStatus status,
    final double geofenceRadiusMeters,
    final int autoClockoutGraceMinutes,
    final DateTime? firstOutsideReadingAt,
    final DateTime? confirmedExitAt,
    final int consecutiveOutsideReadings,
    final int consecutiveInsideReadings,
    final DateTime? clockedOutAt,
    final double? clockOutLatitude,
    final double? clockOutLongitude,
    final double? clockOutAccuracy,
    final double? transportExpense,
    final String? routeCovered,
    final bool? hasOrder,
    final ClockOutReason? clockOutReason,
    final SyncState syncState,
  }) = _$ClockInSessionImpl;

  factory _ClockInSession.fromJson(Map<String, dynamic> json) =
      _$ClockInSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get outletId;
  @override
  String get outletName;
  @override
  String get outletCode;
  @override
  bool get isDeviation;
  @override
  String? get routeId; // Link to assigned route
  @override
  DateTime get clockedInAt;
  @override
  double get clockInLatitude;
  @override
  double get clockInLongitude;
  @override
  double get clockInAccuracy; // GPS accuracy at clock-in
  @override
  int get allocatedMinutes;
  @override
  ClockInStatus get status; // Configuration snapshot (for audit trail)
  @override
  double get geofenceRadiusMeters;
  @override
  int get autoClockoutGraceMinutes; // Exit tracking with confirmation
  @override
  DateTime? get firstOutsideReadingAt; // Initial outside detection
  @override
  DateTime? get confirmedExitAt; // After 2 readings OR 3 min
  @override
  int get consecutiveOutsideReadings; // Counter for confirmation
  @override
  int get consecutiveInsideReadings; // Counter for re-entry
  // Clock-out details
  @override
  DateTime? get clockedOutAt;
  @override
  double? get clockOutLatitude;
  @override
  double? get clockOutLongitude;
  @override
  double? get clockOutAccuracy; // GPS accuracy at clock-out
  @override
  double? get transportExpense;
  @override
  String? get routeCovered;
  @override
  bool? get hasOrder;
  @override
  ClockOutReason? get clockOutReason;
  @override
  SyncState get syncState;

  /// Create a copy of ClockInSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClockInSessionImplCopyWith<_$ClockInSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
