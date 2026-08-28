import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../daily_route/presentation/widgets/widgets.dart'
    show RouteBackHeader;
import '../../domain/entities/entities.dart';
import '../providers/sales_order_providers.dart';

/// Product picker. Returns the selected [SalesProduct] via Navigator.pop.
class ProductPickerScreen extends ConsumerStatefulWidget {
  final String cardCode;

  const ProductPickerScreen({super.key, required this.cardCode});

  @override
  ConsumerState<ProductPickerScreen> createState() =>
      _ProductPickerScreenState();
}

class _ProductPickerScreenState extends ConsumerState<ProductPickerScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  final _modelController = TextEditingController();
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
    _modelController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final max = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    if (current >= (max * 0.85)) {
      ref
          .read(salesProductsByCardCodeProvider(widget.cardCode).notifier)
          .loadMore();
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref
          .read(salesProductsByCardCodeProvider(widget.cardCode).notifier)
          .search(value.trim());
    });
  }

  void _onSearchSubmitted(String value) {
    _debounce?.cancel();
    ref
        .read(salesProductsByCardCodeProvider(widget.cardCode).notifier)
        .search(value.trim());
  }

  String _formatPrice(double value) {
    final fixed = value.toStringAsFixed(2);
    final parts = fixed.split('.');
    final whole = parts[0].replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ',',
    );
    return 'KES $whole.${parts[1]}';
  }

  Widget _productPopupBuilder(
    BuildContext context,
    String item,
    bool isDisabled,
    bool isSelected,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: isSelected ? kSecondaryLightColor.withValues(alpha: 0.3) : null,
      child: Text(
        item,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
          color: isDisabled ? Colors.grey : null,
        ),
      ),
    );
  }

  Future<void> _openFiltersSheet(SalesProductsState state) async {
    String? selectedBrand = state.selectedBrand;
    String? selectedCategory = state.selectedCategory;
    String modelQuery = state.modelQuery;

    final brands = [...state.availableBrands]..sort();

    final categories = [...state.availableCategories]..sort();

    // Guard against assertion when current selected value is not in options
    if (selectedBrand != null && !brands.contains(selectedBrand)) {
      brands.add(selectedBrand);
      brands.sort();
    }
    if (selectedCategory != null && !categories.contains(selectedCategory)) {
      categories.add(selectedCategory);
      categories.sort();
    }

    _modelController.text = modelQuery;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Filters',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  DropdownSearch<String>(
                    items: (filter, _) => ['All brands', ...brands],
                    selectedItem: selectedBrand ?? 'All brands',
                    decoratorProps: const DropDownDecoratorProps(
                      decoration: InputDecoration(labelText: 'Brand'),
                    ),
                    popupProps: PopupProps.modalBottomSheet(
                      showSelectedItems: true,
                      itemBuilder: _productPopupBuilder,
                      showSearchBox: true,
                    ),
                    onChanged: (v) => setModalState(
                      () => selectedBrand = v == 'All brands' ? null : v,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownSearch<String>(
                    items: (filter, _) => ['All categories', ...categories],
                    selectedItem: selectedCategory ?? 'All categories',
                    decoratorProps: const DropDownDecoratorProps(
                      decoration: InputDecoration(labelText: 'Category'),
                    ),
                    popupProps: PopupProps.modalBottomSheet(
                      showSelectedItems: true,
                      itemBuilder: _productPopupBuilder,
                      showSearchBox: true,
                    ),
                    onChanged: (v) => setModalState(
                      () => selectedCategory = v == 'All categories' ? null : v,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _modelController,
                    decoration: const InputDecoration(
                      labelText: 'Model contains',
                      hintText: 'e.g. MODEL-001',
                    ),
                    onChanged: (v) => modelQuery = v,
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setModalState(() {
                            selectedBrand = null;
                            selectedCategory = null;
                            _modelController.clear();
                            modelQuery = '';
                          });
                        },
                        child: const Text('Clear'),
                      ),
                      const Spacer(),
                      FilledButton(
                        onPressed: () async {
                          final navigator = Navigator.of(ctx);
                          final notifier = ref.read(
                            salesProductsByCardCodeProvider(
                              widget.cardCode,
                            ).notifier,
                          );
                          await notifier.setBrand(selectedBrand);
                          await notifier.setCategory(selectedCategory);
                          notifier.setModelQuery(modelQuery.trim());
                          if (mounted) navigator.pop();
                        },
                        child: const Text('Apply'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(
      salesProductsByCardCodeProvider(widget.cardCode),
    );
    final products = productsState.products.where((p) {
      final q = productsState.modelQuery.trim().toLowerCase();
      if (q.isEmpty) return true;
      return (p.modelNumber ?? '').toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            RouteBackHeader(
              title: 'Add Product',
              onBack: () => Navigator.of(context).maybePop(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(fontSize: 13, color: kTextDark),
                      decoration: InputDecoration(
                        hintText: 'Search products...',
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
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
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
                      onChanged: _onSearchChanged,
                      onSubmitted: _onSearchSubmitted,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Material(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () => _openFiltersSheet(productsState),
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: kBorderColor),
                        ),
                        child: const Icon(
                          Icons.tune,
                          size: 18,
                          color: kTextDark,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: productsState.isLoading && products.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : productsState.error != null && products.isEmpty
                  ? Center(child: Text(productsState.error!))
                  : products.isEmpty
                  ? const Center(
                      child: Text(
                        'No products found',
                        style: TextStyle(color: kTextMuted),
                      ),
                    )
                  : ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      itemCount:
                          products.length + (productsState.isLoading ? 1 : 0),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
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
                        final p = products[i];
                        return Material(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () => Navigator.of(context).pop(p),
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: kBorderColor),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          p.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '${p.code}${p.brand != null ? ' · ${p.brand}' : ''}${p.modelNumber != null ? ' · ${p.modelNumber}' : ''}',
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: kTextFaint,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    _formatPrice(p.unitPrice),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: kSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
