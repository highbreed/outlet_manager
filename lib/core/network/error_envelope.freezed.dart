// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_envelope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ErrorEnvelope {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;
  int? get retryAfter => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Create a copy of ErrorEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorEnvelopeCopyWith<ErrorEnvelope> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorEnvelopeCopyWith<$Res> {
  factory $ErrorEnvelopeCopyWith(
    ErrorEnvelope value,
    $Res Function(ErrorEnvelope) then,
  ) = _$ErrorEnvelopeCopyWithImpl<$Res, ErrorEnvelope>;
  @useResult
  $Res call({
    String code,
    String message,
    Map<String, dynamic>? details,
    int? retryAfter,
    String? requestId,
  });
}

/// @nodoc
class _$ErrorEnvelopeCopyWithImpl<$Res, $Val extends ErrorEnvelope>
    implements $ErrorEnvelopeCopyWith<$Res> {
  _$ErrorEnvelopeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
    Object? retryAfter = freezed,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            details: freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            retryAfter: freezed == retryAfter
                ? _value.retryAfter
                : retryAfter // ignore: cast_nullable_to_non_nullable
                      as int?,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ErrorEnvelopeImplCopyWith<$Res>
    implements $ErrorEnvelopeCopyWith<$Res> {
  factory _$$ErrorEnvelopeImplCopyWith(
    _$ErrorEnvelopeImpl value,
    $Res Function(_$ErrorEnvelopeImpl) then,
  ) = __$$ErrorEnvelopeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String message,
    Map<String, dynamic>? details,
    int? retryAfter,
    String? requestId,
  });
}

/// @nodoc
class __$$ErrorEnvelopeImplCopyWithImpl<$Res>
    extends _$ErrorEnvelopeCopyWithImpl<$Res, _$ErrorEnvelopeImpl>
    implements _$$ErrorEnvelopeImplCopyWith<$Res> {
  __$$ErrorEnvelopeImplCopyWithImpl(
    _$ErrorEnvelopeImpl _value,
    $Res Function(_$ErrorEnvelopeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ErrorEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
    Object? retryAfter = freezed,
    Object? requestId = freezed,
  }) {
    return _then(
      _$ErrorEnvelopeImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value._details
            : details // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        retryAfter: freezed == retryAfter
            ? _value.retryAfter
            : retryAfter // ignore: cast_nullable_to_non_nullable
                  as int?,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ErrorEnvelopeImpl implements _ErrorEnvelope {
  const _$ErrorEnvelopeImpl({
    required this.code,
    required this.message,
    final Map<String, dynamic>? details,
    this.retryAfter,
    this.requestId,
  }) : _details = details;

  @override
  final String code;
  @override
  final String message;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? retryAfter;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'ErrorEnvelope(code: $code, message: $message, details: $details, retryAfter: $retryAfter, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorEnvelopeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    message,
    const DeepCollectionEquality().hash(_details),
    retryAfter,
    requestId,
  );

  /// Create a copy of ErrorEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorEnvelopeImplCopyWith<_$ErrorEnvelopeImpl> get copyWith =>
      __$$ErrorEnvelopeImplCopyWithImpl<_$ErrorEnvelopeImpl>(this, _$identity);
}

abstract class _ErrorEnvelope implements ErrorEnvelope {
  const factory _ErrorEnvelope({
    required final String code,
    required final String message,
    final Map<String, dynamic>? details,
    final int? retryAfter,
    final String? requestId,
  }) = _$ErrorEnvelopeImpl;

  @override
  String get code;
  @override
  String get message;
  @override
  Map<String, dynamic>? get details;
  @override
  int? get retryAfter;
  @override
  String? get requestId;

  /// Create a copy of ErrorEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorEnvelopeImplCopyWith<_$ErrorEnvelopeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
