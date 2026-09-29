// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_sale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailySale {

 int get id; int get outletId; int get userId; String get customerName; String? get customerPhone;/// Kept as returned by the API (decimal string, e.g. "45000.00").
 String get totalAmount;/// Total unit count across all items (not line count).
 int get totalItems; DateTime get saleDate; DailySaleStatus get status; List<DailySaleItem> get items; DateTime? get createdAt; DateTime? get updatedAt;/// Server-side path to the uploaded proof-of-purchase file, present
/// once the sale has been confirmed with a photo attached.
 String? get proofOfPurchasePath;
/// Create a copy of DailySale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailySaleCopyWith<DailySale> get copyWith => _$DailySaleCopyWithImpl<DailySale>(this as DailySale, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailySale&&(identical(other.id, id) || other.id == id)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.saleDate, saleDate) || other.saleDate == saleDate)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.proofOfPurchasePath, proofOfPurchasePath) || other.proofOfPurchasePath == proofOfPurchasePath));
}


@override
int get hashCode => Object.hash(runtimeType,id,outletId,userId,customerName,customerPhone,totalAmount,totalItems,saleDate,status,const DeepCollectionEquality().hash(items),createdAt,updatedAt,proofOfPurchasePath);

@override
String toString() {
  return 'DailySale(id: $id, outletId: $outletId, userId: $userId, customerName: $customerName, customerPhone: $customerPhone, totalAmount: $totalAmount, totalItems: $totalItems, saleDate: $saleDate, status: $status, items: $items, createdAt: $createdAt, updatedAt: $updatedAt, proofOfPurchasePath: $proofOfPurchasePath)';
}


}

/// @nodoc
abstract mixin class $DailySaleCopyWith<$Res>  {
  factory $DailySaleCopyWith(DailySale value, $Res Function(DailySale) _then) = _$DailySaleCopyWithImpl;
@useResult
$Res call({
 int id, int outletId, int userId, String customerName, String? customerPhone, String totalAmount, int totalItems, DateTime saleDate, DailySaleStatus status, List<DailySaleItem> items, DateTime? createdAt, DateTime? updatedAt, String? proofOfPurchasePath
});




}
/// @nodoc
class _$DailySaleCopyWithImpl<$Res>
    implements $DailySaleCopyWith<$Res> {
  _$DailySaleCopyWithImpl(this._self, this._then);

  final DailySale _self;
  final $Res Function(DailySale) _then;

/// Create a copy of DailySale
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? outletId = null,Object? userId = null,Object? customerName = null,Object? customerPhone = freezed,Object? totalAmount = null,Object? totalItems = null,Object? saleDate = null,Object? status = null,Object? items = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? proofOfPurchasePath = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,saleDate: null == saleDate ? _self.saleDate : saleDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DailySaleStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<DailySaleItem>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,proofOfPurchasePath: freezed == proofOfPurchasePath ? _self.proofOfPurchasePath : proofOfPurchasePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailySale].
extension DailySalePatterns on DailySale {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailySale value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailySale() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailySale value)  $default,){
final _that = this;
switch (_that) {
case _DailySale():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailySale value)?  $default,){
final _that = this;
switch (_that) {
case _DailySale() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int outletId,  int userId,  String customerName,  String? customerPhone,  String totalAmount,  int totalItems,  DateTime saleDate,  DailySaleStatus status,  List<DailySaleItem> items,  DateTime? createdAt,  DateTime? updatedAt,  String? proofOfPurchasePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailySale() when $default != null:
return $default(_that.id,_that.outletId,_that.userId,_that.customerName,_that.customerPhone,_that.totalAmount,_that.totalItems,_that.saleDate,_that.status,_that.items,_that.createdAt,_that.updatedAt,_that.proofOfPurchasePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int outletId,  int userId,  String customerName,  String? customerPhone,  String totalAmount,  int totalItems,  DateTime saleDate,  DailySaleStatus status,  List<DailySaleItem> items,  DateTime? createdAt,  DateTime? updatedAt,  String? proofOfPurchasePath)  $default,) {final _that = this;
switch (_that) {
case _DailySale():
return $default(_that.id,_that.outletId,_that.userId,_that.customerName,_that.customerPhone,_that.totalAmount,_that.totalItems,_that.saleDate,_that.status,_that.items,_that.createdAt,_that.updatedAt,_that.proofOfPurchasePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int outletId,  int userId,  String customerName,  String? customerPhone,  String totalAmount,  int totalItems,  DateTime saleDate,  DailySaleStatus status,  List<DailySaleItem> items,  DateTime? createdAt,  DateTime? updatedAt,  String? proofOfPurchasePath)?  $default,) {final _that = this;
switch (_that) {
case _DailySale() when $default != null:
return $default(_that.id,_that.outletId,_that.userId,_that.customerName,_that.customerPhone,_that.totalAmount,_that.totalItems,_that.saleDate,_that.status,_that.items,_that.createdAt,_that.updatedAt,_that.proofOfPurchasePath);case _:
  return null;

}
}

}

/// @nodoc


class _DailySale extends DailySale {
  const _DailySale({required this.id, required this.outletId, required this.userId, required this.customerName, this.customerPhone, required this.totalAmount, required this.totalItems, required this.saleDate, required this.status, final  List<DailySaleItem> items = const <DailySaleItem>[], this.createdAt, this.updatedAt, this.proofOfPurchasePath}): _items = items,super._();
  

@override final  int id;
@override final  int outletId;
@override final  int userId;
@override final  String customerName;
@override final  String? customerPhone;
/// Kept as returned by the API (decimal string, e.g. "45000.00").
@override final  String totalAmount;
/// Total unit count across all items (not line count).
@override final  int totalItems;
@override final  DateTime saleDate;
@override final  DailySaleStatus status;
 final  List<DailySaleItem> _items;
@override@JsonKey() List<DailySaleItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
/// Server-side path to the uploaded proof-of-purchase file, present
/// once the sale has been confirmed with a photo attached.
@override final  String? proofOfPurchasePath;

/// Create a copy of DailySale
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailySaleCopyWith<_DailySale> get copyWith => __$DailySaleCopyWithImpl<_DailySale>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailySale&&(identical(other.id, id) || other.id == id)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.saleDate, saleDate) || other.saleDate == saleDate)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.proofOfPurchasePath, proofOfPurchasePath) || other.proofOfPurchasePath == proofOfPurchasePath));
}


@override
int get hashCode => Object.hash(runtimeType,id,outletId,userId,customerName,customerPhone,totalAmount,totalItems,saleDate,status,const DeepCollectionEquality().hash(_items),createdAt,updatedAt,proofOfPurchasePath);

@override
String toString() {
  return 'DailySale(id: $id, outletId: $outletId, userId: $userId, customerName: $customerName, customerPhone: $customerPhone, totalAmount: $totalAmount, totalItems: $totalItems, saleDate: $saleDate, status: $status, items: $items, createdAt: $createdAt, updatedAt: $updatedAt, proofOfPurchasePath: $proofOfPurchasePath)';
}


}

/// @nodoc
abstract mixin class _$DailySaleCopyWith<$Res> implements $DailySaleCopyWith<$Res> {
  factory _$DailySaleCopyWith(_DailySale value, $Res Function(_DailySale) _then) = __$DailySaleCopyWithImpl;
@override @useResult
$Res call({
 int id, int outletId, int userId, String customerName, String? customerPhone, String totalAmount, int totalItems, DateTime saleDate, DailySaleStatus status, List<DailySaleItem> items, DateTime? createdAt, DateTime? updatedAt, String? proofOfPurchasePath
});




}
/// @nodoc
class __$DailySaleCopyWithImpl<$Res>
    implements _$DailySaleCopyWith<$Res> {
  __$DailySaleCopyWithImpl(this._self, this._then);

  final _DailySale _self;
  final $Res Function(_DailySale) _then;

/// Create a copy of DailySale
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? outletId = null,Object? userId = null,Object? customerName = null,Object? customerPhone = freezed,Object? totalAmount = null,Object? totalItems = null,Object? saleDate = null,Object? status = null,Object? items = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? proofOfPurchasePath = freezed,}) {
  return _then(_DailySale(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,saleDate: null == saleDate ? _self.saleDate : saleDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DailySaleStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<DailySaleItem>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,proofOfPurchasePath: freezed == proofOfPurchasePath ? _self.proofOfPurchasePath : proofOfPurchasePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
