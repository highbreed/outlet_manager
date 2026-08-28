// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ItemGroup {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get syncedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of ItemGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemGroupCopyWith<ItemGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemGroupCopyWith<$Res> {
  factory $ItemGroupCopyWith(ItemGroup value, $Res Function(ItemGroup) then) =
      _$ItemGroupCopyWithImpl<$Res, ItemGroup>;
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    bool isActive,
    DateTime? syncedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$ItemGroupCopyWithImpl<$Res, $Val extends ItemGroup>
    implements $ItemGroupCopyWith<$Res> {
  _$ItemGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? isActive = null,
    Object? syncedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            syncedAt: freezed == syncedAt
                ? _value.syncedAt
                : syncedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
abstract class _$$ItemGroupImplCopyWith<$Res>
    implements $ItemGroupCopyWith<$Res> {
  factory _$$ItemGroupImplCopyWith(
    _$ItemGroupImpl value,
    $Res Function(_$ItemGroupImpl) then,
  ) = __$$ItemGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String code,
    String name,
    bool isActive,
    DateTime? syncedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ItemGroupImplCopyWithImpl<$Res>
    extends _$ItemGroupCopyWithImpl<$Res, _$ItemGroupImpl>
    implements _$$ItemGroupImplCopyWith<$Res> {
  __$$ItemGroupImplCopyWithImpl(
    _$ItemGroupImpl _value,
    $Res Function(_$ItemGroupImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? isActive = null,
    Object? syncedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ItemGroupImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        syncedAt: freezed == syncedAt
            ? _value.syncedAt
            : syncedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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

class _$ItemGroupImpl extends _ItemGroup {
  const _$ItemGroupImpl({
    required this.id,
    required this.code,
    required this.name,
    required this.isActive,
    this.syncedAt,
    this.createdAt,
    this.updatedAt,
  }) : super._();

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  final bool isActive;
  @override
  final DateTime? syncedAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ItemGroup(id: $id, code: $code, name: $name, isActive: $isActive, syncedAt: $syncedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.syncedAt, syncedAt) ||
                other.syncedAt == syncedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    name,
    isActive,
    syncedAt,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ItemGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemGroupImplCopyWith<_$ItemGroupImpl> get copyWith =>
      __$$ItemGroupImplCopyWithImpl<_$ItemGroupImpl>(this, _$identity);
}

abstract class _ItemGroup extends ItemGroup {
  const factory _ItemGroup({
    required final int id,
    required final String code,
    required final String name,
    required final bool isActive,
    final DateTime? syncedAt,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$ItemGroupImpl;
  const _ItemGroup._() : super._();

  @override
  int get id;
  @override
  String get code;
  @override
  String get name;
  @override
  bool get isActive;
  @override
  DateTime? get syncedAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of ItemGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemGroupImplCopyWith<_$ItemGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
