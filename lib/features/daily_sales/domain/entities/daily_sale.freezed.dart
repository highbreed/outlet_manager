// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_sale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DailySale {
  int get id => throw _privateConstructorUsedError;
  int get outletId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String? get customerPhone => throw _privateConstructorUsedError;

  /// Kept as returned by the API (decimal string, e.g. "45000.00").
  String get totalAmount => throw _privateConstructorUsedError;

  /// Total unit count across all items (not line count).
  int get totalItems => throw _privateConstructorUsedError;
  DateTime get saleDate => throw _privateConstructorUsedError;
  DailySaleStatus get status => throw _privateConstructorUsedError;
  List<DailySaleItem> get items => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Server-side path to the uploaded proof-of-purchase file, present
  /// once the sale has been confirmed with a photo attached.
  String? get proofOfPurchasePath => throw _privateConstructorUsedError;

  /// Create a copy of DailySale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySaleCopyWith<DailySale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySaleCopyWith<$Res> {
  factory $DailySaleCopyWith(DailySale value, $Res Function(DailySale) then) =
      _$DailySaleCopyWithImpl<$Res, DailySale>;
  @useResult
  $Res call({
    int id,
    int outletId,
    int userId,
    String customerName,
    String? customerPhone,
    String totalAmount,
    int totalItems,
    DateTime saleDate,
    DailySaleStatus status,
    List<DailySaleItem> items,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? proofOfPurchasePath,
  });
}

/// @nodoc
class _$DailySaleCopyWithImpl<$Res, $Val extends DailySale>
    implements $DailySaleCopyWith<$Res> {
  _$DailySaleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailySale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? outletId = null,
    Object? userId = null,
    Object? customerName = null,
    Object? customerPhone = freezed,
    Object? totalAmount = null,
    Object? totalItems = null,
    Object? saleDate = null,
    Object? status = null,
    Object? items = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? proofOfPurchasePath = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            outletId: null == outletId
                ? _value.outletId
                : outletId // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            customerName: null == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String,
            customerPhone: freezed == customerPhone
                ? _value.customerPhone
                : customerPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalAmount: null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as String,
            totalItems: null == totalItems
                ? _value.totalItems
                : totalItems // ignore: cast_nullable_to_non_nullable
                      as int,
            saleDate: null == saleDate
                ? _value.saleDate
                : saleDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as DailySaleStatus,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<DailySaleItem>,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            proofOfPurchasePath: freezed == proofOfPurchasePath
                ? _value.proofOfPurchasePath
                : proofOfPurchasePath // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailySaleImplCopyWith<$Res>
    implements $DailySaleCopyWith<$Res> {
  factory _$$DailySaleImplCopyWith(
    _$DailySaleImpl value,
    $Res Function(_$DailySaleImpl) then,
  ) = __$$DailySaleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int outletId,
    int userId,
    String customerName,
    String? customerPhone,
    String totalAmount,
    int totalItems,
    DateTime saleDate,
    DailySaleStatus status,
    List<DailySaleItem> items,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? proofOfPurchasePath,
  });
}

/// @nodoc
class __$$DailySaleImplCopyWithImpl<$Res>
    extends _$DailySaleCopyWithImpl<$Res, _$DailySaleImpl>
    implements _$$DailySaleImplCopyWith<$Res> {
  __$$DailySaleImplCopyWithImpl(
    _$DailySaleImpl _value,
    $Res Function(_$DailySaleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailySale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? outletId = null,
    Object? userId = null,
    Object? customerName = null,
    Object? customerPhone = freezed,
    Object? totalAmount = null,
    Object? totalItems = null,
    Object? saleDate = null,
    Object? status = null,
    Object? items = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? proofOfPurchasePath = freezed,
  }) {
    return _then(
      _$DailySaleImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        outletId: null == outletId
            ? _value.outletId
            : outletId // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        customerName: null == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String,
        customerPhone: freezed == customerPhone
            ? _value.customerPhone
            : customerPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalAmount: null == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as String,
        totalItems: null == totalItems
            ? _value.totalItems
            : totalItems // ignore: cast_nullable_to_non_nullable
                  as int,
        saleDate: null == saleDate
            ? _value.saleDate
            : saleDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as DailySaleStatus,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<DailySaleItem>,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        proofOfPurchasePath: freezed == proofOfPurchasePath
            ? _value.proofOfPurchasePath
            : proofOfPurchasePath // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DailySaleImpl extends _DailySale {
  const _$DailySaleImpl({
    required this.id,
    required this.outletId,
    required this.userId,
    required this.customerName,
    this.customerPhone,
    required this.totalAmount,
    required this.totalItems,
    required this.saleDate,
    required this.status,
    final List<DailySaleItem> items = const <DailySaleItem>[],
    this.createdAt,
    this.updatedAt,
    this.proofOfPurchasePath,
  }) : _items = items,
       super._();

  @override
  final int id;
  @override
  final int outletId;
  @override
  final int userId;
  @override
  final String customerName;
  @override
  final String? customerPhone;

  /// Kept as returned by the API (decimal string, e.g. "45000.00").
  @override
  final String totalAmount;

  /// Total unit count across all items (not line count).
  @override
  final int totalItems;
  @override
  final DateTime saleDate;
  @override
  final DailySaleStatus status;
  final List<DailySaleItem> _items;
  @override
  @JsonKey()
  List<DailySaleItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Server-side path to the uploaded proof-of-purchase file, present
  /// once the sale has been confirmed with a photo attached.
  @override
  final String? proofOfPurchasePath;

  @override
  String toString() {
    return 'DailySale(id: $id, outletId: $outletId, userId: $userId, customerName: $customerName, customerPhone: $customerPhone, totalAmount: $totalAmount, totalItems: $totalItems, saleDate: $saleDate, status: $status, items: $items, createdAt: $createdAt, updatedAt: $updatedAt, proofOfPurchasePath: $proofOfPurchasePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySaleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.saleDate, saleDate) ||
                other.saleDate == saleDate) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.proofOfPurchasePath, proofOfPurchasePath) ||
                other.proofOfPurchasePath == proofOfPurchasePath));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    outletId,
    userId,
    customerName,
    customerPhone,
    totalAmount,
    totalItems,
    saleDate,
    status,
    const DeepCollectionEquality().hash(_items),
    createdAt,
    updatedAt,
    proofOfPurchasePath,
  );

  /// Create a copy of DailySale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySaleImplCopyWith<_$DailySaleImpl> get copyWith =>
      __$$DailySaleImplCopyWithImpl<_$DailySaleImpl>(this, _$identity);
}

abstract class _DailySale extends DailySale {
  const factory _DailySale({
    required final int id,
    required final int outletId,
    required final int userId,
    required final String customerName,
    final String? customerPhone,
    required final String totalAmount,
    required final int totalItems,
    required final DateTime saleDate,
    required final DailySaleStatus status,
    final List<DailySaleItem> items,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final String? proofOfPurchasePath,
  }) = _$DailySaleImpl;
  const _DailySale._() : super._();

  @override
  int get id;
  @override
  int get outletId;
  @override
  int get userId;
  @override
  String get customerName;
  @override
  String? get customerPhone;

  /// Kept as returned by the API (decimal string, e.g. "45000.00").
  @override
  String get totalAmount;

  /// Total unit count across all items (not line count).
  @override
  int get totalItems;
  @override
  DateTime get saleDate;
  @override
  DailySaleStatus get status;
  @override
  List<DailySaleItem> get items;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Server-side path to the uploaded proof-of-purchase file, present
  /// once the sale has been confirmed with a photo attached.
  @override
  String? get proofOfPurchasePath;

  /// Create a copy of DailySale
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySaleImplCopyWith<_$DailySaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
