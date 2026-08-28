// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_serial_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SaleSerialNumber {
  int get id => throw _privateConstructorUsedError;
  String get serialNumber => throw _privateConstructorUsedError;

  /// Create a copy of SaleSerialNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleSerialNumberCopyWith<SaleSerialNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleSerialNumberCopyWith<$Res> {
  factory $SaleSerialNumberCopyWith(
    SaleSerialNumber value,
    $Res Function(SaleSerialNumber) then,
  ) = _$SaleSerialNumberCopyWithImpl<$Res, SaleSerialNumber>;
  @useResult
  $Res call({int id, String serialNumber});
}

/// @nodoc
class _$SaleSerialNumberCopyWithImpl<$Res, $Val extends SaleSerialNumber>
    implements $SaleSerialNumberCopyWith<$Res> {
  _$SaleSerialNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleSerialNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? serialNumber = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            serialNumber: null == serialNumber
                ? _value.serialNumber
                : serialNumber // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SaleSerialNumberImplCopyWith<$Res>
    implements $SaleSerialNumberCopyWith<$Res> {
  factory _$$SaleSerialNumberImplCopyWith(
    _$SaleSerialNumberImpl value,
    $Res Function(_$SaleSerialNumberImpl) then,
  ) = __$$SaleSerialNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String serialNumber});
}

/// @nodoc
class __$$SaleSerialNumberImplCopyWithImpl<$Res>
    extends _$SaleSerialNumberCopyWithImpl<$Res, _$SaleSerialNumberImpl>
    implements _$$SaleSerialNumberImplCopyWith<$Res> {
  __$$SaleSerialNumberImplCopyWithImpl(
    _$SaleSerialNumberImpl _value,
    $Res Function(_$SaleSerialNumberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SaleSerialNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? serialNumber = null}) {
    return _then(
      _$SaleSerialNumberImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        serialNumber: null == serialNumber
            ? _value.serialNumber
            : serialNumber // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SaleSerialNumberImpl implements _SaleSerialNumber {
  const _$SaleSerialNumberImpl({required this.id, required this.serialNumber});

  @override
  final int id;
  @override
  final String serialNumber;

  @override
  String toString() {
    return 'SaleSerialNumber(id: $id, serialNumber: $serialNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleSerialNumberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, serialNumber);

  /// Create a copy of SaleSerialNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleSerialNumberImplCopyWith<_$SaleSerialNumberImpl> get copyWith =>
      __$$SaleSerialNumberImplCopyWithImpl<_$SaleSerialNumberImpl>(
        this,
        _$identity,
      );
}

abstract class _SaleSerialNumber implements SaleSerialNumber {
  const factory _SaleSerialNumber({
    required final int id,
    required final String serialNumber,
  }) = _$SaleSerialNumberImpl;

  @override
  int get id;
  @override
  String get serialNumber;

  /// Create a copy of SaleSerialNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleSerialNumberImplCopyWith<_$SaleSerialNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
