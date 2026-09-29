// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_session_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClockSessionEvent {

 String get id; String get sessionId; ClockSessionEventType get type; double get latitude; double get longitude; double get accuracy; DateTime get timestamp; Map<String, dynamic>? get metadata;
/// Create a copy of ClockSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockSessionEventCopyWith<ClockSessionEvent> get copyWith => _$ClockSessionEventCopyWithImpl<ClockSessionEvent>(this as ClockSessionEvent, _$identity);

  /// Serializes this ClockSessionEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockSessionEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.type, type) || other.type == type)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,type,latitude,longitude,accuracy,timestamp,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ClockSessionEvent(id: $id, sessionId: $sessionId, type: $type, latitude: $latitude, longitude: $longitude, accuracy: $accuracy, timestamp: $timestamp, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ClockSessionEventCopyWith<$Res>  {
  factory $ClockSessionEventCopyWith(ClockSessionEvent value, $Res Function(ClockSessionEvent) _then) = _$ClockSessionEventCopyWithImpl;
@useResult
$Res call({
 String id, String sessionId, ClockSessionEventType type, double latitude, double longitude, double accuracy, DateTime timestamp, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$ClockSessionEventCopyWithImpl<$Res>
    implements $ClockSessionEventCopyWith<$Res> {
  _$ClockSessionEventCopyWithImpl(this._self, this._then);

  final ClockSessionEvent _self;
  final $Res Function(ClockSessionEvent) _then;

/// Create a copy of ClockSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = null,Object? type = null,Object? latitude = null,Object? longitude = null,Object? accuracy = null,Object? timestamp = null,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClockSessionEventType,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClockSessionEvent].
extension ClockSessionEventPatterns on ClockSessionEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockSessionEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockSessionEvent() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockSessionEvent value)  $default,){
final _that = this;
switch (_that) {
case _ClockSessionEvent():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockSessionEvent value)?  $default,){
final _that = this;
switch (_that) {
case _ClockSessionEvent() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sessionId,  ClockSessionEventType type,  double latitude,  double longitude,  double accuracy,  DateTime timestamp,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClockSessionEvent() when $default != null:
return $default(_that.id,_that.sessionId,_that.type,_that.latitude,_that.longitude,_that.accuracy,_that.timestamp,_that.metadata);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sessionId,  ClockSessionEventType type,  double latitude,  double longitude,  double accuracy,  DateTime timestamp,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _ClockSessionEvent():
return $default(_that.id,_that.sessionId,_that.type,_that.latitude,_that.longitude,_that.accuracy,_that.timestamp,_that.metadata);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sessionId,  ClockSessionEventType type,  double latitude,  double longitude,  double accuracy,  DateTime timestamp,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _ClockSessionEvent() when $default != null:
return $default(_that.id,_that.sessionId,_that.type,_that.latitude,_that.longitude,_that.accuracy,_that.timestamp,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClockSessionEvent implements ClockSessionEvent {
  const _ClockSessionEvent({required this.id, required this.sessionId, required this.type, required this.latitude, required this.longitude, required this.accuracy, required this.timestamp, final  Map<String, dynamic>? metadata}): _metadata = metadata;
  factory _ClockSessionEvent.fromJson(Map<String, dynamic> json) => _$ClockSessionEventFromJson(json);

@override final  String id;
@override final  String sessionId;
@override final  ClockSessionEventType type;
@override final  double latitude;
@override final  double longitude;
@override final  double accuracy;
@override final  DateTime timestamp;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ClockSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockSessionEventCopyWith<_ClockSessionEvent> get copyWith => __$ClockSessionEventCopyWithImpl<_ClockSessionEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClockSessionEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockSessionEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.type, type) || other.type == type)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,type,latitude,longitude,accuracy,timestamp,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ClockSessionEvent(id: $id, sessionId: $sessionId, type: $type, latitude: $latitude, longitude: $longitude, accuracy: $accuracy, timestamp: $timestamp, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ClockSessionEventCopyWith<$Res> implements $ClockSessionEventCopyWith<$Res> {
  factory _$ClockSessionEventCopyWith(_ClockSessionEvent value, $Res Function(_ClockSessionEvent) _then) = __$ClockSessionEventCopyWithImpl;
@override @useResult
$Res call({
 String id, String sessionId, ClockSessionEventType type, double latitude, double longitude, double accuracy, DateTime timestamp, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$ClockSessionEventCopyWithImpl<$Res>
    implements _$ClockSessionEventCopyWith<$Res> {
  __$ClockSessionEventCopyWithImpl(this._self, this._then);

  final _ClockSessionEvent _self;
  final $Res Function(_ClockSessionEvent) _then;

/// Create a copy of ClockSessionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = null,Object? type = null,Object? latitude = null,Object? longitude = null,Object? accuracy = null,Object? timestamp = null,Object? metadata = freezed,}) {
  return _then(_ClockSessionEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClockSessionEventType,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
