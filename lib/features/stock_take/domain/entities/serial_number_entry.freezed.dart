// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'serial_number_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SerialNumberEntry {

 String get localId; int? get serverId; String get sessionLocalId; String get itemLocalId; String get serialNumberRaw; String get serialNumberNorm; String get deviceScanId; DateTime get deviceScannedAt; int? get scanSequence; SerialStatus get status; String? get validationError; DateTime get scannedAt;
/// Create a copy of SerialNumberEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SerialNumberEntryCopyWith<SerialNumberEntry> get copyWith => _$SerialNumberEntryCopyWithImpl<SerialNumberEntry>(this as SerialNumberEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SerialNumberEntry&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.sessionLocalId, sessionLocalId) || other.sessionLocalId == sessionLocalId)&&(identical(other.itemLocalId, itemLocalId) || other.itemLocalId == itemLocalId)&&(identical(other.serialNumberRaw, serialNumberRaw) || other.serialNumberRaw == serialNumberRaw)&&(identical(other.serialNumberNorm, serialNumberNorm) || other.serialNumberNorm == serialNumberNorm)&&(identical(other.deviceScanId, deviceScanId) || other.deviceScanId == deviceScanId)&&(identical(other.deviceScannedAt, deviceScannedAt) || other.deviceScannedAt == deviceScannedAt)&&(identical(other.scanSequence, scanSequence) || other.scanSequence == scanSequence)&&(identical(other.status, status) || other.status == status)&&(identical(other.validationError, validationError) || other.validationError == validationError)&&(identical(other.scannedAt, scannedAt) || other.scannedAt == scannedAt));
}


@override
int get hashCode => Object.hash(runtimeType,localId,serverId,sessionLocalId,itemLocalId,serialNumberRaw,serialNumberNorm,deviceScanId,deviceScannedAt,scanSequence,status,validationError,scannedAt);

@override
String toString() {
  return 'SerialNumberEntry(localId: $localId, serverId: $serverId, sessionLocalId: $sessionLocalId, itemLocalId: $itemLocalId, serialNumberRaw: $serialNumberRaw, serialNumberNorm: $serialNumberNorm, deviceScanId: $deviceScanId, deviceScannedAt: $deviceScannedAt, scanSequence: $scanSequence, status: $status, validationError: $validationError, scannedAt: $scannedAt)';
}


}

/// @nodoc
abstract mixin class $SerialNumberEntryCopyWith<$Res>  {
  factory $SerialNumberEntryCopyWith(SerialNumberEntry value, $Res Function(SerialNumberEntry) _then) = _$SerialNumberEntryCopyWithImpl;
@useResult
$Res call({
 String localId, int? serverId, String sessionLocalId, String itemLocalId, String serialNumberRaw, String serialNumberNorm, String deviceScanId, DateTime deviceScannedAt, int? scanSequence, SerialStatus status, String? validationError, DateTime scannedAt
});




}
/// @nodoc
class _$SerialNumberEntryCopyWithImpl<$Res>
    implements $SerialNumberEntryCopyWith<$Res> {
  _$SerialNumberEntryCopyWithImpl(this._self, this._then);

  final SerialNumberEntry _self;
  final $Res Function(SerialNumberEntry) _then;

/// Create a copy of SerialNumberEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? serverId = freezed,Object? sessionLocalId = null,Object? itemLocalId = null,Object? serialNumberRaw = null,Object? serialNumberNorm = null,Object? deviceScanId = null,Object? deviceScannedAt = null,Object? scanSequence = freezed,Object? status = null,Object? validationError = freezed,Object? scannedAt = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,sessionLocalId: null == sessionLocalId ? _self.sessionLocalId : sessionLocalId // ignore: cast_nullable_to_non_nullable
as String,itemLocalId: null == itemLocalId ? _self.itemLocalId : itemLocalId // ignore: cast_nullable_to_non_nullable
as String,serialNumberRaw: null == serialNumberRaw ? _self.serialNumberRaw : serialNumberRaw // ignore: cast_nullable_to_non_nullable
as String,serialNumberNorm: null == serialNumberNorm ? _self.serialNumberNorm : serialNumberNorm // ignore: cast_nullable_to_non_nullable
as String,deviceScanId: null == deviceScanId ? _self.deviceScanId : deviceScanId // ignore: cast_nullable_to_non_nullable
as String,deviceScannedAt: null == deviceScannedAt ? _self.deviceScannedAt : deviceScannedAt // ignore: cast_nullable_to_non_nullable
as DateTime,scanSequence: freezed == scanSequence ? _self.scanSequence : scanSequence // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SerialStatus,validationError: freezed == validationError ? _self.validationError : validationError // ignore: cast_nullable_to_non_nullable
as String?,scannedAt: null == scannedAt ? _self.scannedAt : scannedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SerialNumberEntry].
extension SerialNumberEntryPatterns on SerialNumberEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SerialNumberEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SerialNumberEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SerialNumberEntry value)  $default,){
final _that = this;
switch (_that) {
case _SerialNumberEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SerialNumberEntry value)?  $default,){
final _that = this;
switch (_that) {
case _SerialNumberEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  int? serverId,  String sessionLocalId,  String itemLocalId,  String serialNumberRaw,  String serialNumberNorm,  String deviceScanId,  DateTime deviceScannedAt,  int? scanSequence,  SerialStatus status,  String? validationError,  DateTime scannedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SerialNumberEntry() when $default != null:
return $default(_that.localId,_that.serverId,_that.sessionLocalId,_that.itemLocalId,_that.serialNumberRaw,_that.serialNumberNorm,_that.deviceScanId,_that.deviceScannedAt,_that.scanSequence,_that.status,_that.validationError,_that.scannedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  int? serverId,  String sessionLocalId,  String itemLocalId,  String serialNumberRaw,  String serialNumberNorm,  String deviceScanId,  DateTime deviceScannedAt,  int? scanSequence,  SerialStatus status,  String? validationError,  DateTime scannedAt)  $default,) {final _that = this;
switch (_that) {
case _SerialNumberEntry():
return $default(_that.localId,_that.serverId,_that.sessionLocalId,_that.itemLocalId,_that.serialNumberRaw,_that.serialNumberNorm,_that.deviceScanId,_that.deviceScannedAt,_that.scanSequence,_that.status,_that.validationError,_that.scannedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  int? serverId,  String sessionLocalId,  String itemLocalId,  String serialNumberRaw,  String serialNumberNorm,  String deviceScanId,  DateTime deviceScannedAt,  int? scanSequence,  SerialStatus status,  String? validationError,  DateTime scannedAt)?  $default,) {final _that = this;
switch (_that) {
case _SerialNumberEntry() when $default != null:
return $default(_that.localId,_that.serverId,_that.sessionLocalId,_that.itemLocalId,_that.serialNumberRaw,_that.serialNumberNorm,_that.deviceScanId,_that.deviceScannedAt,_that.scanSequence,_that.status,_that.validationError,_that.scannedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SerialNumberEntry extends SerialNumberEntry {
  const _SerialNumberEntry({required this.localId, this.serverId, required this.sessionLocalId, required this.itemLocalId, required this.serialNumberRaw, required this.serialNumberNorm, required this.deviceScanId, required this.deviceScannedAt, this.scanSequence, required this.status, this.validationError, required this.scannedAt}): super._();
  

@override final  String localId;
@override final  int? serverId;
@override final  String sessionLocalId;
@override final  String itemLocalId;
@override final  String serialNumberRaw;
@override final  String serialNumberNorm;
@override final  String deviceScanId;
@override final  DateTime deviceScannedAt;
@override final  int? scanSequence;
@override final  SerialStatus status;
@override final  String? validationError;
@override final  DateTime scannedAt;

/// Create a copy of SerialNumberEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SerialNumberEntryCopyWith<_SerialNumberEntry> get copyWith => __$SerialNumberEntryCopyWithImpl<_SerialNumberEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SerialNumberEntry&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.sessionLocalId, sessionLocalId) || other.sessionLocalId == sessionLocalId)&&(identical(other.itemLocalId, itemLocalId) || other.itemLocalId == itemLocalId)&&(identical(other.serialNumberRaw, serialNumberRaw) || other.serialNumberRaw == serialNumberRaw)&&(identical(other.serialNumberNorm, serialNumberNorm) || other.serialNumberNorm == serialNumberNorm)&&(identical(other.deviceScanId, deviceScanId) || other.deviceScanId == deviceScanId)&&(identical(other.deviceScannedAt, deviceScannedAt) || other.deviceScannedAt == deviceScannedAt)&&(identical(other.scanSequence, scanSequence) || other.scanSequence == scanSequence)&&(identical(other.status, status) || other.status == status)&&(identical(other.validationError, validationError) || other.validationError == validationError)&&(identical(other.scannedAt, scannedAt) || other.scannedAt == scannedAt));
}


@override
int get hashCode => Object.hash(runtimeType,localId,serverId,sessionLocalId,itemLocalId,serialNumberRaw,serialNumberNorm,deviceScanId,deviceScannedAt,scanSequence,status,validationError,scannedAt);

@override
String toString() {
  return 'SerialNumberEntry(localId: $localId, serverId: $serverId, sessionLocalId: $sessionLocalId, itemLocalId: $itemLocalId, serialNumberRaw: $serialNumberRaw, serialNumberNorm: $serialNumberNorm, deviceScanId: $deviceScanId, deviceScannedAt: $deviceScannedAt, scanSequence: $scanSequence, status: $status, validationError: $validationError, scannedAt: $scannedAt)';
}


}

/// @nodoc
abstract mixin class _$SerialNumberEntryCopyWith<$Res> implements $SerialNumberEntryCopyWith<$Res> {
  factory _$SerialNumberEntryCopyWith(_SerialNumberEntry value, $Res Function(_SerialNumberEntry) _then) = __$SerialNumberEntryCopyWithImpl;
@override @useResult
$Res call({
 String localId, int? serverId, String sessionLocalId, String itemLocalId, String serialNumberRaw, String serialNumberNorm, String deviceScanId, DateTime deviceScannedAt, int? scanSequence, SerialStatus status, String? validationError, DateTime scannedAt
});




}
/// @nodoc
class __$SerialNumberEntryCopyWithImpl<$Res>
    implements _$SerialNumberEntryCopyWith<$Res> {
  __$SerialNumberEntryCopyWithImpl(this._self, this._then);

  final _SerialNumberEntry _self;
  final $Res Function(_SerialNumberEntry) _then;

/// Create a copy of SerialNumberEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? serverId = freezed,Object? sessionLocalId = null,Object? itemLocalId = null,Object? serialNumberRaw = null,Object? serialNumberNorm = null,Object? deviceScanId = null,Object? deviceScannedAt = null,Object? scanSequence = freezed,Object? status = null,Object? validationError = freezed,Object? scannedAt = null,}) {
  return _then(_SerialNumberEntry(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,sessionLocalId: null == sessionLocalId ? _self.sessionLocalId : sessionLocalId // ignore: cast_nullable_to_non_nullable
as String,itemLocalId: null == itemLocalId ? _self.itemLocalId : itemLocalId // ignore: cast_nullable_to_non_nullable
as String,serialNumberRaw: null == serialNumberRaw ? _self.serialNumberRaw : serialNumberRaw // ignore: cast_nullable_to_non_nullable
as String,serialNumberNorm: null == serialNumberNorm ? _self.serialNumberNorm : serialNumberNorm // ignore: cast_nullable_to_non_nullable
as String,deviceScanId: null == deviceScanId ? _self.deviceScanId : deviceScanId // ignore: cast_nullable_to_non_nullable
as String,deviceScannedAt: null == deviceScannedAt ? _self.deviceScannedAt : deviceScannedAt // ignore: cast_nullable_to_non_nullable
as DateTime,scanSequence: freezed == scanSequence ? _self.scanSequence : scanSequence // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SerialStatus,validationError: freezed == validationError ? _self.validationError : validationError // ignore: cast_nullable_to_non_nullable
as String?,scannedAt: null == scannedAt ? _self.scannedAt : scannedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
