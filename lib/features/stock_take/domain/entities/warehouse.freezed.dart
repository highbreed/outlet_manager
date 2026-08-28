// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warehouse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Warehouse {
  int get id => throw _privateConstructorUsedError;
  String get warehouseName => throw _privateConstructorUsedError;
  String get warehouseCode => throw _privateConstructorUsedError;
  String? get sapWarehouseCode => throw _privateConstructorUsedError;
  WarehouseType get warehouseType => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Create a copy of Warehouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WarehouseCopyWith<Warehouse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseCopyWith<$Res> {
  factory $WarehouseCopyWith(Warehouse value, $Res Function(Warehouse) then) =
      _$WarehouseCopyWithImpl<$Res, Warehouse>;
  @useResult
  $Res call({
    int id,
    String warehouseName,
    String warehouseCode,
    String? sapWarehouseCode,
    WarehouseType warehouseType,
    String? location,
    bool isActive,
  });
}

/// @nodoc
class _$WarehouseCopyWithImpl<$Res, $Val extends Warehouse>
    implements $WarehouseCopyWith<$Res> {
  _$WarehouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Warehouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? warehouseName = null,
    Object? warehouseCode = null,
    Object? sapWarehouseCode = freezed,
    Object? warehouseType = null,
    Object? location = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            warehouseName: null == warehouseName
                ? _value.warehouseName
                : warehouseName // ignore: cast_nullable_to_non_nullable
                      as String,
            warehouseCode: null == warehouseCode
                ? _value.warehouseCode
                : warehouseCode // ignore: cast_nullable_to_non_nullable
                      as String,
            sapWarehouseCode: freezed == sapWarehouseCode
                ? _value.sapWarehouseCode
                : sapWarehouseCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            warehouseType: null == warehouseType
                ? _value.warehouseType
                : warehouseType // ignore: cast_nullable_to_non_nullable
                      as WarehouseType,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$WarehouseImplCopyWith<$Res>
    implements $WarehouseCopyWith<$Res> {
  factory _$$WarehouseImplCopyWith(
    _$WarehouseImpl value,
    $Res Function(_$WarehouseImpl) then,
  ) = __$$WarehouseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String warehouseName,
    String warehouseCode,
    String? sapWarehouseCode,
    WarehouseType warehouseType,
    String? location,
    bool isActive,
  });
}

/// @nodoc
class __$$WarehouseImplCopyWithImpl<$Res>
    extends _$WarehouseCopyWithImpl<$Res, _$WarehouseImpl>
    implements _$$WarehouseImplCopyWith<$Res> {
  __$$WarehouseImplCopyWithImpl(
    _$WarehouseImpl _value,
    $Res Function(_$WarehouseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Warehouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? warehouseName = null,
    Object? warehouseCode = null,
    Object? sapWarehouseCode = freezed,
    Object? warehouseType = null,
    Object? location = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$WarehouseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        warehouseName: null == warehouseName
            ? _value.warehouseName
            : warehouseName // ignore: cast_nullable_to_non_nullable
                  as String,
        warehouseCode: null == warehouseCode
            ? _value.warehouseCode
            : warehouseCode // ignore: cast_nullable_to_non_nullable
                  as String,
        sapWarehouseCode: freezed == sapWarehouseCode
            ? _value.sapWarehouseCode
            : sapWarehouseCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        warehouseType: null == warehouseType
            ? _value.warehouseType
            : warehouseType // ignore: cast_nullable_to_non_nullable
                  as WarehouseType,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$WarehouseImpl extends _Warehouse {
  const _$WarehouseImpl({
    required this.id,
    required this.warehouseName,
    required this.warehouseCode,
    this.sapWarehouseCode,
    required this.warehouseType,
    this.location,
    required this.isActive,
  }) : super._();

  @override
  final int id;
  @override
  final String warehouseName;
  @override
  final String warehouseCode;
  @override
  final String? sapWarehouseCode;
  @override
  final WarehouseType warehouseType;
  @override
  final String? location;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'Warehouse(id: $id, warehouseName: $warehouseName, warehouseCode: $warehouseCode, sapWarehouseCode: $sapWarehouseCode, warehouseType: $warehouseType, location: $location, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarehouseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.warehouseName, warehouseName) ||
                other.warehouseName == warehouseName) &&
            (identical(other.warehouseCode, warehouseCode) ||
                other.warehouseCode == warehouseCode) &&
            (identical(other.sapWarehouseCode, sapWarehouseCode) ||
                other.sapWarehouseCode == sapWarehouseCode) &&
            (identical(other.warehouseType, warehouseType) ||
                other.warehouseType == warehouseType) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    warehouseName,
    warehouseCode,
    sapWarehouseCode,
    warehouseType,
    location,
    isActive,
  );

  /// Create a copy of Warehouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WarehouseImplCopyWith<_$WarehouseImpl> get copyWith =>
      __$$WarehouseImplCopyWithImpl<_$WarehouseImpl>(this, _$identity);
}

abstract class _Warehouse extends Warehouse {
  const factory _Warehouse({
    required final int id,
    required final String warehouseName,
    required final String warehouseCode,
    final String? sapWarehouseCode,
    required final WarehouseType warehouseType,
    final String? location,
    required final bool isActive,
  }) = _$WarehouseImpl;
  const _Warehouse._() : super._();

  @override
  int get id;
  @override
  String get warehouseName;
  @override
  String get warehouseCode;
  @override
  String? get sapWarehouseCode;
  @override
  WarehouseType get warehouseType;
  @override
  String? get location;
  @override
  bool get isActive;

  /// Create a copy of Warehouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WarehouseImplCopyWith<_$WarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
