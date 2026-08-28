import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../providers/products_providers.dart';
import '../widgets/category_filter_sheet.dart';
import '../widgets/product_card.dart';

/// Product catalogue browser: search, filter by category/brand, check stock.
class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final max = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    if (current >= (max * 0.85)) {
      ref.read(productsProvider.notifier).loadMore();
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(productsProvider.notifier).search(value.trim());
    });
  }

  Future<void> _openFilterSheet(ProductsState state) async {
    final result = await showModalBottomSheet<ProductFilterResult>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) => CategoryFilterSheet(
        groups: state.availableGroups,
        brands: state.availableBrands,
        selectedItemGroup1: state.selectedItemGroup1,
        selectedBrand: state.selectedBrand,
      ),
    );

    if (result == null || !mounted) return;

    await ref.read(productsProvider.notifier).applyFilter(result);

    // Keep the visible search box in sync with a model/category pick made
    // inside the sheet (or clear it out on "Clear all").
    if (result.clear) {
      _searchController.clear();
    } else if (result.itemGroup1 != null) {
      _searchController.text = result.modelSearch ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productsProvider);
    final products = state.products;
    final quickCategories = state.availableGroups.take(6).toList();

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(fontSize: 13, color: kTextDark),
                          decoration: InputDecoration(
                            hintText: 'Search product, model or barcode',
                            hintStyle: const TextStyle(
                              fontSize: 13,
                              color: kTextFaint,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 18,
                              color: kTextFaint,
                            ),
                            filled: true,
                            fillColor: kPrimaryLightColor,
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: kBorderColor),
                            ),
                            suffixIcon: _searchController.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear, size: 16),
                                    onPressed: () {
                                      _searchController.clear();
                                      _onSearchChanged('');
                                    },
                                  )
                                : null,
                          ),
                          onChanged: (v) {
                            setState(() {});
                            _onSearchChanged(v);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Material(
                            color: state.hasActiveFilters
                                ? kTextDark
                                : kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(16),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => _openFilterSheet(state),
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: state.hasActiveFilters
                                      ? null
                                      : Border.all(color: kBorderColor),
                                ),
                                child: Icon(
                                  Icons.tune,
                                  size: 18,
                                  color: state.hasActiveFilters
                                      ? kTextLight
                                      : kTextDark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 32,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _QuickChip(
                          label: 'All',
                          selected: state.selectedItemGroup1 == null,
                          onTap: () => ref
                              .read(productsProvider.notifier)
                              .clearCategory(),
                        ),
                        for (final group in quickCategories) ...[
                          const SizedBox(width: 8),
                          _QuickChip(
                            label: group.name,
                            selected: state.selectedItemGroup1 == group.name,
                            onTap: () => ref
                                .read(productsProvider.notifier)
                                .applyFilter(
                                  ProductFilterResult(itemGroup1: group.name),
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: state.isLoading && products.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : state.error != null && products.isEmpty
                  ? _ErrorRetry(
                      error: state.error!,
                      onRetry: () =>
                          ref.read(productsProvider.notifier).refresh(),
                    )
                  : products.isEmpty
                  ? const Center(
                      child: Text(
                        'No products found',
                        style: TextStyle(color: kTextMuted),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () =>
                          ref.read(productsProvider.notifier).refresh(),
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.only(bottom: 24),
                        itemCount:
                            products.length + (state.isLoading ? 1 : 0),
                        itemBuilder: (_, i) {
                          if (i >= products.length) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            );
                          }
                          final product = products[i];
                          return ProductCard(
                            product: product,
                            onTap: () => context.push(
                              '/products/detail/${product.code}',
                              extra: product,
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _QuickChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? kSecondaryLightColor : kPrimaryLightColor,
          borderRadius: BorderRadius.circular(999),
          border: selected ? null : Border.all(color: kBorderColor),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: selected ? kSecondaryColor : kTextDark,
          ),
        ),
      ),
    );
  }
}

class _ErrorRetry extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _ErrorRetry({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off, size: 40, color: kTextMuted),
            const SizedBox(height: 12),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kTextMuted),
            ),
            const SizedBox(height: 12),
            SecondaryButton(label: 'Retry', expand: false, onPressed: onRetry),
          ],
        ),
      ),
    );
  }
}
