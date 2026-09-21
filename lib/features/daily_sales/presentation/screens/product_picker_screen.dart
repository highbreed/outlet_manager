import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../stock_take/domain/entities/entities.dart' show CustomerProduct;
import '../../../stock_take/presentation/providers/stock_take_providers.dart';
import '../../../stock_take/presentation/screens/barcode_scanner_screen.dart';

/// Full-screen product picker for Daily Sales' register-sale flow.
///
/// Replaces an in-line dropdown search, which doesn't scale to a catalogue
/// of 100,000+ products - this pushes a dedicated page instead, mirroring
/// the stock-take feature's product picker (search + barcode scan +
/// infinite-scroll results). Backed by the outlet's own catalogue
/// (`GET /product-catalogue?customer_id=`), not the global `/products`
/// browser - scoped by numeric [customerId]. Pops with the selected
/// [CustomerProduct], or `null` if the user backs out without picking one.
class ProductPickerScreen extends ConsumerStatefulWidget {
  final int customerId;

  const ProductPickerScreen({super.key, required this.customerId});

  @override
  ConsumerState<ProductPickerScreen> createState() =>
      _ProductPickerScreenState();
}

class _ProductPickerScreenState extends ConsumerState<ProductPickerScreen> {
  static const _pageSize = 50;

  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounceTimer;

  final List<CustomerProduct> _products = [];
  int _page = 1;
  bool _hasMore = true;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _isResolvingBarcode = false;
  String? _error;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);
    _load(refresh: true);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 400), () {
      final newQuery = _searchController.text.trim();
      if (newQuery == _query) return;
      _query = newQuery;
      _load(refresh: true);
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  Future<void> _load({required bool refresh}) async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
      _error = null;
      if (refresh) {
        _products.clear();
        _page = 1;
        _hasMore = true;
      }
    });

    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final result = await repository.getCustomerProducts(
      widget.customerId,
      search: _query.isEmpty ? null : _query,
      page: _page,
      size: _pageSize,
    );
    if (!mounted) return;

    result.fold(
      (failure) => setState(() {
        _isLoading = false;
        _error = failure.displayMessage;
      }),
      (products) => setState(() {
        _products.addAll(products);
        // No total-count in this response shape - a short page means
        // there's nothing left to fetch.
        _hasMore = products.length == _pageSize;
        _page++;
        _isLoading = false;
      }),
    );
  }

  Future<void> _loadMore() async {
    if (!_hasMore || _isLoading || _isLoadingMore) return;
    setState(() => _isLoadingMore = true);
    await _load(refresh: false);
    if (mounted) setState(() => _isLoadingMore = false);
  }

  Future<void> _scanBarcode() async {
    final result = await Navigator.of(context).push<BarcodeScanResult>(
      MaterialPageRoute(
        builder: (_) => const BarcodeScannerScreen(
          title: 'Scan Product Barcode',
          singleScan: true,
          hintText: 'Align the product barcode within the frame',
        ),
      ),
    );
    if (result == null || !mounted) return;

    HapticFeedback.mediumImpact();
    final barcode = result.barcode.trim();

    setState(() => _isResolvingBarcode = true);
    final repository = await ref.read(stockTakeRepositoryProvider.future);
    final response = await repository.getCustomerProducts(
      widget.customerId,
      search: barcode,
      size: _pageSize,
    );
    if (!mounted) return;

    response.fold(
      (failure) {
        setState(() => _isResolvingBarcode = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.displayMessage)),
        );
      },
      (products) {
        final match = _matchBarcodeOrCode(products, barcode);
        if (match != null) {
          Navigator.pop(context, match);
          return;
        }
        setState(() => _isResolvingBarcode = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("'$barcode' was not found in this outlet's catalogue"),
            backgroundColor: kWarningColor,
          ),
        );
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

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: kBackground,
        body: Column(
          children: [
            _PickerHeader(
              searchController: _searchController,
              enabled: !_isResolvingBarcode,
              isScanning: _isResolvingBarcode,
              onScan: _isResolvingBarcode ? null : _scanBarcode,
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SafeArea(top: false, child: _buildContent()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading && _products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null && _products.isEmpty) {
      return _buildErrorState(_error!);
    }
    if (_products.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () => _load(refresh: true),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        itemCount: _products.length + (_isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= _products.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final product = _products[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _ProductCard(
              product: product,
              onTap: () => Navigator.pop(context, product),
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: kRedColor),
            const SizedBox(height: 16),
            Text(error, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            SecondaryButton(
              label: 'Retry',
              expand: false,
              onPressed: () => _load(refresh: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 56, color: kTextFaint),
            const SizedBox(height: 16),
            const Text(
              'No Products Found',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              _query.isNotEmpty
                  ? 'No matches for "$_query"'
                  : 'Try a search term or scan a barcode',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: kTextMuted),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────────────────

class _PickerHeader extends StatelessWidget {
  final TextEditingController searchController;
  final bool enabled;
  final bool isScanning;
  final VoidCallback? onScan;
  final VoidCallback onBack;

  const _PickerHeader({
    required this.searchController,
    required this.enabled,
    required this.isScanning,
    required this.onScan,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;

    return Container(
      width: double.infinity,
      color: kTextDark,
      padding: EdgeInsets.fromLTRB(20, topInset + 8, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onBack,
                child: const Icon(
                  Icons.arrow_back,
                  color: kTextLight,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Select Product',
                style: TextStyle(
                  color: kTextLight,
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            height: 56,
            padding: const EdgeInsets.only(left: 14, right: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, size: 18, color: kTextFaint),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    enabled: enabled,
                    autofocus: true,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: kTextDark,
                    style: const TextStyle(color: kTextDark, fontSize: 15),
                    decoration: const InputDecoration(
                      hintText: 'Search by name, model number or code',
                      hintStyle: TextStyle(color: kTextFaint, fontSize: 15),
                      border: InputBorder.none,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: onScan,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: isScanning
                        ? const Padding(
                            padding: EdgeInsets.all(12),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: kTextLight,
                            ),
                          )
                        : const Icon(
                            Icons.qr_code_scanner,
                            color: kTextLight,
                            size: 19,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Product card
// ─────────────────────────────────────────────────────────────────────────

class _ProductCard extends StatelessWidget {
  final CustomerProduct product;
  final VoidCallback onTap;

  const _ProductCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final subtitleParts = <String>[
      product.itemCode,
      if (product.modelNumber != null) product.modelNumber!,
      product.brandName,
    ];

    return Material(
      color: kPrimaryLightColor,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: kBorderColor),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: kBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.inventory_2_outlined,
                  color: kTextFaint,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.itemName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitleParts.join(' · '),
                      style: const TextStyle(fontSize: 11, color: kTextFaint),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: kSecondaryLightColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: kSecondaryColor, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
