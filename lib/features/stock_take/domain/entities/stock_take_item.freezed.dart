// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_take_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockTakeItem {

 String get localId; int? get serverId; String get sessionLocalId; int get customerProductId; int get brandId; String get brandName; String get itemCode; String get itemName; String? get itemDescription; String? get category; String? get modelNumber; int get serialCount; int get minStockLevel; int get maxStockLevel; ItemCountStatus get status; DateTime get startedAt; DateTime? get completedAt; DateTime get updatedAt;
/// Create a copy of StockTakeItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockTakeItemCopyWith<StockTakeItem> get copyWith => _$StockTakeItemCopyWithImpl<StockTakeItem>(this as StockTakeItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockTakeItem&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.sessionLocalId, sessionLocalId) || other.sessionLocalId == sessionLocalId)&&(identical(other.customerProductId, customerProductId) || other.customerProductId == customerProductId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemDescription, itemDescription) || other.itemDescription == itemDescription)&&(identical(other.category, category) || other.category == category)&&(identical(other.modelNumber, modelNumber) || other.modelNumber == modelNumber)&&(identical(other.serialCount, serialCount) || other.serialCount == serialCount)&&(identical(other.minStockLevel, minStockLevel) || other.minStockLevel == minStockLevel)&&(identical(other.maxStockLevel, maxStockLevel) || other.maxStockLevel == maxStockLevel)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,localId,serverId,sessionLocalId,customerProductId,brandId,brandName,itemCode,itemName,itemDescription,category,modelNumber,serialCount,minStockLevel,maxStockLevel,status,startedAt,completedAt,updatedAt);

@override
String toString() {
  return 'StockTakeItem(localId: $localId, serverId: $serverId, sessionLocalId: $sessionLocalId, customerProductId: $customerProductId, brandId: $brandId, brandName: $brandName, itemCode: $itemCode, itemName: $itemName, itemDescription: $itemDescription, category: $category, modelNumber: $modelNumber, serialCount: $serialCount, minStockLevel: $minStockLevel, maxStockLevel: $maxStockLevel, status: $status, startedAt: $startedAt, completedAt: $completedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $StockTakeItemCopyWith<$Res>  {
  factory $StockTakeItemCopyWith(StockTakeItem value, $Res Function(StockTakeItem) _then) = _$StockTakeItemCopyWithImpl;
@useResult
$Res call({
 String localId, int? serverId, String sessionLocalId, int customerProductId, int brandId, String brandName, String itemCode, String itemName, String? itemDescription, String? category, String? modelNumber, int serialCount, int minStockLevel, int maxStockLevel, ItemCountStatus status, DateTime startedAt, DateTime? completedAt, DateTime updatedAt
});




}
/// @nodoc
class _$StockTakeItemCopyWithImpl<$Res>
    implements $StockTakeItemCopyWith<$Res> {
  _$StockTakeItemCopyWithImpl(this._self, this._then);

  final StockTakeItem _self;
  final $Res Function(StockTakeItem) _then;

/// Create a copy of StockTakeItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? serverId = freezed,Object? sessionLocalId = null,Object? customerProductId = null,Object? brandId = null,Object? brandName = null,Object? itemCode = null,Object? itemName = null,Object? itemDescription = freezed,Object? category = freezed,Object? modelNumber = freezed,Object? serialCount = null,Object? minStockLevel = null,Object? maxStockLevel = null,Object? status = null,Object? startedAt = null,Object? completedAt = freezed,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,sessionLocalId: null == sessionLocalId ? _self.sessionLocalId : sessionLocalId // ignore: cast_nullable_to_non_nullable
as String,customerProductId: null == customerProductId ? _self.customerProductId : customerProductId // ignore: cast_nullable_to_non_nullable
as int,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemDescription: freezed == itemDescription ? _self.itemDescription : itemDescription // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,modelNumber: freezed == modelNumber ? _self.modelNumber : modelNumber // ignore: cast_nullable_to_non_nullable
as String?,serialCount: null == serialCount ? _self.serialCount : serialCount // ignore: cast_nullable_to_non_nullable
as int,minStockLevel: null == minStockLevel ? _self.minStockLevel : minStockLevel // ignore: cast_nullable_to_non_nullable
as int,maxStockLevel: null == maxStockLevel ? _self.maxStockLevel : maxStockLevel // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ItemCountStatus,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StockTakeItem].
extension StockTakeItemPatterns on StockTakeItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockTakeItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockTakeItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockTakeItem value)  $default,){
final _that = this;
switch (_that) {
case _StockTakeItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockTakeItem value)?  $default,){
final _that = this;
switch (_that) {
case _StockTakeItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  int? serverId,  String sessionLocalId,  int customerProductId,  int brandId,  String brandName,  String itemCode,  String itemName,  String? itemDescription,  String? category,  String? modelNumber,  int serialCount,  int minStockLevel,  int maxStockLevel,  ItemCountStatus status,  DateTime startedAt,  DateTime? completedAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockTakeItem() when $default != null:
return $default(_that.localId,_that.serverId,_that.sessionLocalId,_that.customerProductId,_that.brandId,_that.brandName,_that.itemCode,_that.itemName,_that.itemDescription,_that.category,_that.modelNumber,_that.serialCount,_that.minStockLevel,_that.maxStockLevel,_that.status,_that.startedAt,_that.completedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  int? serverId,  String sessionLocalId,  int customerProductId,  int brandId,  String brandName,  String itemCode,  String itemName,  String? itemDescription,  String? category,  String? modelNumber,  int serialCount,  int minStockLevel,  int maxStockLevel,  ItemCountStatus status,  DateTime startedAt,  DateTime? completedAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _StockTakeItem():
return $default(_that.localId,_that.serverId,_that.sessionLocalId,_that.customerProductId,_that.brandId,_that.brandName,_that.itemCode,_that.itemName,_that.itemDescription,_that.category,_that.modelNumber,_that.serialCount,_that.minStockLevel,_that.maxStockLevel,_that.status,_that.startedAt,_that.completedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  int? serverId,  String sessionLocalId,  int customerProductId,  int brandId,  String brandName,  String itemCode,  String itemName,  String? itemDescription,  String? category,  String? modelNumber,  int serialCount,  int minStockLevel,  int maxStockLevel,  ItemCountStatus status,  DateTime startedAt,  DateTime? completedAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _StockTakeItem() when $default != null:
return $default(_that.localId,_that.serverId,_that.sessionLocalId,_that.customerProductId,_that.brandId,_that.brandName,_that.itemCode,_that.itemName,_that.itemDescription,_that.category,_that.modelNumber,_that.serialCount,_that.minStockLevel,_that.maxStockLevel,_that.status,_that.startedAt,_that.completedAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _StockTakeItem extends StockTakeItem {
  const _StockTakeItem({required this.localId, this.serverId, required this.sessionLocalId, required this.customerProductId, required this.brandId, required this.brandName, required this.itemCode, required this.itemName, this.itemDescription, this.category, this.modelNumber, required this.serialCount, required this.minStockLevel, required this.maxStockLevel, required this.status, required this.startedAt, this.completedAt, required this.updatedAt}): super._();
  

@override final  String localId;
@override final  int? serverId;
@override final  String sessionLocalId;
@override final  int customerProductId;
@override final  int brandId;
@override final  String brandName;
@override final  String itemCode;
@override final  String itemName;
@override final  String? itemDescription;
@override final  String? category;
@override final  String? modelNumber;
@override final  int serialCount;
@override final  int minStockLevel;
@override final  int maxStockLevel;
@override final  ItemCountStatus status;
@override final  DateTime startedAt;
@override final  DateTime? completedAt;
@override final  DateTime updatedAt;

/// Create a copy of StockTakeItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockTakeItemCopyWith<_StockTakeItem> get copyWith => __$StockTakeItemCopyWithImpl<_StockTakeItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockTakeItem&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.sessionLocalId, sessionLocalId) || other.sessionLocalId == sessionLocalId)&&(identical(other.customerProductId, customerProductId) || other.customerProductId == customerProductId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemDescription, itemDescription) || other.itemDescription == itemDescription)&&(identical(other.category, category) || other.category == category)&&(identical(other.modelNumber, modelNumber) || other.modelNumber == modelNumber)&&(identical(other.serialCount, serialCount) || other.serialCount == serialCount)&&(identical(other.minStockLevel, minStockLevel) || other.minStockLevel == minStockLevel)&&(identical(other.maxStockLevel, maxStockLevel) || other.maxStockLevel == maxStockLevel)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,localId,serverId,sessionLocalId,customerProductId,brandId,brandName,itemCode,itemName,itemDescription,category,modelNumber,serialCount,minStockLevel,maxStockLevel,status,startedAt,completedAt,updatedAt);

@override
String toString() {
  return 'StockTakeItem(localId: $localId, serverId: $serverId, sessionLocalId: $sessionLocalId, customerProductId: $customerProductId, brandId: $brandId, brandName: $brandName, itemCode: $itemCode, itemName: $itemName, itemDescription: $itemDescription, category: $category, modelNumber: $modelNumber, serialCount: $serialCount, minStockLevel: $minStockLevel, maxStockLevel: $maxStockLevel, status: $status, startedAt: $startedAt, completedAt: $completedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$StockTakeItemCopyWith<$Res> implements $StockTakeItemCopyWith<$Res> {
  factory _$StockTakeItemCopyWith(_StockTakeItem value, $Res Function(_StockTakeItem) _then) = __$StockTakeItemCopyWithImpl;
@override @useResult
$Res call({
 String localId, int? serverId, String sessionLocalId, int customerProductId, int brandId, String brandName, String itemCode, String itemName, String? itemDescription, String? category, String? modelNumber, int serialCount, int minStockLevel, int maxStockLevel, ItemCountStatus status, DateTime startedAt, DateTime? completedAt, DateTime updatedAt
});




}
/// @nodoc
class __$StockTakeItemCopyWithImpl<$Res>
    implements _$StockTakeItemCopyWith<$Res> {
  __$StockTakeItemCopyWithImpl(this._self, this._then);

  final _StockTakeItem _self;
  final $Res Function(_StockTakeItem) _then;

/// Create a copy of StockTakeItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? serverId = freezed,Object? sessionLocalId = null,Object? customerProductId = null,Object? brandId = null,Object? brandName = null,Object? itemCode = null,Object? itemName = null,Object? itemDescription = freezed,Object? category = freezed,Object? modelNumber = freezed,Object? serialCount = null,Object? minStockLevel = null,Object? maxStockLevel = null,Object? status = null,Object? startedAt = null,Object? completedAt = freezed,Object? updatedAt = null,}) {
  return _then(_StockTakeItem(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,serverId: freezed == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as int?,sessionLocalId: null == sessionLocalId ? _self.sessionLocalId : sessionLocalId // ignore: cast_nullable_to_non_nullable
as String,customerProductId: null == customerProductId ? _self.customerProductId : customerProductId // ignore: cast_nullable_to_non_nullable
as int,brandId: null == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemDescription: freezed == itemDescription ? _self.itemDescription : itemDescription // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,modelNumber: freezed == modelNumber ? _self.modelNumber : modelNumber // ignore: cast_nullable_to_non_nullable
as String?,serialCount: null == serialCount ? _self.serialCount : serialCount // ignore: cast_nullable_to_non_nullable
as int,minStockLevel: null == minStockLevel ? _self.minStockLevel : minStockLevel // ignore: cast_nullable_to_non_nullable
as int,maxStockLevel: null == maxStockLevel ? _self.maxStockLevel : maxStockLevel // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ItemCountStatus,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
