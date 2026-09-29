// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mapping_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MappingSession {
  String get localId => throw _privateConstructorUsedError;
  int get footprintId => throw _privateConstructorUsedError;
  int get mappingRequestId => throw _privateConstructorUsedError;
  String get visitLocalId =>
      throw _privateConstructorUsedError; // Denormalized for the resume/recovery UI — never used for any
  // decision, display only.
  String get outletId => throw _privateConstructorUsedError;
  String get outletCode => throw _privateConstructorUsedError;
  String get outletName => throw _privateConstructorUsedError;

  /// Security-critical (spec §19/§95) — every session belongs to exactly
  /// one authenticated user; recovery/upload/finish/abandon all check
  /// this against the CURRENT session before acting.
  String get ownerUserId => throw _privateConstructorUsedError;
  MappingLocalState get localState => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get serverTimeAtStart => throw _privateConstructorUsedError;
  DateTime? get lastSampleAt => throw _privateConstructorUsedError;
  DateTime? get captureFinishedLocalAt => throw _privateConstructorUsedError;

  /// Cached, but never blindly trusted — recomputed from actual
  /// [MappingSample] rows on every cold-start recovery (spec §24).
  int get nextSequence => throw _privateConstructorUsedError;
  MappingCaptureLimits get limits => throw _privateConstructorUsedError;
  int? get recommendedIntervalMs => throw _privateConstructorUsedError;

  /// The backend's own `total_samples`/`samples_received` figure, from
  /// the most recent `/samples` or `/capture-status` response — used as
  /// a defensive floor (`max(localCount, this)`) when seeding the
  /// `max_samples` guard on resume. Local row count alone is only a
  /// correct total today because nothing currently deletes `synced`
  /// rows during an active session; this field means that stays true
  /// even if a future retention/cleanup pass starts deleting them.
  int? get lastKnownServerTotalSamples => throw _privateConstructorUsedError;

  /// Exact snapshot to restore on exit from mapping mode — never
  /// hardcoded assumptions (spec §5/§6/§36/§37).
  double get preMappingDistanceFilter => throw _privateConstructorUsedError;
  double get preMappingHeartbeatInterval => throw _privateConstructorUsedError;
  Map<String, dynamic>? get preMappingExtras =>
      throw _privateConstructorUsedError;
  int get configVersion => throw _privateConstructorUsedError;
  MappingFailureCode? get failureCode => throw _privateConstructorUsedError;
  String? get failureMessage => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of MappingSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MappingSessionCopyWith<MappingSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MappingSessionCopyWith<$Res> {
  factory $MappingSessionCopyWith(
    MappingSession value,
    $Res Function(MappingSession) then,
  ) = _$MappingSessionCopyWithImpl<$Res, MappingSession>;
  @useResult
  $Res call({
    String localId,
    int footprintId,
    int mappingRequestId,
    String visitLocalId,
    String outletId,
    String outletCode,
    String outletName,
    String ownerUserId,
    MappingLocalState localState,
    DateTime startedAt,
    DateTime? serverTimeAtStart,
    DateTime? lastSampleAt,
    DateTime? captureFinishedLocalAt,
    int nextSequence,
    MappingCaptureLimits limits,
    int? recommendedIntervalMs,
    int? lastKnownServerTotalSamples,
    double preMappingDistanceFilter,
    double preMappingHeartbeatInterval,
    Map<String, dynamic>? preMappingExtras,
    int configVersion,
    MappingFailureCode? failureCode,
    String? failureMessage,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$MappingSessionCopyWithImpl<$Res, $Val extends MappingSession>
    implements $MappingSessionCopyWith<$Res> {
  _$MappingSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MappingSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? footprintId = null,
    Object? mappingRequestId = null,
    Object? visitLocalId = null,
    Object? outletId = null,
    Object? outletCode = null,
    Object? outletName = null,
    Object? ownerUserId = null,
    Object? localState = null,
    Object? startedAt = null,
    Object? serverTimeAtStart = freezed,
    Object? lastSampleAt = freezed,
    Object? captureFinishedLocalAt = freezed,
    Object? nextSequence = null,
    Object? limits = null,
    Object? recommendedIntervalMs = freezed,
    Object? lastKnownServerTotalSamples = freezed,
    Object? preMappingDistanceFilter = null,
    Object? preMappingHeartbeatInterval = null,
    Object? preMappingExtras = freezed,
    Object? configVersion = null,
    Object? failureCode = freezed,
    Object? failureMessage = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            localId: null == localId
                ? _value.localId
                : localId // ignore: cast_nullable_to_non_nullable
                      as String,
            footprintId: null == footprintId
                ? _value.footprintId
                : footprintId // ignore: cast_nullable_to_non_nullable
                      as int,
            mappingRequestId: null == mappingRequestId
                ? _value.mappingRequestId
                : mappingRequestId // ignore: cast_nullable_to_non_nullable
                      as int,
            visitLocalId: null == visitLocalId
                ? _value.visitLocalId
                : visitLocalId // ignore: cast_nullable_to_non_nullable
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
            ownerUserId: null == ownerUserId
                ? _value.ownerUserId
                : ownerUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            localState: null == localState
                ? _value.localState
                : localState // ignore: cast_nullable_to_non_nullable
                      as MappingLocalState,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            serverTimeAtStart: freezed == serverTimeAtStart
                ? _value.serverTimeAtStart
                : serverTimeAtStart // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastSampleAt: freezed == lastSampleAt
                ? _value.lastSampleAt
                : lastSampleAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            captureFinishedLocalAt: freezed == captureFinishedLocalAt
                ? _value.captureFinishedLocalAt
                : captureFinishedLocalAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            nextSequence: null == nextSequence
                ? _value.nextSequence
                : nextSequence // ignore: cast_nullable_to_non_nullable
                      as int,
            limits: null == limits
                ? _value.limits
                : limits // ignore: cast_nullable_to_non_nullable
                      as MappingCaptureLimits,
            recommendedIntervalMs: freezed == recommendedIntervalMs
                ? _value.recommendedIntervalMs
                : recommendedIntervalMs // ignore: cast_nullable_to_non_nullable
                      as int?,
            lastKnownServerTotalSamples: freezed == lastKnownServerTotalSamples
                ? _value.lastKnownServerTotalSamples
                : lastKnownServerTotalSamples // ignore: cast_nullable_to_non_nullable
                      as int?,
            preMappingDistanceFilter: null == preMappingDistanceFilter
                ? _value.preMappingDistanceFilter
                : preMappingDistanceFilter // ignore: cast_nullable_to_non_nullable
                      as double,
            preMappingHeartbeatInterval: null == preMappingHeartbeatInterval
                ? _value.preMappingHeartbeatInterval
                : preMappingHeartbeatInterval // ignore: cast_nullable_to_non_nullable
                      as double,
            preMappingExtras: freezed == preMappingExtras
                ? _value.preMappingExtras
                : preMappingExtras // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            configVersion: null == configVersion
                ? _value.configVersion
                : configVersion // ignore: cast_nullable_to_non_nullable
                      as int,
            failureCode: freezed == failureCode
                ? _value.failureCode
                : failureCode // ignore: cast_nullable_to_non_nullable
                      as MappingFailureCode?,
            failureMessage: freezed == failureMessage
                ? _value.failureMessage
                : failureMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MappingSessionImplCopyWith<$Res>
    implements $MappingSessionCopyWith<$Res> {
  factory _$$MappingSessionImplCopyWith(
    _$MappingSessionImpl value,
    $Res Function(_$MappingSessionImpl) then,
  ) = __$$MappingSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String localId,
    int footprintId,
    int mappingRequestId,
    String visitLocalId,
    String outletId,
    String outletCode,
    String outletName,
    String ownerUserId,
    MappingLocalState localState,
    DateTime startedAt,
    DateTime? serverTimeAtStart,
    DateTime? lastSampleAt,
    DateTime? captureFinishedLocalAt,
    int nextSequence,
    MappingCaptureLimits limits,
    int? recommendedIntervalMs,
    int? lastKnownServerTotalSamples,
    double preMappingDistanceFilter,
    double preMappingHeartbeatInterval,
    Map<String, dynamic>? preMappingExtras,
    int configVersion,
    MappingFailureCode? failureCode,
    String? failureMessage,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$MappingSessionImplCopyWithImpl<$Res>
    extends _$MappingSessionCopyWithImpl<$Res, _$MappingSessionImpl>
    implements _$$MappingSessionImplCopyWith<$Res> {
  __$$MappingSessionImplCopyWithImpl(
    _$MappingSessionImpl _value,
    $Res Function(_$MappingSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MappingSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? footprintId = null,
    Object? mappingRequestId = null,
    Object? visitLocalId = null,
    Object? outletId = null,
    Object? outletCode = null,
    Object? outletName = null,
    Object? ownerUserId = null,
    Object? localState = null,
    Object? startedAt = null,
    Object? serverTimeAtStart = freezed,
    Object? lastSampleAt = freezed,
    Object? captureFinishedLocalAt = freezed,
    Object? nextSequence = null,
    Object? limits = null,
    Object? recommendedIntervalMs = freezed,
    Object? lastKnownServerTotalSamples = freezed,
    Object? preMappingDistanceFilter = null,
    Object? preMappingHeartbeatInterval = null,
    Object? preMappingExtras = freezed,
    Object? configVersion = null,
    Object? failureCode = freezed,
    Object? failureMessage = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$MappingSessionImpl(
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        footprintId: null == footprintId
            ? _value.footprintId
            : footprintId // ignore: cast_nullable_to_non_nullable
                  as int,
        mappingRequestId: null == mappingRequestId
            ? _value.mappingRequestId
            : mappingRequestId // ignore: cast_nullable_to_non_nullable
                  as int,
        visitLocalId: null == visitLocalId
            ? _value.visitLocalId
            : visitLocalId // ignore: cast_nullable_to_non_nullable
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
        ownerUserId: null == ownerUserId
            ? _value.ownerUserId
            : ownerUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        localState: null == localState
            ? _value.localState
            : localState // ignore: cast_nullable_to_non_nullable
                  as MappingLocalState,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        serverTimeAtStart: freezed == serverTimeAtStart
            ? _value.serverTimeAtStart
            : serverTimeAtStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastSampleAt: freezed == lastSampleAt
            ? _value.lastSampleAt
            : lastSampleAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        captureFinishedLocalAt: freezed == captureFinishedLocalAt
            ? _value.captureFinishedLocalAt
            : captureFinishedLocalAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        nextSequence: null == nextSequence
            ? _value.nextSequence
            : nextSequence // ignore: cast_nullable_to_non_nullable
                  as int,
        limits: null == limits
            ? _value.limits
            : limits // ignore: cast_nullable_to_non_nullable
                  as MappingCaptureLimits,
        recommendedIntervalMs: freezed == recommendedIntervalMs
            ? _value.recommendedIntervalMs
            : recommendedIntervalMs // ignore: cast_nullable_to_non_nullable
                  as int?,
        lastKnownServerTotalSamples: freezed == lastKnownServerTotalSamples
            ? _value.lastKnownServerTotalSamples
            : lastKnownServerTotalSamples // ignore: cast_nullable_to_non_nullable
                  as int?,
        preMappingDistanceFilter: null == preMappingDistanceFilter
            ? _value.preMappingDistanceFilter
            : preMappingDistanceFilter // ignore: cast_nullable_to_non_nullable
                  as double,
        preMappingHeartbeatInterval: null == preMappingHeartbeatInterval
            ? _value.preMappingHeartbeatInterval
            : preMappingHeartbeatInterval // ignore: cast_nullable_to_non_nullable
                  as double,
        preMappingExtras: freezed == preMappingExtras
            ? _value._preMappingExtras
            : preMappingExtras // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        configVersion: null == configVersion
            ? _value.configVersion
            : configVersion // ignore: cast_nullable_to_non_nullable
                  as int,
        failureCode: freezed == failureCode
            ? _value.failureCode
            : failureCode // ignore: cast_nullable_to_non_nullable
                  as MappingFailureCode?,
        failureMessage: freezed == failureMessage
            ? _value.failureMessage
            : failureMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$MappingSessionImpl extends _MappingSession {
  const _$MappingSessionImpl({
    required this.localId,
    required this.footprintId,
    required this.mappingRequestId,
    required this.visitLocalId,
    required this.outletId,
    required this.outletCode,
    required this.outletName,
    required this.ownerUserId,
    required this.localState,
    required this.startedAt,
    this.serverTimeAtStart,
    this.lastSampleAt,
    this.captureFinishedLocalAt,
    this.nextSequence = 0,
    required this.limits,
    this.recommendedIntervalMs,
    this.lastKnownServerTotalSamples,
    required this.preMappingDistanceFilter,
    required this.preMappingHeartbeatInterval,
    final Map<String, dynamic>? preMappingExtras,
    this.configVersion = 1,
    this.failureCode,
    this.failureMessage,
    required this.createdAt,
    required this.updatedAt,
  }) : _preMappingExtras = preMappingExtras,
       super._();

  @override
  final String localId;
  @override
  final int footprintId;
  @override
  final int mappingRequestId;
  @override
  final String visitLocalId;
  // Denormalized for the resume/recovery UI — never used for any
  // decision, display only.
  @override
  final String outletId;
  @override
  final String outletCode;
  @override
  final String outletName;

  /// Security-critical (spec §19/§95) — every session belongs to exactly
  /// one authenticated user; recovery/upload/finish/abandon all check
  /// this against the CURRENT session before acting.
  @override
  final String ownerUserId;
  @override
  final MappingLocalState localState;
  @override
  final DateTime startedAt;
  @override
  final DateTime? serverTimeAtStart;
  @override
  final DateTime? lastSampleAt;
  @override
  final DateTime? captureFinishedLocalAt;

  /// Cached, but never blindly trusted — recomputed from actual
  /// [MappingSample] rows on every cold-start recovery (spec §24).
  @override
  @JsonKey()
  final int nextSequence;
  @override
  final MappingCaptureLimits limits;
  @override
  final int? recommendedIntervalMs;

  /// The backend's own `total_samples`/`samples_received` figure, from
  /// the most recent `/samples` or `/capture-status` response — used as
  /// a defensive floor (`max(localCount, this)`) when seeding the
  /// `max_samples` guard on resume. Local row count alone is only a
  /// correct total today because nothing currently deletes `synced`
  /// rows during an active session; this field means that stays true
  /// even if a future retention/cleanup pass starts deleting them.
  @override
  final int? lastKnownServerTotalSamples;

  /// Exact snapshot to restore on exit from mapping mode — never
  /// hardcoded assumptions (spec §5/§6/§36/§37).
  @override
  final double preMappingDistanceFilter;
  @override
  final double preMappingHeartbeatInterval;
  final Map<String, dynamic>? _preMappingExtras;
  @override
  Map<String, dynamic>? get preMappingExtras {
    final value = _preMappingExtras;
    if (value == null) return null;
    if (_preMappingExtras is EqualUnmodifiableMapView) return _preMappingExtras;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final int configVersion;
  @override
  final MappingFailureCode? failureCode;
  @override
  final String? failureMessage;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MappingSession(localId: $localId, footprintId: $footprintId, mappingRequestId: $mappingRequestId, visitLocalId: $visitLocalId, outletId: $outletId, outletCode: $outletCode, outletName: $outletName, ownerUserId: $ownerUserId, localState: $localState, startedAt: $startedAt, serverTimeAtStart: $serverTimeAtStart, lastSampleAt: $lastSampleAt, captureFinishedLocalAt: $captureFinishedLocalAt, nextSequence: $nextSequence, limits: $limits, recommendedIntervalMs: $recommendedIntervalMs, lastKnownServerTotalSamples: $lastKnownServerTotalSamples, preMappingDistanceFilter: $preMappingDistanceFilter, preMappingHeartbeatInterval: $preMappingHeartbeatInterval, preMappingExtras: $preMappingExtras, configVersion: $configVersion, failureCode: $failureCode, failureMessage: $failureMessage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MappingSessionImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.footprintId, footprintId) ||
                other.footprintId == footprintId) &&
            (identical(other.mappingRequestId, mappingRequestId) ||
                other.mappingRequestId == mappingRequestId) &&
            (identical(other.visitLocalId, visitLocalId) ||
                other.visitLocalId == visitLocalId) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.outletCode, outletCode) ||
                other.outletCode == outletCode) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.ownerUserId, ownerUserId) ||
                other.ownerUserId == ownerUserId) &&
            (identical(other.localState, localState) ||
                other.localState == localState) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.serverTimeAtStart, serverTimeAtStart) ||
                other.serverTimeAtStart == serverTimeAtStart) &&
            (identical(other.lastSampleAt, lastSampleAt) ||
                other.lastSampleAt == lastSampleAt) &&
            (identical(other.captureFinishedLocalAt, captureFinishedLocalAt) ||
                other.captureFinishedLocalAt == captureFinishedLocalAt) &&
            (identical(other.nextSequence, nextSequence) ||
                other.nextSequence == nextSequence) &&
            (identical(other.limits, limits) || other.limits == limits) &&
            (identical(other.recommendedIntervalMs, recommendedIntervalMs) ||
                other.recommendedIntervalMs == recommendedIntervalMs) &&
            (identical(
                  other.lastKnownServerTotalSamples,
                  lastKnownServerTotalSamples,
                ) ||
                other.lastKnownServerTotalSamples ==
                    lastKnownServerTotalSamples) &&
            (identical(
                  other.preMappingDistanceFilter,
                  preMappingDistanceFilter,
                ) ||
                other.preMappingDistanceFilter == preMappingDistanceFilter) &&
            (identical(
                  other.preMappingHeartbeatInterval,
                  preMappingHeartbeatInterval,
                ) ||
                other.preMappingHeartbeatInterval ==
                    preMappingHeartbeatInterval) &&
            const DeepCollectionEquality().equals(
              other._preMappingExtras,
              _preMappingExtras,
            ) &&
            (identical(other.configVersion, configVersion) ||
                other.configVersion == configVersion) &&
            (identical(other.failureCode, failureCode) ||
                other.failureCode == failureCode) &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    localId,
    footprintId,
    mappingRequestId,
    visitLocalId,
    outletId,
    outletCode,
    outletName,
    ownerUserId,
    localState,
    startedAt,
    serverTimeAtStart,
    lastSampleAt,
    captureFinishedLocalAt,
    nextSequence,
    limits,
    recommendedIntervalMs,
    lastKnownServerTotalSamples,
    preMappingDistanceFilter,
    preMappingHeartbeatInterval,
    const DeepCollectionEquality().hash(_preMappingExtras),
    configVersion,
    failureCode,
    failureMessage,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of MappingSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MappingSessionImplCopyWith<_$MappingSessionImpl> get copyWith =>
      __$$MappingSessionImplCopyWithImpl<_$MappingSessionImpl>(
        this,
        _$identity,
      );
}

abstract class _MappingSession extends MappingSession {
  const factory _MappingSession({
    required final String localId,
    required final int footprintId,
    required final int mappingRequestId,
    required final String visitLocalId,
    required final String outletId,
    required final String outletCode,
    required final String outletName,
    required final String ownerUserId,
    required final MappingLocalState localState,
    required final DateTime startedAt,
    final DateTime? serverTimeAtStart,
    final DateTime? lastSampleAt,
    final DateTime? captureFinishedLocalAt,
    final int nextSequence,
    required final MappingCaptureLimits limits,
    final int? recommendedIntervalMs,
    final int? lastKnownServerTotalSamples,
    required final double preMappingDistanceFilter,
    required final double preMappingHeartbeatInterval,
    final Map<String, dynamic>? preMappingExtras,
    final int configVersion,
    final MappingFailureCode? failureCode,
    final String? failureMessage,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$MappingSessionImpl;
  const _MappingSession._() : super._();

  @override
  String get localId;
  @override
  int get footprintId;
  @override
  int get mappingRequestId;
  @override
  String get visitLocalId; // Denormalized for the resume/recovery UI — never used for any
  // decision, display only.
  @override
  String get outletId;
  @override
  String get outletCode;
  @override
  String get outletName;

  /// Security-critical (spec §19/§95) — every session belongs to exactly
  /// one authenticated user; recovery/upload/finish/abandon all check
  /// this against the CURRENT session before acting.
  @override
  String get ownerUserId;
  @override
  MappingLocalState get localState;
  @override
  DateTime get startedAt;
  @override
  DateTime? get serverTimeAtStart;
  @override
  DateTime? get lastSampleAt;
  @override
  DateTime? get captureFinishedLocalAt;

  /// Cached, but never blindly trusted — recomputed from actual
  /// [MappingSample] rows on every cold-start recovery (spec §24).
  @override
  int get nextSequence;
  @override
  MappingCaptureLimits get limits;
  @override
  int? get recommendedIntervalMs;

  /// The backend's own `total_samples`/`samples_received` figure, from
  /// the most recent `/samples` or `/capture-status` response — used as
  /// a defensive floor (`max(localCount, this)`) when seeding the
  /// `max_samples` guard on resume. Local row count alone is only a
  /// correct total today because nothing currently deletes `synced`
  /// rows during an active session; this field means that stays true
  /// even if a future retention/cleanup pass starts deleting them.
  @override
  int? get lastKnownServerTotalSamples;

  /// Exact snapshot to restore on exit from mapping mode — never
  /// hardcoded assumptions (spec §5/§6/§36/§37).
  @override
  double get preMappingDistanceFilter;
  @override
  double get preMappingHeartbeatInterval;
  @override
  Map<String, dynamic>? get preMappingExtras;
  @override
  int get configVersion;
  @override
  MappingFailureCode? get failureCode;
  @override
  String? get failureMessage;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of MappingSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MappingSessionImplCopyWith<_$MappingSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
