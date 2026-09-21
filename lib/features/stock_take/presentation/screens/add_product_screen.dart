import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../providers/session_providers.dart';
import 'barcode_scanner_screen.dart';

/// Screen to add a product to the stock take session
/// Features:
/// - Initial load of 200 products
/// - Lazy loading as user scrolls
/// - Local filtering while typing
/// - Backend search when local results are empty
/// - Barcode scanning with backend lookup
/// - Brand filter pills (client-side, over the already-loaded catalogue —
///   there's no reliable per-product "assigned brand" access-flag wired
///   into this screen's data source, so this is a plain filter, not a
///   permission indicator like the mock's greyed-out state implies)
class AddProductScreen extends ConsumerStatefulWidget {
  final String sessionLocalId;
  final int customerId;

  const AddProductScreen({
    super.key,
    required this.sessionLocalId,
    required this.customerId,
  });

  @override
  ConsumerState<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends ConsumerState<AddProductScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  String _localFilterQuery = '';
  String? _selectedBrand;
  bool _isAddingProduct = false;
  String? _error;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    final newQuery = _searchController.text.trim();

    setState(() {
      _localFilterQuery = newQuery.toLowerCase();
    });

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      final catalogueState = ref.read(paginatedCatalogueControllerProvider);
      if (newQuery.length >= 3 && newQuery != catalogueState.searchQuery) {
        ref
            .read(paginatedCatalogueControllerProvider.notifier)
            .search(newQuery);
      } else if (newQuery.isEmpty && catalogueState.searchQuery != null) {
        ref.read(paginatedCatalogueControllerProvider.notifier).search('');
      }
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(paginatedCatalogueControllerProvider.notifier).loadMore();
    }
  }

  List<CustomerProduct> _filterProductsLocally(List<CustomerProduct> products) {
    var filtered = products;

    if (_selectedBrand != null) {
      filtered = filtered.where((p) => p.brandName == _selectedBrand).toList();
    }

    if (_localFilterQuery.isEmpty) return filtered;

    return filtered.where((p) {
      return p.itemName.toLowerCase().contains(_localFilterQuery) ||
          p.brandName.toLowerCase().contains(_localFilterQuery) ||
          p.itemCode.toLowerCase().contains(_localFilterQuery) ||
          (p.barcode?.toLowerCase().contains(_localFilterQuery) ?? false) ||
          (p.itemDescription?.toLowerCase().contains(_localFilterQuery) ??
              false) ||
          (p.modelNumber?.toLowerCase().contains(_localFilterQuery) ?? false);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final catalogueState = ref.watch(paginatedCatalogueControllerProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: kBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              searchController: _searchController,
              enabled: !_isAddingProduct,
              onScan: _isAddingProduct ? null : _scanBarcode,
              onBack: () => context.pop(),
            ),
            _BrandPillRow(
              brands: _brandNames(catalogueState.products),
              selected: _selectedBrand,
              onSelect: (brand) => setState(() => _selectedBrand = brand),
            ),
            Expanded(
              child: SafeArea(top: false, child: _buildContent(catalogueState)),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _brandNames(List<CustomerProduct> products) {
    final names = products.map((p) => p.brandName).toSet().toList()..sort();
    return names;
  }

  Widget _buildContent(PaginatedCatalogueState catalogueState) {
    final filteredProducts = _filterProductsLocally(catalogueState.products);

    return Column(
      children: [
        if (_error != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            decoration: BoxDecoration(
              color: kRedColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.error_outline, color: kRedColor, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _error!,
                    style: const TextStyle(color: kRedColor, fontSize: 12),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _error = null),
                  child: const Icon(Icons.close, size: 18, color: kRedColor),
                ),
              ],
            ),
          ),

        Expanded(
          child: _isAddingProduct
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(
                        'Adding product...',
                        style: TextStyle(color: kTextMuted),
                      ),
                    ],
                  ),
                )
              : catalogueState.isLoading
              ? const Center(child: CircularProgressIndicator())
              : catalogueState.error != null && catalogueState.products.isEmpty
              ? _buildErrorState(catalogueState.error!)
              : catalogueState.products.isEmpty
              ? _buildNoProductsState()
              : filteredProducts.isEmpty
              ? _buildEmptySearchState()
              : _buildProductList(filteredProducts, catalogueState),
        ),
      ],
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
            Text(
              'Failed to load products: $error',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SecondaryButton(
              label: 'Retry',
              expand: false,
              onPressed: () {
                ref
                    .read(paginatedCatalogueControllerProvider.notifier)
                    .refresh();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoProductsState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined, size: 56, color: kTextFaint),
            SizedBox(height: 16),
            Text(
              'No Products Available',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 8),
            Text(
              'No products are assigned to this customer',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptySearchState() {
    final catalogueState = ref.read(paginatedCatalogueControllerProvider);

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
              _localFilterQuery.isNotEmpty
                  ? 'No matches for "$_localFilterQuery"'
                  : 'Try a different search term or scan a barcode',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: kTextMuted),
            ),
            if (_localFilterQuery.isNotEmpty &&
                (catalogueState.hasMore ||
                    catalogueState.searchQuery != _localFilterQuery)) ...[
              const SizedBox(height: 20),
              catalogueState.isLoading
                  ? const CircularProgressIndicator()
                  : SecondaryButton(
                      label: 'Search Online',
                      leadingIcon: Icons.cloud_download_outlined,
                      expand: false,
                      onPressed: () {
                        ref
                            .read(paginatedCatalogueControllerProvider.notifier)
                            .search(_localFilterQuery);
                      },
                    ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(
    List<CustomerProduct> products,
    PaginatedCatalogueState catalogueState,
  ) {
    final Map<String, List<CustomerProduct>> groupedProducts = {};
    for (final product in products) {
      groupedProducts.putIfAbsent(product.brandName, () => []).add(product);
    }

    final sortedBrands = groupedProducts.keys.toList()..sort();

    final items = <_ListItem>[];
    for (final brand in sortedBrands) {
      items.add(_BrandHeader(brand));
      for (final product in groupedProducts[brand]!) {
        items.add(_ProductItem(product));
      }
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(paginatedCatalogueControllerProvider.notifier).refresh();
      },
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        itemCount: items.length + (catalogueState.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= items.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final item = items[index];
          if (item is _BrandHeader) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                item.brandName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: kSecondaryColor,
                ),
              ),
            );
          } else if (item is _ProductItem) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _ProductCard(
                product: item.product,
                onTap: () => _addProduct(item.product),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Future<void> _scanBarcode() async {
    final result = await Navigator.of(context).push<BarcodeScanResult>(
      MaterialPageRoute(
        builder: (context) => const BarcodeScannerScreen(
          title: 'Scan Product',
          hintText: 'Scan product barcode',
        ),
      ),
    );

    if (result == null || !mounted) return;

    HapticFeedback.mediumImpact();

    final barcode = result.barcode.trim();
    _searchController.text = barcode;

    final matchingProduct = await ref.read(
      findProductByBarcodeProvider(barcode).future,
    );

    if (matchingProduct != null && mounted) {
      await _addProduct(matchingProduct);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product not available: $barcode'),
          backgroundColor: kWarningColor,
        ),
      );
    }
  }

  Future<void> _addProduct(CustomerProduct product) async {
    setState(() {
      _isAddingProduct = true;
      _error = null;
    });

    try {
      final item = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .addProduct(sessionLocalId: widget.sessionLocalId, product: product);

      if (item != null && mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Added ${product.itemName}')));

        context.pushReplacement(
          '/stock-take/session/${widget.sessionLocalId}/item/${item.localId}',
          extra: {
            'itemLocalId': item.localId,
            'itemName': item.itemName,
            'brandName': item.brandName,
            'category': item.category,
            'modelNumber': item.modelNumber,
            'minStockLevel': item.minStockLevel,
            'maxStockLevel': item.maxStockLevel,
          },
        );
      } else if (mounted) {
        final state = ref.read(stockTakeSessionControllerProvider);
        setState(() {
          _error = state.errorMessage ?? 'Failed to add product';
          _isAddingProduct = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Failed to add product: $e';
          _isAddingProduct = false;
        });
      }
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  final TextEditingController searchController;
  final bool enabled;
  final VoidCallback? onScan;
  final VoidCallback onBack;

  const _Header({
    required this.searchController,
    required this.enabled,
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
                'Add Product',
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
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: kTextDark,
                    style: const TextStyle(color: kTextDark, fontSize: 15),
                    decoration: const InputDecoration(
                      hintText: 'Search by name or code',
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
                    child: const Icon(
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

class _BrandPillRow extends StatelessWidget {
  final List<String> brands;
  final String? selected;
  final ValueChanged<String?> onSelect;

  const _BrandPillRow({
    required this.brands,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    if (brands.length <= 1) return const SizedBox(height: 12);

    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 8),
        children: [
          _BrandPill(
            label: 'All Brands',
            selected: selected == null,
            onTap: () => onSelect(null),
          ),
          for (final brand in brands) ...[
            const SizedBox(width: 6),
            _BrandPill(
              label: brand,
              selected: selected == brand,
              onTap: () => onSelect(brand),
            ),
          ],
        ],
      ),
    );
  }
}

class _BrandPill extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _BrandPill({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? kTextDark : kPrimaryLightColor,
          borderRadius: BorderRadius.circular(999),
          border: selected ? null : Border.all(color: kBorderColor),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: selected ? kTextLight : kTextDark,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Product list items
// ─────────────────────────────────────────────────────────────────────────

sealed class _ListItem {}

class _BrandHeader extends _ListItem {
  final String brandName;
  _BrandHeader(this.brandName);
}

class _ProductItem extends _ListItem {
  final CustomerProduct product;
  _ProductItem(this.product);
}

class _ProductCard extends StatelessWidget {
  final CustomerProduct product;
  final VoidCallback onTap;

  const _ProductCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
                      product.hasStockLevels
                          ? '${product.itemCode} · Min ${product.minOnshelfQty} · Max ${product.maxOnshelfQty}'
                          : product.itemCode,
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
