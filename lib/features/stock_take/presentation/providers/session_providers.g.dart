// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customerWarehousesHash() =>
    r'47553bb83ba6c8aefaf032f390c799c0d1ba018e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provider for customer warehouses
///
/// Copied from [customerWarehouses].
@ProviderFor(customerWarehouses)
const customerWarehousesProvider = CustomerWarehousesFamily();

/// Provider for customer warehouses
///
/// Copied from [customerWarehouses].
class CustomerWarehousesFamily extends Family<AsyncValue<List<Warehouse>>> {
  /// Provider for customer warehouses
  ///
  /// Copied from [customerWarehouses].
  const CustomerWarehousesFamily();

  /// Provider for customer warehouses
  ///
  /// Copied from [customerWarehouses].
  CustomerWarehousesProvider call(int customerId) {
    return CustomerWarehousesProvider(customerId);
  }

  @override
  CustomerWarehousesProvider getProviderOverride(
    covariant CustomerWarehousesProvider provider,
  ) {
    return call(provider.customerId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'customerWarehousesProvider';
}

/// Provider for customer warehouses
///
/// Copied from [customerWarehouses].
class CustomerWarehousesProvider
    extends AutoDisposeFutureProvider<List<Warehouse>> {
  /// Provider for customer warehouses
  ///
  /// Copied from [customerWarehouses].
  CustomerWarehousesProvider(int customerId)
    : this._internal(
        (ref) => customerWarehouses(ref as CustomerWarehousesRef, customerId),
        from: customerWarehousesProvider,
        name: r'customerWarehousesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$customerWarehousesHash,
        dependencies: CustomerWarehousesFamily._dependencies,
        allTransitiveDependencies:
            CustomerWarehousesFamily._allTransitiveDependencies,
        customerId: customerId,
      );

  CustomerWarehousesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
  }) : super.internal();

  final int customerId;

  @override
  Override overrideWith(
    FutureOr<List<Warehouse>> Function(CustomerWarehousesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CustomerWarehousesProvider._internal(
        (ref) => create(ref as CustomerWarehousesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Warehouse>> createElement() {
    return _CustomerWarehousesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerWarehousesProvider &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CustomerWarehousesRef on AutoDisposeFutureProviderRef<List<Warehouse>> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _CustomerWarehousesProviderElement
    extends AutoDisposeFutureProviderElement<List<Warehouse>>
    with CustomerWarehousesRef {
  _CustomerWarehousesProviderElement(super.provider);

  @override
  int get customerId => (origin as CustomerWarehousesProvider).customerId;
}

String _$customerProductsHash() => r'32126aed0b951cd5870f194d50efeca495877ca5';

/// Provider for customer products (for product selection)
///
/// Copied from [customerProducts].
@ProviderFor(customerProducts)
const customerProductsProvider = CustomerProductsFamily();

/// Provider for customer products (for product selection)
///
/// Copied from [customerProducts].
class CustomerProductsFamily extends Family<AsyncValue<List<CustomerProduct>>> {
  /// Provider for customer products (for product selection)
  ///
  /// Copied from [customerProducts].
  const CustomerProductsFamily();

  /// Provider for customer products (for product selection)
  ///
  /// Copied from [customerProducts].
  CustomerProductsProvider call(int customerId, {int? brandId}) {
    return CustomerProductsProvider(customerId, brandId: brandId);
  }

  @override
  CustomerProductsProvider getProviderOverride(
    covariant CustomerProductsProvider provider,
  ) {
    return call(provider.customerId, brandId: provider.brandId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'customerProductsProvider';
}

/// Provider for customer products (for product selection)
///
/// Copied from [customerProducts].
class CustomerProductsProvider
    extends AutoDisposeFutureProvider<List<CustomerProduct>> {
  /// Provider for customer products (for product selection)
  ///
  /// Copied from [customerProducts].
  CustomerProductsProvider(int customerId, {int? brandId})
    : this._internal(
        (ref) => customerProducts(
          ref as CustomerProductsRef,
          customerId,
          brandId: brandId,
        ),
        from: customerProductsProvider,
        name: r'customerProductsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$customerProductsHash,
        dependencies: CustomerProductsFamily._dependencies,
        allTransitiveDependencies:
            CustomerProductsFamily._allTransitiveDependencies,
        customerId: customerId,
        brandId: brandId,
      );

  CustomerProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
    required this.brandId,
  }) : super.internal();

  final int customerId;
  final int? brandId;

  @override
  Override overrideWith(
    FutureOr<List<CustomerProduct>> Function(CustomerProductsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CustomerProductsProvider._internal(
        (ref) => create(ref as CustomerProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
        brandId: brandId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CustomerProduct>> createElement() {
    return _CustomerProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerProductsProvider &&
        other.customerId == customerId &&
        other.brandId == brandId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);
    hash = _SystemHash.combine(hash, brandId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CustomerProductsRef
    on AutoDisposeFutureProviderRef<List<CustomerProduct>> {
  /// The parameter `customerId` of this provider.
  int get customerId;

  /// The parameter `brandId` of this provider.
  int? get brandId;
}

class _CustomerProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<CustomerProduct>>
    with CustomerProductsRef {
  _CustomerProductsProviderElement(super.provider);

  @override
  int get customerId => (origin as CustomerProductsProvider).customerId;
  @override
  int? get brandId => (origin as CustomerProductsProvider).brandId;
}

String _$activeSessionCatalogueHash() =>
    r'8905059af8256b74799fbaba06e0f4c6fe0039ae';

/// Provider for active session catalogue products (includes barcode)
/// Use this when user has an active stock take session
/// NOTE: This endpoint automatically filters by the agent's assigned customer brands
///
/// Copied from [activeSessionCatalogue].
@ProviderFor(activeSessionCatalogue)
const activeSessionCatalogueProvider = ActiveSessionCatalogueFamily();

/// Provider for active session catalogue products (includes barcode)
/// Use this when user has an active stock take session
/// NOTE: This endpoint automatically filters by the agent's assigned customer brands
///
/// Copied from [activeSessionCatalogue].
class ActiveSessionCatalogueFamily
    extends Family<AsyncValue<List<CustomerProduct>>> {
  /// Provider for active session catalogue products (includes barcode)
  /// Use this when user has an active stock take session
  /// NOTE: This endpoint automatically filters by the agent's assigned customer brands
  ///
  /// Copied from [activeSessionCatalogue].
  const ActiveSessionCatalogueFamily();

  /// Provider for active session catalogue products (includes barcode)
  /// Use this when user has an active stock take session
  /// NOTE: This endpoint automatically filters by the agent's assigned customer brands
  ///
  /// Copied from [activeSessionCatalogue].
  ActiveSessionCatalogueProvider call({String? search, int? brandId}) {
    return ActiveSessionCatalogueProvider(search: search, brandId: brandId);
  }

  @override
  ActiveSessionCatalogueProvider getProviderOverride(
    covariant ActiveSessionCatalogueProvider provider,
  ) {
    return call(search: provider.search, brandId: provider.brandId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'activeSessionCatalogueProvider';
}

/// Provider for active session catalogue products (includes barcode)
/// Use this when user has an active stock take session
/// NOTE: This endpoint automatically filters by the agent's assigned customer brands
///
/// Copied from [activeSessionCatalogue].
class ActiveSessionCatalogueProvider
    extends AutoDisposeFutureProvider<List<CustomerProduct>> {
  /// Provider for active session catalogue products (includes barcode)
  /// Use this when user has an active stock take session
  /// NOTE: This endpoint automatically filters by the agent's assigned customer brands
  ///
  /// Copied from [activeSessionCatalogue].
  ActiveSessionCatalogueProvider({String? search, int? brandId})
    : this._internal(
        (ref) => activeSessionCatalogue(
          ref as ActiveSessionCatalogueRef,
          search: search,
          brandId: brandId,
        ),
        from: activeSessionCatalogueProvider,
        name: r'activeSessionCatalogueProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$activeSessionCatalogueHash,
        dependencies: ActiveSessionCatalogueFamily._dependencies,
        allTransitiveDependencies:
            ActiveSessionCatalogueFamily._allTransitiveDependencies,
        search: search,
        brandId: brandId,
      );

  ActiveSessionCatalogueProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
    required this.brandId,
  }) : super.internal();

  final String? search;
  final int? brandId;

  @override
  Override overrideWith(
    FutureOr<List<CustomerProduct>> Function(ActiveSessionCatalogueRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ActiveSessionCatalogueProvider._internal(
        (ref) => create(ref as ActiveSessionCatalogueRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
        brandId: brandId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CustomerProduct>> createElement() {
    return _ActiveSessionCatalogueProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActiveSessionCatalogueProvider &&
        other.search == search &&
        other.brandId == brandId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, brandId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ActiveSessionCatalogueRef
    on AutoDisposeFutureProviderRef<List<CustomerProduct>> {
  /// The parameter `search` of this provider.
  String? get search;

  /// The parameter `brandId` of this provider.
  int? get brandId;
}

class _ActiveSessionCatalogueProviderElement
    extends AutoDisposeFutureProviderElement<List<CustomerProduct>>
    with ActiveSessionCatalogueRef {
  _ActiveSessionCatalogueProviderElement(super.provider);

  @override
  String? get search => (origin as ActiveSessionCatalogueProvider).search;
  @override
  int? get brandId => (origin as ActiveSessionCatalogueProvider).brandId;
}

String _$activeSessionFilteredCatalogueHash() =>
    r'3b86d3141e73e6e944d45b790c30138d1ffbc3cd';

/// Provider for active session catalogue products filtered by agent's brands
/// This combines the catalogue with the agent's customer-specific brand assignments
/// to ensure only accessible products are shown.
///
/// Copied from [activeSessionFilteredCatalogue].
@ProviderFor(activeSessionFilteredCatalogue)
const activeSessionFilteredCatalogueProvider =
    ActiveSessionFilteredCatalogueFamily();

/// Provider for active session catalogue products filtered by agent's brands
/// This combines the catalogue with the agent's customer-specific brand assignments
/// to ensure only accessible products are shown.
///
/// Copied from [activeSessionFilteredCatalogue].
class ActiveSessionFilteredCatalogueFamily
    extends Family<AsyncValue<List<CustomerProduct>>> {
  /// Provider for active session catalogue products filtered by agent's brands
  /// This combines the catalogue with the agent's customer-specific brand assignments
  /// to ensure only accessible products are shown.
  ///
  /// Copied from [activeSessionFilteredCatalogue].
  const ActiveSessionFilteredCatalogueFamily();

  /// Provider for active session catalogue products filtered by agent's brands
  /// This combines the catalogue with the agent's customer-specific brand assignments
  /// to ensure only accessible products are shown.
  ///
  /// Copied from [activeSessionFilteredCatalogue].
  ActiveSessionFilteredCatalogueProvider call({String? search, int? brandId}) {
    return ActiveSessionFilteredCatalogueProvider(
      search: search,
      brandId: brandId,
    );
  }

  @override
  ActiveSessionFilteredCatalogueProvider getProviderOverride(
    covariant ActiveSessionFilteredCatalogueProvider provider,
  ) {
    return call(search: provider.search, brandId: provider.brandId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'activeSessionFilteredCatalogueProvider';
}

/// Provider for active session catalogue products filtered by agent's brands
/// This combines the catalogue with the agent's customer-specific brand assignments
/// to ensure only accessible products are shown.
///
/// Copied from [activeSessionFilteredCatalogue].
class ActiveSessionFilteredCatalogueProvider
    extends AutoDisposeFutureProvider<List<CustomerProduct>> {
  /// Provider for active session catalogue products filtered by agent's brands
  /// This combines the catalogue with the agent's customer-specific brand assignments
  /// to ensure only accessible products are shown.
  ///
  /// Copied from [activeSessionFilteredCatalogue].
  ActiveSessionFilteredCatalogueProvider({String? search, int? brandId})
    : this._internal(
        (ref) => activeSessionFilteredCatalogue(
          ref as ActiveSessionFilteredCatalogueRef,
          search: search,
          brandId: brandId,
        ),
        from: activeSessionFilteredCatalogueProvider,
        name: r'activeSessionFilteredCatalogueProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$activeSessionFilteredCatalogueHash,
        dependencies: ActiveSessionFilteredCatalogueFamily._dependencies,
        allTransitiveDependencies:
            ActiveSessionFilteredCatalogueFamily._allTransitiveDependencies,
        search: search,
        brandId: brandId,
      );

  ActiveSessionFilteredCatalogueProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
    required this.brandId,
  }) : super.internal();

  final String? search;
  final int? brandId;

  @override
  Override overrideWith(
    FutureOr<List<CustomerProduct>> Function(
      ActiveSessionFilteredCatalogueRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ActiveSessionFilteredCatalogueProvider._internal(
        (ref) => create(ref as ActiveSessionFilteredCatalogueRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
        brandId: brandId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CustomerProduct>> createElement() {
    return _ActiveSessionFilteredCatalogueProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActiveSessionFilteredCatalogueProvider &&
        other.search == search &&
        other.brandId == brandId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, brandId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ActiveSessionFilteredCatalogueRef
    on AutoDisposeFutureProviderRef<List<CustomerProduct>> {
  /// The parameter `search` of this provider.
  String? get search;

  /// The parameter `brandId` of this provider.
  int? get brandId;
}

class _ActiveSessionFilteredCatalogueProviderElement
    extends AutoDisposeFutureProviderElement<List<CustomerProduct>>
    with ActiveSessionFilteredCatalogueRef {
  _ActiveSessionFilteredCatalogueProviderElement(super.provider);

  @override
  String? get search =>
      (origin as ActiveSessionFilteredCatalogueProvider).search;
  @override
  int? get brandId =>
      (origin as ActiveSessionFilteredCatalogueProvider).brandId;
}

String _$agentBrandsHash() => r'92adbb028736d4617683827d6978c06136858960';

/// Provider for agent brands (products)
///
/// Copied from [agentBrands].
@ProviderFor(agentBrands)
const agentBrandsProvider = AgentBrandsFamily();

/// Provider for agent brands (products)
///
/// Copied from [agentBrands].
class AgentBrandsFamily extends Family<AsyncValue<AgentBrand?>> {
  /// Provider for agent brands (products)
  ///
  /// Copied from [agentBrands].
  const AgentBrandsFamily();

  /// Provider for agent brands (products)
  ///
  /// Copied from [agentBrands].
  AgentBrandsProvider call(int agentId) {
    return AgentBrandsProvider(agentId);
  }

  @override
  AgentBrandsProvider getProviderOverride(
    covariant AgentBrandsProvider provider,
  ) {
    return call(provider.agentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'agentBrandsProvider';
}

/// Provider for agent brands (products)
///
/// Copied from [agentBrands].
class AgentBrandsProvider extends AutoDisposeFutureProvider<AgentBrand?> {
  /// Provider for agent brands (products)
  ///
  /// Copied from [agentBrands].
  AgentBrandsProvider(int agentId)
    : this._internal(
        (ref) => agentBrands(ref as AgentBrandsRef, agentId),
        from: agentBrandsProvider,
        name: r'agentBrandsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$agentBrandsHash,
        dependencies: AgentBrandsFamily._dependencies,
        allTransitiveDependencies: AgentBrandsFamily._allTransitiveDependencies,
        agentId: agentId,
      );

  AgentBrandsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final int agentId;

  @override
  Override overrideWith(
    FutureOr<AgentBrand?> Function(AgentBrandsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AgentBrandsProvider._internal(
        (ref) => create(ref as AgentBrandsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AgentBrand?> createElement() {
    return _AgentBrandsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AgentBrandsProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AgentBrandsRef on AutoDisposeFutureProviderRef<AgentBrand?> {
  /// The parameter `agentId` of this provider.
  int get agentId;
}

class _AgentBrandsProviderElement
    extends AutoDisposeFutureProviderElement<AgentBrand?>
    with AgentBrandsRef {
  _AgentBrandsProviderElement(super.provider);

  @override
  int get agentId => (origin as AgentBrandsProvider).agentId;
}

String _$myBrandsHash() => r'b2bd06d2b76ed4615604dfef9f41dfe6a87fb226';

/// Provider for current agent's global brands
///
/// Copied from [myBrands].
@ProviderFor(myBrands)
final myBrandsProvider = AutoDisposeFutureProvider<AgentBrand?>.internal(
  myBrands,
  name: r'myBrandsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myBrandsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyBrandsRef = AutoDisposeFutureProviderRef<AgentBrand?>;
String _$activeSessionBrandsHash() =>
    r'c702411a6ed74aedc1b55b8fb6d18d2a4257cb27';

/// Provider for agent's brands for the active stock count session
///
/// Copied from [activeSessionBrands].
@ProviderFor(activeSessionBrands)
final activeSessionBrandsProvider =
    AutoDisposeFutureProvider<AgentBrand?>.internal(
      activeSessionBrands,
      name: r'activeSessionBrandsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activeSessionBrandsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveSessionBrandsRef = AutoDisposeFutureProviderRef<AgentBrand?>;
String _$activeSessionCustomerBrandsHash() =>
    r'9d209e735df682ca853c38012251e64469f498d6';

/// Provider for agent's customer-specific brands for the active stock count session
///
/// Copied from [activeSessionCustomerBrands].
@ProviderFor(activeSessionCustomerBrands)
final activeSessionCustomerBrandsProvider =
    AutoDisposeFutureProvider<AgentCustomerBrands?>.internal(
      activeSessionCustomerBrands,
      name: r'activeSessionCustomerBrandsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activeSessionCustomerBrandsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveSessionCustomerBrandsRef =
    AutoDisposeFutureProviderRef<AgentCustomerBrands?>;
String _$myBrandsForCustomerHash() =>
    r'6d4c3d9fcd842321f1d744fb4ac876755e213ba3';

/// Provider for agent's brands for a specific customer
///
/// Copied from [myBrandsForCustomer].
@ProviderFor(myBrandsForCustomer)
const myBrandsForCustomerProvider = MyBrandsForCustomerFamily();

/// Provider for agent's brands for a specific customer
///
/// Copied from [myBrandsForCustomer].
class MyBrandsForCustomerFamily
    extends Family<AsyncValue<AgentCustomerBrands?>> {
  /// Provider for agent's brands for a specific customer
  ///
  /// Copied from [myBrandsForCustomer].
  const MyBrandsForCustomerFamily();

  /// Provider for agent's brands for a specific customer
  ///
  /// Copied from [myBrandsForCustomer].
  MyBrandsForCustomerProvider call(int customerId) {
    return MyBrandsForCustomerProvider(customerId);
  }

  @override
  MyBrandsForCustomerProvider getProviderOverride(
    covariant MyBrandsForCustomerProvider provider,
  ) {
    return call(provider.customerId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'myBrandsForCustomerProvider';
}

/// Provider for agent's brands for a specific customer
///
/// Copied from [myBrandsForCustomer].
class MyBrandsForCustomerProvider
    extends AutoDisposeFutureProvider<AgentCustomerBrands?> {
  /// Provider for agent's brands for a specific customer
  ///
  /// Copied from [myBrandsForCustomer].
  MyBrandsForCustomerProvider(int customerId)
    : this._internal(
        (ref) => myBrandsForCustomer(ref as MyBrandsForCustomerRef, customerId),
        from: myBrandsForCustomerProvider,
        name: r'myBrandsForCustomerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$myBrandsForCustomerHash,
        dependencies: MyBrandsForCustomerFamily._dependencies,
        allTransitiveDependencies:
            MyBrandsForCustomerFamily._allTransitiveDependencies,
        customerId: customerId,
      );

  MyBrandsForCustomerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
  }) : super.internal();

  final int customerId;

  @override
  Override overrideWith(
    FutureOr<AgentCustomerBrands?> Function(MyBrandsForCustomerRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyBrandsForCustomerProvider._internal(
        (ref) => create(ref as MyBrandsForCustomerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AgentCustomerBrands?> createElement() {
    return _MyBrandsForCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyBrandsForCustomerProvider &&
        other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MyBrandsForCustomerRef
    on AutoDisposeFutureProviderRef<AgentCustomerBrands?> {
  /// The parameter `customerId` of this provider.
  int get customerId;
}

class _MyBrandsForCustomerProviderElement
    extends AutoDisposeFutureProviderElement<AgentCustomerBrands?>
    with MyBrandsForCustomerRef {
  _MyBrandsForCustomerProviderElement(super.provider);

  @override
  int get customerId => (origin as MyBrandsForCustomerProvider).customerId;
}

String _$activeSessionAccessibleBrandIdsHash() =>
    r'd0824b9d2a05ec9e3c38ca75ee163f8d63e23b62';

/// Provider that returns the brand IDs the agent can access for the active session
/// Returns empty list if agent has access to all brands (no filtering needed)
///
/// Copied from [activeSessionAccessibleBrandIds].
@ProviderFor(activeSessionAccessibleBrandIds)
final activeSessionAccessibleBrandIdsProvider =
    AutoDisposeFutureProvider<List<int>>.internal(
      activeSessionAccessibleBrandIds,
      name: r'activeSessionAccessibleBrandIdsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activeSessionAccessibleBrandIdsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveSessionAccessibleBrandIdsRef =
    AutoDisposeFutureProviderRef<List<int>>;
String _$shouldFilterBrandsBySessionHash() =>
    r'ebd0e048ff7d57d66eaa8e3c5b7e891515c4e8f7';

/// Provider that returns whether brand filtering is needed for active session
///
/// Copied from [shouldFilterBrandsBySession].
@ProviderFor(shouldFilterBrandsBySession)
final shouldFilterBrandsBySessionProvider =
    AutoDisposeFutureProvider<bool>.internal(
      shouldFilterBrandsBySession,
      name: r'shouldFilterBrandsBySessionProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$shouldFilterBrandsBySessionHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ShouldFilterBrandsBySessionRef = AutoDisposeFutureProviderRef<bool>;
String _$findProductByBarcodeHash() =>
    r'8998fcd5985b52bac59902505019373eeecfd49e';

/// Provider for finding a product by barcode against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend,
/// which is the sole source of truth for what's in scope for this session.
///
/// Copied from [findProductByBarcode].
@ProviderFor(findProductByBarcode)
const findProductByBarcodeProvider = FindProductByBarcodeFamily();

/// Provider for finding a product by barcode against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend,
/// which is the sole source of truth for what's in scope for this session.
///
/// Copied from [findProductByBarcode].
class FindProductByBarcodeFamily extends Family<AsyncValue<CustomerProduct?>> {
  /// Provider for finding a product by barcode against the live,
  /// session-scoped catalogue. Not cached locally - always hits the backend,
  /// which is the sole source of truth for what's in scope for this session.
  ///
  /// Copied from [findProductByBarcode].
  const FindProductByBarcodeFamily();

  /// Provider for finding a product by barcode against the live,
  /// session-scoped catalogue. Not cached locally - always hits the backend,
  /// which is the sole source of truth for what's in scope for this session.
  ///
  /// Copied from [findProductByBarcode].
  FindProductByBarcodeProvider call(String barcode) {
    return FindProductByBarcodeProvider(barcode);
  }

  @override
  FindProductByBarcodeProvider getProviderOverride(
    covariant FindProductByBarcodeProvider provider,
  ) {
    return call(provider.barcode);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findProductByBarcodeProvider';
}

/// Provider for finding a product by barcode against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend,
/// which is the sole source of truth for what's in scope for this session.
///
/// Copied from [findProductByBarcode].
class FindProductByBarcodeProvider
    extends AutoDisposeFutureProvider<CustomerProduct?> {
  /// Provider for finding a product by barcode against the live,
  /// session-scoped catalogue. Not cached locally - always hits the backend,
  /// which is the sole source of truth for what's in scope for this session.
  ///
  /// Copied from [findProductByBarcode].
  FindProductByBarcodeProvider(String barcode)
    : this._internal(
        (ref) => findProductByBarcode(ref as FindProductByBarcodeRef, barcode),
        from: findProductByBarcodeProvider,
        name: r'findProductByBarcodeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$findProductByBarcodeHash,
        dependencies: FindProductByBarcodeFamily._dependencies,
        allTransitiveDependencies:
            FindProductByBarcodeFamily._allTransitiveDependencies,
        barcode: barcode,
      );

  FindProductByBarcodeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.barcode,
  }) : super.internal();

  final String barcode;

  @override
  Override overrideWith(
    FutureOr<CustomerProduct?> Function(FindProductByBarcodeRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindProductByBarcodeProvider._internal(
        (ref) => create(ref as FindProductByBarcodeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        barcode: barcode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CustomerProduct?> createElement() {
    return _FindProductByBarcodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindProductByBarcodeProvider && other.barcode == barcode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, barcode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindProductByBarcodeRef
    on AutoDisposeFutureProviderRef<CustomerProduct?> {
  /// The parameter `barcode` of this provider.
  String get barcode;
}

class _FindProductByBarcodeProviderElement
    extends AutoDisposeFutureProviderElement<CustomerProduct?>
    with FindProductByBarcodeRef {
  _FindProductByBarcodeProviderElement(super.provider);

  @override
  String get barcode => (origin as FindProductByBarcodeProvider).barcode;
}

String _$searchCatalogueProductsHash() =>
    r'8831ab50126220f3db5f92673d24e7838ab08e2c';

/// Provider for searching products by search term against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend.
///
/// Copied from [searchCatalogueProducts].
@ProviderFor(searchCatalogueProducts)
const searchCatalogueProductsProvider = SearchCatalogueProductsFamily();

/// Provider for searching products by search term against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend.
///
/// Copied from [searchCatalogueProducts].
class SearchCatalogueProductsFamily
    extends Family<AsyncValue<List<CustomerProduct>>> {
  /// Provider for searching products by search term against the live,
  /// session-scoped catalogue. Not cached locally - always hits the backend.
  ///
  /// Copied from [searchCatalogueProducts].
  const SearchCatalogueProductsFamily();

  /// Provider for searching products by search term against the live,
  /// session-scoped catalogue. Not cached locally - always hits the backend.
  ///
  /// Copied from [searchCatalogueProducts].
  SearchCatalogueProductsProvider call(String searchTerm) {
    return SearchCatalogueProductsProvider(searchTerm);
  }

  @override
  SearchCatalogueProductsProvider getProviderOverride(
    covariant SearchCatalogueProductsProvider provider,
  ) {
    return call(provider.searchTerm);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchCatalogueProductsProvider';
}

/// Provider for searching products by search term against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend.
///
/// Copied from [searchCatalogueProducts].
class SearchCatalogueProductsProvider
    extends AutoDisposeFutureProvider<List<CustomerProduct>> {
  /// Provider for searching products by search term against the live,
  /// session-scoped catalogue. Not cached locally - always hits the backend.
  ///
  /// Copied from [searchCatalogueProducts].
  SearchCatalogueProductsProvider(String searchTerm)
    : this._internal(
        (ref) => searchCatalogueProducts(
          ref as SearchCatalogueProductsRef,
          searchTerm,
        ),
        from: searchCatalogueProductsProvider,
        name: r'searchCatalogueProductsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$searchCatalogueProductsHash,
        dependencies: SearchCatalogueProductsFamily._dependencies,
        allTransitiveDependencies:
            SearchCatalogueProductsFamily._allTransitiveDependencies,
        searchTerm: searchTerm,
      );

  SearchCatalogueProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchTerm,
  }) : super.internal();

  final String searchTerm;

  @override
  Override overrideWith(
    FutureOr<List<CustomerProduct>> Function(
      SearchCatalogueProductsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchCatalogueProductsProvider._internal(
        (ref) => create(ref as SearchCatalogueProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchTerm: searchTerm,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CustomerProduct>> createElement() {
    return _SearchCatalogueProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchCatalogueProductsProvider &&
        other.searchTerm == searchTerm;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchTerm.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchCatalogueProductsRef
    on AutoDisposeFutureProviderRef<List<CustomerProduct>> {
  /// The parameter `searchTerm` of this provider.
  String get searchTerm;
}

class _SearchCatalogueProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<CustomerProduct>>
    with SearchCatalogueProductsRef {
  _SearchCatalogueProductsProviderElement(super.provider);

  @override
  String get searchTerm =>
      (origin as SearchCatalogueProductsProvider).searchTerm;
}

String _$paginatedCatalogueControllerHash() =>
    r'9f3ccec72ede6e4e34495a75361e9831a1161aca';

/// Controller for paginated product catalogue with lazy loading
///
/// Copied from [PaginatedCatalogueController].
@ProviderFor(PaginatedCatalogueController)
final paginatedCatalogueControllerProvider =
    AutoDisposeNotifierProvider<
      PaginatedCatalogueController,
      PaginatedCatalogueState
    >.internal(
      PaginatedCatalogueController.new,
      name: r'paginatedCatalogueControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paginatedCatalogueControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PaginatedCatalogueController =
    AutoDisposeNotifier<PaginatedCatalogueState>;
String _$stockTakeSessionControllerHash() =>
    r'ec8562902dcdf41f38103b76b935b9b16cf455e8';

/// Main controller for stock take session management
///
/// Copied from [StockTakeSessionController].
@ProviderFor(StockTakeSessionController)
final stockTakeSessionControllerProvider =
    AutoDisposeNotifierProvider<
      StockTakeSessionController,
      StockTakeSessionState
    >.internal(
      StockTakeSessionController.new,
      name: r'stockTakeSessionControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$stockTakeSessionControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$StockTakeSessionController =
    AutoDisposeNotifier<StockTakeSessionState>;
String _$serialScanControllerHash() =>
    r'16817850f0bd2a3185d33f8b37fd7ef27dcd04c3';

abstract class _$SerialScanController
    extends BuildlessAutoDisposeNotifier<SerialScanState> {
  late final String sessionLocalId;
  late final String itemLocalId;

  SerialScanState build(String sessionLocalId, String itemLocalId);
}

/// Controller for serial number scanning and validation
///
/// Copied from [SerialScanController].
@ProviderFor(SerialScanController)
const serialScanControllerProvider = SerialScanControllerFamily();

/// Controller for serial number scanning and validation
///
/// Copied from [SerialScanController].
class SerialScanControllerFamily extends Family<SerialScanState> {
  /// Controller for serial number scanning and validation
  ///
  /// Copied from [SerialScanController].
  const SerialScanControllerFamily();

  /// Controller for serial number scanning and validation
  ///
  /// Copied from [SerialScanController].
  SerialScanControllerProvider call(String sessionLocalId, String itemLocalId) {
    return SerialScanControllerProvider(sessionLocalId, itemLocalId);
  }

  @override
  SerialScanControllerProvider getProviderOverride(
    covariant SerialScanControllerProvider provider,
  ) {
    return call(provider.sessionLocalId, provider.itemLocalId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'serialScanControllerProvider';
}

/// Controller for serial number scanning and validation
///
/// Copied from [SerialScanController].
class SerialScanControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<SerialScanController, SerialScanState> {
  /// Controller for serial number scanning and validation
  ///
  /// Copied from [SerialScanController].
  SerialScanControllerProvider(String sessionLocalId, String itemLocalId)
    : this._internal(
        () => SerialScanController()
          ..sessionLocalId = sessionLocalId
          ..itemLocalId = itemLocalId,
        from: serialScanControllerProvider,
        name: r'serialScanControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$serialScanControllerHash,
        dependencies: SerialScanControllerFamily._dependencies,
        allTransitiveDependencies:
            SerialScanControllerFamily._allTransitiveDependencies,
        sessionLocalId: sessionLocalId,
        itemLocalId: itemLocalId,
      );

  SerialScanControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionLocalId,
    required this.itemLocalId,
  }) : super.internal();

  final String sessionLocalId;
  final String itemLocalId;

  @override
  SerialScanState runNotifierBuild(covariant SerialScanController notifier) {
    return notifier.build(sessionLocalId, itemLocalId);
  }

  @override
  Override overrideWith(SerialScanController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SerialScanControllerProvider._internal(
        () => create()
          ..sessionLocalId = sessionLocalId
          ..itemLocalId = itemLocalId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionLocalId: sessionLocalId,
        itemLocalId: itemLocalId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SerialScanController, SerialScanState>
  createElement() {
    return _SerialScanControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SerialScanControllerProvider &&
        other.sessionLocalId == sessionLocalId &&
        other.itemLocalId == itemLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionLocalId.hashCode);
    hash = _SystemHash.combine(hash, itemLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SerialScanControllerRef
    on AutoDisposeNotifierProviderRef<SerialScanState> {
  /// The parameter `sessionLocalId` of this provider.
  String get sessionLocalId;

  /// The parameter `itemLocalId` of this provider.
  String get itemLocalId;
}

class _SerialScanControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          SerialScanController,
          SerialScanState
        >
    with SerialScanControllerRef {
  _SerialScanControllerProviderElement(super.provider);

  @override
  String get sessionLocalId =>
      (origin as SerialScanControllerProvider).sessionLocalId;
  @override
  String get itemLocalId =>
      (origin as SerialScanControllerProvider).itemLocalId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
