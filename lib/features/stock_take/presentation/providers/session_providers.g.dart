// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controller for paginated product catalogue with lazy loading

@ProviderFor(PaginatedCatalogueController)
const paginatedCatalogueControllerProvider =
    PaginatedCatalogueControllerProvider._();

/// Controller for paginated product catalogue with lazy loading
final class PaginatedCatalogueControllerProvider
    extends
        $NotifierProvider<
          PaginatedCatalogueController,
          PaginatedCatalogueState
        > {
  /// Controller for paginated product catalogue with lazy loading
  const PaginatedCatalogueControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paginatedCatalogueControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paginatedCatalogueControllerHash();

  @$internal
  @override
  PaginatedCatalogueController create() => PaginatedCatalogueController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaginatedCatalogueState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaginatedCatalogueState>(value),
    );
  }
}

String _$paginatedCatalogueControllerHash() =>
    r'9f3ccec72ede6e4e34495a75361e9831a1161aca';

/// Controller for paginated product catalogue with lazy loading

abstract class _$PaginatedCatalogueController
    extends $Notifier<PaginatedCatalogueState> {
  PaginatedCatalogueState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<PaginatedCatalogueState, PaginatedCatalogueState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaginatedCatalogueState, PaginatedCatalogueState>,
              PaginatedCatalogueState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Main controller for stock take session management

@ProviderFor(StockTakeSessionController)
const stockTakeSessionControllerProvider =
    StockTakeSessionControllerProvider._();

/// Main controller for stock take session management
final class StockTakeSessionControllerProvider
    extends
        $NotifierProvider<StockTakeSessionController, StockTakeSessionState> {
  /// Main controller for stock take session management
  const StockTakeSessionControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stockTakeSessionControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stockTakeSessionControllerHash();

  @$internal
  @override
  StockTakeSessionController create() => StockTakeSessionController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StockTakeSessionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StockTakeSessionState>(value),
    );
  }
}

String _$stockTakeSessionControllerHash() =>
    r'5bd7bd7a7caf79cfa9256204cd1f1ab8b3e73029';

/// Main controller for stock take session management

abstract class _$StockTakeSessionController
    extends $Notifier<StockTakeSessionState> {
  StockTakeSessionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<StockTakeSessionState, StockTakeSessionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StockTakeSessionState, StockTakeSessionState>,
              StockTakeSessionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Controller for serial number scanning and validation

@ProviderFor(SerialScanController)
const serialScanControllerProvider = SerialScanControllerFamily._();

/// Controller for serial number scanning and validation
final class SerialScanControllerProvider
    extends $NotifierProvider<SerialScanController, SerialScanState> {
  /// Controller for serial number scanning and validation
  const SerialScanControllerProvider._({
    required SerialScanControllerFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'serialScanControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$serialScanControllerHash();

  @override
  String toString() {
    return r'serialScanControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SerialScanController create() => SerialScanController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SerialScanState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SerialScanState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SerialScanControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$serialScanControllerHash() =>
    r'58d51c53a2918d3c0a402c44de925ca6d2037515';

/// Controller for serial number scanning and validation

final class SerialScanControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          SerialScanController,
          SerialScanState,
          SerialScanState,
          SerialScanState,
          (String, String)
        > {
  const SerialScanControllerFamily._()
    : super(
        retry: null,
        name: r'serialScanControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Controller for serial number scanning and validation

  SerialScanControllerProvider call(
    String sessionLocalId,
    String itemLocalId,
  ) => SerialScanControllerProvider._(
    argument: (sessionLocalId, itemLocalId),
    from: this,
  );

  @override
  String toString() => r'serialScanControllerProvider';
}

/// Controller for serial number scanning and validation

abstract class _$SerialScanController extends $Notifier<SerialScanState> {
  late final _$args = ref.$arg as (String, String);
  String get sessionLocalId => _$args.$1;
  String get itemLocalId => _$args.$2;

  SerialScanState build(String sessionLocalId, String itemLocalId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref = this.ref as $Ref<SerialScanState, SerialScanState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SerialScanState, SerialScanState>,
              SerialScanState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider for customer warehouses

@ProviderFor(customerWarehouses)
const customerWarehousesProvider = CustomerWarehousesFamily._();

/// Provider for customer warehouses

final class CustomerWarehousesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Warehouse>>,
          List<Warehouse>,
          FutureOr<List<Warehouse>>
        >
    with $FutureModifier<List<Warehouse>>, $FutureProvider<List<Warehouse>> {
  /// Provider for customer warehouses
  const CustomerWarehousesProvider._({
    required CustomerWarehousesFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'customerWarehousesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$customerWarehousesHash();

  @override
  String toString() {
    return r'customerWarehousesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Warehouse>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Warehouse>> create(Ref ref) {
    final argument = this.argument as int;
    return customerWarehouses(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerWarehousesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$customerWarehousesHash() =>
    r'47553bb83ba6c8aefaf032f390c799c0d1ba018e';

/// Provider for customer warehouses

final class CustomerWarehousesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Warehouse>>, int> {
  const CustomerWarehousesFamily._()
    : super(
        retry: null,
        name: r'customerWarehousesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for customer warehouses

  CustomerWarehousesProvider call(int customerId) =>
      CustomerWarehousesProvider._(argument: customerId, from: this);

  @override
  String toString() => r'customerWarehousesProvider';
}

/// Provider for customer products (for product selection)

@ProviderFor(customerProducts)
const customerProductsProvider = CustomerProductsFamily._();

/// Provider for customer products (for product selection)

final class CustomerProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CustomerProduct>>,
          List<CustomerProduct>,
          FutureOr<List<CustomerProduct>>
        >
    with
        $FutureModifier<List<CustomerProduct>>,
        $FutureProvider<List<CustomerProduct>> {
  /// Provider for customer products (for product selection)
  const CustomerProductsProvider._({
    required CustomerProductsFamily super.from,
    required (int, {int? brandId}) super.argument,
  }) : super(
         retry: null,
         name: r'customerProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$customerProductsHash();

  @override
  String toString() {
    return r'customerProductsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<CustomerProduct>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CustomerProduct>> create(Ref ref) {
    final argument = this.argument as (int, {int? brandId});
    return customerProducts(ref, argument.$1, brandId: argument.brandId);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerProductsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$customerProductsHash() => r'32126aed0b951cd5870f194d50efeca495877ca5';

/// Provider for customer products (for product selection)

final class CustomerProductsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CustomerProduct>>,
          (int, {int? brandId})
        > {
  const CustomerProductsFamily._()
    : super(
        retry: null,
        name: r'customerProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for customer products (for product selection)

  CustomerProductsProvider call(int customerId, {int? brandId}) =>
      CustomerProductsProvider._(
        argument: (customerId, brandId: brandId),
        from: this,
      );

  @override
  String toString() => r'customerProductsProvider';
}

/// Provider for active session catalogue products (includes barcode)
/// Use this when user has an active stock take session
/// NOTE: This endpoint automatically filters by the agent's assigned customer brands

@ProviderFor(activeSessionCatalogue)
const activeSessionCatalogueProvider = ActiveSessionCatalogueFamily._();

/// Provider for active session catalogue products (includes barcode)
/// Use this when user has an active stock take session
/// NOTE: This endpoint automatically filters by the agent's assigned customer brands

final class ActiveSessionCatalogueProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CustomerProduct>>,
          List<CustomerProduct>,
          FutureOr<List<CustomerProduct>>
        >
    with
        $FutureModifier<List<CustomerProduct>>,
        $FutureProvider<List<CustomerProduct>> {
  /// Provider for active session catalogue products (includes barcode)
  /// Use this when user has an active stock take session
  /// NOTE: This endpoint automatically filters by the agent's assigned customer brands
  const ActiveSessionCatalogueProvider._({
    required ActiveSessionCatalogueFamily super.from,
    required ({String? search, int? brandId}) super.argument,
  }) : super(
         retry: null,
         name: r'activeSessionCatalogueProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$activeSessionCatalogueHash();

  @override
  String toString() {
    return r'activeSessionCatalogueProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<CustomerProduct>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CustomerProduct>> create(Ref ref) {
    final argument = this.argument as ({String? search, int? brandId});
    return activeSessionCatalogue(
      ref,
      search: argument.search,
      brandId: argument.brandId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ActiveSessionCatalogueProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$activeSessionCatalogueHash() =>
    r'8905059af8256b74799fbaba06e0f4c6fe0039ae';

/// Provider for active session catalogue products (includes barcode)
/// Use this when user has an active stock take session
/// NOTE: This endpoint automatically filters by the agent's assigned customer brands

final class ActiveSessionCatalogueFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CustomerProduct>>,
          ({String? search, int? brandId})
        > {
  const ActiveSessionCatalogueFamily._()
    : super(
        retry: null,
        name: r'activeSessionCatalogueProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for active session catalogue products (includes barcode)
  /// Use this when user has an active stock take session
  /// NOTE: This endpoint automatically filters by the agent's assigned customer brands

  ActiveSessionCatalogueProvider call({String? search, int? brandId}) =>
      ActiveSessionCatalogueProvider._(
        argument: (search: search, brandId: brandId),
        from: this,
      );

  @override
  String toString() => r'activeSessionCatalogueProvider';
}

/// Provider for active session catalogue products filtered by agent's brands
/// This combines the catalogue with the agent's customer-specific brand assignments
/// to ensure only accessible products are shown.

@ProviderFor(activeSessionFilteredCatalogue)
const activeSessionFilteredCatalogueProvider =
    ActiveSessionFilteredCatalogueFamily._();

/// Provider for active session catalogue products filtered by agent's brands
/// This combines the catalogue with the agent's customer-specific brand assignments
/// to ensure only accessible products are shown.

final class ActiveSessionFilteredCatalogueProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CustomerProduct>>,
          List<CustomerProduct>,
          FutureOr<List<CustomerProduct>>
        >
    with
        $FutureModifier<List<CustomerProduct>>,
        $FutureProvider<List<CustomerProduct>> {
  /// Provider for active session catalogue products filtered by agent's brands
  /// This combines the catalogue with the agent's customer-specific brand assignments
  /// to ensure only accessible products are shown.
  const ActiveSessionFilteredCatalogueProvider._({
    required ActiveSessionFilteredCatalogueFamily super.from,
    required ({String? search, int? brandId}) super.argument,
  }) : super(
         retry: null,
         name: r'activeSessionFilteredCatalogueProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$activeSessionFilteredCatalogueHash();

  @override
  String toString() {
    return r'activeSessionFilteredCatalogueProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<CustomerProduct>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CustomerProduct>> create(Ref ref) {
    final argument = this.argument as ({String? search, int? brandId});
    return activeSessionFilteredCatalogue(
      ref,
      search: argument.search,
      brandId: argument.brandId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ActiveSessionFilteredCatalogueProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$activeSessionFilteredCatalogueHash() =>
    r'3b86d3141e73e6e944d45b790c30138d1ffbc3cd';

/// Provider for active session catalogue products filtered by agent's brands
/// This combines the catalogue with the agent's customer-specific brand assignments
/// to ensure only accessible products are shown.

final class ActiveSessionFilteredCatalogueFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<CustomerProduct>>,
          ({String? search, int? brandId})
        > {
  const ActiveSessionFilteredCatalogueFamily._()
    : super(
        retry: null,
        name: r'activeSessionFilteredCatalogueProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for active session catalogue products filtered by agent's brands
  /// This combines the catalogue with the agent's customer-specific brand assignments
  /// to ensure only accessible products are shown.

  ActiveSessionFilteredCatalogueProvider call({String? search, int? brandId}) =>
      ActiveSessionFilteredCatalogueProvider._(
        argument: (search: search, brandId: brandId),
        from: this,
      );

  @override
  String toString() => r'activeSessionFilteredCatalogueProvider';
}

/// Provider for agent brands (products)

@ProviderFor(agentBrands)
const agentBrandsProvider = AgentBrandsFamily._();

/// Provider for agent brands (products)

final class AgentBrandsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AgentBrand?>,
          AgentBrand?,
          FutureOr<AgentBrand?>
        >
    with $FutureModifier<AgentBrand?>, $FutureProvider<AgentBrand?> {
  /// Provider for agent brands (products)
  const AgentBrandsProvider._({
    required AgentBrandsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'agentBrandsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$agentBrandsHash();

  @override
  String toString() {
    return r'agentBrandsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AgentBrand?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AgentBrand?> create(Ref ref) {
    final argument = this.argument as int;
    return agentBrands(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AgentBrandsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$agentBrandsHash() => r'92adbb028736d4617683827d6978c06136858960';

/// Provider for agent brands (products)

final class AgentBrandsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AgentBrand?>, int> {
  const AgentBrandsFamily._()
    : super(
        retry: null,
        name: r'agentBrandsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for agent brands (products)

  AgentBrandsProvider call(int agentId) =>
      AgentBrandsProvider._(argument: agentId, from: this);

  @override
  String toString() => r'agentBrandsProvider';
}

/// Provider for current agent's global brands

@ProviderFor(myBrands)
const myBrandsProvider = MyBrandsProvider._();

/// Provider for current agent's global brands

final class MyBrandsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AgentBrand?>,
          AgentBrand?,
          FutureOr<AgentBrand?>
        >
    with $FutureModifier<AgentBrand?>, $FutureProvider<AgentBrand?> {
  /// Provider for current agent's global brands
  const MyBrandsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myBrandsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myBrandsHash();

  @$internal
  @override
  $FutureProviderElement<AgentBrand?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AgentBrand?> create(Ref ref) {
    return myBrands(ref);
  }
}

String _$myBrandsHash() => r'b2bd06d2b76ed4615604dfef9f41dfe6a87fb226';

/// Provider for agent's brands for the active stock count session

@ProviderFor(activeSessionBrands)
const activeSessionBrandsProvider = ActiveSessionBrandsProvider._();

/// Provider for agent's brands for the active stock count session

final class ActiveSessionBrandsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AgentBrand?>,
          AgentBrand?,
          FutureOr<AgentBrand?>
        >
    with $FutureModifier<AgentBrand?>, $FutureProvider<AgentBrand?> {
  /// Provider for agent's brands for the active stock count session
  const ActiveSessionBrandsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeSessionBrandsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeSessionBrandsHash();

  @$internal
  @override
  $FutureProviderElement<AgentBrand?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AgentBrand?> create(Ref ref) {
    return activeSessionBrands(ref);
  }
}

String _$activeSessionBrandsHash() =>
    r'c702411a6ed74aedc1b55b8fb6d18d2a4257cb27';

/// Provider for agent's customer-specific brands for the active stock count session

@ProviderFor(activeSessionCustomerBrands)
const activeSessionCustomerBrandsProvider =
    ActiveSessionCustomerBrandsProvider._();

/// Provider for agent's customer-specific brands for the active stock count session

final class ActiveSessionCustomerBrandsProvider
    extends
        $FunctionalProvider<
          AsyncValue<AgentCustomerBrands?>,
          AgentCustomerBrands?,
          FutureOr<AgentCustomerBrands?>
        >
    with
        $FutureModifier<AgentCustomerBrands?>,
        $FutureProvider<AgentCustomerBrands?> {
  /// Provider for agent's customer-specific brands for the active stock count session
  const ActiveSessionCustomerBrandsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeSessionCustomerBrandsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeSessionCustomerBrandsHash();

  @$internal
  @override
  $FutureProviderElement<AgentCustomerBrands?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AgentCustomerBrands?> create(Ref ref) {
    return activeSessionCustomerBrands(ref);
  }
}

String _$activeSessionCustomerBrandsHash() =>
    r'9d209e735df682ca853c38012251e64469f498d6';

/// Provider for agent's brands for a specific customer

@ProviderFor(myBrandsForCustomer)
const myBrandsForCustomerProvider = MyBrandsForCustomerFamily._();

/// Provider for agent's brands for a specific customer

final class MyBrandsForCustomerProvider
    extends
        $FunctionalProvider<
          AsyncValue<AgentCustomerBrands?>,
          AgentCustomerBrands?,
          FutureOr<AgentCustomerBrands?>
        >
    with
        $FutureModifier<AgentCustomerBrands?>,
        $FutureProvider<AgentCustomerBrands?> {
  /// Provider for agent's brands for a specific customer
  const MyBrandsForCustomerProvider._({
    required MyBrandsForCustomerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'myBrandsForCustomerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$myBrandsForCustomerHash();

  @override
  String toString() {
    return r'myBrandsForCustomerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AgentCustomerBrands?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AgentCustomerBrands?> create(Ref ref) {
    final argument = this.argument as int;
    return myBrandsForCustomer(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MyBrandsForCustomerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$myBrandsForCustomerHash() =>
    r'6d4c3d9fcd842321f1d744fb4ac876755e213ba3';

/// Provider for agent's brands for a specific customer

final class MyBrandsForCustomerFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AgentCustomerBrands?>, int> {
  const MyBrandsForCustomerFamily._()
    : super(
        retry: null,
        name: r'myBrandsForCustomerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for agent's brands for a specific customer

  MyBrandsForCustomerProvider call(int customerId) =>
      MyBrandsForCustomerProvider._(argument: customerId, from: this);

  @override
  String toString() => r'myBrandsForCustomerProvider';
}

/// Provider that returns the brand IDs the agent can access for the active session
/// Returns empty list if agent has access to all brands (no filtering needed)

@ProviderFor(activeSessionAccessibleBrandIds)
const activeSessionAccessibleBrandIdsProvider =
    ActiveSessionAccessibleBrandIdsProvider._();

/// Provider that returns the brand IDs the agent can access for the active session
/// Returns empty list if agent has access to all brands (no filtering needed)

final class ActiveSessionAccessibleBrandIdsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<int>>,
          List<int>,
          FutureOr<List<int>>
        >
    with $FutureModifier<List<int>>, $FutureProvider<List<int>> {
  /// Provider that returns the brand IDs the agent can access for the active session
  /// Returns empty list if agent has access to all brands (no filtering needed)
  const ActiveSessionAccessibleBrandIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeSessionAccessibleBrandIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeSessionAccessibleBrandIdsHash();

  @$internal
  @override
  $FutureProviderElement<List<int>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<int>> create(Ref ref) {
    return activeSessionAccessibleBrandIds(ref);
  }
}

String _$activeSessionAccessibleBrandIdsHash() =>
    r'd0824b9d2a05ec9e3c38ca75ee163f8d63e23b62';

/// Provider that returns whether brand filtering is needed for active session

@ProviderFor(shouldFilterBrandsBySession)
const shouldFilterBrandsBySessionProvider =
    ShouldFilterBrandsBySessionProvider._();

/// Provider that returns whether brand filtering is needed for active session

final class ShouldFilterBrandsBySessionProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Provider that returns whether brand filtering is needed for active session
  const ShouldFilterBrandsBySessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shouldFilterBrandsBySessionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shouldFilterBrandsBySessionHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return shouldFilterBrandsBySession(ref);
  }
}

String _$shouldFilterBrandsBySessionHash() =>
    r'ebd0e048ff7d57d66eaa8e3c5b7e891515c4e8f7';

/// Provider for finding a product by barcode against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend,
/// which is the sole source of truth for what's in scope for this session.

@ProviderFor(findProductByBarcode)
const findProductByBarcodeProvider = FindProductByBarcodeFamily._();

/// Provider for finding a product by barcode against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend,
/// which is the sole source of truth for what's in scope for this session.

final class FindProductByBarcodeProvider
    extends
        $FunctionalProvider<
          AsyncValue<CustomerProduct?>,
          CustomerProduct?,
          FutureOr<CustomerProduct?>
        >
    with $FutureModifier<CustomerProduct?>, $FutureProvider<CustomerProduct?> {
  /// Provider for finding a product by barcode against the live,
  /// session-scoped catalogue. Not cached locally - always hits the backend,
  /// which is the sole source of truth for what's in scope for this session.
  const FindProductByBarcodeProvider._({
    required FindProductByBarcodeFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'findProductByBarcodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$findProductByBarcodeHash();

  @override
  String toString() {
    return r'findProductByBarcodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CustomerProduct?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CustomerProduct?> create(Ref ref) {
    final argument = this.argument as String;
    return findProductByBarcode(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FindProductByBarcodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$findProductByBarcodeHash() =>
    r'8998fcd5985b52bac59902505019373eeecfd49e';

/// Provider for finding a product by barcode against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend,
/// which is the sole source of truth for what's in scope for this session.

final class FindProductByBarcodeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CustomerProduct?>, String> {
  const FindProductByBarcodeFamily._()
    : super(
        retry: null,
        name: r'findProductByBarcodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for finding a product by barcode against the live,
  /// session-scoped catalogue. Not cached locally - always hits the backend,
  /// which is the sole source of truth for what's in scope for this session.

  FindProductByBarcodeProvider call(String barcode) =>
      FindProductByBarcodeProvider._(argument: barcode, from: this);

  @override
  String toString() => r'findProductByBarcodeProvider';
}

/// Provider for searching products by search term against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend.

@ProviderFor(searchCatalogueProducts)
const searchCatalogueProductsProvider = SearchCatalogueProductsFamily._();

/// Provider for searching products by search term against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend.

final class SearchCatalogueProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CustomerProduct>>,
          List<CustomerProduct>,
          FutureOr<List<CustomerProduct>>
        >
    with
        $FutureModifier<List<CustomerProduct>>,
        $FutureProvider<List<CustomerProduct>> {
  /// Provider for searching products by search term against the live,
  /// session-scoped catalogue. Not cached locally - always hits the backend.
  const SearchCatalogueProductsProvider._({
    required SearchCatalogueProductsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchCatalogueProductsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchCatalogueProductsHash();

  @override
  String toString() {
    return r'searchCatalogueProductsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<CustomerProduct>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CustomerProduct>> create(Ref ref) {
    final argument = this.argument as String;
    return searchCatalogueProducts(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchCatalogueProductsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchCatalogueProductsHash() =>
    r'8831ab50126220f3db5f92673d24e7838ab08e2c';

/// Provider for searching products by search term against the live,
/// session-scoped catalogue. Not cached locally - always hits the backend.

final class SearchCatalogueProductsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<CustomerProduct>>, String> {
  const SearchCatalogueProductsFamily._()
    : super(
        retry: null,
        name: r'searchCatalogueProductsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for searching products by search term against the live,
  /// session-scoped catalogue. Not cached locally - always hits the backend.

  SearchCatalogueProductsProvider call(String searchTerm) =>
      SearchCatalogueProductsProvider._(argument: searchTerm, from: this);

  @override
  String toString() => r'searchCatalogueProductsProvider';
}
