import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../products/domain/entities/product.dart';
import '../../../products/presentation/providers/products_providers.dart';
import '../../../stock_take/domain/entities/entities.dart' show CustomerProduct;
import '../../../stock_take/presentation/providers/stock_take_providers.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../providers/usecase_providers.dart';

part 'sale_cart_controller.g.dart';

/// State for the in-progress "register sale" cart, before it's submitted
/// as a pending [DailySale].
class SaleCartState {
  final List<SaleCartItem> items;
  final String customerName;
  final String customerPhone;
  final bool isResolvingBarcode;
  final bool isSubmitting;
  final String? error;
  // Set alongside `error` when the failure is specifically the "complete
  // today's stock take first" 400 from POST /daily-sales — lets the screen
  // offer a "Go to Stock Take" action instead of just showing the message.
  final bool requiresStockTake;
  final DailySale? submittedSale;

  const SaleCartState({
    this.items = const [],
    this.customerName = '',
    this.customerPhone = '',
    this.isResolvingBarcode = false,
    this.isSubmitting = false,
    this.error,
    this.requiresStockTake = false,
    this.submittedSale,
  });

  bool get canSubmit =>
      items.isNotEmpty &&
      customerName.trim().isNotEmpty &&
      customerPhone.trim().isNotEmpty &&
      !isSubmitting;

  /// Sum of estimated line totals (VAT-inclusive). Items whose price
  /// couldn't be resolved contribute 0 — see [allPricesResolved].
  double get estimatedTotalWithVat =>
      items.fold(0.0, (sum, item) => sum + item.estimatedLineTotal);

  bool get allPricesResolved =>
      items.isNotEmpty && items.every((item) => item.hasEstimatedPrice);

  SaleCartState copyWith({
    List<SaleCartItem>? items,
    String? customerName,
    String? customerPhone,
    bool? isResolvingBarcode,
    bool? isSubmitting,
    String? error,
    bool clearError = false,
    bool requiresStockTake = false,
    DailySale? submittedSale,
  }) {
    return SaleCartState(
      items: items ?? this.items,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      isResolvingBarcode: isResolvingBarcode ?? this.isResolvingBarcode,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: clearError ? null : (error ?? this.error),
      requiresStockTake: clearError ? false : requiresStockTake,
      submittedSale: submittedSale ?? this.submittedSale,
    );
  }
}

/// Controller for building and submitting the register-sale cart.
///
/// Product resolution (barcode scan + search) reuses the stock_take
/// feature's outlet product catalogue (`GET /product-catalogue`, via
/// `stockTakeRepositoryProvider.getCustomerProducts`) rather than a second
/// product data path - outlet-scoped by numeric customer id, not cached,
/// and independent of any stock take session.
@riverpod
class SaleCartController extends _$SaleCartController {
  @override
  SaleCartState build() => const SaleCartState();

  /// Resolves a scanned barcode against the outlet's live catalogue
  /// (`GET /product-catalogue?customer_id=`) - not cached, and independent
  /// of any stock-take session.
  Future<void> addByBarcode(String barcode, int customerId) async {
    state = state.copyWith(isResolvingBarcode: true, clearError: true);

    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.getCustomerProducts(
      customerId,
      search: barcode,
    );

    result.fold(
      (failure) => state = state.copyWith(
        isResolvingBarcode: false,
        error: failure.displayMessage,
      ),
      (products) {
        final product = _matchBarcodeOrCode(products, barcode);
        if (product == null) {
          state = state.copyWith(
            isResolvingBarcode: false,
            error: "'$barcode' was not found in this outlet's catalogue",
          );
          return;
        }
        _mergeProduct(product);
        state = state.copyWith(isResolvingBarcode: false);
      },
    );
  }

  /// Prefers an exact barcode match, then an exact item-code match, since
  /// the backend's `search` is a fuzzy text match across multiple fields.
  CustomerProduct? _matchBarcodeOrCode(
    List<CustomerProduct> products,
    String code,
  ) {
    for (final product in products) {
      if (product.barcode?.toLowerCase() == code.toLowerCase()) {
        return product;
      }
    }
    for (final product in products) {
      if (product.itemCode.toLowerCase() == code.toLowerCase()) {
        return product;
      }
    }
    return products.isNotEmpty ? products.first : null;
  }

  void addProduct(CustomerProduct product) {
    _mergeProduct(product);
  }

  void _mergeProduct(CustomerProduct product) {
    final barcode = product.hasBarcode ? product.barcode! : product.itemCode;
    final existingIndex = state.items.indexWhere(
      (item) => item.barcode == barcode,
    );

    if (existingIndex != -1) {
      final updated = [...state.items];
      final existing = updated[existingIndex];
      updated[existingIndex] = existing.copyWith(
        quantity: existing.quantity + 1,
      );
      state = state.copyWith(items: updated, clearError: true);
      return;
    }

    state = state.copyWith(
      items: [
        ...state.items,
        SaleCartItem(
          barcode: barcode,
          productCode: product.itemCode,
          productName: product.itemName,
          modelNumber: product.modelNumber,
        ),
      ],
      clearError: true,
    );

    unawaited(_lookupEstimatedPrice(barcode: barcode, itemCode: product.itemCode));
  }

  /// Best-effort price lookup from the separate `/products` catalogue -
  /// the outlet catalogue used above has no price field. Runs in the
  /// background and patches the matching cart line if/when it resolves -
  /// never blocks adding a product to the cart, and silently gives up on
  /// failure (the item just shows "price confirmed at submission").
  Future<void> _lookupEstimatedPrice({
    required String barcode,
    required String itemCode,
  }) async {
    try {
      final datasource = ref.read(productsRemoteDataSourceProvider);
      final page = await datasource.fetchProducts(search: itemCode, size: 5);

      Product? match;
      for (final p in page.items) {
        if (p.code == itemCode || p.barcode == barcode) {
          match = p;
          break;
        }
      }
      if (match == null || match.unitPrice <= 0) return;

      final index = state.items.indexWhere((item) => item.barcode == barcode);
      if (index == -1) return;

      final updated = [...state.items];
      updated[index] = updated[index].copyWith(
        estimatedUnitPrice: match.unitPrice,
      );
      state = state.copyWith(items: updated);
    } catch (_) {
      // Best-effort only — leave the item without an estimated price.
    }
  }

  void updateQuantity(int index, int quantity) {
    if (index < 0 || index >= state.items.length || quantity < 1) return;
    final updated = [...state.items];
    updated[index] = updated[index].copyWith(quantity: quantity);
    state = state.copyWith(items: updated);
  }

  void removeItem(int index) {
    if (index < 0 || index >= state.items.length) return;
    final updated = [...state.items]..removeAt(index);
    state = state.copyWith(items: updated);
  }

  void setCustomer({String? name, String? phone}) {
    state = state.copyWith(customerName: name, customerPhone: phone);
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  Future<bool> submit() async {
    if (!state.canSubmit) return false;

    state = state.copyWith(isSubmitting: true, clearError: true);

    final usecase = await ref.read(registerDailySaleProvider.future);
    final result = await usecase(
      RegisterDailySaleParams(
        customerName: state.customerName.trim(),
        customerPhone: state.customerPhone.trim().isEmpty
            ? null
            : state.customerPhone.trim(),
        items: [
          for (final item in state.items)
            (barcode: item.barcode, quantity: item.quantity),
        ],
      ),
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          isSubmitting: false,
          error: failure.displayMessage,
          requiresStockTake: failure.displayMessage.toLowerCase().contains(
            'stock take',
          ),
        );
        return false;
      },
      (sale) {
        state = SaleCartState(submittedSale: sale);
        return true;
      },
    );
  }
}
