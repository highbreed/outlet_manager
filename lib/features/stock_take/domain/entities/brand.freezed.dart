// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Brand {

 int get id; String get name; String get code;
/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandCopyWith<Brand> get copyWith => _$BrandCopyWithImpl<Brand>(this as Brand, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Brand&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,code);

@override
String toString() {
  return 'Brand(id: $id, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $BrandCopyWith<$Res>  {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) _then) = _$BrandCopyWithImpl;
@useResult
$Res call({
 int id, String name, String code
});




}
/// @nodoc
class _$BrandCopyWithImpl<$Res>
    implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._self, this._then);

  final Brand _self;
  final $Res Function(Brand) _then;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Brand].
extension BrandPatterns on Brand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Brand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Brand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Brand value)  $default,){
final _that = this;
switch (_that) {
case _Brand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Brand value)?  $default,){
final _that = this;
switch (_that) {
case _Brand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Brand() when $default != null:
return $default(_that.id,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _Brand():
return $default(_that.id,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _Brand() when $default != null:
return $default(_that.id,_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc


class _Brand implements Brand {
  const _Brand({required this.id, required this.name, required this.code});
  

@override final  int id;
@override final  String name;
@override final  String code;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandCopyWith<_Brand> get copyWith => __$BrandCopyWithImpl<_Brand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Brand&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,code);

@override
String toString() {
  return 'Brand(id: $id, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$BrandCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$BrandCopyWith(_Brand value, $Res Function(_Brand) _then) = __$BrandCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String code
});




}
/// @nodoc
class __$BrandCopyWithImpl<$Res>
    implements _$BrandCopyWith<$Res> {
  __$BrandCopyWithImpl(this._self, this._then);

  final _Brand _self;
  final $Res Function(_Brand) _then;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,}) {
  return _then(_Brand(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AgentBrand {

 int get agentId; bool get isAllBrands; List<Brand> get brands;
/// Create a copy of AgentBrand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentBrandCopyWith<AgentBrand> get copyWith => _$AgentBrandCopyWithImpl<AgentBrand>(this as AgentBrand, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentBrand&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.isAllBrands, isAllBrands) || other.isAllBrands == isAllBrands)&&const DeepCollectionEquality().equals(other.brands, brands));
}


@override
int get hashCode => Object.hash(runtimeType,agentId,isAllBrands,const DeepCollectionEquality().hash(brands));

@override
String toString() {
  return 'AgentBrand(agentId: $agentId, isAllBrands: $isAllBrands, brands: $brands)';
}


}

/// @nodoc
abstract mixin class $AgentBrandCopyWith<$Res>  {
  factory $AgentBrandCopyWith(AgentBrand value, $Res Function(AgentBrand) _then) = _$AgentBrandCopyWithImpl;
@useResult
$Res call({
 int agentId, bool isAllBrands, List<Brand> brands
});




}
/// @nodoc
class _$AgentBrandCopyWithImpl<$Res>
    implements $AgentBrandCopyWith<$Res> {
  _$AgentBrandCopyWithImpl(this._self, this._then);

  final AgentBrand _self;
  final $Res Function(AgentBrand) _then;

/// Create a copy of AgentBrand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? agentId = null,Object? isAllBrands = null,Object? brands = null,}) {
  return _then(_self.copyWith(
agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as int,isAllBrands: null == isAllBrands ? _self.isAllBrands : isAllBrands // ignore: cast_nullable_to_non_nullable
as bool,brands: null == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as List<Brand>,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentBrand].
extension AgentBrandPatterns on AgentBrand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentBrand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentBrand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentBrand value)  $default,){
final _that = this;
switch (_that) {
case _AgentBrand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentBrand value)?  $default,){
final _that = this;
switch (_that) {
case _AgentBrand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int agentId,  bool isAllBrands,  List<Brand> brands)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentBrand() when $default != null:
return $default(_that.agentId,_that.isAllBrands,_that.brands);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int agentId,  bool isAllBrands,  List<Brand> brands)  $default,) {final _that = this;
switch (_that) {
case _AgentBrand():
return $default(_that.agentId,_that.isAllBrands,_that.brands);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int agentId,  bool isAllBrands,  List<Brand> brands)?  $default,) {final _that = this;
switch (_that) {
case _AgentBrand() when $default != null:
return $default(_that.agentId,_that.isAllBrands,_that.brands);case _:
  return null;

}
}

}

/// @nodoc


class _AgentBrand extends AgentBrand {
  const _AgentBrand({required this.agentId, required this.isAllBrands, required final  List<Brand> brands}): _brands = brands,super._();
  

@override final  int agentId;
@override final  bool isAllBrands;
 final  List<Brand> _brands;
@override List<Brand> get brands {
  if (_brands is EqualUnmodifiableListView) return _brands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brands);
}


/// Create a copy of AgentBrand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentBrandCopyWith<_AgentBrand> get copyWith => __$AgentBrandCopyWithImpl<_AgentBrand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentBrand&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.isAllBrands, isAllBrands) || other.isAllBrands == isAllBrands)&&const DeepCollectionEquality().equals(other._brands, _brands));
}


@override
int get hashCode => Object.hash(runtimeType,agentId,isAllBrands,const DeepCollectionEquality().hash(_brands));

@override
String toString() {
  return 'AgentBrand(agentId: $agentId, isAllBrands: $isAllBrands, brands: $brands)';
}


}

/// @nodoc
abstract mixin class _$AgentBrandCopyWith<$Res> implements $AgentBrandCopyWith<$Res> {
  factory _$AgentBrandCopyWith(_AgentBrand value, $Res Function(_AgentBrand) _then) = __$AgentBrandCopyWithImpl;
@override @useResult
$Res call({
 int agentId, bool isAllBrands, List<Brand> brands
});




}
/// @nodoc
class __$AgentBrandCopyWithImpl<$Res>
    implements _$AgentBrandCopyWith<$Res> {
  __$AgentBrandCopyWithImpl(this._self, this._then);

  final _AgentBrand _self;
  final $Res Function(_AgentBrand) _then;

/// Create a copy of AgentBrand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? agentId = null,Object? isAllBrands = null,Object? brands = null,}) {
  return _then(_AgentBrand(
agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as int,isAllBrands: null == isAllBrands ? _self.isAllBrands : isAllBrands // ignore: cast_nullable_to_non_nullable
as bool,brands: null == brands ? _self._brands : brands // ignore: cast_nullable_to_non_nullable
as List<Brand>,
  ));
}


}

/// @nodoc
mixin _$CustomerBrandAssignment {

 int? get customerId; String? get customerName; String? get customerCardCode; bool get isAllBrands; List<Brand> get brands;
/// Create a copy of CustomerBrandAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerBrandAssignmentCopyWith<CustomerBrandAssignment> get copyWith => _$CustomerBrandAssignmentCopyWithImpl<CustomerBrandAssignment>(this as CustomerBrandAssignment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerBrandAssignment&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerCardCode, customerCardCode) || other.customerCardCode == customerCardCode)&&(identical(other.isAllBrands, isAllBrands) || other.isAllBrands == isAllBrands)&&const DeepCollectionEquality().equals(other.brands, brands));
}


@override
int get hashCode => Object.hash(runtimeType,customerId,customerName,customerCardCode,isAllBrands,const DeepCollectionEquality().hash(brands));

@override
String toString() {
  return 'CustomerBrandAssignment(customerId: $customerId, customerName: $customerName, customerCardCode: $customerCardCode, isAllBrands: $isAllBrands, brands: $brands)';
}


}

/// @nodoc
abstract mixin class $CustomerBrandAssignmentCopyWith<$Res>  {
  factory $CustomerBrandAssignmentCopyWith(CustomerBrandAssignment value, $Res Function(CustomerBrandAssignment) _then) = _$CustomerBrandAssignmentCopyWithImpl;
@useResult
$Res call({
 int? customerId, String? customerName, String? customerCardCode, bool isAllBrands, List<Brand> brands
});




}
/// @nodoc
class _$CustomerBrandAssignmentCopyWithImpl<$Res>
    implements $CustomerBrandAssignmentCopyWith<$Res> {
  _$CustomerBrandAssignmentCopyWithImpl(this._self, this._then);

  final CustomerBrandAssignment _self;
  final $Res Function(CustomerBrandAssignment) _then;

/// Create a copy of CustomerBrandAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = freezed,Object? customerName = freezed,Object? customerCardCode = freezed,Object? isAllBrands = null,Object? brands = null,}) {
  return _then(_self.copyWith(
customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerCardCode: freezed == customerCardCode ? _self.customerCardCode : customerCardCode // ignore: cast_nullable_to_non_nullable
as String?,isAllBrands: null == isAllBrands ? _self.isAllBrands : isAllBrands // ignore: cast_nullable_to_non_nullable
as bool,brands: null == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as List<Brand>,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerBrandAssignment].
extension CustomerBrandAssignmentPatterns on CustomerBrandAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerBrandAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerBrandAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerBrandAssignment value)  $default,){
final _that = this;
switch (_that) {
case _CustomerBrandAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerBrandAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerBrandAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? customerId,  String? customerName,  String? customerCardCode,  bool isAllBrands,  List<Brand> brands)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerBrandAssignment() when $default != null:
return $default(_that.customerId,_that.customerName,_that.customerCardCode,_that.isAllBrands,_that.brands);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? customerId,  String? customerName,  String? customerCardCode,  bool isAllBrands,  List<Brand> brands)  $default,) {final _that = this;
switch (_that) {
case _CustomerBrandAssignment():
return $default(_that.customerId,_that.customerName,_that.customerCardCode,_that.isAllBrands,_that.brands);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? customerId,  String? customerName,  String? customerCardCode,  bool isAllBrands,  List<Brand> brands)?  $default,) {final _that = this;
switch (_that) {
case _CustomerBrandAssignment() when $default != null:
return $default(_that.customerId,_that.customerName,_that.customerCardCode,_that.isAllBrands,_that.brands);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerBrandAssignment extends CustomerBrandAssignment {
  const _CustomerBrandAssignment({this.customerId, this.customerName, this.customerCardCode, required this.isAllBrands, required final  List<Brand> brands}): _brands = brands,super._();
  

@override final  int? customerId;
@override final  String? customerName;
@override final  String? customerCardCode;
@override final  bool isAllBrands;
 final  List<Brand> _brands;
@override List<Brand> get brands {
  if (_brands is EqualUnmodifiableListView) return _brands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brands);
}


/// Create a copy of CustomerBrandAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerBrandAssignmentCopyWith<_CustomerBrandAssignment> get copyWith => __$CustomerBrandAssignmentCopyWithImpl<_CustomerBrandAssignment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerBrandAssignment&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerCardCode, customerCardCode) || other.customerCardCode == customerCardCode)&&(identical(other.isAllBrands, isAllBrands) || other.isAllBrands == isAllBrands)&&const DeepCollectionEquality().equals(other._brands, _brands));
}


@override
int get hashCode => Object.hash(runtimeType,customerId,customerName,customerCardCode,isAllBrands,const DeepCollectionEquality().hash(_brands));

@override
String toString() {
  return 'CustomerBrandAssignment(customerId: $customerId, customerName: $customerName, customerCardCode: $customerCardCode, isAllBrands: $isAllBrands, brands: $brands)';
}


}

/// @nodoc
abstract mixin class _$CustomerBrandAssignmentCopyWith<$Res> implements $CustomerBrandAssignmentCopyWith<$Res> {
  factory _$CustomerBrandAssignmentCopyWith(_CustomerBrandAssignment value, $Res Function(_CustomerBrandAssignment) _then) = __$CustomerBrandAssignmentCopyWithImpl;
@override @useResult
$Res call({
 int? customerId, String? customerName, String? customerCardCode, bool isAllBrands, List<Brand> brands
});




}
/// @nodoc
class __$CustomerBrandAssignmentCopyWithImpl<$Res>
    implements _$CustomerBrandAssignmentCopyWith<$Res> {
  __$CustomerBrandAssignmentCopyWithImpl(this._self, this._then);

  final _CustomerBrandAssignment _self;
  final $Res Function(_CustomerBrandAssignment) _then;

/// Create a copy of CustomerBrandAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = freezed,Object? customerName = freezed,Object? customerCardCode = freezed,Object? isAllBrands = null,Object? brands = null,}) {
  return _then(_CustomerBrandAssignment(
customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerCardCode: freezed == customerCardCode ? _self.customerCardCode : customerCardCode // ignore: cast_nullable_to_non_nullable
as String?,isAllBrands: null == isAllBrands ? _self.isAllBrands : isAllBrands // ignore: cast_nullable_to_non_nullable
as bool,brands: null == brands ? _self._brands : brands // ignore: cast_nullable_to_non_nullable
as List<Brand>,
  ));
}


}

/// @nodoc
mixin _$AgentCustomerBrands {

 int get agentId; String get agentName; bool get hasGlobalAllBrands; List<CustomerBrandAssignment> get customerAssignments;
/// Create a copy of AgentCustomerBrands
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgentCustomerBrandsCopyWith<AgentCustomerBrands> get copyWith => _$AgentCustomerBrandsCopyWithImpl<AgentCustomerBrands>(this as AgentCustomerBrands, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgentCustomerBrands&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.agentName, agentName) || other.agentName == agentName)&&(identical(other.hasGlobalAllBrands, hasGlobalAllBrands) || other.hasGlobalAllBrands == hasGlobalAllBrands)&&const DeepCollectionEquality().equals(other.customerAssignments, customerAssignments));
}


@override
int get hashCode => Object.hash(runtimeType,agentId,agentName,hasGlobalAllBrands,const DeepCollectionEquality().hash(customerAssignments));

@override
String toString() {
  return 'AgentCustomerBrands(agentId: $agentId, agentName: $agentName, hasGlobalAllBrands: $hasGlobalAllBrands, customerAssignments: $customerAssignments)';
}


}

/// @nodoc
abstract mixin class $AgentCustomerBrandsCopyWith<$Res>  {
  factory $AgentCustomerBrandsCopyWith(AgentCustomerBrands value, $Res Function(AgentCustomerBrands) _then) = _$AgentCustomerBrandsCopyWithImpl;
@useResult
$Res call({
 int agentId, String agentName, bool hasGlobalAllBrands, List<CustomerBrandAssignment> customerAssignments
});




}
/// @nodoc
class _$AgentCustomerBrandsCopyWithImpl<$Res>
    implements $AgentCustomerBrandsCopyWith<$Res> {
  _$AgentCustomerBrandsCopyWithImpl(this._self, this._then);

  final AgentCustomerBrands _self;
  final $Res Function(AgentCustomerBrands) _then;

/// Create a copy of AgentCustomerBrands
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? agentId = null,Object? agentName = null,Object? hasGlobalAllBrands = null,Object? customerAssignments = null,}) {
  return _then(_self.copyWith(
agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as int,agentName: null == agentName ? _self.agentName : agentName // ignore: cast_nullable_to_non_nullable
as String,hasGlobalAllBrands: null == hasGlobalAllBrands ? _self.hasGlobalAllBrands : hasGlobalAllBrands // ignore: cast_nullable_to_non_nullable
as bool,customerAssignments: null == customerAssignments ? _self.customerAssignments : customerAssignments // ignore: cast_nullable_to_non_nullable
as List<CustomerBrandAssignment>,
  ));
}

}


/// Adds pattern-matching-related methods to [AgentCustomerBrands].
extension AgentCustomerBrandsPatterns on AgentCustomerBrands {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgentCustomerBrands value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgentCustomerBrands() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgentCustomerBrands value)  $default,){
final _that = this;
switch (_that) {
case _AgentCustomerBrands():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgentCustomerBrands value)?  $default,){
final _that = this;
switch (_that) {
case _AgentCustomerBrands() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int agentId,  String agentName,  bool hasGlobalAllBrands,  List<CustomerBrandAssignment> customerAssignments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgentCustomerBrands() when $default != null:
return $default(_that.agentId,_that.agentName,_that.hasGlobalAllBrands,_that.customerAssignments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int agentId,  String agentName,  bool hasGlobalAllBrands,  List<CustomerBrandAssignment> customerAssignments)  $default,) {final _that = this;
switch (_that) {
case _AgentCustomerBrands():
return $default(_that.agentId,_that.agentName,_that.hasGlobalAllBrands,_that.customerAssignments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int agentId,  String agentName,  bool hasGlobalAllBrands,  List<CustomerBrandAssignment> customerAssignments)?  $default,) {final _that = this;
switch (_that) {
case _AgentCustomerBrands() when $default != null:
return $default(_that.agentId,_that.agentName,_that.hasGlobalAllBrands,_that.customerAssignments);case _:
  return null;

}
}

}

/// @nodoc


class _AgentCustomerBrands extends AgentCustomerBrands {
  const _AgentCustomerBrands({required this.agentId, required this.agentName, required this.hasGlobalAllBrands, required final  List<CustomerBrandAssignment> customerAssignments}): _customerAssignments = customerAssignments,super._();
  

@override final  int agentId;
@override final  String agentName;
@override final  bool hasGlobalAllBrands;
 final  List<CustomerBrandAssignment> _customerAssignments;
@override List<CustomerBrandAssignment> get customerAssignments {
  if (_customerAssignments is EqualUnmodifiableListView) return _customerAssignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customerAssignments);
}


/// Create a copy of AgentCustomerBrands
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgentCustomerBrandsCopyWith<_AgentCustomerBrands> get copyWith => __$AgentCustomerBrandsCopyWithImpl<_AgentCustomerBrands>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgentCustomerBrands&&(identical(other.agentId, agentId) || other.agentId == agentId)&&(identical(other.agentName, agentName) || other.agentName == agentName)&&(identical(other.hasGlobalAllBrands, hasGlobalAllBrands) || other.hasGlobalAllBrands == hasGlobalAllBrands)&&const DeepCollectionEquality().equals(other._customerAssignments, _customerAssignments));
}


@override
int get hashCode => Object.hash(runtimeType,agentId,agentName,hasGlobalAllBrands,const DeepCollectionEquality().hash(_customerAssignments));

@override
String toString() {
  return 'AgentCustomerBrands(agentId: $agentId, agentName: $agentName, hasGlobalAllBrands: $hasGlobalAllBrands, customerAssignments: $customerAssignments)';
}


}

/// @nodoc
abstract mixin class _$AgentCustomerBrandsCopyWith<$Res> implements $AgentCustomerBrandsCopyWith<$Res> {
  factory _$AgentCustomerBrandsCopyWith(_AgentCustomerBrands value, $Res Function(_AgentCustomerBrands) _then) = __$AgentCustomerBrandsCopyWithImpl;
@override @useResult
$Res call({
 int agentId, String agentName, bool hasGlobalAllBrands, List<CustomerBrandAssignment> customerAssignments
});




}
/// @nodoc
class __$AgentCustomerBrandsCopyWithImpl<$Res>
    implements _$AgentCustomerBrandsCopyWith<$Res> {
  __$AgentCustomerBrandsCopyWithImpl(this._self, this._then);

  final _AgentCustomerBrands _self;
  final $Res Function(_AgentCustomerBrands) _then;

/// Create a copy of AgentCustomerBrands
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? agentId = null,Object? agentName = null,Object? hasGlobalAllBrands = null,Object? customerAssignments = null,}) {
  return _then(_AgentCustomerBrands(
agentId: null == agentId ? _self.agentId : agentId // ignore: cast_nullable_to_non_nullable
as int,agentName: null == agentName ? _self.agentName : agentName // ignore: cast_nullable_to_non_nullable
as String,hasGlobalAllBrands: null == hasGlobalAllBrands ? _self.hasGlobalAllBrands : hasGlobalAllBrands // ignore: cast_nullable_to_non_nullable
as bool,customerAssignments: null == customerAssignments ? _self._customerAssignments : customerAssignments // ignore: cast_nullable_to_non_nullable
as List<CustomerBrandAssignment>,
  ));
}


}

// dart format on
