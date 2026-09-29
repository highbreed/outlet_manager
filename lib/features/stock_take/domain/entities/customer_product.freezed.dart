// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerProduct {

 int get id; int get customerId; int get brandId; String get brandName; String get itemCode; String get itemName; String? get itemDescription;/// Product barcode (EAN/UPC) for scanning
 String? get barcode;/// Product categorization
 String? get itemGroup; String? get modelNumber; String? get productStatus; int get approvalStatus;// Min/Max levels (uses effective values)
 int get minOnshelfQty; int get maxOnshelfQty; int get minBackstoreQty; int get maxBackstoreQty; bool get isActive;
/// Create a copy of CustomerProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductCopyWith<CustomerProduct> get copyWith => _$CustomerProductCopyWithImpl<CustomerProduct>(this as CustomerProduct, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemDescription, itemDescription) || other.itemDescription == itemDescription)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.itemGroup, itemGroup) || other.itemGroup == itemGroup)&&(identical(other.modelNumber, modelNumber) || other.modelNumber == modelNumber)&&(identical(other.productStatus, productStatus) || other.productStatus == productStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.minOnshelfQty, minOnshelfQty) || other.minOnshelfQty == minOnshelfQty)&&(identical(other.maxOnshelfQty, maxOnshelfQty) || other.maxOnshelfQty == maxOnshelfQty)&&(identical(other.minBackstoreQty, minBackstoreQty) || other.minBackstoreQty == minBackstoreQty)&&(identical(other.maxBackstoreQty, maxBackstoreQty) || other.maxBackstoreQty == maxBackstoreQty)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,customerId,brandId,brandName,itemCode,itemName,itemDescription,barcode,itemGroup,modelNumber,productStatus,approvalStatus,minOnshelfQty,maxOnshelfQty,minBackstoreQty,maxBackstoreQty,isActive);

@override
String toString() {
  return 'CustomerProduct(id: $id, customerId: $customerId, brandId: $brandId, brandName: $brandName, itemCode: $itemCode, itemName: $itemName, itemDescription: $itemDescription, barcode: $barcode, itemGroup: $itemGroup, modelNumber: $modelNumber, productStatus: $productStatus, approvalStatus: $approvalStatus, minOnshelfQty: $minOnshelfQty, maxOnshelfQty: $maxOnshelfQty, minBackstoreQty: $minBackstoreQty, maxBackstoreQty: $maxBackstoreQty, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $CustomerProductCopyWith<$Res>  {
  factory $CustomerProductCopyWith(CustomerProduct value, $Res Function(CustomerProduct) _then) = _$CustomerProductCopyWithImpl;
@useResult
$Res call({
 int id, int customerId, int brandId, String brandName, String itemCode, String itemName, String? itemDescription, String? barcode, String? itemGroup, String? modelNumber, String? productStatus, int approvalStatus, int minOnshelfQty, int maxOnshelfQty, int minBackstoreQty, int maxBackstoreQty, bool isActive
});




}
/// @nodoc
class _$CustomerProductCopyWithImpl<$Res>
    implements $CustomerProductCopyWith<$Res> {
  _$CustomerProductCopyWithImpl(this._self, this._then);

  final CustomerProduct _self;
  final $Res Function(CustomerProduct) _then;

/// Create a copy of CustomerProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? brandId = null,Object? brandName = null,Object? itemCode = null,Object? itemName = null,Object? itemDescription = freezed,Object? barcode = freezed,Object? itemGroup = freezed,Object? modelNumber = freezed,Object? productStatus = freezed,Object? approvalStatus = null,Object? minOnshelfQty = null,Object? maxOnshelfQty = null,Object? minBackstoreQty = null,Object? maxBackstoreQty = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemDescription: freezed == itemDescription ? _self.itemDescription : itemDescription // ignore: cast_nullable_to_non_nullable
as String?,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,itemGroup: freezed == itemGroup ? _self.itemGroup : itemGroup // ignore: cast_nullable_to_non_nullable
as String?,modelNumber: freezed == modelNumber ? _self.modelNumber : modelNumber // ignore: cast_nullable_to_non_nullable
as String?,productStatus: freezed == productStatus ? _self.productStatus : productStatus // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as int,minOnshelfQty: null == minOnshelfQty ? _self.minOnshelfQty : minOnshelfQty // ignore: cast_nullable_to_non_nullable
as int,maxOnshelfQty: null == maxOnshelfQty ? _self.maxOnshelfQty : maxOnshelfQty // ignore: cast_nullable_to_non_nullable
as int,minBackstoreQty: null == minBackstoreQty ? _self.minBackstoreQty : minBackstoreQty // ignore: cast_nullable_to_non_nullable
as int,maxBackstoreQty: null == maxBackstoreQty ? _self.maxBackstoreQty : maxBackstoreQty // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerProduct].
extension CustomerProductPatterns on CustomerProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerProduct value)  $default,){
final _that = this;
switch (_that) {
case _CustomerProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerProduct value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int customerId,  int brandId,  String brandName,  String itemCode,  String itemName,  String? itemDescription,  String? barcode,  String? itemGroup,  String? modelNumber,  String? productStatus,  int approvalStatus,  int minOnshelfQty,  int maxOnshelfQty,  int minBackstoreQty,  int maxBackstoreQty,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerProduct() when $default != null:
return $default(_that.id,_that.customerId,_that.brandId,_that.brandName,_that.itemCode,_that.itemName,_that.itemDescription,_that.barcode,_that.itemGroup,_that.modelNumber,_that.productStatus,_that.approvalStatus,_that.minOnshelfQty,_that.maxOnshelfQty,_that.minBackstoreQty,_that.maxBackstoreQty,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int customerId,  int brandId,  String brandName,  String itemCode,  String itemName,  String? itemDescription,  String? barcode,  String? itemGroup,  String? modelNumber,  String? productStatus,  int approvalStatus,  int minOnshelfQty,  int maxOnshelfQty,  int minBackstoreQty,  int maxBackstoreQty,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _CustomerProduct():
return $default(_that.id,_that.customerId,_that.brandId,_that.brandName,_that.itemCode,_that.itemName,_that.itemDescription,_that.barcode,_that.itemGroup,_that.modelNumber,_that.productStatus,_that.approvalStatus,_that.minOnshelfQty,_that.maxOnshelfQty,_that.minBackstoreQty,_that.maxBackstoreQty,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int customerId,  int brandId,  String brandName,  String itemCode,  String itemName,  String? itemDescription,  String? barcode,  String? itemGroup,  String? modelNumber,  String? productStatus,  int approvalStatus,  int minOnshelfQty,  int maxOnshelfQty,  int minBackstoreQty,  int maxBackstoreQty,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _CustomerProduct() when $default != null:
return $default(_that.id,_that.customerId,_that.brandId,_that.brandName,_that.itemCode,_that.itemName,_that.itemDescription,_that.barcode,_that.itemGroup,_that.modelNumber,_that.productStatus,_that.approvalStatus,_that.minOnshelfQty,_that.maxOnshelfQty,_that.minBackstoreQty,_that.maxBackstoreQty,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerProduct extends CustomerProduct {
  const _CustomerProduct({required this.id, required this.customerId, required this.brandId, required this.brandName, required this.itemCode, required this.itemName, this.itemDescription, this.barcode, this.itemGroup, this.modelNumber, this.productStatus, required this.approvalStatus, required this.minOnshelfQty, required this.maxOnshelfQty, required this.minBackstoreQty, required this.maxBackstoreQty, required this.isActive}): super._();
  

@override final  int id;
@override final  int customerId;
@override final  int brandId;
@override final  String brandName;
@override final  String itemCode;
@override final  String itemName;
@override final  String? itemDescription;
/// Product barcode (EAN/UPC) for scanning
@override final  String? barcode;
/// Product categorization
@override final  String? itemGroup;
@override final  String? modelNumber;
@override final  String? productStatus;
@override final  int approvalStatus;
// Min/Max levels (uses effective values)
@override final  int minOnshelfQty;
@override final  int maxOnshelfQty;
@override final  int minBackstoreQty;
@override final  int maxBackstoreQty;
@override final  bool isActive;

/// Create a copy of CustomerProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerProductCopyWith<_CustomerProduct> get copyWith => __$CustomerProductCopyWithImpl<_CustomerProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemDescription, itemDescription) || other.itemDescription == itemDescription)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.itemGroup, itemGroup) || other.itemGroup == itemGroup)&&(identical(other.modelNumber, modelNumber) || other.modelNumber == modelNumber)&&(identical(other.productStatus, productStatus) || other.productStatus == productStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.minOnshelfQty, minOnshelfQty) || other.minOnshelfQty == minOnshelfQty)&&(identical(other.maxOnshelfQty, maxOnshelfQty) || other.maxOnshelfQty == maxOnshelfQty)&&(identical(other.minBackstoreQty, minBackstoreQty) || other.minBackstoreQty == minBackstoreQty)&&(identical(other.maxBackstoreQty, maxBackstoreQty) || other.maxBackstoreQty == maxBackstoreQty)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,customerId,brandId,brandName,itemCode,itemName,itemDescription,barcode,itemGroup,modelNumber,productStatus,approvalStatus,minOnshelfQty,maxOnshelfQty,minBackstoreQty,maxBackstoreQty,isActive);

@override
String toString() {
  return 'CustomerProduct(id: $id, customerId: $customerId, brandId: $brandId, brandName: $brandName, itemCode: $itemCode, itemName: $itemName, itemDescription: $itemDescription, barcode: $barcode, itemGroup: $itemGroup, modelNumber: $modelNumber, productStatus: $productStatus, approvalStatus: $approvalStatus, minOnshelfQty: $minOnshelfQty, maxOnshelfQty: $maxOnshelfQty, minBackstoreQty: $minBackstoreQty, maxBackstoreQty: $maxBackstoreQty, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$CustomerProductCopyWith<$Res> implements $CustomerProductCopyWith<$Res> {
  factory _$CustomerProductCopyWith(_CustomerProduct value, $Res Function(_CustomerProduct) _then) = __$CustomerProductCopyWithImpl;
@override @useResult
$Res call({
 int id, int customerId, int brandId, String brandName, String itemCode, String itemName, String? itemDescription, String? barcode, String? itemGroup, String? modelNumber, String? productStatus, int approvalStatus, int minOnshelfQty, int maxOnshelfQty, int minBackstoreQty, int maxBackstoreQty, bool isActive
});




}
/// @nodoc
class __$CustomerProductCopyWithImpl<$Res>
    implements _$CustomerProductCopyWith<$Res> {
  __$CustomerProductCopyWithImpl(this._self, this._then);

  final _CustomerProduct _self;
  final $Res Function(_CustomerProduct) _then;

/// Create a copy of CustomerProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? brandId = null,Object? brandName = null,Object? itemCode = null,Object? itemName = null,Object? itemDescription = freezed,Object? barcode = freezed,Object? itemGroup = freezed,Object? modelNumber = freezed,Object? productStatus = freezed,Object? approvalStatus = null,Object? minOnshelfQty = null,Object? maxOnshelfQty = null,Object? minBackstoreQty = null,Object? maxBackstoreQty = null,Object? isActive = null,}) {
  return _then(_CustomerProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemDescription: freezed == itemDescription ? _self.itemDescription : itemDescription // ignore: cast_nullable_to_non_nullable
as String?,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,itemGroup: freezed == itemGroup ? _self.itemGroup : itemGroup // ignore: cast_nullable_to_non_nullable
as String?,modelNumber: freezed == modelNumber ? _self.modelNumber : modelNumber // ignore: cast_nullable_to_non_nullable
as String?,productStatus: freezed == productStatus ? _self.productStatus : productStatus // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as int,minOnshelfQty: null == minOnshelfQty ? _self.minOnshelfQty : minOnshelfQty // ignore: cast_nullable_to_non_nullable
as int,maxOnshelfQty: null == maxOnshelfQty ? _self.maxOnshelfQty : maxOnshelfQty // ignore: cast_nullable_to_non_nullable
as int,minBackstoreQty: null == minBackstoreQty ? _self.minBackstoreQty : minBackstoreQty // ignore: cast_nullable_to_non_nullable
as int,maxBackstoreQty: null == maxBackstoreQty ? _self.maxBackstoreQty : maxBackstoreQty // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
