// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_sale_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DailySaleItem {
  int get id => throw _privateConstructorUsedError;
  int get dailySalesId => throw _privateConstructorUsedError;
  String get productCode => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Kept as returned by the API (decimal string, e.g. "15000.00").
  /// Can be "0.00" if the catalogue entry has no price set.
  String get unitPrice => throw _privateConstructorUsedError;
  String get totalPrice => throw _privateConstructorUsedError;
  List<SaleSerialNumber> get serialNumbers =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of DailySaleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySaleItemCopyWith<DailySaleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySaleItemCopyWith<$Res> {
  factory $DailySaleItemCopyWith(
    DailySaleItem value,
    $Res Function(DailySaleItem) then,
  ) = _$DailySaleItemCopyWithImpl<$Res, DailySaleItem>;
  @useResult
  $Res call({
    int id,
    int dailySalesId,
    String productCode,
    String productName,
    int quantity,
    String unitPrice,
    String totalPrice,
    List<SaleSerialNumber> serialNumbers,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$DailySaleItemCopyWithImpl<$Res, $Val extends DailySaleItem>
    implements $DailySaleItemCopyWith<$Res> {
  _$DailySaleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailySaleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dailySalesId = null,
    Object? productCode = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? serialNumbers = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            dailySalesId: null == dailySalesId
                ? _value.dailySalesId
                : dailySalesId // ignore: cast_nullable_to_non_nullable
                      as int,
            productCode: null == productCode
                ? _value.productCode
                : productCode // ignore: cast_nullable_to_non_nullable
                      as String,
            productName: null == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            unitPrice: null == unitPrice
                ? _value.unitPrice
                : unitPrice // ignore: cast_nullable_to_non_nullable
                      as String,
            totalPrice: null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                      as String,
            serialNumbers: null == serialNumbers
                ? _value.serialNumbers
                : serialNumbers // ignore: cast_nullable_to_non_nullable
                      as List<SaleSerialNumber>,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailySaleItemImplCopyWith<$Res>
    implements $DailySaleItemCopyWith<$Res> {
  factory _$$DailySaleItemImplCopyWith(
    _$DailySaleItemImpl value,
    $Res Function(_$DailySaleItemImpl) then,
  ) = __$$DailySaleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int dailySalesId,
    String productCode,
    String productName,
    int quantity,
    String unitPrice,
    String totalPrice,
    List<SaleSerialNumber> serialNumbers,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$DailySaleItemImplCopyWithImpl<$Res>
    extends _$DailySaleItemCopyWithImpl<$Res, _$DailySaleItemImpl>
    implements _$$DailySaleItemImplCopyWith<$Res> {
  __$$DailySaleItemImplCopyWithImpl(
    _$DailySaleItemImpl _value,
    $Res Function(_$DailySaleItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailySaleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dailySalesId = null,
    Object? productCode = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? serialNumbers = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$DailySaleItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        dailySalesId: null == dailySalesId
            ? _value.dailySalesId
            : dailySalesId // ignore: cast_nullable_to_non_nullable
                  as int,
        productCode: null == productCode
            ? _value.productCode
            : productCode // ignore: cast_nullable_to_non_nullable
                  as String,
        productName: null == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        unitPrice: null == unitPrice
            ? _value.unitPrice
            : unitPrice // ignore: cast_nullable_to_non_nullable
                  as String,
        totalPrice: null == totalPrice
            ? _value.totalPrice
            : totalPrice // ignore: cast_nullable_to_non_nullable
                  as String,
        serialNumbers: null == serialNumbers
            ? _value._serialNumbers
            : serialNumbers // ignore: cast_nullable_to_non_nullable
                  as List<SaleSerialNumber>,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$DailySaleItemImpl extends _DailySaleItem {
  const _$DailySaleItemImpl({
    required this.id,
    required this.dailySalesId,
    required this.productCode,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    final List<SaleSerialNumber> serialNumbers = const <SaleSerialNumber>[],
    this.createdAt,
    this.updatedAt,
  }) : _serialNumbers = serialNumbers,
       super._();

  @override
  final int id;
  @override
  final int dailySalesId;
  @override
  final String productCode;
  @override
  final String productName;
  @override
  final int quantity;

  /// Kept as returned by the API (decimal string, e.g. "15000.00").
  /// Can be "0.00" if the catalogue entry has no price set.
  @override
  final String unitPrice;
  @override
  final String totalPrice;
  final List<SaleSerialNumber> _serialNumbers;
  @override
  @JsonKey()
  List<SaleSerialNumber> get serialNumbers {
    if (_serialNumbers is EqualUnmodifiableListView) return _serialNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serialNumbers);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'DailySaleItem(id: $id, dailySalesId: $dailySalesId, productCode: $productCode, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, serialNumbers: $serialNumbers, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySaleItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dailySalesId, dailySalesId) ||
                other.dailySalesId == dailySalesId) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(
              other._serialNumbers,
              _serialNumbers,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    dailySalesId,
    productCode,
    productName,
    quantity,
    unitPrice,
    totalPrice,
    const DeepCollectionEquality().hash(_serialNumbers),
    createdAt,
    updatedAt,
  );

  /// Create a copy of DailySaleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySaleItemImplCopyWith<_$DailySaleItemImpl> get copyWith =>
      __$$DailySaleItemImplCopyWithImpl<_$DailySaleItemImpl>(this, _$identity);
}

abstract class _DailySaleItem extends DailySaleItem {
  const factory _DailySaleItem({
    required final int id,
    required final int dailySalesId,
    required final String productCode,
    required final String productName,
    required final int quantity,
    required final String unitPrice,
    required final String totalPrice,
    final List<SaleSerialNumber> serialNumbers,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$DailySaleItemImpl;
  const _DailySaleItem._() : super._();

  @override
  int get id;
  @override
  int get dailySalesId;
  @override
  String get productCode;
  @override
  String get productName;
  @override
  int get quantity;

  /// Kept as returned by the API (decimal string, e.g. "15000.00").
  /// Can be "0.00" if the catalogue entry has no price set.
  @override
  String get unitPrice;
  @override
  String get totalPrice;
  @override
  List<SaleSerialNumber> get serialNumbers;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of DailySaleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySaleItemImplCopyWith<_$DailySaleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
