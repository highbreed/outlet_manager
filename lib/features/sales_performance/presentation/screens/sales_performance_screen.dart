import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../products/data/datasources/products_remote_datasource.dart';
import '../../../products/presentation/providers/products_providers.dart';
import '../../../products/presentation/widgets/stock_status_badge.dart'
    show formatKes;
import '../../../sales_order/domain/entities/customer.dart';
import '../../data/datasources/sales_performance_remote_datasource.dart';
import '../providers/sales_performance_providers.dart';
import '../widgets/month_year_picker_sheet.dart';
import '../widgets/outlet_filter_sheet.dart';
import '../widgets/performance_category_filter_sheet.dart';
import '../widgets/performance_product_row.dart';
import '../widgets/performance_summary_card.dart';
import '../widgets/sellout_product_row.dart';

/// The logged-in rep's own confirmed-sales performance for a month: an
/// aggregate view (Summary tab), a per-product sellout breakdown of what
/// was actually sold (Sellout tab, `GET /sales/my-performance`, agent-wide
/// by default), and — once an outlet is picked — that outlet's full
/// product target list (`GET /products/sales-targets`) merged with actual
/// quantities sold, letting the rep see target-vs-achieved per product
/// (Sales Target tab).
class SalesPerformanceScreen extends ConsumerStatefulWidget {
  const SalesPerformanceScreen({super.key});

  @override
  ConsumerState<SalesPerformanceScreen> createState() =>
      _SalesPerformanceScreenState();
}

class _SalesPerformanceScreenState
    extends ConsumerState<SalesPerformanceScreen> {
  late int _year = DateTime.now().year;
  late int _month = DateTime.now().month;
  SalesCustomer? _outlet;
  final _searchController = TextEditingController();
  String _modelQuery = '';
  PerformanceCategoryFilter? _categoryFilter;
  final _selloutSearchController = TextEditingController();
  String _selloutQuery = '';
  PerformanceCategoryFilter? _selloutCategoryFilter;

  @override
  void dispose() {
    _searchController.dispose();
    _selloutSearchController.dispose();
    super.dispose();
  }

  Future<void> _pickPeriod() async {
    final result = await showModalBottomSheet<(int, int)>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kPrimaryLightColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) =>
          MonthYearPickerSheet(initialYear: _year, initialMonth: _month),
    );
    if (result != null) {
      setState(() {
        _year = result.$1;
        _month = result.$2;
        // A different period may not have the same categories/brands.
        _categoryFilter = null;
      });
    }
  }

  Future<void> _pickOutlet() async {
    final result = await showModalBottomSheet<OutletFilterResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kPrimaryLightColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => OutletFilterSheet(selected: _outlet),
    );
    if (result == null) return; // dismissed without a choice
    setState(() {
      _outlet = result.outlet;
      _categoryFilter = null;
    });
  }

  Future<void> _pickCategory(List<OutletSalesTargetItem> baseItems) async {
    final result = await showModalBottomSheet<PerformanceCategoryFilter>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kPrimaryLightColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => PerformanceCategoryFilterSheet(
        entries: [
          for (final p in baseItems)
            (
              itemGroup1: p.itemGroup1,
              itemGroup2: p.itemGroup2,
              itemGroup3: p.itemGroup3,
              brand: p.brand,
            ),
        ],
        selected: _categoryFilter,
      ),
    );
    if (result == null) return; // dismissed without a choice
    setState(() => _categoryFilter = result.isEmpty ? null : result);
  }

  Future<void> _pickSelloutCategory(
    List<SalesPerformanceProduct> baseItems,
  ) async {
    final result = await showModalBottomSheet<PerformanceCategoryFilter>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kPrimaryLightColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => PerformanceCategoryFilterSheet(
        entries: [
          for (final p in baseItems)
            (
              itemGroup1: p.itemGroup1,
              itemGroup2: p.itemGroup2,
              itemGroup3: p.itemGroup3,
              brand: p.brand,
            ),
        ],
        selected: _selloutCategoryFilter,
      ),
    );
    if (result == null) return; // dismissed without a choice
    setState(() => _selloutCategoryFilter = result.isEmpty ? null : result);
  }

  Widget _errorView(Object error, VoidCallback onRetry) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off, size: 40, color: kTextMuted),
            const SizedBox(height: 12),
            Text(
              error is Failure ? error.displayMessage : 'Something went wrong',
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

  Widget _buildSummaryTab() {
    final args = (_year, _month, _outlet?.code);
    final performanceAsync = ref.watch(salesPerformanceProvider(args));

    return performanceAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          _errorView(error, () => ref.invalidate(salesPerformanceProvider(args))),
      data: (performance) => RefreshIndicator(
        onRefresh: () async => ref.invalidate(salesPerformanceProvider(args)),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            PerformanceSummaryCard(
              year: _year,
              month: _month,
              cardCode: _outlet?.code,
              performance: performance,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelloutTab() {
    final args = (_year, _month, _outlet?.code);
    final performanceAsync = ref.watch(salesPerformanceProvider(args));

    return performanceAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          _errorView(error, () => ref.invalidate(salesPerformanceProvider(args))),
      data: (performance) {
        final products = performance.products;

        final query = _selloutQuery.trim().toLowerCase();
        var filtered = query.isEmpty
            ? products
            : products
                  .where(
                    (p) =>
                        (p.productName ?? '').toLowerCase().contains(query) ||
                        (p.modelNo ?? '').toLowerCase().contains(query) ||
                        p.itemCode.toLowerCase().contains(query),
                  )
                  .toList();

        final categoryFilter = _selloutCategoryFilter;
        if (categoryFilter != null) {
          filtered = filtered
              .where(
                (p) =>
                    (categoryFilter.itemGroup1 == null ||
                        p.itemGroup1 == categoryFilter.itemGroup1) &&
                    (categoryFilter.itemGroup2 == null ||
                        p.itemGroup2 == categoryFilter.itemGroup2) &&
                    (categoryFilter.itemGroup3 == null ||
                        p.itemGroup3 == categoryFilter.itemGroup3) &&
                    (categoryFilter.brand == null ||
                        p.brand == categoryFilter.brand),
              )
              .toList();
        }

        final grouped = <String, List<SalesPerformanceProduct>>{};
        for (final p in filtered) {
          final key = (p.itemGroup1 == null || p.itemGroup1!.isEmpty)
              ? 'Uncategorized'
              : p.itemGroup1!;
          grouped.putIfAbsent(key, () => []).add(p);
        }
        final groupNames = grouped.keys.toList()..sort();

        return RefreshIndicator(
          onRefresh: () async =>
              ref.invalidate(salesPerformanceProvider(args)),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            children: [
              _SearchFilterRow(
                controller: _selloutSearchController,
                onChanged: (v) => setState(() => _selloutQuery = v),
                filterActive: _selloutCategoryFilter != null,
                onFilterTap: () => _pickSelloutCategory(products),
              ),
              if (_selloutCategoryFilter != null) ...[
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _RemovableChip(
                    label: _selloutCategoryFilter!.label,
                    onRemove: () =>
                        setState(() => _selloutCategoryFilter = null),
                  ),
                ),
              ],
              const SizedBox(height: 10),
              Text(
                '${performance.totalQuantitySold} units sold across '
                '${products.length} product${products.length == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 12, color: kTextMuted),
              ),
              const SizedBox(height: 14),
              if (filtered.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Center(
                    child: Text(
                      products.isEmpty
                          ? 'No confirmed sales yet this period.'
                          : 'No products match your filters.',
                      style: const TextStyle(fontSize: 13, color: kTextMuted),
                    ),
                  ),
                )
              else
                for (final groupName in groupNames) ...[
                  _GroupedCard(
                    title: groupName,
                    count: grouped[groupName]!.length,
                    children: [
                      for (var i = 0; i < grouped[groupName]!.length; i++)
                        SelloutProductRow(
                          product: grouped[groupName]![i],
                          showDivider: i != grouped[groupName]!.length - 1,
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildProductsTab() {
    final outlet = _outlet;
    if (outlet == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: kBackground,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.storefront_outlined,
                  color: kTextFaint,
                  size: 26,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Select an outlet',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'Targets are set per outlet — pick one to see target vs. '
                'achieved.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: kTextMuted),
              ),
              const SizedBox(height: 18),
              PrimaryButton(
                label: 'Select Outlet',
                expand: false,
                onPressed: _pickOutlet,
              ),
            ],
          ),
        ),
      );
    }

    final baseQuery = (
      cardCode: outlet.code,
      year: _year,
      month: _month,
      itemGroup1: null,
      itemGroup2: null,
      itemGroup3: null,
      brand: null,
    );
    final activeQuery = (
      cardCode: outlet.code,
      year: _year,
      month: _month,
      itemGroup1: _categoryFilter?.itemGroup1,
      itemGroup2: _categoryFilter?.itemGroup2,
      itemGroup3: _categoryFilter?.itemGroup3,
      brand: _categoryFilter?.brand,
    );
    final performanceArgs = (_year, _month, outlet.code);

    final baseTargetsAsync = ref.watch(outletSalesTargetsProvider(baseQuery));
    final targetsAsync = ref.watch(outletSalesTargetsProvider(activeQuery));
    final performanceAsync = ref.watch(salesPerformanceProvider(performanceArgs));

    return targetsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => _errorView(
        error,
        () => ref.invalidate(outletSalesTargetsProvider(activeQuery)),
      ),
      data: (targets) {
        final soldByItem = <String, SalesPerformanceProduct>{
          for (final p in performanceAsync.value?.products ?? [])
            p.itemCode: p,
        };
        final merged = [
          for (final item in targets.items)
            MergedTargetProduct(target: item, sold: soldByItem[item.itemCode]),
        ];

        final query = _modelQuery.trim().toLowerCase();
        final filtered = query.isEmpty
            ? merged
            : merged
                  .where(
                    (m) =>
                        (m.target.itemName ?? '').toLowerCase().contains(
                          query,
                        ) ||
                        (m.target.modelNo ?? '').toLowerCase().contains(
                          query,
                        ) ||
                        m.itemCode.toLowerCase().contains(query),
                  )
                  .toList();

        final grouped = <String, List<MergedTargetProduct>>{};
        for (final m in filtered) {
          final key = (m.itemGroup1 == null || m.itemGroup1!.isEmpty)
              ? 'Uncategorized'
              : m.itemGroup1!;
          grouped.putIfAbsent(key, () => []).add(m);
        }
        final groupNames = grouped.keys.toList()..sort();

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(outletSalesTargetsProvider(activeQuery));
            ref.invalidate(outletSalesTargetsProvider(baseQuery));
            ref.invalidate(salesPerformanceProvider(performanceArgs));
          },
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            children: [
              _SearchFilterRow(
                controller: _searchController,
                onChanged: (v) => setState(() => _modelQuery = v),
                filterActive: _categoryFilter != null,
                onFilterTap: () => _pickCategory(
                  baseTargetsAsync.value?.items ?? targets.items,
                ),
              ),
              if (_categoryFilter != null) ...[
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _RemovableChip(
                    label: _categoryFilter!.label,
                    onRemove: () => setState(() => _categoryFilter = null),
                  ),
                ),
              ],
              const SizedBox(height: 10),
              Text(
                targets.totalTargetAmount != null
                    ? 'Total target: ${formatKes(targets.totalTargetAmount!)} across '
                          '${targets.items.length} product${targets.items.length == 1 ? '' : 's'}'
                    : 'Total target: ${targets.totalTargetQty.round()} units across '
                          '${targets.items.length} product${targets.items.length == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 12, color: kTextMuted),
              ),
              const SizedBox(height: 14),
              if (filtered.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Center(
                    child: Text(
                      targets.items.isEmpty
                          ? 'No targets set for this outlet this period.'
                          : 'No products match your filters.',
                      style: const TextStyle(fontSize: 13, color: kTextMuted),
                    ),
                  ),
                )
              else
                for (final groupName in groupNames) ...[
                  _GroupedCard(
                    title: groupName,
                    count: grouped[groupName]!.length,
                    children: [
                      for (var i = 0; i < grouped[groupName]!.length; i++)
                        PerformanceProductRow(
                          product: grouped[groupName]![i],
                          showDivider: i != grouped[groupName]!.length - 1,
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'My Performance',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    _PillButton(
                      label: monthYearLabel(_year, _month),
                      trailingIcon: Icons.expand_more,
                      onTap: _pickPeriod,
                    ),
                    const SizedBox(width: 8),
                    _PillButton(
                      label: 'Outlet',
                      showDot: _outlet != null,
                      onTap: _pickOutlet,
                    ),
                  ],
                ),
              ),
              if (_outlet != null) ...[
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _RemovableChip(
                      label: _outlet!.name,
                      onRemove: () => setState(() => _outlet = null),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: kBorderColor)),
                ),
                child: const TabBar(
                  isScrollable: false,
                  labelColor: kSecondaryColor,
                  unselectedLabelColor: kTextFaint,
                  indicatorColor: kSecondaryColor,
                  indicatorWeight: 2,
                  dividerColor: Colors.transparent,
                  labelStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: [
                    Tab(text: 'Summary'),
                    Tab(text: 'Sellout'),
                    Tab(text: 'Sales Target'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildSummaryTab(),
                    _buildSelloutTab(),
                    _buildProductsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PillButton extends StatelessWidget {
  final String label;
  final IconData? trailingIcon;
  final bool showDot;
  final VoidCallback onTap;

  const _PillButton({
    required this.label,
    this.trailingIcon,
    this.showDot = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(999),
          child: InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: kBorderColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kTextDark,
                    ),
                  ),
                  if (trailingIcon != null) ...[
                    const SizedBox(width: 4),
                    Icon(trailingIcon, size: 14, color: kTextDark),
                  ],
                ],
              ),
            ),
          ),
        ),
        if (showDot)
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: kSecondaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

class _RemovableChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _RemovableChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 6, 8, 6),
      decoration: BoxDecoration(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: kSecondaryColor,
            ),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: onRemove,
            borderRadius: BorderRadius.circular(999),
            child: const Padding(
              padding: EdgeInsets.all(2),
              child: Icon(Icons.close, size: 14, color: kSecondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchFilterRow extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool filterActive;
  final VoidCallback onFilterTap;

  const _SearchFilterRow({
    required this.controller,
    required this.onChanged,
    required this.filterActive,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: const TextStyle(fontSize: 13, color: kTextDark),
            decoration: InputDecoration(
              hintText: 'Search model or name',
              hintStyle: const TextStyle(fontSize: 13, color: kTextFaint),
              prefixIcon: const Icon(Icons.search, size: 18, color: kTextFaint),
              isDense: true,
              filled: true,
              fillColor: kPrimaryLightColor,
              contentPadding: const EdgeInsets.symmetric(vertical: 13),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: kBorderColor),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Material(
          color: filterActive ? kTextDark : kPrimaryLightColor,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: onFilterTap,
            child: Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: filterActive ? null : Border.all(color: kBorderColor),
              ),
              child: Icon(
                Icons.tune,
                size: 18,
                color: filterActive ? kTextLight : kTextDark,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Uppercase group label above a single bordered card of divided rows —
/// matches the mock's Sellout/Sales Target grouping exactly.
class _GroupedCard extends StatelessWidget {
  final String title;
  final int count;
  final List<Widget> children;

  const _GroupedCard({
    required this.title,
    required this.count,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${title.toUpperCase()} ($count)',
          style: const TextStyle(
            fontSize: 11,
            color: kTextFaint,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: kBorderColor),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}
