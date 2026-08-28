import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/sales_customer_remote_datasource.dart';
import '../../domain/entities/entities.dart';
import 'mock_data.dart';

// ============================================================================
// Customers (API-backed)
// ============================================================================

final _uuid = const Uuid();

/// Remote data source provider
final salesCustomerRemoteDataSourceProvider =
    Provider<SalesCustomerRemoteDataSource>((ref) {
      final dio = ref.watch(dioProvider);
      return SalesCustomerRemoteDataSource(dio);
    });

final salesWarehousesProvider = FutureProvider<List<SalesWarehouse>>((
  ref,
) async {
  final dataSource = ref.watch(salesCustomerRemoteDataSourceProvider);
  return dataSource.fetchWarehouses();
});

final salesTodayQuotationsProvider = FutureProvider<List<SalesQuotation>>((
  ref,
) async {
  final dataSource = ref.watch(salesCustomerRemoteDataSourceProvider);
  final filter = ref.watch(salesFilterProvider);
  final now = DateTime.now();
  final hasExplicitDateFilter =
      filter.fromDate != null || filter.toDate != null;
  final applyDefaultTodayWindow = !filter.isActive;

  final startOfDay = hasExplicitDateFilter
      ? filter.fromDate
      : (applyDefaultTodayWindow
            ? DateTime(now.year, now.month, now.day)
            : null);
  final endOfDay = hasExplicitDateFilter
      ? filter.toDate
      : (applyDefaultTodayWindow
            ? DateTime(now.year, now.month, now.day, 23, 59, 59)
            : null);

  final statusFilter = filter.quotationStatus?.name;
  final customerType = filter.customerType?.name;

  // GET /sales/quotations only returns warehouse_code, not a name — resolve
  // it against the warehouse list so the detail screen can show more than
  // a bare code.
  final warehouseNameByCode = <String, String>{
    for (final w in await ref.watch(salesWarehousesProvider.future))
      w.warehouseCode: w.warehouseName,
  };

  final response = await dataSource.fetchQuotations(
    dateFrom: startOfDay,
    dateTo: endOfDay,
    cardCode: filter.cardCode?.trim().isEmpty ?? true
        ? null
        : filter.cardCode?.trim(),
    status: statusFilter,
    customerType: customerType,
    page: 1,
    size: 100,
  );

  return response.items.map((item) {
    final customerType = item.customerType.toLowerCase() == 'credit'
        ? CustomerType.credit
        : CustomerType.cash;
    final createdAt = item.createdAt ?? now;
    final lineItems = item.items
        .map(
          (line) => OrderLineItem(
            localId: 'server-line-${line.id}',
            productId: line.id,
            productCode: line.itemCode,
            productName: line.itemName,
            modelNumber: line.modelNumber,
            uom: 'Unit',
            quantity: line.quantity.round(),
            unitPrice: line.unitPrice,
          ),
        )
        .toList();

    return SalesQuotation(
      localId: 'server-${item.id}',
      serverId: item.id,
      sapDocNum: item.sapDocNum,
      quotationNumber: item.sapDocNum > 0
          ? 'QT-${item.sapDocNum}'
          : 'QT-${item.id}',
      customerId: 0,
      customerCode: item.cardCode,
      customerName: item.cardName,
      customerType: customerType,
      lineItems: lineItems,
      lpoNumber: item.lpoNumber,
      warehouseCode: item.warehouseCode,
      warehouseName: warehouseNameByCode[item.warehouseCode],
      notes: null,
      status: SalesQuotationsNotifier.statusFromApi(item.status),
      validUntil: createdAt.add(const Duration(days: 14)),
      createdAt: createdAt,
      updatedAt: createdAt,
    );
  }).toList();
});

/// Customer list state with pagination
class SalesCustomersState {
  final List<SalesCustomer> customers;
  final bool isLoading;
  final bool hasMore;
  final int page;
  final String? error;
  final String searchQuery;

  const SalesCustomersState({
    this.customers = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.page = 1,
    this.error,
    this.searchQuery = '',
  });

  SalesCustomersState copyWith({
    List<SalesCustomer>? customers,
    bool? isLoading,
    bool? hasMore,
    int? page,
    String? error,
    String? searchQuery,
  }) {
    return SalesCustomersState(
      customers: customers ?? this.customers,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

/// Customer list notifier with pagination and search
class SalesCustomersNotifier extends StateNotifier<SalesCustomersState> {
  final SalesCustomerRemoteDataSource _dataSource;

  SalesCustomersNotifier(this._dataSource)
    : super(const SalesCustomersState()) {
    loadCustomers();
  }

  Future<void> loadCustomers({bool refresh = false}) async {
    if (state.isLoading) return;
    if (!refresh && !state.hasMore) return;

    final page = refresh ? 1 : state.page;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _dataSource.fetchCustomers(
        cardName: state.searchQuery.isNotEmpty ? state.searchQuery : null,
        page: page,
        size: 20,
      );

      final newCustomers = refresh
          ? response.items
          : [...state.customers, ...response.items];

      // Assign IDs based on index for now (backend may provide IDs later)
      final customersWithIds = newCustomers.asMap().entries.map((entry) {
        final customer = entry.value;
        return SalesCustomer(
          id: entry.key + 1,
          code: customer.code,
          name: customer.name,
          type: customer.type,
          creditLimit: customer.creditLimit,
          outstandingBalance: customer.outstandingBalance,
          availableCredit: customer.availableCredit,
          overCreditLimit: customer.overCreditLimit,
          canCreateDirectOrder: customer.canCreateDirectOrder,
          priceListNum: customer.priceListNum,
          currency: customer.currency,
          paymentGroupName: customer.paymentGroupName,
        );
      }).toList();

      state = state.copyWith(
        customers: customersWithIds,
        isLoading: false,
        hasMore: response.hasMore,
        page: page + 1,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> search(String query) async {
    state = state.copyWith(
      searchQuery: query,
      customers: [],
      page: 1,
      hasMore: true,
    );
    await loadCustomers(refresh: true);
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoading) return;
    await loadCustomers();
  }

  Future<void> refresh() async {
    state = state.copyWith(customers: [], page: 1, hasMore: true);
    await loadCustomers(refresh: true);
  }
}

final salesCustomersProvider =
    StateNotifierProvider<SalesCustomersNotifier, SalesCustomersState>((ref) {
      final dataSource = ref.watch(salesCustomerRemoteDataSourceProvider);
      return SalesCustomersNotifier(dataSource);
    });

/// Simple provider for backward compatibility (returns list)
final salesCustomersListProvider = Provider<List<SalesCustomer>>((ref) {
  return ref.watch(salesCustomersProvider).customers;
});

final salesProductsProvider = Provider<List<SalesProduct>>((ref) {
  return SalesOrderMockData.products;
});

class SalesProductsState {
  final List<SalesProduct> products;
  final bool isLoading;
  final bool hasMore;
  final int page;
  final String? error;
  final String searchQuery;
  final String? selectedBrand;
  final String? selectedCategory;
  final String modelQuery;
  final List<String> availableBrands;
  final List<String> availableCategories;
  final int maxPageSize;

  const SalesProductsState({
    this.products = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.page = 1,
    this.error,
    this.searchQuery = '',
    this.selectedBrand,
    this.selectedCategory,
    this.modelQuery = '',
    this.availableBrands = const [],
    this.availableCategories = const [],
    this.maxPageSize = 20,
  });

  SalesProductsState copyWith({
    List<SalesProduct>? products,
    bool? isLoading,
    bool? hasMore,
    int? page,
    String? error,
    String? searchQuery,
    String? selectedBrand,
    String? selectedCategory,
    String? modelQuery,
    List<String>? availableBrands,
    List<String>? availableCategories,
    int? maxPageSize,
    bool clearSelectedBrand = false,
    bool clearSelectedCategory = false,
  }) {
    return SalesProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedBrand: clearSelectedBrand
          ? null
          : (selectedBrand ?? this.selectedBrand),
      selectedCategory: clearSelectedCategory
          ? null
          : (selectedCategory ?? this.selectedCategory),
      modelQuery: modelQuery ?? this.modelQuery,
      availableBrands: availableBrands ?? this.availableBrands,
      availableCategories: availableCategories ?? this.availableCategories,
      maxPageSize: maxPageSize ?? this.maxPageSize,
    );
  }
}

class SalesProductsNotifier extends StateNotifier<SalesProductsState> {
  final SalesCustomerRemoteDataSource _dataSource;
  final String _cardCode;

  SalesProductsNotifier(this._dataSource, this._cardCode)
    : super(const SalesProductsState()) {
    loadFilterOptions();
    loadProducts();
  }

  Future<void> loadFilterOptions() async {
    try {
      final response = await _dataSource.fetchProductFilters(
        cardCode: _cardCode,
      );
      state = state.copyWith(
        availableBrands: response.brands,
        availableCategories: response.categories,
      );
    } catch (_) {
      // Non-blocking: keep existing options if filters endpoint fails
    }
  }

  Future<void> loadProducts({bool refresh = false}) async {
    if (state.isLoading) return;
    if (!refresh && !state.hasMore) return;

    final page = refresh ? 1 : state.page;
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _dataSource.fetchProducts(
        cardCode: _cardCode,
        search: state.searchQuery.isEmpty ? null : state.searchQuery,
        category: state.selectedCategory,
        brand: state.selectedBrand,
        page: page,
        size: refresh ? state.maxPageSize : 20,
      );

      final pageItems = response.items.asMap().entries.map((entry) {
        final p = entry.value;
        final stableId = (page - 1) * 20 + entry.key + 1;
        return SalesProduct(
          id: stableId,
          code: p.code,
          name: p.name,
          category: p.category,
          modelNumber: p.modelNumber,
          barcode: p.barcode,
          description: p.description,
          brand: p.brand,
          uom: p.uom,
          unitPrice: p.unitPrice,
          stockOnHand: p.stockOnHand,
        );
      }).toList();

      final products = refresh ? pageItems : [...state.products, ...pageItems];

      state = state.copyWith(
        products: products,
        isLoading: false,
        hasMore: response.hasMore,
        page: page + 1,
        maxPageSize: response.maxPageSize,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> search(String query) async {
    state = state.copyWith(
      searchQuery: query,
      products: [],
      page: 1,
      hasMore: true,
    );
    await loadProducts(refresh: true);
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoading) return;
    await loadProducts();
  }

  Future<void> setBrand(String? brand) async {
    state = state.copyWith(
      selectedBrand: (brand == null || brand.isEmpty) ? null : brand,
      clearSelectedBrand: brand == null || brand.isEmpty,
      products: [],
      page: 1,
      hasMore: true,
    );
    await loadProducts(refresh: true);
  }

  Future<void> setCategory(String? category) async {
    state = state.copyWith(
      selectedCategory: (category == null || category.isEmpty)
          ? null
          : category,
      clearSelectedCategory: category == null || category.isEmpty,
      products: [],
      page: 1,
      hasMore: true,
    );
    await loadProducts(refresh: true);
  }

  void setModelQuery(String query) {
    state = state.copyWith(modelQuery: query);
  }
}

final salesProductsByCardCodeProvider =
    StateNotifierProvider.family<
      SalesProductsNotifier,
      SalesProductsState,
      String
    >((ref, cardCode) {
      final dataSource = ref.watch(salesCustomerRemoteDataSourceProvider);
      return SalesProductsNotifier(dataSource, cardCode);
    });

final customerByIdProvider = Provider.family<SalesCustomer?, int>((ref, id) {
  return ref
      .watch(salesCustomersListProvider)
      .where((c) => c.id == id)
      .firstOrNull;
});

// ============================================================================
// Sales Orders
// ============================================================================

class SalesOrdersNotifier extends StateNotifier<List<SalesOrder>> {
  SalesOrdersNotifier() : super(const []);

  String _newOrderNumber() {
    final year = DateTime.now().year;
    final n = state.length + 1;
    return 'SO-$year-${n.toString().padLeft(4, '0')}';
  }

  SalesOrder create({
    required SalesCustomer customer,
    required List<OrderLineItem> items,
    double taxPercent = 16,
    double additionalDiscountPercent = 0,
    String? lpoNumber,
    String? warehouseCode,
    String? warehouseName,
    String? notes,
    PaymentMethod? paymentMethod,
    String? paymentReference,
    String? fromQuotationLocalId,
    SalesOrderStatus status = SalesOrderStatus.pending,
    int? serverId,
    int? sapDocNum,
  }) {
    final now = DateTime.now();
    final order = SalesOrder(
      localId: _uuid.v4(),
      serverId: serverId,
      sapDocNum: sapDocNum,
      orderNumber: _newOrderNumber(),
      customerId: customer.id,
      customerCode: customer.code,
      customerName: customer.name,
      customerType: customer.type,
      lineItems: items,
      taxPercent: taxPercent,
      additionalDiscountPercent: additionalDiscountPercent,
      lpoNumber: lpoNumber,
      warehouseCode: warehouseCode,
      warehouseName: warehouseName,
      notes: notes,
      status: status,
      quotationLocalId: fromQuotationLocalId,
      paymentMethod: paymentMethod,
      paymentReference: paymentReference,
      createdAt: now,
      updatedAt: now,
    );
    state = [order, ...state];
    return order;
  }

  void update(SalesOrder order) {
    state = [
      for (final o in state)
        if (o.localId == order.localId) order else o,
    ];
  }

  void remove(String localId) {
    state = state.where((o) => o.localId != localId).toList();
  }

  SalesOrder? byId(String localId) =>
      state.where((o) => o.localId == localId).firstOrNull;
}

final salesOrdersProvider =
    StateNotifierProvider<SalesOrdersNotifier, List<SalesOrder>>(
      (ref) => SalesOrdersNotifier(),
    );

final salesOrderByIdProvider = Provider.family<SalesOrder?, String>((
  ref,
  localId,
) {
  return ref
      .watch(salesOrdersProvider)
      .where((o) => o.localId == localId)
      .firstOrNull;
});

// ============================================================================
// Sales Quotations
// ============================================================================

class SalesQuotationsNotifier extends StateNotifier<List<SalesQuotation>> {
  SalesQuotationsNotifier() : super(const []);

  static QuotationStatus statusFromApi(String status) {
    switch (status.toLowerCase()) {
      case 'sent':
        return QuotationStatus.sent;
      case 'accepted':
        return QuotationStatus.accepted;
      case 'converted':
        return QuotationStatus.converted;
      case 'expired':
        return QuotationStatus.expired;
      case 'cancelled':
      case 'canceled':
        return QuotationStatus.cancelled;
      default:
        return QuotationStatus.draft;
    }
  }

  String _newQuotationNumber() {
    final year = DateTime.now().year;
    final n = state.length + 1;
    return 'QT-$year-${n.toString().padLeft(4, '0')}';
  }

  SalesQuotation create({
    required SalesCustomer customer,
    required List<OrderLineItem> items,
    double taxPercent = 16,
    double additionalDiscountPercent = 0,
    String? lpoNumber,
    String? warehouseCode,
    String? warehouseName,
    String? notes,
    int? serverId,
    int? sapDocNum,
    DateTime? validUntil,
    QuotationStatus status = QuotationStatus.draft,
  }) {
    final now = DateTime.now();
    final quotation = SalesQuotation(
      localId: _uuid.v4(),
      serverId: serverId,
      sapDocNum: sapDocNum,
      quotationNumber: _newQuotationNumber(),
      customerId: customer.id,
      customerCode: customer.code,
      customerName: customer.name,
      customerType: customer.type,
      lineItems: items,
      taxPercent: taxPercent,
      additionalDiscountPercent: additionalDiscountPercent,
      lpoNumber: lpoNumber,
      warehouseCode: warehouseCode,
      warehouseName: warehouseName,
      notes: notes,
      status: status,
      validUntil: validUntil ?? now.add(const Duration(days: 14)),
      createdAt: now,
      updatedAt: now,
    );
    state = [quotation, ...state];
    return quotation;
  }

  void update(SalesQuotation quotation) {
    state = [
      for (final q in state)
        if (q.localId == quotation.localId) quotation else q,
    ];
  }

  void remove(String localId) {
    state = state.where((q) => q.localId != localId).toList();
  }

  SalesQuotation? byId(String localId) =>
      state.where((q) => q.localId == localId).firstOrNull;
}

final salesQuotationsProvider =
    StateNotifierProvider<SalesQuotationsNotifier, List<SalesQuotation>>(
      (ref) => SalesQuotationsNotifier(),
    );

final salesQuotationByIdProvider = Provider.family<SalesQuotation?, String>((
  ref,
  localId,
) {
  return ref
      .watch(salesQuotationsProvider)
      .where((q) => q.localId == localId)
      .firstOrNull;
});

// ============================================================================
// Draft builder (shared between order + quotation creation screens)
// ============================================================================

enum SalesDocumentKind { order, quotation }

class SalesDraft {
  final SalesDocumentKind kind;
  final SalesCustomer customer;
  final List<OrderLineItem> items;
  final double taxPercent;
  final double additionalDiscountPercent;
  final String notes;
  final DateTime? validUntil;

  const SalesDraft({
    required this.kind,
    required this.customer,
    this.items = const [],
    this.taxPercent = 16,
    this.additionalDiscountPercent = 0,
    this.notes = '',
    this.validUntil,
  });

  double get subtotal => items.fold(0, (s, i) => s + i.total);
  double get discountAmount => subtotal * (additionalDiscountPercent / 100);

  /// Prices are VAT-exclusive, so the taxable amount is just the
  /// discounted subtotal.
  double get taxableAmount => subtotal - discountAmount;

  /// VAT added on top of the VAT-exclusive discounted subtotal.
  double get taxAmount => taxableAmount * (taxPercent / 100);

  /// Final payable amount: discounted subtotal plus VAT.
  double get total => taxableAmount + taxAmount;
  int get totalQuantity => items.fold(0, (s, i) => s + i.quantity);

  SalesDraft copyWith({
    List<OrderLineItem>? items,
    double? taxPercent,
    double? additionalDiscountPercent,
    String? notes,
    DateTime? validUntil,
  }) => SalesDraft(
    kind: kind,
    customer: customer,
    items: items ?? this.items,
    taxPercent: taxPercent ?? this.taxPercent,
    additionalDiscountPercent:
        additionalDiscountPercent ?? this.additionalDiscountPercent,
    notes: notes ?? this.notes,
    validUntil: validUntil ?? this.validUntil,
  );
}

class SalesDraftNotifier extends StateNotifier<SalesDraft> {
  SalesDraftNotifier(super.state);

  void addProduct(SalesProduct product, {int quantity = 1}) {
    // Match by the real item code, not SalesProduct.id — that id is just
    // a position within the current search's results page ((page-1)*20 +
    // index + 1), recomputed from scratch on every new search. Two
    // different products from different searches can land on the same
    // position and thus the same id, which previously caused adding a new
    // product to silently bump the quantity of an unrelated earlier one.
    final existing = state.items
        .where((i) => i.productCode == product.code)
        .firstOrNull;
    if (existing != null) {
      updateQuantity(existing.localId, existing.quantity + quantity);
      return;
    }
    final item = OrderLineItem.fromProduct(
      localId: _uuid.v4(),
      product: product,
      quantity: quantity,
    );
    state = state.copyWith(items: [...state.items, item]);
  }

  void updateQuantity(String localId, int quantity) {
    if (quantity <= 0) {
      removeItem(localId);
      return;
    }
    state = state.copyWith(
      items: [
        for (final i in state.items)
          if (i.localId == localId) i.copyWith(quantity: quantity) else i,
      ],
    );
  }

  void updateDiscount(String localId, double percent) {
    state = state.copyWith(
      items: [
        for (final i in state.items)
          if (i.localId == localId)
            i.copyWith(discountPercent: percent.clamp(0, 100))
          else
            i,
      ],
    );
  }

  void updateUnitPrice(String localId, double price) {
    state = state.copyWith(
      items: [
        for (final i in state.items)
          if (i.localId == localId) i.copyWith(unitPrice: price) else i,
      ],
    );
  }

  void removeItem(String localId) {
    state = state.copyWith(
      items: state.items.where((i) => i.localId != localId).toList(),
    );
  }

  void setTaxPercent(double v) => state = state.copyWith(taxPercent: v);
  void setDiscountPercent(double v) =>
      state = state.copyWith(additionalDiscountPercent: v);
  void setNotes(String v) => state = state.copyWith(notes: v);
  void setValidUntil(DateTime v) => state = state.copyWith(validUntil: v);
}

/// Family provider so multiple in-flight drafts don't collide.
final salesDraftProvider =
    StateNotifierProvider.family<SalesDraftNotifier, SalesDraft, SalesDraft>(
      (ref, initial) => SalesDraftNotifier(initial),
    );

// ============================================================================
// Filters for the Sales list screens
// ============================================================================

class SalesFilter {
  final String search;
  final String? cardCode;
  final CustomerType? customerType;
  final SalesOrderStatus? orderStatus;
  final QuotationStatus? quotationStatus;
  final DateTime? fromDate;
  final DateTime? toDate;

  const SalesFilter({
    this.search = '',
    this.cardCode,
    this.customerType,
    this.orderStatus,
    this.quotationStatus,
    this.fromDate,
    this.toDate,
  });

  bool get isActive =>
      search.isNotEmpty ||
      (cardCode != null && cardCode!.trim().isNotEmpty) ||
      customerType != null ||
      orderStatus != null ||
      quotationStatus != null ||
      fromDate != null ||
      toDate != null;

  SalesFilter copyWith({
    String? search,
    String? cardCode,
    CustomerType? customerType,
    SalesOrderStatus? orderStatus,
    QuotationStatus? quotationStatus,
    DateTime? fromDate,
    DateTime? toDate,
    bool clearCustomerType = false,
    bool clearCardCode = false,
    bool clearOrderStatus = false,
    bool clearQuotationStatus = false,
    bool clearFromDate = false,
    bool clearToDate = false,
  }) => SalesFilter(
    search: search ?? this.search,
    cardCode: clearCardCode ? null : (cardCode ?? this.cardCode),
    customerType: clearCustomerType
        ? null
        : (customerType ?? this.customerType),
    orderStatus: clearOrderStatus ? null : (orderStatus ?? this.orderStatus),
    quotationStatus: clearQuotationStatus
        ? null
        : (quotationStatus ?? this.quotationStatus),
    fromDate: clearFromDate ? null : (fromDate ?? this.fromDate),
    toDate: clearToDate ? null : (toDate ?? this.toDate),
  );
}

class SalesFilterNotifier extends StateNotifier<SalesFilter> {
  SalesFilterNotifier() : super(const SalesFilter());

  void setSearch(String v) => state = state.copyWith(search: v);
  void setCardCode(String? v) => state = (v == null || v.trim().isEmpty)
      ? state.copyWith(clearCardCode: true)
      : state.copyWith(cardCode: v.trim());
  void setCustomerType(CustomerType? v) => state = v == null
      ? state.copyWith(clearCustomerType: true)
      : state.copyWith(customerType: v);
  void setOrderStatus(SalesOrderStatus? v) => state = v == null
      ? state.copyWith(clearOrderStatus: true)
      : state.copyWith(orderStatus: v);
  void setQuotationStatus(QuotationStatus? v) => state = v == null
      ? state.copyWith(clearQuotationStatus: true)
      : state.copyWith(quotationStatus: v);
  void setFromDate(DateTime? v) => state = v == null
      ? state.copyWith(clearFromDate: true)
      : state.copyWith(fromDate: v);
  void setToDate(DateTime? v) => state = v == null
      ? state.copyWith(clearToDate: true)
      : state.copyWith(toDate: v);
  void clear() => state = const SalesFilter();
}

final salesFilterProvider =
    StateNotifierProvider<SalesFilterNotifier, SalesFilter>(
      (ref) => SalesFilterNotifier(),
    );

/// Orders filtered by the current [salesFilterProvider].
final filteredSalesOrdersProvider = Provider<List<SalesOrder>>((ref) {
  final orders = ref.watch(salesOrdersProvider);
  final f = ref.watch(salesFilterProvider);
  final q = f.search.trim().toLowerCase();

  return orders.where((o) {
    if (q.isNotEmpty) {
      final hit =
          o.orderNumber.toLowerCase().contains(q) ||
          o.customerName.toLowerCase().contains(q) ||
          o.customerCode.toLowerCase().contains(q);
      if (!hit) return false;
    }
    if (f.customerType != null && o.customerType != f.customerType) {
      return false;
    }
    if (f.orderStatus != null && o.status != f.orderStatus) return false;
    if (f.fromDate != null && o.createdAt.isBefore(f.fromDate!)) return false;
    if (f.toDate != null &&
        o.createdAt.isAfter(f.toDate!.add(const Duration(days: 1)))) {
      return false;
    }
    return true;
  }).toList();
});

/// Quotations filtered by the current [salesFilterProvider].
final filteredSalesQuotationsProvider = Provider<List<SalesQuotation>>((ref) {
  final quotations = ref.watch(salesQuotationsProvider);
  final f = ref.watch(salesFilterProvider);
  final q = f.search.trim().toLowerCase();

  return quotations.where((qt) {
    if (q.isNotEmpty) {
      final hit =
          qt.quotationNumber.toLowerCase().contains(q) ||
          qt.customerName.toLowerCase().contains(q) ||
          qt.customerCode.toLowerCase().contains(q);
      if (!hit) return false;
    }
    if (f.customerType != null && qt.customerType != f.customerType) {
      return false;
    }
    if (f.quotationStatus != null && qt.status != f.quotationStatus) {
      return false;
    }
    if (f.fromDate != null && qt.createdAt.isBefore(f.fromDate!)) return false;
    if (f.toDate != null &&
        qt.createdAt.isAfter(f.toDate!.add(const Duration(days: 1)))) {
      return false;
    }
    return true;
  }).toList();
});
