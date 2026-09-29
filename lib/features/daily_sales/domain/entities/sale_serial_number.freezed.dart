// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_serial_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaleSerialNumber {

 int get id; String get serialNumber;
/// Create a copy of SaleSerialNumber
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleSerialNumberCopyWith<SaleSerialNumber> get copyWith => _$SaleSerialNumberCopyWithImpl<SaleSerialNumber>(this as SaleSerialNumber, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleSerialNumber&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,serialNumber);

@override
String toString() {
  return 'SaleSerialNumber(id: $id, serialNumber: $serialNumber)';
}


}

/// @nodoc
abstract mixin class $SaleSerialNumberCopyWith<$Res>  {
  factory $SaleSerialNumberCopyWith(SaleSerialNumber value, $Res Function(SaleSerialNumber) _then) = _$SaleSerialNumberCopyWithImpl;
@useResult
$Res call({
 int id, String serialNumber
});




}
/// @nodoc
class _$SaleSerialNumberCopyWithImpl<$Res>
    implements $SaleSerialNumberCopyWith<$Res> {
  _$SaleSerialNumberCopyWithImpl(this._self, this._then);

  final SaleSerialNumber _self;
  final $Res Function(SaleSerialNumber) _then;

/// Create a copy of SaleSerialNumber
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serialNumber = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serialNumber: null == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleSerialNumber].
extension SaleSerialNumberPatterns on SaleSerialNumber {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleSerialNumber value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleSerialNumber() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleSerialNumber value)  $default,){
final _that = this;
switch (_that) {
case _SaleSerialNumber():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleSerialNumber value)?  $default,){
final _that = this;
switch (_that) {
case _SaleSerialNumber() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String serialNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleSerialNumber() when $default != null:
return $default(_that.id,_that.serialNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String serialNumber)  $default,) {final _that = this;
switch (_that) {
case _SaleSerialNumber():
return $default(_that.id,_that.serialNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String serialNumber)?  $default,) {final _that = this;
switch (_that) {
case _SaleSerialNumber() when $default != null:
return $default(_that.id,_that.serialNumber);case _:
  return null;

}
}

}

/// @nodoc


class _SaleSerialNumber implements SaleSerialNumber {
  const _SaleSerialNumber({required this.id, required this.serialNumber});
  

@override final  int id;
@override final  String serialNumber;

/// Create a copy of SaleSerialNumber
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleSerialNumberCopyWith<_SaleSerialNumber> get copyWith => __$SaleSerialNumberCopyWithImpl<_SaleSerialNumber>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleSerialNumber&&(identical(other.id, id) || other.id == id)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber));
}


@override
int get hashCode => Object.hash(runtimeType,id,serialNumber);

@override
String toString() {
  return 'SaleSerialNumber(id: $id, serialNumber: $serialNumber)';
}


}

/// @nodoc
abstract mixin class _$SaleSerialNumberCopyWith<$Res> implements $SaleSerialNumberCopyWith<$Res> {
  factory _$SaleSerialNumberCopyWith(_SaleSerialNumber value, $Res Function(_SaleSerialNumber) _then) = __$SaleSerialNumberCopyWithImpl;
@override @useResult
$Res call({
 int id, String serialNumber
});




}
/// @nodoc
class __$SaleSerialNumberCopyWithImpl<$Res>
    implements _$SaleSerialNumberCopyWith<$Res> {
  __$SaleSerialNumberCopyWithImpl(this._self, this._then);

  final _SaleSerialNumber _self;
  final $Res Function(_SaleSerialNumber) _then;

/// Create a copy of SaleSerialNumber
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serialNumber = null,}) {
  return _then(_SaleSerialNumber(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,serialNumber: null == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
