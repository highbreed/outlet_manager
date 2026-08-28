// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_take_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StockTakeItem {
  String get localId => throw _privateConstructorUsedError;
  int? get serverId => throw _privateConstructorUsedError;
  String get sessionLocalId => throw _privateConstructorUsedError;
  int get customerProductId => throw _privateConstructorUsedError;
  int get brandId => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;
  String get itemCode => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  String? get itemDescription => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get modelNumber => throw _privateConstructorUsedError;
  int get serialCount => throw _privateConstructorUsedError;
  int get minStockLevel => throw _privateConstructorUsedError;
  int get maxStockLevel => throw _privateConstructorUsedError;
  ItemCountStatus get status => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of StockTakeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockTakeItemCopyWith<StockTakeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockTakeItemCopyWith<$Res> {
  factory $StockTakeItemCopyWith(
    StockTakeItem value,
    $Res Function(StockTakeItem) then,
  ) = _$StockTakeItemCopyWithImpl<$Res, StockTakeItem>;
  @useResult
  $Res call({
    String localId,
    int? serverId,
    String sessionLocalId,
    int customerProductId,
    int brandId,
    String brandName,
    String itemCode,
    String itemName,
    String? itemDescription,
    String? category,
    String? modelNumber,
    int serialCount,
    int minStockLevel,
    int maxStockLevel,
    ItemCountStatus status,
    DateTime startedAt,
    DateTime? completedAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$StockTakeItemCopyWithImpl<$Res, $Val extends StockTakeItem>
    implements $StockTakeItemCopyWith<$Res> {
  _$StockTakeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockTakeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? sessionLocalId = null,
    Object? customerProductId = null,
    Object? brandId = null,
    Object? brandName = null,
    Object? itemCode = null,
    Object? itemName = null,
    Object? itemDescription = freezed,
    Object? category = freezed,
    Object? modelNumber = freezed,
    Object? serialCount = null,
    Object? minStockLevel = null,
    Object? maxStockLevel = null,
    Object? status = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            localId: null == localId
                ? _value.localId
                : localId // ignore: cast_nullable_to_non_nullable
                      as String,
            serverId: freezed == serverId
                ? _value.serverId
                : serverId // ignore: cast_nullable_to_non_nullable
                      as int?,
            sessionLocalId: null == sessionLocalId
                ? _value.sessionLocalId
                : sessionLocalId // ignore: cast_nullable_to_non_nullable
                      as String,
            customerProductId: null == customerProductId
                ? _value.customerProductId
                : customerProductId // ignore: cast_nullable_to_non_nullable
                      as int,
            brandId: null == brandId
                ? _value.brandId
                : brandId // ignore: cast_nullable_to_non_nullable
                      as int,
            brandName: null == brandName
                ? _value.brandName
                : brandName // ignore: cast_nullable_to_non_nullable
                      as String,
            itemCode: null == itemCode
                ? _value.itemCode
                : itemCode // ignore: cast_nullable_to_non_nullable
                      as String,
            itemName: null == itemName
                ? _value.itemName
                : itemName // ignore: cast_nullable_to_non_nullable
                      as String,
            itemDescription: freezed == itemDescription
                ? _value.itemDescription
                : itemDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            modelNumber: freezed == modelNumber
                ? _value.modelNumber
                : modelNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            serialCount: null == serialCount
                ? _value.serialCount
                : serialCount // ignore: cast_nullable_to_non_nullable
                      as int,
            minStockLevel: null == minStockLevel
                ? _value.minStockLevel
                : minStockLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            maxStockLevel: null == maxStockLevel
                ? _value.maxStockLevel
                : maxStockLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ItemCountStatus,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StockTakeItemImplCopyWith<$Res>
    implements $StockTakeItemCopyWith<$Res> {
  factory _$$StockTakeItemImplCopyWith(
    _$StockTakeItemImpl value,
    $Res Function(_$StockTakeItemImpl) then,
  ) = __$$StockTakeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String localId,
    int? serverId,
    String sessionLocalId,
    int customerProductId,
    int brandId,
    String brandName,
    String itemCode,
    String itemName,
    String? itemDescription,
    String? category,
    String? modelNumber,
    int serialCount,
    int minStockLevel,
    int maxStockLevel,
    ItemCountStatus status,
    DateTime startedAt,
    DateTime? completedAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$StockTakeItemImplCopyWithImpl<$Res>
    extends _$StockTakeItemCopyWithImpl<$Res, _$StockTakeItemImpl>
    implements _$$StockTakeItemImplCopyWith<$Res> {
  __$$StockTakeItemImplCopyWithImpl(
    _$StockTakeItemImpl _value,
    $Res Function(_$StockTakeItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockTakeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = null,
    Object? serverId = freezed,
    Object? sessionLocalId = null,
    Object? customerProductId = null,
    Object? brandId = null,
    Object? brandName = null,
    Object? itemCode = null,
    Object? itemName = null,
    Object? itemDescription = freezed,
    Object? category = freezed,
    Object? modelNumber = freezed,
    Object? serialCount = null,
    Object? minStockLevel = null,
    Object? maxStockLevel = null,
    Object? status = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? updatedAt = null,
  }) {
    return _then(
      _$StockTakeItemImpl(
        localId: null == localId
            ? _value.localId
            : localId // ignore: cast_nullable_to_non_nullable
                  as String,
        serverId: freezed == serverId
            ? _value.serverId
            : serverId // ignore: cast_nullable_to_non_nullable
                  as int?,
        sessionLocalId: null == sessionLocalId
            ? _value.sessionLocalId
            : sessionLocalId // ignore: cast_nullable_to_non_nullable
                  as String,
        customerProductId: null == customerProductId
            ? _value.customerProductId
            : customerProductId // ignore: cast_nullable_to_non_nullable
                  as int,
        brandId: null == brandId
            ? _value.brandId
            : brandId // ignore: cast_nullable_to_non_nullable
                  as int,
        brandName: null == brandName
            ? _value.brandName
            : brandName // ignore: cast_nullable_to_non_nullable
                  as String,
        itemCode: null == itemCode
            ? _value.itemCode
            : itemCode // ignore: cast_nullable_to_non_nullable
                  as String,
        itemName: null == itemName
            ? _value.itemName
            : itemName // ignore: cast_nullable_to_non_nullable
                  as String,
        itemDescription: freezed == itemDescription
            ? _value.itemDescription
            : itemDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        modelNumber: freezed == modelNumber
            ? _value.modelNumber
            : modelNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        serialCount: null == serialCount
            ? _value.serialCount
            : serialCount // ignore: cast_nullable_to_non_nullable
                  as int,
        minStockLevel: null == minStockLevel
            ? _value.minStockLevel
            : minStockLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        maxStockLevel: null == maxStockLevel
            ? _value.maxStockLevel
            : maxStockLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ItemCountStatus,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$StockTakeItemImpl extends _StockTakeItem {
  const _$StockTakeItemImpl({
    required this.localId,
    this.serverId,
    required this.sessionLocalId,
    required this.customerProductId,
    required this.brandId,
    required this.brandName,
    required this.itemCode,
    required this.itemName,
    this.itemDescription,
    this.category,
    this.modelNumber,
    required this.serialCount,
    required this.minStockLevel,
    required this.maxStockLevel,
    required this.status,
    required this.startedAt,
    this.completedAt,
    required this.updatedAt,
  }) : super._();

  @override
  final String localId;
  @override
  final int? serverId;
  @override
  final String sessionLocalId;
  @override
  final int customerProductId;
  @override
  final int brandId;
  @override
  final String brandName;
  @override
  final String itemCode;
  @override
  final String itemName;
  @override
  final String? itemDescription;
  @override
  final String? category;
  @override
  final String? modelNumber;
  @override
  final int serialCount;
  @override
  final int minStockLevel;
  @override
  final int maxStockLevel;
  @override
  final ItemCountStatus status;
  @override
  final DateTime startedAt;
  @override
  final DateTime? completedAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'StockTakeItem(localId: $localId, serverId: $serverId, sessionLocalId: $sessionLocalId, customerProductId: $customerProductId, brandId: $brandId, brandName: $brandName, itemCode: $itemCode, itemName: $itemName, itemDescription: $itemDescription, category: $category, modelNumber: $modelNumber, serialCount: $serialCount, minStockLevel: $minStockLevel, maxStockLevel: $maxStockLevel, status: $status, startedAt: $startedAt, completedAt: $completedAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockTakeItemImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId) &&
            (identical(other.sessionLocalId, sessionLocalId) ||
                other.sessionLocalId == sessionLocalId) &&
            (identical(other.customerProductId, customerProductId) ||
                other.customerProductId == customerProductId) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemDescription, itemDescription) ||
                other.itemDescription == itemDescription) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.modelNumber, modelNumber) ||
                other.modelNumber == modelNumber) &&
            (identical(other.serialCount, serialCount) ||
                other.serialCount == serialCount) &&
            (identical(other.minStockLevel, minStockLevel) ||
                other.minStockLevel == minStockLevel) &&
            (identical(other.maxStockLevel, maxStockLevel) ||
                other.maxStockLevel == maxStockLevel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    localId,
    serverId,
    sessionLocalId,
    customerProductId,
    brandId,
    brandName,
    itemCode,
    itemName,
    itemDescription,
    category,
    modelNumber,
    serialCount,
    minStockLevel,
    maxStockLevel,
    status,
    startedAt,
    completedAt,
    updatedAt,
  );

  /// Create a copy of StockTakeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockTakeItemImplCopyWith<_$StockTakeItemImpl> get copyWith =>
      __$$StockTakeItemImplCopyWithImpl<_$StockTakeItemImpl>(this, _$identity);
}

abstract class _StockTakeItem extends StockTakeItem {
  const factory _StockTakeItem({
    required final String localId,
    final int? serverId,
    required final String sessionLocalId,
    required final int customerProductId,
    required final int brandId,
    required final String brandName,
    required final String itemCode,
    required final String itemName,
    final String? itemDescription,
    final String? category,
    final String? modelNumber,
    required final int serialCount,
    required final int minStockLevel,
    required final int maxStockLevel,
    required final ItemCountStatus status,
    required final DateTime startedAt,
    final DateTime? completedAt,
    required final DateTime updatedAt,
  }) = _$StockTakeItemImpl;
  const _StockTakeItem._() : super._();

  @override
  String get localId;
  @override
  int? get serverId;
  @override
  String get sessionLocalId;
  @override
  int get customerProductId;
  @override
  int get brandId;
  @override
  String get brandName;
  @override
  String get itemCode;
  @override
  String get itemName;
  @override
  String? get itemDescription;
  @override
  String? get category;
  @override
  String? get modelNumber;
  @override
  int get serialCount;
  @override
  int get minStockLevel;
  @override
  int get maxStockLevel;
  @override
  ItemCountStatus get status;
  @override
  DateTime get startedAt;
  @override
  DateTime? get completedAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of StockTakeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockTakeItemImplCopyWith<_$StockTakeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
