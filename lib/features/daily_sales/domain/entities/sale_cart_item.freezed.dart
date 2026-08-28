// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SaleCartItem {
  String get barcode => throw _privateConstructorUsedError;
  String get productCode => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String? get modelNumber => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double? get estimatedUnitPrice => throw _privateConstructorUsedError;

  /// Create a copy of SaleCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleCartItemCopyWith<SaleCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleCartItemCopyWith<$Res> {
  factory $SaleCartItemCopyWith(
    SaleCartItem value,
    $Res Function(SaleCartItem) then,
  ) = _$SaleCartItemCopyWithImpl<$Res, SaleCartItem>;
  @useResult
  $Res call({
    String barcode,
    String productCode,
    String productName,
    String? modelNumber,
    int quantity,
    double? estimatedUnitPrice,
  });
}

/// @nodoc
class _$SaleCartItemCopyWithImpl<$Res, $Val extends SaleCartItem>
    implements $SaleCartItemCopyWith<$Res> {
  _$SaleCartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? productCode = null,
    Object? productName = null,
    Object? modelNumber = freezed,
    Object? quantity = null,
    Object? estimatedUnitPrice = freezed,
  }) {
    return _then(
      _value.copyWith(
            barcode: null == barcode
                ? _value.barcode
                : barcode // ignore: cast_nullable_to_non_nullable
                      as String,
            productCode: null == productCode
                ? _value.productCode
                : productCode // ignore: cast_nullable_to_non_nullable
                      as String,
            productName: null == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String,
            modelNumber: freezed == modelNumber
                ? _value.modelNumber
                : modelNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            estimatedUnitPrice: freezed == estimatedUnitPrice
                ? _value.estimatedUnitPrice
                : estimatedUnitPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SaleCartItemImplCopyWith<$Res>
    implements $SaleCartItemCopyWith<$Res> {
  factory _$$SaleCartItemImplCopyWith(
    _$SaleCartItemImpl value,
    $Res Function(_$SaleCartItemImpl) then,
  ) = __$$SaleCartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String barcode,
    String productCode,
    String productName,
    String? modelNumber,
    int quantity,
    double? estimatedUnitPrice,
  });
}

/// @nodoc
class __$$SaleCartItemImplCopyWithImpl<$Res>
    extends _$SaleCartItemCopyWithImpl<$Res, _$SaleCartItemImpl>
    implements _$$SaleCartItemImplCopyWith<$Res> {
  __$$SaleCartItemImplCopyWithImpl(
    _$SaleCartItemImpl _value,
    $Res Function(_$SaleCartItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SaleCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? productCode = null,
    Object? productName = null,
    Object? modelNumber = freezed,
    Object? quantity = null,
    Object? estimatedUnitPrice = freezed,
  }) {
    return _then(
      _$SaleCartItemImpl(
        barcode: null == barcode
            ? _value.barcode
            : barcode // ignore: cast_nullable_to_non_nullable
                  as String,
        productCode: null == productCode
            ? _value.productCode
            : productCode // ignore: cast_nullable_to_non_nullable
                  as String,
        productName: null == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String,
        modelNumber: freezed == modelNumber
            ? _value.modelNumber
            : modelNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        estimatedUnitPrice: freezed == estimatedUnitPrice
            ? _value.estimatedUnitPrice
            : estimatedUnitPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc

class _$SaleCartItemImpl extends _SaleCartItem {
  const _$SaleCartItemImpl({
    required this.barcode,
    required this.productCode,
    required this.productName,
    this.modelNumber,
    this.quantity = 1,
    this.estimatedUnitPrice,
  }) : super._();

  @override
  final String barcode;
  @override
  final String productCode;
  @override
  final String productName;
  @override
  final String? modelNumber;
  @override
  @JsonKey()
  final int quantity;
  @override
  final double? estimatedUnitPrice;

  @override
  String toString() {
    return 'SaleCartItem(barcode: $barcode, productCode: $productCode, productName: $productName, modelNumber: $modelNumber, quantity: $quantity, estimatedUnitPrice: $estimatedUnitPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleCartItemImpl &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.modelNumber, modelNumber) ||
                other.modelNumber == modelNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.estimatedUnitPrice, estimatedUnitPrice) ||
                other.estimatedUnitPrice == estimatedUnitPrice));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    barcode,
    productCode,
    productName,
    modelNumber,
    quantity,
    estimatedUnitPrice,
  );

  /// Create a copy of SaleCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleCartItemImplCopyWith<_$SaleCartItemImpl> get copyWith =>
      __$$SaleCartItemImplCopyWithImpl<_$SaleCartItemImpl>(this, _$identity);
}

abstract class _SaleCartItem extends SaleCartItem {
  const factory _SaleCartItem({
    required final String barcode,
    required final String productCode,
    required final String productName,
    final String? modelNumber,
    final int quantity,
    final double? estimatedUnitPrice,
  }) = _$SaleCartItemImpl;
  const _SaleCartItem._() : super._();

  @override
  String get barcode;
  @override
  String get productCode;
  @override
  String get productName;
  @override
  String? get modelNumber;
  @override
  int get quantity;
  @override
  double? get estimatedUnitPrice;

  /// Create a copy of SaleCartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleCartItemImplCopyWith<_$SaleCartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
