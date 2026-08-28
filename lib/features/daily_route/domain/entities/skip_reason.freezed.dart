// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skip_reason.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SkipReason _$SkipReasonFromJson(Map<String, dynamic> json) {
  return _SkipReason.fromJson(json);
}

/// @nodoc
mixin _$SkipReason {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get requiresNotes => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this SkipReason to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkipReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkipReasonCopyWith<SkipReason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkipReasonCopyWith<$Res> {
  factory $SkipReasonCopyWith(
    SkipReason value,
    $Res Function(SkipReason) then,
  ) = _$SkipReasonCopyWithImpl<$Res, SkipReason>;
  @useResult
  $Res call({
    int id,
    String code,
    String label,
    bool requiresNotes,
    bool isActive,
  });
}

/// @nodoc
class _$SkipReasonCopyWithImpl<$Res, $Val extends SkipReason>
    implements $SkipReasonCopyWith<$Res> {
  _$SkipReasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkipReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? label = null,
    Object? requiresNotes = null,
    Object? isActive = null,
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
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            requiresNotes: null == requiresNotes
                ? _value.requiresNotes
                : requiresNotes // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$SkipReasonImplCopyWith<$Res>
    implements $SkipReasonCopyWith<$Res> {
  factory _$$SkipReasonImplCopyWith(
    _$SkipReasonImpl value,
    $Res Function(_$SkipReasonImpl) then,
  ) = __$$SkipReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String code,
    String label,
    bool requiresNotes,
    bool isActive,
  });
}

/// @nodoc
class __$$SkipReasonImplCopyWithImpl<$Res>
    extends _$SkipReasonCopyWithImpl<$Res, _$SkipReasonImpl>
    implements _$$SkipReasonImplCopyWith<$Res> {
  __$$SkipReasonImplCopyWithImpl(
    _$SkipReasonImpl _value,
    $Res Function(_$SkipReasonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SkipReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? label = null,
    Object? requiresNotes = null,
    Object? isActive = null,
  }) {
    return _then(
      _$SkipReasonImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        requiresNotes: null == requiresNotes
            ? _value.requiresNotes
            : requiresNotes // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SkipReasonImpl implements _SkipReason {
  const _$SkipReasonImpl({
    required this.id,
    required this.code,
    required this.label,
    this.requiresNotes = false,
    this.isActive = true,
  });

  factory _$SkipReasonImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkipReasonImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String label;
  @override
  @JsonKey()
  final bool requiresNotes;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'SkipReason(id: $id, code: $code, label: $label, requiresNotes: $requiresNotes, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkipReasonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.requiresNotes, requiresNotes) ||
                other.requiresNotes == requiresNotes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, label, requiresNotes, isActive);

  /// Create a copy of SkipReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkipReasonImplCopyWith<_$SkipReasonImpl> get copyWith =>
      __$$SkipReasonImplCopyWithImpl<_$SkipReasonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkipReasonImplToJson(this);
  }
}

abstract class _SkipReason implements SkipReason {
  const factory _SkipReason({
    required final int id,
    required final String code,
    required final String label,
    final bool requiresNotes,
    final bool isActive,
  }) = _$SkipReasonImpl;

  factory _SkipReason.fromJson(Map<String, dynamic> json) =
      _$SkipReasonImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get label;
  @override
  bool get requiresNotes;
  @override
  bool get isActive;

  /// Create a copy of SkipReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkipReasonImplCopyWith<_$SkipReasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
