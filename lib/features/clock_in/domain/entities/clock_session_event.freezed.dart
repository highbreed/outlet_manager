// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_session_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClockSessionEvent _$ClockSessionEventFromJson(Map<String, dynamic> json) {
  return _ClockSessionEvent.fromJson(json);
}

/// @nodoc
mixin _$ClockSessionEvent {
  String get id => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  ClockSessionEventType get type => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get accuracy => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this ClockSessionEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClockSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClockSessionEventCopyWith<ClockSessionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClockSessionEventCopyWith<$Res> {
  factory $ClockSessionEventCopyWith(
    ClockSessionEvent value,
    $Res Function(ClockSessionEvent) then,
  ) = _$ClockSessionEventCopyWithImpl<$Res, ClockSessionEvent>;
  @useResult
  $Res call({
    String id,
    String sessionId,
    ClockSessionEventType type,
    double latitude,
    double longitude,
    double accuracy,
    DateTime timestamp,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$ClockSessionEventCopyWithImpl<$Res, $Val extends ClockSessionEvent>
    implements $ClockSessionEventCopyWith<$Res> {
  _$ClockSessionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClockSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? type = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracy = null,
    Object? timestamp = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ClockSessionEventType,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            accuracy: null == accuracy
                ? _value.accuracy
                : accuracy // ignore: cast_nullable_to_non_nullable
                      as double,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClockSessionEventImplCopyWith<$Res>
    implements $ClockSessionEventCopyWith<$Res> {
  factory _$$ClockSessionEventImplCopyWith(
    _$ClockSessionEventImpl value,
    $Res Function(_$ClockSessionEventImpl) then,
  ) = __$$ClockSessionEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String sessionId,
    ClockSessionEventType type,
    double latitude,
    double longitude,
    double accuracy,
    DateTime timestamp,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$ClockSessionEventImplCopyWithImpl<$Res>
    extends _$ClockSessionEventCopyWithImpl<$Res, _$ClockSessionEventImpl>
    implements _$$ClockSessionEventImplCopyWith<$Res> {
  __$$ClockSessionEventImplCopyWithImpl(
    _$ClockSessionEventImpl _value,
    $Res Function(_$ClockSessionEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClockSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? type = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracy = null,
    Object? timestamp = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _$ClockSessionEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ClockSessionEventType,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        accuracy: null == accuracy
            ? _value.accuracy
            : accuracy // ignore: cast_nullable_to_non_nullable
                  as double,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClockSessionEventImpl implements _ClockSessionEvent {
  const _$ClockSessionEventImpl({
    required this.id,
    required this.sessionId,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.timestamp,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata;

  factory _$ClockSessionEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClockSessionEventImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionId;
  @override
  final ClockSessionEventType type;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double accuracy;
  @override
  final DateTime timestamp;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ClockSessionEvent(id: $id, sessionId: $sessionId, type: $type, latitude: $latitude, longitude: $longitude, accuracy: $accuracy, timestamp: $timestamp, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClockSessionEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sessionId,
    type,
    latitude,
    longitude,
    accuracy,
    timestamp,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of ClockSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClockSessionEventImplCopyWith<_$ClockSessionEventImpl> get copyWith =>
      __$$ClockSessionEventImplCopyWithImpl<_$ClockSessionEventImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClockSessionEventImplToJson(this);
  }
}

abstract class _ClockSessionEvent implements ClockSessionEvent {
  const factory _ClockSessionEvent({
    required final String id,
    required final String sessionId,
    required final ClockSessionEventType type,
    required final double latitude,
    required final double longitude,
    required final double accuracy,
    required final DateTime timestamp,
    final Map<String, dynamic>? metadata,
  }) = _$ClockSessionEventImpl;

  factory _ClockSessionEvent.fromJson(Map<String, dynamic> json) =
      _$ClockSessionEventImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionId;
  @override
  ClockSessionEventType get type;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get accuracy;
  @override
  DateTime get timestamp;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of ClockSessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClockSessionEventImplCopyWith<_$ClockSessionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
