// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_sales_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailySalesPage {

 List<DailySale> get items; int get page; int get size; int get total; int get pages; bool get hasPrevious; bool get hasNext;
/// Create a copy of DailySalesPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailySalesPageCopyWith<DailySalesPage> get copyWith => _$DailySalesPageCopyWithImpl<DailySalesPage>(this as DailySalesPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailySalesPage&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.total, total) || other.total == total)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,size,total,pages,hasPrevious,hasNext);

@override
String toString() {
  return 'DailySalesPage(items: $items, page: $page, size: $size, total: $total, pages: $pages, hasPrevious: $hasPrevious, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $DailySalesPageCopyWith<$Res>  {
  factory $DailySalesPageCopyWith(DailySalesPage value, $Res Function(DailySalesPage) _then) = _$DailySalesPageCopyWithImpl;
@useResult
$Res call({
 List<DailySale> items, int page, int size, int total, int pages, bool hasPrevious, bool hasNext
});




}
/// @nodoc
class _$DailySalesPageCopyWithImpl<$Res>
    implements $DailySalesPageCopyWith<$Res> {
  _$DailySalesPageCopyWithImpl(this._self, this._then);

  final DailySalesPage _self;
  final $Res Function(DailySalesPage) _then;

/// Create a copy of DailySalesPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? size = null,Object? total = null,Object? pages = null,Object? hasPrevious = null,Object? hasNext = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<DailySale>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DailySalesPage].
extension DailySalesPagePatterns on DailySalesPage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailySalesPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailySalesPage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailySalesPage value)  $default,){
final _that = this;
switch (_that) {
case _DailySalesPage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailySalesPage value)?  $default,){
final _that = this;
switch (_that) {
case _DailySalesPage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DailySale> items,  int page,  int size,  int total,  int pages,  bool hasPrevious,  bool hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailySalesPage() when $default != null:
return $default(_that.items,_that.page,_that.size,_that.total,_that.pages,_that.hasPrevious,_that.hasNext);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DailySale> items,  int page,  int size,  int total,  int pages,  bool hasPrevious,  bool hasNext)  $default,) {final _that = this;
switch (_that) {
case _DailySalesPage():
return $default(_that.items,_that.page,_that.size,_that.total,_that.pages,_that.hasPrevious,_that.hasNext);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DailySale> items,  int page,  int size,  int total,  int pages,  bool hasPrevious,  bool hasNext)?  $default,) {final _that = this;
switch (_that) {
case _DailySalesPage() when $default != null:
return $default(_that.items,_that.page,_that.size,_that.total,_that.pages,_that.hasPrevious,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc


class _DailySalesPage implements DailySalesPage {
  const _DailySalesPage({required final  List<DailySale> items, required this.page, required this.size, required this.total, required this.pages, required this.hasPrevious, required this.hasNext}): _items = items;
  

 final  List<DailySale> _items;
@override List<DailySale> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int page;
@override final  int size;
@override final  int total;
@override final  int pages;
@override final  bool hasPrevious;
@override final  bool hasNext;

/// Create a copy of DailySalesPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailySalesPageCopyWith<_DailySalesPage> get copyWith => __$DailySalesPageCopyWithImpl<_DailySalesPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailySalesPage&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.total, total) || other.total == total)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,size,total,pages,hasPrevious,hasNext);

@override
String toString() {
  return 'DailySalesPage(items: $items, page: $page, size: $size, total: $total, pages: $pages, hasPrevious: $hasPrevious, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$DailySalesPageCopyWith<$Res> implements $DailySalesPageCopyWith<$Res> {
  factory _$DailySalesPageCopyWith(_DailySalesPage value, $Res Function(_DailySalesPage) _then) = __$DailySalesPageCopyWithImpl;
@override @useResult
$Res call({
 List<DailySale> items, int page, int size, int total, int pages, bool hasPrevious, bool hasNext
});




}
/// @nodoc
class __$DailySalesPageCopyWithImpl<$Res>
    implements _$DailySalesPageCopyWith<$Res> {
  __$DailySalesPageCopyWithImpl(this._self, this._then);

  final _DailySalesPage _self;
  final $Res Function(_DailySalesPage) _then;

/// Create a copy of DailySalesPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? size = null,Object? total = null,Object? pages = null,Object? hasPrevious = null,Object? hasNext = null,}) {
  return _then(_DailySalesPage(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<DailySale>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
