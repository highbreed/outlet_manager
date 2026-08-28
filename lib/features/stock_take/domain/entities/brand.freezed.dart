// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Brand {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandCopyWith<Brand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandCopyWith<$Res> {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) then) =
      _$BrandCopyWithImpl<$Res, Brand>;
  @useResult
  $Res call({int id, String name, String code});
}

/// @nodoc
class _$BrandCopyWithImpl<$Res, $Val extends Brand>
    implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? code = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BrandImplCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$$BrandImplCopyWith(
    _$BrandImpl value,
    $Res Function(_$BrandImpl) then,
  ) = __$$BrandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String code});
}

/// @nodoc
class __$$BrandImplCopyWithImpl<$Res>
    extends _$BrandCopyWithImpl<$Res, _$BrandImpl>
    implements _$$BrandImplCopyWith<$Res> {
  __$$BrandImplCopyWithImpl(
    _$BrandImpl _value,
    $Res Function(_$BrandImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? code = null}) {
    return _then(
      _$BrandImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$BrandImpl implements _Brand {
  const _$BrandImpl({required this.id, required this.name, required this.code});

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'Brand(id: $id, name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, code);

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandImplCopyWith<_$BrandImpl> get copyWith =>
      __$$BrandImplCopyWithImpl<_$BrandImpl>(this, _$identity);
}

abstract class _Brand implements Brand {
  const factory _Brand({
    required final int id,
    required final String name,
    required final String code,
  }) = _$BrandImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;

  /// Create a copy of Brand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandImplCopyWith<_$BrandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AgentBrand {
  int get agentId => throw _privateConstructorUsedError;
  bool get isAllBrands => throw _privateConstructorUsedError;
  List<Brand> get brands => throw _privateConstructorUsedError;

  /// Create a copy of AgentBrand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentBrandCopyWith<AgentBrand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentBrandCopyWith<$Res> {
  factory $AgentBrandCopyWith(
    AgentBrand value,
    $Res Function(AgentBrand) then,
  ) = _$AgentBrandCopyWithImpl<$Res, AgentBrand>;
  @useResult
  $Res call({int agentId, bool isAllBrands, List<Brand> brands});
}

/// @nodoc
class _$AgentBrandCopyWithImpl<$Res, $Val extends AgentBrand>
    implements $AgentBrandCopyWith<$Res> {
  _$AgentBrandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentBrand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? isAllBrands = null,
    Object? brands = null,
  }) {
    return _then(
      _value.copyWith(
            agentId: null == agentId
                ? _value.agentId
                : agentId // ignore: cast_nullable_to_non_nullable
                      as int,
            isAllBrands: null == isAllBrands
                ? _value.isAllBrands
                : isAllBrands // ignore: cast_nullable_to_non_nullable
                      as bool,
            brands: null == brands
                ? _value.brands
                : brands // ignore: cast_nullable_to_non_nullable
                      as List<Brand>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AgentBrandImplCopyWith<$Res>
    implements $AgentBrandCopyWith<$Res> {
  factory _$$AgentBrandImplCopyWith(
    _$AgentBrandImpl value,
    $Res Function(_$AgentBrandImpl) then,
  ) = __$$AgentBrandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int agentId, bool isAllBrands, List<Brand> brands});
}

/// @nodoc
class __$$AgentBrandImplCopyWithImpl<$Res>
    extends _$AgentBrandCopyWithImpl<$Res, _$AgentBrandImpl>
    implements _$$AgentBrandImplCopyWith<$Res> {
  __$$AgentBrandImplCopyWithImpl(
    _$AgentBrandImpl _value,
    $Res Function(_$AgentBrandImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AgentBrand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? isAllBrands = null,
    Object? brands = null,
  }) {
    return _then(
      _$AgentBrandImpl(
        agentId: null == agentId
            ? _value.agentId
            : agentId // ignore: cast_nullable_to_non_nullable
                  as int,
        isAllBrands: null == isAllBrands
            ? _value.isAllBrands
            : isAllBrands // ignore: cast_nullable_to_non_nullable
                  as bool,
        brands: null == brands
            ? _value._brands
            : brands // ignore: cast_nullable_to_non_nullable
                  as List<Brand>,
      ),
    );
  }
}

/// @nodoc

class _$AgentBrandImpl extends _AgentBrand {
  const _$AgentBrandImpl({
    required this.agentId,
    required this.isAllBrands,
    required final List<Brand> brands,
  }) : _brands = brands,
       super._();

  @override
  final int agentId;
  @override
  final bool isAllBrands;
  final List<Brand> _brands;
  @override
  List<Brand> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  String toString() {
    return 'AgentBrand(agentId: $agentId, isAllBrands: $isAllBrands, brands: $brands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentBrandImpl &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.isAllBrands, isAllBrands) ||
                other.isAllBrands == isAllBrands) &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    agentId,
    isAllBrands,
    const DeepCollectionEquality().hash(_brands),
  );

  /// Create a copy of AgentBrand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentBrandImplCopyWith<_$AgentBrandImpl> get copyWith =>
      __$$AgentBrandImplCopyWithImpl<_$AgentBrandImpl>(this, _$identity);
}

abstract class _AgentBrand extends AgentBrand {
  const factory _AgentBrand({
    required final int agentId,
    required final bool isAllBrands,
    required final List<Brand> brands,
  }) = _$AgentBrandImpl;
  const _AgentBrand._() : super._();

  @override
  int get agentId;
  @override
  bool get isAllBrands;
  @override
  List<Brand> get brands;

  /// Create a copy of AgentBrand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentBrandImplCopyWith<_$AgentBrandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerBrandAssignment {
  int? get customerId => throw _privateConstructorUsedError;
  String? get customerName => throw _privateConstructorUsedError;
  String? get customerCardCode => throw _privateConstructorUsedError;
  bool get isAllBrands => throw _privateConstructorUsedError;
  List<Brand> get brands => throw _privateConstructorUsedError;

  /// Create a copy of CustomerBrandAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerBrandAssignmentCopyWith<CustomerBrandAssignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerBrandAssignmentCopyWith<$Res> {
  factory $CustomerBrandAssignmentCopyWith(
    CustomerBrandAssignment value,
    $Res Function(CustomerBrandAssignment) then,
  ) = _$CustomerBrandAssignmentCopyWithImpl<$Res, CustomerBrandAssignment>;
  @useResult
  $Res call({
    int? customerId,
    String? customerName,
    String? customerCardCode,
    bool isAllBrands,
    List<Brand> brands,
  });
}

/// @nodoc
class _$CustomerBrandAssignmentCopyWithImpl<
  $Res,
  $Val extends CustomerBrandAssignment
>
    implements $CustomerBrandAssignmentCopyWith<$Res> {
  _$CustomerBrandAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerBrandAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? customerCardCode = freezed,
    Object? isAllBrands = null,
    Object? brands = null,
  }) {
    return _then(
      _value.copyWith(
            customerId: freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as int?,
            customerName: freezed == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            customerCardCode: freezed == customerCardCode
                ? _value.customerCardCode
                : customerCardCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            isAllBrands: null == isAllBrands
                ? _value.isAllBrands
                : isAllBrands // ignore: cast_nullable_to_non_nullable
                      as bool,
            brands: null == brands
                ? _value.brands
                : brands // ignore: cast_nullable_to_non_nullable
                      as List<Brand>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerBrandAssignmentImplCopyWith<$Res>
    implements $CustomerBrandAssignmentCopyWith<$Res> {
  factory _$$CustomerBrandAssignmentImplCopyWith(
    _$CustomerBrandAssignmentImpl value,
    $Res Function(_$CustomerBrandAssignmentImpl) then,
  ) = __$$CustomerBrandAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? customerId,
    String? customerName,
    String? customerCardCode,
    bool isAllBrands,
    List<Brand> brands,
  });
}

/// @nodoc
class __$$CustomerBrandAssignmentImplCopyWithImpl<$Res>
    extends
        _$CustomerBrandAssignmentCopyWithImpl<
          $Res,
          _$CustomerBrandAssignmentImpl
        >
    implements _$$CustomerBrandAssignmentImplCopyWith<$Res> {
  __$$CustomerBrandAssignmentImplCopyWithImpl(
    _$CustomerBrandAssignmentImpl _value,
    $Res Function(_$CustomerBrandAssignmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerBrandAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? customerCardCode = freezed,
    Object? isAllBrands = null,
    Object? brands = null,
  }) {
    return _then(
      _$CustomerBrandAssignmentImpl(
        customerId: freezed == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as int?,
        customerName: freezed == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        customerCardCode: freezed == customerCardCode
            ? _value.customerCardCode
            : customerCardCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        isAllBrands: null == isAllBrands
            ? _value.isAllBrands
            : isAllBrands // ignore: cast_nullable_to_non_nullable
                  as bool,
        brands: null == brands
            ? _value._brands
            : brands // ignore: cast_nullable_to_non_nullable
                  as List<Brand>,
      ),
    );
  }
}

/// @nodoc

class _$CustomerBrandAssignmentImpl extends _CustomerBrandAssignment {
  const _$CustomerBrandAssignmentImpl({
    this.customerId,
    this.customerName,
    this.customerCardCode,
    required this.isAllBrands,
    required final List<Brand> brands,
  }) : _brands = brands,
       super._();

  @override
  final int? customerId;
  @override
  final String? customerName;
  @override
  final String? customerCardCode;
  @override
  final bool isAllBrands;
  final List<Brand> _brands;
  @override
  List<Brand> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  String toString() {
    return 'CustomerBrandAssignment(customerId: $customerId, customerName: $customerName, customerCardCode: $customerCardCode, isAllBrands: $isAllBrands, brands: $brands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerBrandAssignmentImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerCardCode, customerCardCode) ||
                other.customerCardCode == customerCardCode) &&
            (identical(other.isAllBrands, isAllBrands) ||
                other.isAllBrands == isAllBrands) &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    customerId,
    customerName,
    customerCardCode,
    isAllBrands,
    const DeepCollectionEquality().hash(_brands),
  );

  /// Create a copy of CustomerBrandAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerBrandAssignmentImplCopyWith<_$CustomerBrandAssignmentImpl>
  get copyWith =>
      __$$CustomerBrandAssignmentImplCopyWithImpl<
        _$CustomerBrandAssignmentImpl
      >(this, _$identity);
}

abstract class _CustomerBrandAssignment extends CustomerBrandAssignment {
  const factory _CustomerBrandAssignment({
    final int? customerId,
    final String? customerName,
    final String? customerCardCode,
    required final bool isAllBrands,
    required final List<Brand> brands,
  }) = _$CustomerBrandAssignmentImpl;
  const _CustomerBrandAssignment._() : super._();

  @override
  int? get customerId;
  @override
  String? get customerName;
  @override
  String? get customerCardCode;
  @override
  bool get isAllBrands;
  @override
  List<Brand> get brands;

  /// Create a copy of CustomerBrandAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerBrandAssignmentImplCopyWith<_$CustomerBrandAssignmentImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AgentCustomerBrands {
  int get agentId => throw _privateConstructorUsedError;
  String get agentName => throw _privateConstructorUsedError;
  bool get hasGlobalAllBrands => throw _privateConstructorUsedError;
  List<CustomerBrandAssignment> get customerAssignments =>
      throw _privateConstructorUsedError;

  /// Create a copy of AgentCustomerBrands
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentCustomerBrandsCopyWith<AgentCustomerBrands> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentCustomerBrandsCopyWith<$Res> {
  factory $AgentCustomerBrandsCopyWith(
    AgentCustomerBrands value,
    $Res Function(AgentCustomerBrands) then,
  ) = _$AgentCustomerBrandsCopyWithImpl<$Res, AgentCustomerBrands>;
  @useResult
  $Res call({
    int agentId,
    String agentName,
    bool hasGlobalAllBrands,
    List<CustomerBrandAssignment> customerAssignments,
  });
}

/// @nodoc
class _$AgentCustomerBrandsCopyWithImpl<$Res, $Val extends AgentCustomerBrands>
    implements $AgentCustomerBrandsCopyWith<$Res> {
  _$AgentCustomerBrandsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentCustomerBrands
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? agentName = null,
    Object? hasGlobalAllBrands = null,
    Object? customerAssignments = null,
  }) {
    return _then(
      _value.copyWith(
            agentId: null == agentId
                ? _value.agentId
                : agentId // ignore: cast_nullable_to_non_nullable
                      as int,
            agentName: null == agentName
                ? _value.agentName
                : agentName // ignore: cast_nullable_to_non_nullable
                      as String,
            hasGlobalAllBrands: null == hasGlobalAllBrands
                ? _value.hasGlobalAllBrands
                : hasGlobalAllBrands // ignore: cast_nullable_to_non_nullable
                      as bool,
            customerAssignments: null == customerAssignments
                ? _value.customerAssignments
                : customerAssignments // ignore: cast_nullable_to_non_nullable
                      as List<CustomerBrandAssignment>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AgentCustomerBrandsImplCopyWith<$Res>
    implements $AgentCustomerBrandsCopyWith<$Res> {
  factory _$$AgentCustomerBrandsImplCopyWith(
    _$AgentCustomerBrandsImpl value,
    $Res Function(_$AgentCustomerBrandsImpl) then,
  ) = __$$AgentCustomerBrandsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int agentId,
    String agentName,
    bool hasGlobalAllBrands,
    List<CustomerBrandAssignment> customerAssignments,
  });
}

/// @nodoc
class __$$AgentCustomerBrandsImplCopyWithImpl<$Res>
    extends _$AgentCustomerBrandsCopyWithImpl<$Res, _$AgentCustomerBrandsImpl>
    implements _$$AgentCustomerBrandsImplCopyWith<$Res> {
  __$$AgentCustomerBrandsImplCopyWithImpl(
    _$AgentCustomerBrandsImpl _value,
    $Res Function(_$AgentCustomerBrandsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AgentCustomerBrands
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? agentName = null,
    Object? hasGlobalAllBrands = null,
    Object? customerAssignments = null,
  }) {
    return _then(
      _$AgentCustomerBrandsImpl(
        agentId: null == agentId
            ? _value.agentId
            : agentId // ignore: cast_nullable_to_non_nullable
                  as int,
        agentName: null == agentName
            ? _value.agentName
            : agentName // ignore: cast_nullable_to_non_nullable
                  as String,
        hasGlobalAllBrands: null == hasGlobalAllBrands
            ? _value.hasGlobalAllBrands
            : hasGlobalAllBrands // ignore: cast_nullable_to_non_nullable
                  as bool,
        customerAssignments: null == customerAssignments
            ? _value._customerAssignments
            : customerAssignments // ignore: cast_nullable_to_non_nullable
                  as List<CustomerBrandAssignment>,
      ),
    );
  }
}

/// @nodoc

class _$AgentCustomerBrandsImpl extends _AgentCustomerBrands {
  const _$AgentCustomerBrandsImpl({
    required this.agentId,
    required this.agentName,
    required this.hasGlobalAllBrands,
    required final List<CustomerBrandAssignment> customerAssignments,
  }) : _customerAssignments = customerAssignments,
       super._();

  @override
  final int agentId;
  @override
  final String agentName;
  @override
  final bool hasGlobalAllBrands;
  final List<CustomerBrandAssignment> _customerAssignments;
  @override
  List<CustomerBrandAssignment> get customerAssignments {
    if (_customerAssignments is EqualUnmodifiableListView)
      return _customerAssignments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerAssignments);
  }

  @override
  String toString() {
    return 'AgentCustomerBrands(agentId: $agentId, agentName: $agentName, hasGlobalAllBrands: $hasGlobalAllBrands, customerAssignments: $customerAssignments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentCustomerBrandsImpl &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.agentName, agentName) ||
                other.agentName == agentName) &&
            (identical(other.hasGlobalAllBrands, hasGlobalAllBrands) ||
                other.hasGlobalAllBrands == hasGlobalAllBrands) &&
            const DeepCollectionEquality().equals(
              other._customerAssignments,
              _customerAssignments,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    agentId,
    agentName,
    hasGlobalAllBrands,
    const DeepCollectionEquality().hash(_customerAssignments),
  );

  /// Create a copy of AgentCustomerBrands
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentCustomerBrandsImplCopyWith<_$AgentCustomerBrandsImpl> get copyWith =>
      __$$AgentCustomerBrandsImplCopyWithImpl<_$AgentCustomerBrandsImpl>(
        this,
        _$identity,
      );
}

abstract class _AgentCustomerBrands extends AgentCustomerBrands {
  const factory _AgentCustomerBrands({
    required final int agentId,
    required final String agentName,
    required final bool hasGlobalAllBrands,
    required final List<CustomerBrandAssignment> customerAssignments,
  }) = _$AgentCustomerBrandsImpl;
  const _AgentCustomerBrands._() : super._();

  @override
  int get agentId;
  @override
  String get agentName;
  @override
  bool get hasGlobalAllBrands;
  @override
  List<CustomerBrandAssignment> get customerAssignments;

  /// Create a copy of AgentCustomerBrands
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentCustomerBrandsImplCopyWith<_$AgentCustomerBrandsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
