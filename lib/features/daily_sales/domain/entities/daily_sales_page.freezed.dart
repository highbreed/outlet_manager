// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_sales_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DailySalesPage {
  List<DailySale> get items => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  bool get hasPrevious => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;

  /// Create a copy of DailySalesPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailySalesPageCopyWith<DailySalesPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailySalesPageCopyWith<$Res> {
  factory $DailySalesPageCopyWith(
    DailySalesPage value,
    $Res Function(DailySalesPage) then,
  ) = _$DailySalesPageCopyWithImpl<$Res, DailySalesPage>;
  @useResult
  $Res call({
    List<DailySale> items,
    int page,
    int size,
    int total,
    int pages,
    bool hasPrevious,
    bool hasNext,
  });
}

/// @nodoc
class _$DailySalesPageCopyWithImpl<$Res, $Val extends DailySalesPage>
    implements $DailySalesPageCopyWith<$Res> {
  _$DailySalesPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailySalesPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? size = null,
    Object? total = null,
    Object? pages = null,
    Object? hasPrevious = null,
    Object? hasNext = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<DailySale>,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int,
            hasPrevious: null == hasPrevious
                ? _value.hasPrevious
                : hasPrevious // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasNext: null == hasNext
                ? _value.hasNext
                : hasNext // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailySalesPageImplCopyWith<$Res>
    implements $DailySalesPageCopyWith<$Res> {
  factory _$$DailySalesPageImplCopyWith(
    _$DailySalesPageImpl value,
    $Res Function(_$DailySalesPageImpl) then,
  ) = __$$DailySalesPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<DailySale> items,
    int page,
    int size,
    int total,
    int pages,
    bool hasPrevious,
    bool hasNext,
  });
}

/// @nodoc
class __$$DailySalesPageImplCopyWithImpl<$Res>
    extends _$DailySalesPageCopyWithImpl<$Res, _$DailySalesPageImpl>
    implements _$$DailySalesPageImplCopyWith<$Res> {
  __$$DailySalesPageImplCopyWithImpl(
    _$DailySalesPageImpl _value,
    $Res Function(_$DailySalesPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailySalesPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? size = null,
    Object? total = null,
    Object? pages = null,
    Object? hasPrevious = null,
    Object? hasNext = null,
  }) {
    return _then(
      _$DailySalesPageImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<DailySale>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        pages: null == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int,
        hasPrevious: null == hasPrevious
            ? _value.hasPrevious
            : hasPrevious // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasNext: null == hasNext
            ? _value.hasNext
            : hasNext // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DailySalesPageImpl implements _DailySalesPage {
  const _$DailySalesPageImpl({
    required final List<DailySale> items,
    required this.page,
    required this.size,
    required this.total,
    required this.pages,
    required this.hasPrevious,
    required this.hasNext,
  }) : _items = items;

  final List<DailySale> _items;
  @override
  List<DailySale> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int page;
  @override
  final int size;
  @override
  final int total;
  @override
  final int pages;
  @override
  final bool hasPrevious;
  @override
  final bool hasNext;

  @override
  String toString() {
    return 'DailySalesPage(items: $items, page: $page, size: $size, total: $total, pages: $pages, hasPrevious: $hasPrevious, hasNext: $hasNext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailySalesPageImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    page,
    size,
    total,
    pages,
    hasPrevious,
    hasNext,
  );

  /// Create a copy of DailySalesPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailySalesPageImplCopyWith<_$DailySalesPageImpl> get copyWith =>
      __$$DailySalesPageImplCopyWithImpl<_$DailySalesPageImpl>(
        this,
        _$identity,
      );
}

abstract class _DailySalesPage implements DailySalesPage {
  const factory _DailySalesPage({
    required final List<DailySale> items,
    required final int page,
    required final int size,
    required final int total,
    required final int pages,
    required final bool hasPrevious,
    required final bool hasNext,
  }) = _$DailySalesPageImpl;

  @override
  List<DailySale> get items;
  @override
  int get page;
  @override
  int get size;
  @override
  int get total;
  @override
  int get pages;
  @override
  bool get hasPrevious;
  @override
  bool get hasNext;

  /// Create a copy of DailySalesPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailySalesPageImplCopyWith<_$DailySalesPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
