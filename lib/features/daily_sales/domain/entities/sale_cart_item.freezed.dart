// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaleCartItem {

 String get barcode; String get productCode; String get productName; String? get modelNumber; int get quantity; double? get estimatedUnitPrice;
/// Create a copy of SaleCartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleCartItemCopyWith<SaleCartItem> get copyWith => _$SaleCartItemCopyWithImpl<SaleCartItem>(this as SaleCartItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleCartItem&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.productCode, productCode) || other.productCode == productCode)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.modelNumber, modelNumber) || other.modelNumber == modelNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.estimatedUnitPrice, estimatedUnitPrice) || other.estimatedUnitPrice == estimatedUnitPrice));
}


@override
int get hashCode => Object.hash(runtimeType,barcode,productCode,productName,modelNumber,quantity,estimatedUnitPrice);

@override
String toString() {
  return 'SaleCartItem(barcode: $barcode, productCode: $productCode, productName: $productName, modelNumber: $modelNumber, quantity: $quantity, estimatedUnitPrice: $estimatedUnitPrice)';
}


}

/// @nodoc
abstract mixin class $SaleCartItemCopyWith<$Res>  {
  factory $SaleCartItemCopyWith(SaleCartItem value, $Res Function(SaleCartItem) _then) = _$SaleCartItemCopyWithImpl;
@useResult
$Res call({
 String barcode, String productCode, String productName, String? modelNumber, int quantity, double? estimatedUnitPrice
});




}
/// @nodoc
class _$SaleCartItemCopyWithImpl<$Res>
    implements $SaleCartItemCopyWith<$Res> {
  _$SaleCartItemCopyWithImpl(this._self, this._then);

  final SaleCartItem _self;
  final $Res Function(SaleCartItem) _then;

/// Create a copy of SaleCartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? barcode = null,Object? productCode = null,Object? productName = null,Object? modelNumber = freezed,Object? quantity = null,Object? estimatedUnitPrice = freezed,}) {
  return _then(_self.copyWith(
barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,productCode: null == productCode ? _self.productCode : productCode // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,modelNumber: freezed == modelNumber ? _self.modelNumber : modelNumber // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,estimatedUnitPrice: freezed == estimatedUnitPrice ? _self.estimatedUnitPrice : estimatedUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleCartItem].
extension SaleCartItemPatterns on SaleCartItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleCartItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleCartItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleCartItem value)  $default,){
final _that = this;
switch (_that) {
case _SaleCartItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleCartItem value)?  $default,){
final _that = this;
switch (_that) {
case _SaleCartItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String barcode,  String productCode,  String productName,  String? modelNumber,  int quantity,  double? estimatedUnitPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleCartItem() when $default != null:
return $default(_that.barcode,_that.productCode,_that.productName,_that.modelNumber,_that.quantity,_that.estimatedUnitPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String barcode,  String productCode,  String productName,  String? modelNumber,  int quantity,  double? estimatedUnitPrice)  $default,) {final _that = this;
switch (_that) {
case _SaleCartItem():
return $default(_that.barcode,_that.productCode,_that.productName,_that.modelNumber,_that.quantity,_that.estimatedUnitPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String barcode,  String productCode,  String productName,  String? modelNumber,  int quantity,  double? estimatedUnitPrice)?  $default,) {final _that = this;
switch (_that) {
case _SaleCartItem() when $default != null:
return $default(_that.barcode,_that.productCode,_that.productName,_that.modelNumber,_that.quantity,_that.estimatedUnitPrice);case _:
  return null;

}
}

}

/// @nodoc


class _SaleCartItem extends SaleCartItem {
  const _SaleCartItem({required this.barcode, required this.productCode, required this.productName, this.modelNumber, this.quantity = 1, this.estimatedUnitPrice}): super._();
  

@override final  String barcode;
@override final  String productCode;
@override final  String productName;
@override final  String? modelNumber;
@override@JsonKey() final  int quantity;
@override final  double? estimatedUnitPrice;

/// Create a copy of SaleCartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleCartItemCopyWith<_SaleCartItem> get copyWith => __$SaleCartItemCopyWithImpl<_SaleCartItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleCartItem&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.productCode, productCode) || other.productCode == productCode)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.modelNumber, modelNumber) || other.modelNumber == modelNumber)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.estimatedUnitPrice, estimatedUnitPrice) || other.estimatedUnitPrice == estimatedUnitPrice));
}


@override
int get hashCode => Object.hash(runtimeType,barcode,productCode,productName,modelNumber,quantity,estimatedUnitPrice);

@override
String toString() {
  return 'SaleCartItem(barcode: $barcode, productCode: $productCode, productName: $productName, modelNumber: $modelNumber, quantity: $quantity, estimatedUnitPrice: $estimatedUnitPrice)';
}


}

/// @nodoc
abstract mixin class _$SaleCartItemCopyWith<$Res> implements $SaleCartItemCopyWith<$Res> {
  factory _$SaleCartItemCopyWith(_SaleCartItem value, $Res Function(_SaleCartItem) _then) = __$SaleCartItemCopyWithImpl;
@override @useResult
$Res call({
 String barcode, String productCode, String productName, String? modelNumber, int quantity, double? estimatedUnitPrice
});




}
/// @nodoc
class __$SaleCartItemCopyWithImpl<$Res>
    implements _$SaleCartItemCopyWith<$Res> {
  __$SaleCartItemCopyWithImpl(this._self, this._then);

  final _SaleCartItem _self;
  final $Res Function(_SaleCartItem) _then;

/// Create a copy of SaleCartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? barcode = null,Object? productCode = null,Object? productName = null,Object? modelNumber = freezed,Object? quantity = null,Object? estimatedUnitPrice = freezed,}) {
  return _then(_SaleCartItem(
barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,productCode: null == productCode ? _self.productCode : productCode // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,modelNumber: freezed == modelNumber ? _self.modelNumber : modelNumber // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,estimatedUnitPrice: freezed == estimatedUnitPrice ? _self.estimatedUnitPrice : estimatedUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
