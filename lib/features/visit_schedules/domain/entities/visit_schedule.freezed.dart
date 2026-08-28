// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VisitSchedule _$VisitScheduleFromJson(Map<String, dynamic> json) {
  return _VisitSchedule.fromJson(json);
}

/// @nodoc
mixin _$VisitSchedule {
  /// Server ID from outlet_visit_schedules.id
  String get serverId => throw _privateConstructorUsedError;

  /// Agent this schedule belongs to
  String get salesAgentServerId =>
      throw _privateConstructorUsedError; // === Outlet Information (denormalized for offline display) ===
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

  /// Outlet address
  String? get outletAddress =>
      throw _privateConstructorUsedError; // === Schedule Details ===
  /// Day of week: 0=Monday, 1=Tuesday, ..., 6=Sunday
  int get dayOfWeek => throw _privateConstructorUsedError;

  /// Expected arrival time (HH:mm:ss or HH:mm format from backend)
  String? get scheduledClockIn => throw _privateConstructorUsedError;

  /// Expected departure time (HH:mm:ss or HH:mm format from backend)
  String? get scheduledClockOut => throw _privateConstructorUsedError;

  /// Sequence order for the day (1, 2, 3, ...)
  int get visitOrder => throw _privateConstructorUsedError;

  /// Visit priority: 1=must visit, 2=important, 3=flexible
  int get visitPriority => throw _privateConstructorUsedError;

  /// Allocated time for this visit (minutes)
  int get allocatedMinutes =>
      throw _privateConstructorUsedError; // === Validity Period ===
  /// When this schedule becomes effective
  DateTime get effectiveFrom => throw _privateConstructorUsedError;

  /// When this schedule expires (null = indefinite)
  DateTime? get effectiveTo => throw _privateConstructorUsedError;

  /// Whether this schedule is currently active
  bool get isActive =>
      throw _privateConstructorUsedError; // === Sync Tracking ===
  /// Last time this record was synced from backend
  DateTime? get lastSyncedAt => throw _privateConstructorUsedError;

  /// Serializes this VisitSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisitSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitScheduleCopyWith<VisitSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitScheduleCopyWith<$Res> {
  factory $VisitScheduleCopyWith(
    VisitSchedule value,
    $Res Function(VisitSchedule) then,
  ) = _$VisitScheduleCopyWithImpl<$Res, VisitSchedule>;
  @useResult
  $Res call({
    String serverId,
    String salesAgentServerId,
    String outletId,
    String outletCode,
    String outletName,
    double outletLatitude,
    double outletLongitude,
    String? outletAddress,
    int dayOfWeek,
    String? scheduledClockIn,
    String? scheduledClockOut,
    int visitOrder,
    int visitPriority,
    int allocatedMinutes,
    DateTime effectiveFrom,
    DateTime? effectiveTo,
    bool isActive,
    DateTime? lastSyncedAt,
  });
}

/// @nodoc
class _$VisitScheduleCopyWithImpl<$Res, $Val extends VisitSchedule>
    implements $VisitScheduleCopyWith<$Res> {
  _$VisitScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = null,
    Object? salesAgentServerId = null,
    Object? outletId = null,
    Object? outletCode = null,
    Object? outletName = null,
    Object? outletLatitude = null,
    Object? outletLongitude = null,
    Object? outletAddress = freezed,
    Object? dayOfWeek = null,
    Object? scheduledClockIn = freezed,
    Object? scheduledClockOut = freezed,
    Object? visitOrder = null,
    Object? visitPriority = null,
    Object? allocatedMinutes = null,
    Object? effectiveFrom = null,
    Object? effectiveTo = freezed,
    Object? isActive = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            serverId: null == serverId
                ? _value.serverId
                : serverId // ignore: cast_nullable_to_non_nullable
                      as String,
            salesAgentServerId: null == salesAgentServerId
                ? _value.salesAgentServerId
                : salesAgentServerId // ignore: cast_nullable_to_non_nullable
                      as String,
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
            outletAddress: freezed == outletAddress
                ? _value.outletAddress
                : outletAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            dayOfWeek: null == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            scheduledClockIn: freezed == scheduledClockIn
                ? _value.scheduledClockIn
                : scheduledClockIn // ignore: cast_nullable_to_non_nullable
                      as String?,
            scheduledClockOut: freezed == scheduledClockOut
                ? _value.scheduledClockOut
                : scheduledClockOut // ignore: cast_nullable_to_non_nullable
                      as String?,
            visitOrder: null == visitOrder
                ? _value.visitOrder
                : visitOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            visitPriority: null == visitPriority
                ? _value.visitPriority
                : visitPriority // ignore: cast_nullable_to_non_nullable
                      as int,
            allocatedMinutes: null == allocatedMinutes
                ? _value.allocatedMinutes
                : allocatedMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            effectiveFrom: null == effectiveFrom
                ? _value.effectiveFrom
                : effectiveFrom // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            effectiveTo: freezed == effectiveTo
                ? _value.effectiveTo
                : effectiveTo // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$VisitScheduleImplCopyWith<$Res>
    implements $VisitScheduleCopyWith<$Res> {
  factory _$$VisitScheduleImplCopyWith(
    _$VisitScheduleImpl value,
    $Res Function(_$VisitScheduleImpl) then,
  ) = __$$VisitScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String serverId,
    String salesAgentServerId,
    String outletId,
    String outletCode,
    String outletName,
    double outletLatitude,
    double outletLongitude,
    String? outletAddress,
    int dayOfWeek,
    String? scheduledClockIn,
    String? scheduledClockOut,
    int visitOrder,
    int visitPriority,
    int allocatedMinutes,
    DateTime effectiveFrom,
    DateTime? effectiveTo,
    bool isActive,
    DateTime? lastSyncedAt,
  });
}

/// @nodoc
class __$$VisitScheduleImplCopyWithImpl<$Res>
    extends _$VisitScheduleCopyWithImpl<$Res, _$VisitScheduleImpl>
    implements _$$VisitScheduleImplCopyWith<$Res> {
  __$$VisitScheduleImplCopyWithImpl(
    _$VisitScheduleImpl _value,
    $Res Function(_$VisitScheduleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VisitSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverId = null,
    Object? salesAgentServerId = null,
    Object? outletId = null,
    Object? outletCode = null,
    Object? outletName = null,
    Object? outletLatitude = null,
    Object? outletLongitude = null,
    Object? outletAddress = freezed,
    Object? dayOfWeek = null,
    Object? scheduledClockIn = freezed,
    Object? scheduledClockOut = freezed,
    Object? visitOrder = null,
    Object? visitPriority = null,
    Object? allocatedMinutes = null,
    Object? effectiveFrom = null,
    Object? effectiveTo = freezed,
    Object? isActive = null,
    Object? lastSyncedAt = freezed,
  }) {
    return _then(
      _$VisitScheduleImpl(
        serverId: null == serverId
            ? _value.serverId
            : serverId // ignore: cast_nullable_to_non_nullable
                  as String,
        salesAgentServerId: null == salesAgentServerId
            ? _value.salesAgentServerId
            : salesAgentServerId // ignore: cast_nullable_to_non_nullable
                  as String,
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
        outletAddress: freezed == outletAddress
            ? _value.outletAddress
            : outletAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        dayOfWeek: null == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        scheduledClockIn: freezed == scheduledClockIn
            ? _value.scheduledClockIn
            : scheduledClockIn // ignore: cast_nullable_to_non_nullable
                  as String?,
        scheduledClockOut: freezed == scheduledClockOut
            ? _value.scheduledClockOut
            : scheduledClockOut // ignore: cast_nullable_to_non_nullable
                  as String?,
        visitOrder: null == visitOrder
            ? _value.visitOrder
            : visitOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        visitPriority: null == visitPriority
            ? _value.visitPriority
            : visitPriority // ignore: cast_nullable_to_non_nullable
                  as int,
        allocatedMinutes: null == allocatedMinutes
            ? _value.allocatedMinutes
            : allocatedMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        effectiveFrom: null == effectiveFrom
            ? _value.effectiveFrom
            : effectiveFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        effectiveTo: freezed == effectiveTo
            ? _value.effectiveTo
            : effectiveTo // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$VisitScheduleImpl extends _VisitSchedule {
  const _$VisitScheduleImpl({
    required this.serverId,
    required this.salesAgentServerId,
    required this.outletId,
    required this.outletCode,
    required this.outletName,
    required this.outletLatitude,
    required this.outletLongitude,
    this.outletAddress,
    required this.dayOfWeek,
    this.scheduledClockIn,
    this.scheduledClockOut,
    required this.visitOrder,
    this.visitPriority = 2,
    required this.allocatedMinutes,
    required this.effectiveFrom,
    this.effectiveTo,
    this.isActive = true,
    this.lastSyncedAt,
  }) : super._();

  factory _$VisitScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitScheduleImplFromJson(json);

  /// Server ID from outlet_visit_schedules.id
  @override
  final String serverId;

  /// Agent this schedule belongs to
  @override
  final String salesAgentServerId;
  // === Outlet Information (denormalized for offline display) ===
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

  /// Outlet address
  @override
  final String? outletAddress;
  // === Schedule Details ===
  /// Day of week: 0=Monday, 1=Tuesday, ..., 6=Sunday
  @override
  final int dayOfWeek;

  /// Expected arrival time (HH:mm:ss or HH:mm format from backend)
  @override
  final String? scheduledClockIn;

  /// Expected departure time (HH:mm:ss or HH:mm format from backend)
  @override
  final String? scheduledClockOut;

  /// Sequence order for the day (1, 2, 3, ...)
  @override
  final int visitOrder;

  /// Visit priority: 1=must visit, 2=important, 3=flexible
  @override
  @JsonKey()
  final int visitPriority;

  /// Allocated time for this visit (minutes)
  @override
  final int allocatedMinutes;
  // === Validity Period ===
  /// When this schedule becomes effective
  @override
  final DateTime effectiveFrom;

  /// When this schedule expires (null = indefinite)
  @override
  final DateTime? effectiveTo;

  /// Whether this schedule is currently active
  @override
  @JsonKey()
  final bool isActive;
  // === Sync Tracking ===
  /// Last time this record was synced from backend
  @override
  final DateTime? lastSyncedAt;

  @override
  String toString() {
    return 'VisitSchedule(serverId: $serverId, salesAgentServerId: $salesAgentServerId, outletId: $outletId, outletCode: $outletCode, outletName: $outletName, outletLatitude: $outletLatitude, outletLongitude: $outletLongitude, outletAddress: $outletAddress, dayOfWeek: $dayOfWeek, scheduledClockIn: $scheduledClockIn, scheduledClockOut: $scheduledClockOut, visitOrder: $visitOrder, visitPriority: $visitPriority, allocatedMinutes: $allocatedMinutes, effectiveFrom: $effectiveFrom, effectiveTo: $effectiveTo, isActive: $isActive, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitScheduleImpl &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.salesAgentServerId, salesAgentServerId) ||
                other.salesAgentServerId == salesAgentServerId) &&
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
            (identical(other.outletAddress, outletAddress) ||
                other.outletAddress == outletAddress) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.scheduledClockIn, scheduledClockIn) ||
                other.scheduledClockIn == scheduledClockIn) &&
            (identical(other.scheduledClockOut, scheduledClockOut) ||
                other.scheduledClockOut == scheduledClockOut) &&
            (identical(other.visitOrder, visitOrder) ||
                other.visitOrder == visitOrder) &&
            (identical(other.visitPriority, visitPriority) ||
                other.visitPriority == visitPriority) &&
            (identical(other.allocatedMinutes, allocatedMinutes) ||
                other.allocatedMinutes == allocatedMinutes) &&
            (identical(other.effectiveFrom, effectiveFrom) ||
                other.effectiveFrom == effectiveFrom) &&
            (identical(other.effectiveTo, effectiveTo) ||
                other.effectiveTo == effectiveTo) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    serverId,
    salesAgentServerId,
    outletId,
    outletCode,
    outletName,
    outletLatitude,
    outletLongitude,
    outletAddress,
    dayOfWeek,
    scheduledClockIn,
    scheduledClockOut,
    visitOrder,
    visitPriority,
    allocatedMinutes,
    effectiveFrom,
    effectiveTo,
    isActive,
    lastSyncedAt,
  );

  /// Create a copy of VisitSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitScheduleImplCopyWith<_$VisitScheduleImpl> get copyWith =>
      __$$VisitScheduleImplCopyWithImpl<_$VisitScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitScheduleImplToJson(this);
  }
}

abstract class _VisitSchedule extends VisitSchedule {
  const factory _VisitSchedule({
    required final String serverId,
    required final String salesAgentServerId,
    required final String outletId,
    required final String outletCode,
    required final String outletName,
    required final double outletLatitude,
    required final double outletLongitude,
    final String? outletAddress,
    required final int dayOfWeek,
    final String? scheduledClockIn,
    final String? scheduledClockOut,
    required final int visitOrder,
    final int visitPriority,
    required final int allocatedMinutes,
    required final DateTime effectiveFrom,
    final DateTime? effectiveTo,
    final bool isActive,
    final DateTime? lastSyncedAt,
  }) = _$VisitScheduleImpl;
  const _VisitSchedule._() : super._();

  factory _VisitSchedule.fromJson(Map<String, dynamic> json) =
      _$VisitScheduleImpl.fromJson;

  /// Server ID from outlet_visit_schedules.id
  @override
  String get serverId;

  /// Agent this schedule belongs to
  @override
  String get salesAgentServerId; // === Outlet Information (denormalized for offline display) ===
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

  /// Outlet address
  @override
  String? get outletAddress; // === Schedule Details ===
  /// Day of week: 0=Monday, 1=Tuesday, ..., 6=Sunday
  @override
  int get dayOfWeek;

  /// Expected arrival time (HH:mm:ss or HH:mm format from backend)
  @override
  String? get scheduledClockIn;

  /// Expected departure time (HH:mm:ss or HH:mm format from backend)
  @override
  String? get scheduledClockOut;

  /// Sequence order for the day (1, 2, 3, ...)
  @override
  int get visitOrder;

  /// Visit priority: 1=must visit, 2=important, 3=flexible
  @override
  int get visitPriority;

  /// Allocated time for this visit (minutes)
  @override
  int get allocatedMinutes; // === Validity Period ===
  /// When this schedule becomes effective
  @override
  DateTime get effectiveFrom;

  /// When this schedule expires (null = indefinite)
  @override
  DateTime? get effectiveTo;

  /// Whether this schedule is currently active
  @override
  bool get isActive; // === Sync Tracking ===
  /// Last time this record was synced from backend
  @override
  DateTime? get lastSyncedAt;

  /// Create a copy of VisitSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitScheduleImplCopyWith<_$VisitScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
