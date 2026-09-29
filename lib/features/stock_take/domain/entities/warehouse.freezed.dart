// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warehouse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Warehouse {

 int get id; String get warehouseName; String get warehouseCode; String? get sapWarehouseCode; WarehouseType get warehouseType; String? get location; bool get isActive;
/// Create a copy of Warehouse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarehouseCopyWith<Warehouse> get copyWith => _$WarehouseCopyWithImpl<Warehouse>(this as Warehouse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Warehouse&&(identical(other.id, id) || other.id == id)&&(identical(other.warehouseName, warehouseName) || other.warehouseName == warehouseName)&&(identical(other.warehouseCode, warehouseCode) || other.warehouseCode == warehouseCode)&&(identical(other.sapWarehouseCode, sapWarehouseCode) || other.sapWarehouseCode == sapWarehouseCode)&&(identical(other.warehouseType, warehouseType) || other.warehouseType == warehouseType)&&(identical(other.location, location) || other.location == location)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,warehouseName,warehouseCode,sapWarehouseCode,warehouseType,location,isActive);

@override
String toString() {
  return 'Warehouse(id: $id, warehouseName: $warehouseName, warehouseCode: $warehouseCode, sapWarehouseCode: $sapWarehouseCode, warehouseType: $warehouseType, location: $location, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $WarehouseCopyWith<$Res>  {
  factory $WarehouseCopyWith(Warehouse value, $Res Function(Warehouse) _then) = _$WarehouseCopyWithImpl;
@useResult
$Res call({
 int id, String warehouseName, String warehouseCode, String? sapWarehouseCode, WarehouseType warehouseType, String? location, bool isActive
});




}
/// @nodoc
class _$WarehouseCopyWithImpl<$Res>
    implements $WarehouseCopyWith<$Res> {
  _$WarehouseCopyWithImpl(this._self, this._then);

  final Warehouse _self;
  final $Res Function(Warehouse) _then;

/// Create a copy of Warehouse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? warehouseName = null,Object? warehouseCode = null,Object? sapWarehouseCode = freezed,Object? warehouseType = null,Object? location = freezed,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,warehouseName: null == warehouseName ? _self.warehouseName : warehouseName // ignore: cast_nullable_to_non_nullable
as String,warehouseCode: null == warehouseCode ? _self.warehouseCode : warehouseCode // ignore: cast_nullable_to_non_nullable
as String,sapWarehouseCode: freezed == sapWarehouseCode ? _self.sapWarehouseCode : sapWarehouseCode // ignore: cast_nullable_to_non_nullable
as String?,warehouseType: null == warehouseType ? _self.warehouseType : warehouseType // ignore: cast_nullable_to_non_nullable
as WarehouseType,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Warehouse].
extension WarehousePatterns on Warehouse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Warehouse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Warehouse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Warehouse value)  $default,){
final _that = this;
switch (_that) {
case _Warehouse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Warehouse value)?  $default,){
final _that = this;
switch (_that) {
case _Warehouse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String warehouseName,  String warehouseCode,  String? sapWarehouseCode,  WarehouseType warehouseType,  String? location,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Warehouse() when $default != null:
return $default(_that.id,_that.warehouseName,_that.warehouseCode,_that.sapWarehouseCode,_that.warehouseType,_that.location,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String warehouseName,  String warehouseCode,  String? sapWarehouseCode,  WarehouseType warehouseType,  String? location,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _Warehouse():
return $default(_that.id,_that.warehouseName,_that.warehouseCode,_that.sapWarehouseCode,_that.warehouseType,_that.location,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String warehouseName,  String warehouseCode,  String? sapWarehouseCode,  WarehouseType warehouseType,  String? location,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _Warehouse() when $default != null:
return $default(_that.id,_that.warehouseName,_that.warehouseCode,_that.sapWarehouseCode,_that.warehouseType,_that.location,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _Warehouse extends Warehouse {
  const _Warehouse({required this.id, required this.warehouseName, required this.warehouseCode, this.sapWarehouseCode, required this.warehouseType, this.location, required this.isActive}): super._();
  

@override final  int id;
@override final  String warehouseName;
@override final  String warehouseCode;
@override final  String? sapWarehouseCode;
@override final  WarehouseType warehouseType;
@override final  String? location;
@override final  bool isActive;

/// Create a copy of Warehouse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarehouseCopyWith<_Warehouse> get copyWith => __$WarehouseCopyWithImpl<_Warehouse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Warehouse&&(identical(other.id, id) || other.id == id)&&(identical(other.warehouseName, warehouseName) || other.warehouseName == warehouseName)&&(identical(other.warehouseCode, warehouseCode) || other.warehouseCode == warehouseCode)&&(identical(other.sapWarehouseCode, sapWarehouseCode) || other.sapWarehouseCode == sapWarehouseCode)&&(identical(other.warehouseType, warehouseType) || other.warehouseType == warehouseType)&&(identical(other.location, location) || other.location == location)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,warehouseName,warehouseCode,sapWarehouseCode,warehouseType,location,isActive);

@override
String toString() {
  return 'Warehouse(id: $id, warehouseName: $warehouseName, warehouseCode: $warehouseCode, sapWarehouseCode: $sapWarehouseCode, warehouseType: $warehouseType, location: $location, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$WarehouseCopyWith<$Res> implements $WarehouseCopyWith<$Res> {
  factory _$WarehouseCopyWith(_Warehouse value, $Res Function(_Warehouse) _then) = __$WarehouseCopyWithImpl;
@override @useResult
$Res call({
 int id, String warehouseName, String warehouseCode, String? sapWarehouseCode, WarehouseType warehouseType, String? location, bool isActive
});




}
/// @nodoc
class __$WarehouseCopyWithImpl<$Res>
    implements _$WarehouseCopyWith<$Res> {
  __$WarehouseCopyWithImpl(this._self, this._then);

  final _Warehouse _self;
  final $Res Function(_Warehouse) _then;

/// Create a copy of Warehouse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? warehouseName = null,Object? warehouseCode = null,Object? sapWarehouseCode = freezed,Object? warehouseType = null,Object? location = freezed,Object? isActive = null,}) {
  return _then(_Warehouse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,warehouseName: null == warehouseName ? _self.warehouseName : warehouseName // ignore: cast_nullable_to_non_nullable
as String,warehouseCode: null == warehouseCode ? _self.warehouseCode : warehouseCode // ignore: cast_nullable_to_non_nullable
as String,sapWarehouseCode: freezed == sapWarehouseCode ? _self.sapWarehouseCode : sapWarehouseCode // ignore: cast_nullable_to_non_nullable
as String?,warehouseType: null == warehouseType ? _self.warehouseType : warehouseType // ignore: cast_nullable_to_non_nullable
as WarehouseType,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
