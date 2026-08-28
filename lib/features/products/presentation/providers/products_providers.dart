import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/failures.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../data/datasources/products_remote_datasource.dart';
import '../../domain/entities/product.dart';
import '../widgets/category_filter_sheet.dart';

/// Remote data source provider
final productsRemoteDataSourceProvider = Provider<ProductsRemoteDataSource>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  return ProductsRemoteDataSource(dio);
});

/// Per-warehouse stock breakdown for a single product, fetched on demand
/// when the product detail screen opens (the catalogue list endpoint
/// doesn't return stock levels at all).
final productStockProvider =
    FutureProvider.family<ProductStockDetail, String>((ref, itemCode) async {
      final dataSource = ref.watch(productsRemoteDataSourceProvider);
      try {
        return await dataSource.fetchProductStock(itemCode);
      } on NetworkException catch (e) {
        throw e.toFailure();
      }
    });

/// Stock-ageing buckets for a product at the rep's currently clocked-in
/// outlet. Requires an active visit — `card_code` is required server-side.
final stockAgeingProvider =
    FutureProvider.family<StockAgeingRow?, (String itemCode, String cardCode)>((
      ref,
      args,
    ) async {
      final dataSource = ref.watch(productsRemoteDataSourceProvider);
      try {
        return await dataSource.fetchStockAgeing(
          itemCode: args.$1,
          cardCode: args.$2,
        );
      } on NetworkException catch (e) {
        throw e.toFailure();
      }
    });

/// Current-year monthly sell-out history for a product at an outlet.
final sellOutHistoryProvider =
    FutureProvider.family<SellOutHistory, (String cardCode, String itemCode)>((
      ref,
      args,
    ) async {
      final dataSource = ref.watch(productsRemoteDataSourceProvider);
      try {
        return await dataSource.fetchSellOut(
          cardCode: args.$1,
          itemCode: args.$2,
          year: DateTime.now().year.toString(),
        );
      } on NetworkException catch (e) {
        throw e.toFailure();
      }
    });

/// Current month's sales target for a product at an outlet. Returns `null`
/// when the backend has no target row yet (404) rather than surfacing it as
/// an error.
final salesTargetProvider =
    FutureProvider.family<SalesTarget?, (String cardCode, String itemCode)>((
      ref,
      args,
    ) async {
      final dataSource = ref.watch(productsRemoteDataSourceProvider);
      try {
        return await dataSource.fetchSalesTarget(
          cardCode: args.$1,
          itemCode: args.$2,
        );
      } on NetworkException catch (e) {
        final failure = e.toFailure();
        if (failure is NotFoundFailure) return null;
        throw failure;
      }
    });

/// Every product's sales target for one outlet + period, optionally
/// narrowed by category/brand (resolved server-side).
typedef OutletSalesTargetsQuery = ({
  String cardCode,
  int year,
  int month,
  String? itemGroup1,
  String? itemGroup2,
  String? itemGroup3,
  String? brand,
});

final outletSalesTargetsProvider =
    FutureProvider.family<OutletSalesTargets, OutletSalesTargetsQuery>((
      ref,
      query,
    ) async {
      final dataSource = ref.watch(productsRemoteDataSourceProvider);
      try {
        return await dataSource.fetchOutletSalesTargets(
          cardCode: query.cardCode,
          year: query.year,
          month: query.month,
          itemGroup1: query.itemGroup1,
          itemGroup2: query.itemGroup2,
          itemGroup3: query.itemGroup3,
          brand: query.brand,
        );
      } on NetworkException catch (e) {
        throw e.toFailure();
      }
    });

/// Alternative/substitute products for a product, optionally scoped to the
/// rep's currently clocked-in outlet (`cardCode == null` still returns the
/// list, just without outlet-specific block/qty status resolved).
final alternativesProvider =
    FutureProvider.family<
      ProductAlternatives,
      (String itemCode, String? cardCode)
    >((ref, args) async {
      final dataSource = ref.watch(productsRemoteDataSourceProvider);
      try {
        return await dataSource.fetchAlternatives(
          itemCode: args.$1,
          cardCode: args.$2,
        );
      } on NetworkException catch (e) {
        throw e.toFailure();
      }
    });

/// Competitor SKUs mapped to a product (not outlet-scoped), paginated and
/// filterable by competitor brand/model — a single item can have 100+
/// competitor SKUs mapped, so this loads a page at a time rather than all
/// at once.
class CompetitorMappingsState {
  final List<CompetitorMapping> items;
  final bool isLoading;
  final bool hasMore;
  final int page;
  final String? error;
  final String modelQuery;
  final CompetitorBrand? brandFilter;

  const CompetitorMappingsState({
    this.items = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.page = 1,
    this.error,
    this.modelQuery = '',
    this.brandFilter,
  });

  CompetitorMappingsState copyWith({
    List<CompetitorMapping>? items,
    bool? isLoading,
    bool? hasMore,
    int? page,
    String? error,
    String? modelQuery,
    CompetitorBrand? brandFilter,
    bool clearBrandFilter = false,
  }) {
    return CompetitorMappingsState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      error: error,
      modelQuery: modelQuery ?? this.modelQuery,
      brandFilter: clearBrandFilter ? null : (brandFilter ?? this.brandFilter),
    );
  }
}

class CompetitorMappingsNotifier extends StateNotifier<CompetitorMappingsState> {
  final ProductsRemoteDataSource _dataSource;
  final String itemCode;

  CompetitorMappingsNotifier(this._dataSource, this.itemCode)
    : super(const CompetitorMappingsState()) {
    load(refresh: true);
  }

  Future<void> load({bool refresh = false}) async {
    if (state.isLoading) return;
    if (!refresh && !state.hasMore) return;

    final page = refresh ? 1 : state.page;
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await _dataSource.fetchCompetitorMappings(
        itemCode: itemCode,
        compBrand: state.brandFilter?.name,
        compModelNo: state.modelQuery.isEmpty ? null : state.modelQuery,
        page: page,
        size: 20,
      );

      final items = refresh
          ? result.items
          : [...state.items, ...result.items];

      state = state.copyWith(
        items: items,
        isLoading: false,
        hasMore: result.hasMore,
        page: page + 1,
      );
    } on NetworkException catch (e) {
      state = state.copyWith(isLoading: false, error: e.toFailure().displayMessage);
    }
  }

  Future<void> search(String query) async {
    state = state.copyWith(modelQuery: query, items: [], page: 1, hasMore: true);
    await load(refresh: true);
  }

  Future<void> setBrandFilter(CompetitorBrand? brand) async {
    state = state.copyWith(
      brandFilter: brand,
      clearBrandFilter: brand == null,
      items: [],
      page: 1,
      hasMore: true,
    );
    await load(refresh: true);
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoading) return;
    await load();
  }

  Future<void> refresh() => load(refresh: true);
}

final competitorMappingsControllerProvider = StateNotifierProvider.family<
  CompetitorMappingsNotifier,
  CompetitorMappingsState,
  String
>((ref, itemCode) {
  final dataSource = ref.watch(productsRemoteDataSourceProvider);
  return CompetitorMappingsNotifier(dataSource, itemCode);
});

/// Fixed competitor-brand pick-list for the "Add competitor SKU" form.
final competitorBrandsProvider = FutureProvider<List<CompetitorBrand>>((
  ref,
) async {
  final dataSource = ref.watch(productsRemoteDataSourceProvider);
  try {
    return await dataSource.fetchCompetitorBrands();
  } on NetworkException catch (e) {
    throw e.toFailure();
  }
});

/// Resolves a single [Product] by item code for the detail route.
///
/// Used only as a fallback when the detail screen is opened without the
/// `Product` already in hand — e.g. `extra` was lost because go_router had
/// to restore navigation state after Android reclaimed the app in the
/// background (arbitrary Dart objects passed as `extra` can't survive that
/// restore — see `/products/detail/:code` in router_provider.dart). Checks
/// the already-loaded catalogue page first before hitting the network.
final productByCodeProvider = FutureProvider.family<Product?, String>((
  ref,
  code,
) async {
  final cached = ref.read(productsProvider).products;
  for (final product in cached) {
    if (product.code == code) return product;
  }

  final dataSource = ref.watch(productsRemoteDataSourceProvider);
  try {
    final result = await dataSource.fetchProducts(search: code, size: 20);
    for (final product in result.items) {
      if (product.code == code) return product;
    }
    return null;
  } on NetworkException catch (e) {
    throw e.toFailure();
  }
});

/// Product catalogue list state with pagination and filters
class ProductsState {
  final List<Product> products;
  final bool isLoading;
  final bool hasMore;
  final int page;
  final String? error;
  final String searchQuery;
  final String? selectedItemGroup1;
  final String? selectedItemGroup2;
  final String? selectedItemGroup3;
  final String? selectedBrand;
  final List<String> availableCategories;
  final List<String> availableBrands;
  final List<ProductGroup> availableGroups;

  const ProductsState({
    this.products = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.page = 1,
    this.error,
    this.searchQuery = '',
    this.selectedItemGroup1,
    this.selectedItemGroup2,
    this.selectedItemGroup3,
    this.selectedBrand,
    this.availableCategories = const [],
    this.availableBrands = const [],
    this.availableGroups = const [],
  });

  bool get hasActiveFilters =>
      selectedItemGroup1 != null || selectedBrand != null;

  /// Breadcrumb label for the active category filter, e.g.
  /// "Air Conditioners › Split Type › 18000 BTU".
  String? get selectedCategoryLabel {
    if (selectedItemGroup1 == null) return null;
    return [selectedItemGroup1, selectedItemGroup2, selectedItemGroup3]
        .whereType<String>()
        .join(' › ');
  }

  ProductsState copyWith({
    List<Product>? products,
    bool? isLoading,
    bool? hasMore,
    int? page,
    String? error,
    String? searchQuery,
    String? selectedItemGroup1,
    String? selectedItemGroup2,
    String? selectedItemGroup3,
    String? selectedBrand,
    List<String>? availableCategories,
    List<String>? availableBrands,
    List<ProductGroup>? availableGroups,
    // The three group levels are always replaced together (never merged
    // field-by-field) whenever a category selection changes, so a picked
    // path can shrink from 3 levels back down to 1 or 0. Set this whenever
    // selectedItemGroupN (including null) should overwrite instead of
    // falling back to the current state.
    bool touchCategory = false,
    bool clearSelectedBrand = false,
  }) {
    return ProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedItemGroup1: touchCategory
          ? selectedItemGroup1
          : (selectedItemGroup1 ?? this.selectedItemGroup1),
      selectedItemGroup2: touchCategory
          ? selectedItemGroup2
          : (selectedItemGroup2 ?? this.selectedItemGroup2),
      selectedItemGroup3: touchCategory
          ? selectedItemGroup3
          : (selectedItemGroup3 ?? this.selectedItemGroup3),
      selectedBrand: clearSelectedBrand
          ? null
          : (selectedBrand ?? this.selectedBrand),
      availableCategories: availableCategories ?? this.availableCategories,
      availableBrands: availableBrands ?? this.availableBrands,
      availableGroups: availableGroups ?? this.availableGroups,
    );
  }
}

/// Product catalogue notifier with pagination, search, and category/brand
/// filtering
class ProductsNotifier extends StateNotifier<ProductsState> {
  final ProductsRemoteDataSource _dataSource;

  ProductsNotifier(this._dataSource) : super(const ProductsState()) {
    loadFilterOptions();
    loadProducts();
  }

  Future<void> loadFilterOptions() async {
    try {
      final options = await _dataSource.fetchFilterOptions();
      state = state.copyWith(
        availableCategories: options.categories,
        availableBrands: options.brands,
        availableGroups: options.groups,
      );
    } catch (_) {
      // Non-blocking: the filter sheet just stays empty if this fails
    }
  }

  Future<void> loadProducts({bool refresh = false}) async {
    if (state.isLoading) return;
    if (!refresh && !state.hasMore) return;

    final page = refresh ? 1 : state.page;
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _dataSource.fetchProducts(
        search: state.searchQuery.isEmpty ? null : state.searchQuery,
        itemGroup1: state.selectedItemGroup1,
        itemGroup2: state.selectedItemGroup2,
        itemGroup3: state.selectedItemGroup3,
        brand: state.selectedBrand,
        page: page,
        size: 20,
      );

      final products = refresh
          ? response.items
          : [...state.products, ...response.items];

      state = state.copyWith(
        products: products,
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
      products: [],
      page: 1,
      hasMore: true,
    );
    await loadProducts(refresh: true);
  }

  /// Clears the category filter (all three group levels) without touching
  /// brand or the search box.
  Future<void> clearCategory() async {
    if (state.selectedItemGroup1 == null) return;
    state = state.copyWith(
      touchCategory: true,
      products: [],
      page: 1,
      hasMore: true,
    );
    await loadProducts(refresh: true);
  }

  Future<void> setBrand(String? brand) async {
    final clear = brand == null || brand.isEmpty;
    if (state.selectedBrand == (clear ? null : brand)) return;
    state = state.copyWith(
      selectedBrand: clear ? null : brand,
      clearSelectedBrand: clear,
      products: [],
      page: 1,
      hasMore: true,
    );
    await loadProducts(refresh: true);
  }

  /// Applies a combined selection from the filter sheet in a single reload
  /// — `result.brand == null` leaves an already-selected brand untouched
  /// (e.g. picking a category doesn't clear it), but any category pick
  /// always replaces the full group1/2/3 path.
  Future<void> applyFilter(ProductFilterResult result) async {
    if (result.clear) {
      state = state.copyWith(
        touchCategory: true,
        clearSelectedBrand: true,
        searchQuery: '',
        products: [],
        page: 1,
        hasMore: true,
      );
      await loadProducts(refresh: true);
      return;
    }

    final touchesCategory = result.itemGroup1 != null;
    state = state.copyWith(
      touchCategory: touchesCategory,
      selectedItemGroup1: result.itemGroup1,
      selectedItemGroup2: result.itemGroup2,
      selectedItemGroup3: result.itemGroup3,
      selectedBrand: result.brand ?? state.selectedBrand,
      searchQuery: touchesCategory
          ? (result.modelSearch ?? '')
          : state.searchQuery,
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

  Future<void> refresh() async {
    state = state.copyWith(products: [], page: 1, hasMore: true);
    await loadProducts(refresh: true);
    await loadFilterOptions();
  }
}

final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) {
    final dataSource = ref.watch(productsRemoteDataSourceProvider);
    return ProductsNotifier(dataSource);
  },
);
