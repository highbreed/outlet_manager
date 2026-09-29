// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemGroup {

 int get id; String get code; String get name; bool get isActive; DateTime? get syncedAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ItemGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemGroupCopyWith<ItemGroup> get copyWith => _$ItemGroupCopyWithImpl<ItemGroup>(this as ItemGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.syncedAt, syncedAt) || other.syncedAt == syncedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,code,name,isActive,syncedAt,createdAt,updatedAt);

@override
String toString() {
  return 'ItemGroup(id: $id, code: $code, name: $name, isActive: $isActive, syncedAt: $syncedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ItemGroupCopyWith<$Res>  {
  factory $ItemGroupCopyWith(ItemGroup value, $Res Function(ItemGroup) _then) = _$ItemGroupCopyWithImpl;
@useResult
$Res call({
 int id, String code, String name, bool isActive, DateTime? syncedAt, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ItemGroupCopyWithImpl<$Res>
    implements $ItemGroupCopyWith<$Res> {
  _$ItemGroupCopyWithImpl(this._self, this._then);

  final ItemGroup _self;
  final $Res Function(ItemGroup) _then;

/// Create a copy of ItemGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? isActive = null,Object? syncedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,syncedAt: freezed == syncedAt ? _self.syncedAt : syncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemGroup].
extension ItemGroupPatterns on ItemGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemGroup value)  $default,){
final _that = this;
switch (_that) {
case _ItemGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemGroup value)?  $default,){
final _that = this;
switch (_that) {
case _ItemGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String name,  bool isActive,  DateTime? syncedAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemGroup() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.isActive,_that.syncedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String name,  bool isActive,  DateTime? syncedAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ItemGroup():
return $default(_that.id,_that.code,_that.name,_that.isActive,_that.syncedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String name,  bool isActive,  DateTime? syncedAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ItemGroup() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.isActive,_that.syncedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ItemGroup extends ItemGroup {
  const _ItemGroup({required this.id, required this.code, required this.name, required this.isActive, this.syncedAt, this.createdAt, this.updatedAt}): super._();
  

@override final  int id;
@override final  String code;
@override final  String name;
@override final  bool isActive;
@override final  DateTime? syncedAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ItemGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemGroupCopyWith<_ItemGroup> get copyWith => __$ItemGroupCopyWithImpl<_ItemGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.syncedAt, syncedAt) || other.syncedAt == syncedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,code,name,isActive,syncedAt,createdAt,updatedAt);

@override
String toString() {
  return 'ItemGroup(id: $id, code: $code, name: $name, isActive: $isActive, syncedAt: $syncedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ItemGroupCopyWith<$Res> implements $ItemGroupCopyWith<$Res> {
  factory _$ItemGroupCopyWith(_ItemGroup value, $Res Function(_ItemGroup) _then) = __$ItemGroupCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String name, bool isActive, DateTime? syncedAt, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ItemGroupCopyWithImpl<$Res>
    implements _$ItemGroupCopyWith<$Res> {
  __$ItemGroupCopyWithImpl(this._self, this._then);

  final _ItemGroup _self;
  final $Res Function(_ItemGroup) _then;

/// Create a copy of ItemGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? isActive = null,Object? syncedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ItemGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,syncedAt: freezed == syncedAt ? _self.syncedAt : syncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
