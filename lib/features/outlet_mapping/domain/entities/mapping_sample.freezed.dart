// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mapping_sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MappingSample {
  /// Local UUID — Isar row identity, distinct from [clientSampleId].
  String get localId => throw _privateConstructorUsedError;
  int get footprintId => throw _privateConstructorUsedError;

  /// Immutable once generated (spec §11/§23) — the backend dedup key,
  /// together with footprintId. Never regenerated on retry.
  String get clientSampleId => throw _privateConstructorUsedError;

  /// Monotonic within a footprint (spec §24) — tie-breaker for equal
  /// `recorded_at`.
  int get sequence => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get accuracyM => throw _privateConstructorUsedError;
  DateTime get recordedAt =>
      throw _privateConstructorUsedError; // Diagnostic only — never read for any accept/reject/enforcement
  // decision anywhere in this feature. See spec §6.
  double? get altitudeM => throw _privateConstructorUsedError;
  double? get verticalAccuracyM => throw _privateConstructorUsedError;
  String? get floorLabel => throw _privateConstructorUsedError;
  double? get speedMps => throw _privateConstructorUsedError;
  double? get headingDeg => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  bool? get isMock => throw _privateConstructorUsedError;
  MappingSampleSyncState get syncState => throw _privateConstructorUsedError;
  int get attemptCount => throw _privateConstructorUsedError;
  DateTime? get lastAttemptAt => throw _privateConstructorUsedError;
  String? get lastError => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of MappingSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MappingSampleCopyWith<MappingSample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MappingSampleCopyWith<$Res> {
  factory $MappingSampleCopyWith(
    MappingSample value,
    $Res Function(MappingSample) then,
  ) = _$MappingSampleCopyWithImpl<$Res, MappingSample>;
  @useResult
  $Res call({
    String localId,
    int footprintId,
    String clientSampleId,
    int sequence,
    double latitude,
    double longitude,
    double accuracyM,
    DateTime recordedAt,
    double? altitudeM,
    double? verticalAccuracyM,
    String? floorLabel,
    double? speedMps,
    double? headingDeg,
    String? provider,
    bool? isMock,
    MappingSampleSyncState syncState,
    int attemptCount,
    DateTime? lastAttemptAt,
    String? lastError,
    DateTime createdAt,
  });
}

/// @nodoc
class _$MappingSampleCopyWithImpl<$Res, $Val extends MappingSample>
    implements $MappingSampleCopyWith<$Res> {
  _$MappingSampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MappingSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? footprintId = null,
    Object? clientSampleId = null,
    Object? sequence = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracyM = null,
    Object? recordedAt = null,
    Object? altitudeM = freezed,
    Object? verticalAccuracyM = freezed,
    Object? floorLabel = freezed,
    Object? speedMps = freezed,
    Object? headingDeg = freezed,
    Object? provider = freezed,
    Object? isMock = freezed,
    Object? syncState = null,
    Object? attemptCount = null,
    Object? lastAttemptAt = freezed,
    Object? lastError = freezed,
    Object? createdAt = null,
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
            clientSampleId: null == clientSampleId
                ? _value.clientSampleId
                : clientSampleId // ignore: cast_nullable_to_non_nullable
                      as String,
            sequence: null == sequence
                ? _value.sequence
                : sequence // ignore: cast_nullable_to_non_nullable
                      as int,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            accuracyM: null == accuracyM
                ? _value.accuracyM
                : accuracyM // ignore: cast_nullable_to_non_nullable
                      as double,
            recordedAt: null == recordedAt
                ? _value.recordedAt
                : recordedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            altitudeM: freezed == altitudeM
                ? _value.altitudeM
                : altitudeM // ignore: cast_nullable_to_non_nullable
                      as double?,
            verticalAccuracyM: freezed == verticalAccuracyM
                ? _value.verticalAccuracyM
                : verticalAccuracyM // ignore: cast_nullable_to_non_nullable
                      as double?,
            floorLabel: freezed == floorLabel
                ? _value.floorLabel
                : floorLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            speedMps: freezed == speedMps
                ? _value.speedMps
                : speedMps // ignore: cast_nullable_to_non_nullable
                      as double?,
            headingDeg: freezed == headingDeg
                ? _value.headingDeg
                : headingDeg // ignore: cast_nullable_to_non_nullable
                      as double?,
            provider: freezed == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                      as String?,
            isMock: freezed == isMock
                ? _value.isMock
                : isMock // ignore: cast_nullable_to_non_nullable
                      as bool?,
            syncState: null == syncState
                ? _value.syncState
                : syncState // ignore: cast_nullable_to_non_nullable
                      as MappingSampleSyncState,
            attemptCount: null == attemptCount
                ? _value.attemptCount
                : attemptCount // ignore: cast_nullable_to_non_nullable
                      as int,
            lastAttemptAt: freezed == lastAttemptAt
                ? _value.lastAttemptAt
                : lastAttemptAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastError: freezed == lastError
                ? _value.lastError
                : lastError // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MappingSampleImplCopyWith<$Res>
    implements $MappingSampleCopyWith<$Res> {
  factory _$$MappingSampleImplCopyWith(
    _$MappingSampleImpl value,
    $Res Function(_$MappingSampleImpl) then,
  ) = __$$MappingSampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String localId,
    int footprintId,
    String clientSampleId,
    int sequence,
    double latitude,
    double longitude,
    double accuracyM,
    DateTime recordedAt,
    double? altitudeM,
    double? verticalAccuracyM,
    String? floorLabel,
    double? speedMps,
    double? headingDeg,
    String? provider,
    bool? isMock,
    MappingSampleSyncState syncState,
    int attemptCount,
    DateTime? lastAttemptAt,
    String? lastError,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$MappingSampleImplCopyWithImpl<$Res>
    extends _$MappingSampleCopyWithImpl<$Res, _$MappingSampleImpl>
    implements _$$MappingSampleImplCopyWith<$Res> {
  __$$MappingSampleImplCopyWithImpl(
    _$MappingSampleImpl _value,
    $Res Function(_$MappingSampleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MappingSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? footprintId = null,
    Object? clientSampleId = null,
    Object? sequence = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracyM = null,
    Object? recordedAt = null,
    Object? altitudeM = freezed,
    Object? verticalAccuracyM = freezed,
    Object? floorLabel = freezed,
    Object? speedMps = freezed,
    Object? headingDeg = freezed,
    Object? provider = freezed,
    Object? isMock = freezed,
    Object? syncState = null,
    Object? attemptCount = null,
    Object? lastAttemptAt = freezed,
    Object? lastError = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$MappingSampleImpl(
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        footprintId: null == footprintId
            ? _value.footprintId
            : footprintId // ignore: cast_nullable_to_non_nullable
                  as int,
        clientSampleId: null == clientSampleId
            ? _value.clientSampleId
            : clientSampleId // ignore: cast_nullable_to_non_nullable
                  as String,
        sequence: null == sequence
            ? _value.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        accuracyM: null == accuracyM
            ? _value.accuracyM
            : accuracyM // ignore: cast_nullable_to_non_nullable
                  as double,
        recordedAt: null == recordedAt
            ? _value.recordedAt
            : recordedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        altitudeM: freezed == altitudeM
            ? _value.altitudeM
            : altitudeM // ignore: cast_nullable_to_non_nullable
                  as double?,
        verticalAccuracyM: freezed == verticalAccuracyM
            ? _value.verticalAccuracyM
            : verticalAccuracyM // ignore: cast_nullable_to_non_nullable
                  as double?,
        floorLabel: freezed == floorLabel
            ? _value.floorLabel
            : floorLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        speedMps: freezed == speedMps
            ? _value.speedMps
            : speedMps // ignore: cast_nullable_to_non_nullable
                  as double?,
        headingDeg: freezed == headingDeg
            ? _value.headingDeg
            : headingDeg // ignore: cast_nullable_to_non_nullable
                  as double?,
        provider: freezed == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String?,
        isMock: freezed == isMock
            ? _value.isMock
            : isMock // ignore: cast_nullable_to_non_nullable
                  as bool?,
        syncState: null == syncState
            ? _value.syncState
            : syncState // ignore: cast_nullable_to_non_nullable
                  as MappingSampleSyncState,
        attemptCount: null == attemptCount
            ? _value.attemptCount
            : attemptCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lastAttemptAt: freezed == lastAttemptAt
            ? _value.lastAttemptAt
            : lastAttemptAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastError: freezed == lastError
            ? _value.lastError
            : lastError // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$MappingSampleImpl implements _MappingSample {
  const _$MappingSampleImpl({
    required this.localId,
    required this.footprintId,
    required this.clientSampleId,
    required this.sequence,
    required this.latitude,
    required this.longitude,
    required this.accuracyM,
    required this.recordedAt,
    this.altitudeM,
    this.verticalAccuracyM,
    this.floorLabel,
    this.speedMps,
    this.headingDeg,
    this.provider,
    this.isMock,
    this.syncState = MappingSampleSyncState.pending,
    this.attemptCount = 0,
    this.lastAttemptAt,
    this.lastError,
    required this.createdAt,
  });

  /// Local UUID — Isar row identity, distinct from [clientSampleId].
  @override
  final String localId;
  @override
  final int footprintId;

  /// Immutable once generated (spec §11/§23) — the backend dedup key,
  /// together with footprintId. Never regenerated on retry.
  @override
  final String clientSampleId;

  /// Monotonic within a footprint (spec §24) — tie-breaker for equal
  /// `recorded_at`.
  @override
  final int sequence;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double accuracyM;
  @override
  final DateTime recordedAt;
  // Diagnostic only — never read for any accept/reject/enforcement
  // decision anywhere in this feature. See spec §6.
  @override
  final double? altitudeM;
  @override
  final double? verticalAccuracyM;
  @override
  final String? floorLabel;
  @override
  final double? speedMps;
  @override
  final double? headingDeg;
  @override
  final String? provider;
  @override
  final bool? isMock;
  @override
  @JsonKey()
  final MappingSampleSyncState syncState;
  @override
  @JsonKey()
  final int attemptCount;
  @override
  final DateTime? lastAttemptAt;
  @override
  final String? lastError;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MappingSample(localId: $localId, footprintId: $footprintId, clientSampleId: $clientSampleId, sequence: $sequence, latitude: $latitude, longitude: $longitude, accuracyM: $accuracyM, recordedAt: $recordedAt, altitudeM: $altitudeM, verticalAccuracyM: $verticalAccuracyM, floorLabel: $floorLabel, speedMps: $speedMps, headingDeg: $headingDeg, provider: $provider, isMock: $isMock, syncState: $syncState, attemptCount: $attemptCount, lastAttemptAt: $lastAttemptAt, lastError: $lastError, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MappingSampleImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.footprintId, footprintId) ||
                other.footprintId == footprintId) &&
            (identical(other.clientSampleId, clientSampleId) ||
                other.clientSampleId == clientSampleId) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.accuracyM, accuracyM) ||
                other.accuracyM == accuracyM) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.altitudeM, altitudeM) ||
                other.altitudeM == altitudeM) &&
            (identical(other.verticalAccuracyM, verticalAccuracyM) ||
                other.verticalAccuracyM == verticalAccuracyM) &&
            (identical(other.floorLabel, floorLabel) ||
                other.floorLabel == floorLabel) &&
            (identical(other.speedMps, speedMps) ||
                other.speedMps == speedMps) &&
            (identical(other.headingDeg, headingDeg) ||
                other.headingDeg == headingDeg) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.isMock, isMock) || other.isMock == isMock) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState) &&
            (identical(other.attemptCount, attemptCount) ||
                other.attemptCount == attemptCount) &&
            (identical(other.lastAttemptAt, lastAttemptAt) ||
                other.lastAttemptAt == lastAttemptAt) &&
            (identical(other.lastError, lastError) ||
                other.lastError == lastError) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    localId,
    footprintId,
    clientSampleId,
    sequence,
    latitude,
    longitude,
    accuracyM,
    recordedAt,
    altitudeM,
    verticalAccuracyM,
    floorLabel,
    speedMps,
    headingDeg,
    provider,
    isMock,
    syncState,
    attemptCount,
    lastAttemptAt,
    lastError,
    createdAt,
  ]);

  /// Create a copy of MappingSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MappingSampleImplCopyWith<_$MappingSampleImpl> get copyWith =>
      __$$MappingSampleImplCopyWithImpl<_$MappingSampleImpl>(this, _$identity);
}

abstract class _MappingSample implements MappingSample {
  const factory _MappingSample({
    required final String localId,
    required final int footprintId,
    required final String clientSampleId,
    required final int sequence,
    required final double latitude,
    required final double longitude,
    required final double accuracyM,
    required final DateTime recordedAt,
    final double? altitudeM,
    final double? verticalAccuracyM,
    final String? floorLabel,
    final double? speedMps,
    final double? headingDeg,
    final String? provider,
    final bool? isMock,
    final MappingSampleSyncState syncState,
    final int attemptCount,
    final DateTime? lastAttemptAt,
    final String? lastError,
    required final DateTime createdAt,
  }) = _$MappingSampleImpl;

  /// Local UUID — Isar row identity, distinct from [clientSampleId].
  @override
  String get localId;
  @override
  int get footprintId;

  /// Immutable once generated (spec §11/§23) — the backend dedup key,
  /// together with footprintId. Never regenerated on retry.
  @override
  String get clientSampleId;

  /// Monotonic within a footprint (spec §24) — tie-breaker for equal
  /// `recorded_at`.
  @override
  int get sequence;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get accuracyM;
  @override
  DateTime get recordedAt; // Diagnostic only — never read for any accept/reject/enforcement
  // decision anywhere in this feature. See spec §6.
  @override
  double? get altitudeM;
  @override
  double? get verticalAccuracyM;
  @override
  String? get floorLabel;
  @override
  double? get speedMps;
  @override
  double? get headingDeg;
  @override
  String? get provider;
  @override
  bool? get isMock;
  @override
  MappingSampleSyncState get syncState;
  @override
  int get attemptCount;
  @override
  DateTime? get lastAttemptAt;
  @override
  String? get lastError;
  @override
  DateTime get createdAt;

  /// Create a copy of MappingSample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MappingSampleImplCopyWith<_$MappingSampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
