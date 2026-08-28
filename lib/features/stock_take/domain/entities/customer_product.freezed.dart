// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CustomerProduct {
  int get id => throw _privateConstructorUsedError;
  int get customerId => throw _privateConstructorUsedError;
  int get brandId => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;
  String get itemCode => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  String? get itemDescription => throw _privateConstructorUsedError;

  /// Product barcode (EAN/UPC) for scanning
  String? get barcode => throw _privateConstructorUsedError;

  /// Product categorization
  String? get itemGroup => throw _privateConstructorUsedError;
  String? get modelNumber => throw _privateConstructorUsedError;
  String? get productStatus => throw _privateConstructorUsedError;
  int get approvalStatus =>
      throw _privateConstructorUsedError; // Min/Max levels (uses effective values)
  int get minOnshelfQty => throw _privateConstructorUsedError;
  int get maxOnshelfQty => throw _privateConstructorUsedError;
  int get minBackstoreQty => throw _privateConstructorUsedError;
  int get maxBackstoreQty => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Create a copy of CustomerProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerProductCopyWith<CustomerProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerProductCopyWith<$Res> {
  factory $CustomerProductCopyWith(
    CustomerProduct value,
    $Res Function(CustomerProduct) then,
  ) = _$CustomerProductCopyWithImpl<$Res, CustomerProduct>;
  @useResult
  $Res call({
    int id,
    int customerId,
    int brandId,
    String brandName,
    String itemCode,
    String itemName,
    String? itemDescription,
    String? barcode,
    String? itemGroup,
    String? modelNumber,
    String? productStatus,
    int approvalStatus,
    int minOnshelfQty,
    int maxOnshelfQty,
    int minBackstoreQty,
    int maxBackstoreQty,
    bool isActive,
  });
}

/// @nodoc
class _$CustomerProductCopyWithImpl<$Res, $Val extends CustomerProduct>
    implements $CustomerProductCopyWith<$Res> {
  _$CustomerProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? brandId = null,
    Object? brandName = null,
    Object? itemCode = null,
    Object? itemName = null,
    Object? itemDescription = freezed,
    Object? barcode = freezed,
    Object? itemGroup = freezed,
    Object? modelNumber = freezed,
    Object? productStatus = freezed,
    Object? approvalStatus = null,
    Object? minOnshelfQty = null,
    Object? maxOnshelfQty = null,
    Object? minBackstoreQty = null,
    Object? maxBackstoreQty = null,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            customerId: null == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
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
            barcode: freezed == barcode
                ? _value.barcode
                : barcode // ignore: cast_nullable_to_non_nullable
                      as String?,
            itemGroup: freezed == itemGroup
                ? _value.itemGroup
                : itemGroup // ignore: cast_nullable_to_non_nullable
                      as String?,
            modelNumber: freezed == modelNumber
                ? _value.modelNumber
                : modelNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            productStatus: freezed == productStatus
                ? _value.productStatus
                : productStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvalStatus: null == approvalStatus
                ? _value.approvalStatus
                : approvalStatus // ignore: cast_nullable_to_non_nullable
                      as int,
            minOnshelfQty: null == minOnshelfQty
                ? _value.minOnshelfQty
                : minOnshelfQty // ignore: cast_nullable_to_non_nullable
                      as int,
            maxOnshelfQty: null == maxOnshelfQty
                ? _value.maxOnshelfQty
                : maxOnshelfQty // ignore: cast_nullable_to_non_nullable
                      as int,
            minBackstoreQty: null == minBackstoreQty
                ? _value.minBackstoreQty
                : minBackstoreQty // ignore: cast_nullable_to_non_nullable
                      as int,
            maxBackstoreQty: null == maxBackstoreQty
                ? _value.maxBackstoreQty
                : maxBackstoreQty // ignore: cast_nullable_to_non_nullable
                      as int,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerProductImplCopyWith<$Res>
    implements $CustomerProductCopyWith<$Res> {
  factory _$$CustomerProductImplCopyWith(
    _$CustomerProductImpl value,
    $Res Function(_$CustomerProductImpl) then,
  ) = __$$CustomerProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int customerId,
    int brandId,
    String brandName,
    String itemCode,
    String itemName,
    String? itemDescription,
    String? barcode,
    String? itemGroup,
    String? modelNumber,
    String? productStatus,
    int approvalStatus,
    int minOnshelfQty,
    int maxOnshelfQty,
    int minBackstoreQty,
    int maxBackstoreQty,
    bool isActive,
  });
}

/// @nodoc
class __$$CustomerProductImplCopyWithImpl<$Res>
    extends _$CustomerProductCopyWithImpl<$Res, _$CustomerProductImpl>
    implements _$$CustomerProductImplCopyWith<$Res> {
  __$$CustomerProductImplCopyWithImpl(
    _$CustomerProductImpl _value,
    $Res Function(_$CustomerProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? brandId = null,
    Object? brandName = null,
    Object? itemCode = null,
    Object? itemName = null,
    Object? itemDescription = freezed,
    Object? barcode = freezed,
    Object? itemGroup = freezed,
    Object? modelNumber = freezed,
    Object? productStatus = freezed,
    Object? approvalStatus = null,
    Object? minOnshelfQty = null,
    Object? maxOnshelfQty = null,
    Object? minBackstoreQty = null,
    Object? maxBackstoreQty = null,
    Object? isActive = null,
  }) {
    return _then(
      _$CustomerProductImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        customerId: null == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
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
        barcode: freezed == barcode
            ? _value.barcode
            : barcode // ignore: cast_nullable_to_non_nullable
                  as String?,
        itemGroup: freezed == itemGroup
            ? _value.itemGroup
            : itemGroup // ignore: cast_nullable_to_non_nullable
                  as String?,
        modelNumber: freezed == modelNumber
            ? _value.modelNumber
            : modelNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        productStatus: freezed == productStatus
            ? _value.productStatus
            : productStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvalStatus: null == approvalStatus
            ? _value.approvalStatus
            : approvalStatus // ignore: cast_nullable_to_non_nullable
                  as int,
        minOnshelfQty: null == minOnshelfQty
            ? _value.minOnshelfQty
            : minOnshelfQty // ignore: cast_nullable_to_non_nullable
                  as int,
        maxOnshelfQty: null == maxOnshelfQty
            ? _value.maxOnshelfQty
            : maxOnshelfQty // ignore: cast_nullable_to_non_nullable
                  as int,
        minBackstoreQty: null == minBackstoreQty
            ? _value.minBackstoreQty
            : minBackstoreQty // ignore: cast_nullable_to_non_nullable
                  as int,
        maxBackstoreQty: null == maxBackstoreQty
            ? _value.maxBackstoreQty
            : maxBackstoreQty // ignore: cast_nullable_to_non_nullable
                  as int,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$CustomerProductImpl extends _CustomerProduct {
  const _$CustomerProductImpl({
    required this.id,
    required this.customerId,
    required this.brandId,
    required this.brandName,
    required this.itemCode,
    required this.itemName,
    this.itemDescription,
    this.barcode,
    this.itemGroup,
    this.modelNumber,
    this.productStatus,
    required this.approvalStatus,
    required this.minOnshelfQty,
    required this.maxOnshelfQty,
    required this.minBackstoreQty,
    required this.maxBackstoreQty,
    required this.isActive,
  }) : super._();

  @override
  final int id;
  @override
  final int customerId;
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

  /// Product barcode (EAN/UPC) for scanning
  @override
  final String? barcode;

  /// Product categorization
  @override
  final String? itemGroup;
  @override
  final String? modelNumber;
  @override
  final String? productStatus;
  @override
  final int approvalStatus;
  // Min/Max levels (uses effective values)
  @override
  final int minOnshelfQty;
  @override
  final int maxOnshelfQty;
  @override
  final int minBackstoreQty;
  @override
  final int maxBackstoreQty;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'CustomerProduct(id: $id, customerId: $customerId, brandId: $brandId, brandName: $brandName, itemCode: $itemCode, itemName: $itemName, itemDescription: $itemDescription, barcode: $barcode, itemGroup: $itemGroup, modelNumber: $modelNumber, productStatus: $productStatus, approvalStatus: $approvalStatus, minOnshelfQty: $minOnshelfQty, maxOnshelfQty: $maxOnshelfQty, minBackstoreQty: $minBackstoreQty, maxBackstoreQty: $maxBackstoreQty, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.brandId, brandId) || other.brandId == brandId) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemDescription, itemDescription) ||
                other.itemDescription == itemDescription) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.itemGroup, itemGroup) ||
                other.itemGroup == itemGroup) &&
            (identical(other.modelNumber, modelNumber) ||
                other.modelNumber == modelNumber) &&
            (identical(other.productStatus, productStatus) ||
                other.productStatus == productStatus) &&
            (identical(other.approvalStatus, approvalStatus) ||
                other.approvalStatus == approvalStatus) &&
            (identical(other.minOnshelfQty, minOnshelfQty) ||
                other.minOnshelfQty == minOnshelfQty) &&
            (identical(other.maxOnshelfQty, maxOnshelfQty) ||
                other.maxOnshelfQty == maxOnshelfQty) &&
            (identical(other.minBackstoreQty, minBackstoreQty) ||
                other.minBackstoreQty == minBackstoreQty) &&
            (identical(other.maxBackstoreQty, maxBackstoreQty) ||
                other.maxBackstoreQty == maxBackstoreQty) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    customerId,
    brandId,
    brandName,
    itemCode,
    itemName,
    itemDescription,
    barcode,
    itemGroup,
    modelNumber,
    productStatus,
    approvalStatus,
    minOnshelfQty,
    maxOnshelfQty,
    minBackstoreQty,
    maxBackstoreQty,
    isActive,
  );

  /// Create a copy of CustomerProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerProductImplCopyWith<_$CustomerProductImpl> get copyWith =>
      __$$CustomerProductImplCopyWithImpl<_$CustomerProductImpl>(
        this,
        _$identity,
      );
}

abstract class _CustomerProduct extends CustomerProduct {
  const factory _CustomerProduct({
    required final int id,
    required final int customerId,
    required final int brandId,
    required final String brandName,
    required final String itemCode,
    required final String itemName,
    final String? itemDescription,
    final String? barcode,
    final String? itemGroup,
    final String? modelNumber,
    final String? productStatus,
    required final int approvalStatus,
    required final int minOnshelfQty,
    required final int maxOnshelfQty,
    required final int minBackstoreQty,
    required final int maxBackstoreQty,
    required final bool isActive,
  }) = _$CustomerProductImpl;
  const _CustomerProduct._() : super._();

  @override
  int get id;
  @override
  int get customerId;
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

  /// Product barcode (EAN/UPC) for scanning
  @override
  String? get barcode;

  /// Product categorization
  @override
  String? get itemGroup;
  @override
  String? get modelNumber;
  @override
  String? get productStatus;
  @override
  int get approvalStatus; // Min/Max levels (uses effective values)
  @override
  int get minOnshelfQty;
  @override
  int get maxOnshelfQty;
  @override
  int get minBackstoreQty;
  @override
  int get maxBackstoreQty;
  @override
  bool get isActive;

  /// Create a copy of CustomerProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerProductImplCopyWith<_$CustomerProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
