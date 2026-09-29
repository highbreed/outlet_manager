// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_sale_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailySaleItem {

 int get id; int get dailySalesId; String get productCode; String get productName; int get quantity;/// Kept as returned by the API (decimal string, e.g. "15000.00").
/// Can be "0.00" if the catalogue entry has no price set.
 String get unitPrice; String get totalPrice; List<SaleSerialNumber> get serialNumbers; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of DailySaleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailySaleItemCopyWith<DailySaleItem> get copyWith => _$DailySaleItemCopyWithImpl<DailySaleItem>(this as DailySaleItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailySaleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.dailySalesId, dailySalesId) || other.dailySalesId == dailySalesId)&&(identical(other.productCode, productCode) || other.productCode == productCode)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&const DeepCollectionEquality().equals(other.serialNumbers, serialNumbers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,dailySalesId,productCode,productName,quantity,unitPrice,totalPrice,const DeepCollectionEquality().hash(serialNumbers),createdAt,updatedAt);

@override
String toString() {
  return 'DailySaleItem(id: $id, dailySalesId: $dailySalesId, productCode: $productCode, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, serialNumbers: $serialNumbers, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DailySaleItemCopyWith<$Res>  {
  factory $DailySaleItemCopyWith(DailySaleItem value, $Res Function(DailySaleItem) _then) = _$DailySaleItemCopyWithImpl;
@useResult
$Res call({
 int id, int dailySalesId, String productCode, String productName, int quantity, String unitPrice, String totalPrice, List<SaleSerialNumber> serialNumbers, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$DailySaleItemCopyWithImpl<$Res>
    implements $DailySaleItemCopyWith<$Res> {
  _$DailySaleItemCopyWithImpl(this._self, this._then);

  final DailySaleItem _self;
  final $Res Function(DailySaleItem) _then;

/// Create a copy of DailySaleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dailySalesId = null,Object? productCode = null,Object? productName = null,Object? quantity = null,Object? unitPrice = null,Object? totalPrice = null,Object? serialNumbers = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dailySalesId: null == dailySalesId ? _self.dailySalesId : dailySalesId // ignore: cast_nullable_to_non_nullable
as int,productCode: null == productCode ? _self.productCode : productCode // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as String,serialNumbers: null == serialNumbers ? _self.serialNumbers : serialNumbers // ignore: cast_nullable_to_non_nullable
as List<SaleSerialNumber>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailySaleItem].
extension DailySaleItemPatterns on DailySaleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailySaleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailySaleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailySaleItem value)  $default,){
final _that = this;
switch (_that) {
case _DailySaleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailySaleItem value)?  $default,){
final _that = this;
switch (_that) {
case _DailySaleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int dailySalesId,  String productCode,  String productName,  int quantity,  String unitPrice,  String totalPrice,  List<SaleSerialNumber> serialNumbers,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailySaleItem() when $default != null:
return $default(_that.id,_that.dailySalesId,_that.productCode,_that.productName,_that.quantity,_that.unitPrice,_that.totalPrice,_that.serialNumbers,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int dailySalesId,  String productCode,  String productName,  int quantity,  String unitPrice,  String totalPrice,  List<SaleSerialNumber> serialNumbers,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DailySaleItem():
return $default(_that.id,_that.dailySalesId,_that.productCode,_that.productName,_that.quantity,_that.unitPrice,_that.totalPrice,_that.serialNumbers,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int dailySalesId,  String productCode,  String productName,  int quantity,  String unitPrice,  String totalPrice,  List<SaleSerialNumber> serialNumbers,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DailySaleItem() when $default != null:
return $default(_that.id,_that.dailySalesId,_that.productCode,_that.productName,_that.quantity,_that.unitPrice,_that.totalPrice,_that.serialNumbers,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _DailySaleItem extends DailySaleItem {
  const _DailySaleItem({required this.id, required this.dailySalesId, required this.productCode, required this.productName, required this.quantity, required this.unitPrice, required this.totalPrice, final  List<SaleSerialNumber> serialNumbers = const <SaleSerialNumber>[], this.createdAt, this.updatedAt}): _serialNumbers = serialNumbers,super._();
  

@override final  int id;
@override final  int dailySalesId;
@override final  String productCode;
@override final  String productName;
@override final  int quantity;
/// Kept as returned by the API (decimal string, e.g. "15000.00").
/// Can be "0.00" if the catalogue entry has no price set.
@override final  String unitPrice;
@override final  String totalPrice;
 final  List<SaleSerialNumber> _serialNumbers;
@override@JsonKey() List<SaleSerialNumber> get serialNumbers {
  if (_serialNumbers is EqualUnmodifiableListView) return _serialNumbers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serialNumbers);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of DailySaleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailySaleItemCopyWith<_DailySaleItem> get copyWith => __$DailySaleItemCopyWithImpl<_DailySaleItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailySaleItem&&(identical(other.id, id) || other.id == id)&&(identical(other.dailySalesId, dailySalesId) || other.dailySalesId == dailySalesId)&&(identical(other.productCode, productCode) || other.productCode == productCode)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&const DeepCollectionEquality().equals(other._serialNumbers, _serialNumbers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,dailySalesId,productCode,productName,quantity,unitPrice,totalPrice,const DeepCollectionEquality().hash(_serialNumbers),createdAt,updatedAt);

@override
String toString() {
  return 'DailySaleItem(id: $id, dailySalesId: $dailySalesId, productCode: $productCode, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, serialNumbers: $serialNumbers, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DailySaleItemCopyWith<$Res> implements $DailySaleItemCopyWith<$Res> {
  factory _$DailySaleItemCopyWith(_DailySaleItem value, $Res Function(_DailySaleItem) _then) = __$DailySaleItemCopyWithImpl;
@override @useResult
$Res call({
 int id, int dailySalesId, String productCode, String productName, int quantity, String unitPrice, String totalPrice, List<SaleSerialNumber> serialNumbers, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$DailySaleItemCopyWithImpl<$Res>
    implements _$DailySaleItemCopyWith<$Res> {
  __$DailySaleItemCopyWithImpl(this._self, this._then);

  final _DailySaleItem _self;
  final $Res Function(_DailySaleItem) _then;

/// Create a copy of DailySaleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dailySalesId = null,Object? productCode = null,Object? productName = null,Object? quantity = null,Object? unitPrice = null,Object? totalPrice = null,Object? serialNumbers = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DailySaleItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dailySalesId: null == dailySalesId ? _self.dailySalesId : dailySalesId // ignore: cast_nullable_to_non_nullable
as int,productCode: null == productCode ? _self.productCode : productCode // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as String,serialNumbers: null == serialNumbers ? _self._serialNumbers : serialNumbers // ignore: cast_nullable_to_non_nullable
as List<SaleSerialNumber>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
