import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

const _kUncategorized = 'Uncategorized';

/// Just the taxonomy fields needed to drive the filter tree/brand list —
/// lets this sheet be built from either the outlet's target list
/// (`OutletSalesTargetItem`, Sales Target tab) or the agent's sold-products
/// list (`SalesPerformanceProduct`, Sellout tab) without depending on
/// either concrete type.
typedef CategoryFilterEntry = ({
  String? itemGroup1,
  String? itemGroup2,
  String? itemGroup3,
  String? brand,
});

/// A category/brand selection applied to the outlet's target list — any
/// field may be left unset, meaning "any" for that field. Filtering itself
/// happens server-side (`GET /products/sales-targets`'s `item_group1/2/3`/
/// `brand` params), this is just the picked value.
class PerformanceCategoryFilter {
  final String? itemGroup1;
  final String? itemGroup2;
  final String? itemGroup3;
  final String? brand;

  const PerformanceCategoryFilter({
    this.itemGroup1,
    this.itemGroup2,
    this.itemGroup3,
    this.brand,
  });

  bool get isEmpty => itemGroup1 == null && brand == null;

  String get label {
    final parts = <String>[
      if (itemGroup1 != null)
        [
          itemGroup1,
          itemGroup2,
          itemGroup3,
        ].whereType<String>().join(' › '),
      if (brand != null) 'Brand: $brand',
    ];
    return parts.join(' · ');
  }
}

/// Uniform tree node covering group 1/2/3, so the UI can walk the taxonomy
/// recursively without caring which level it's at.
class _CategoryNode {
  final String name;
  final List<_CategoryNode> children;

  const _CategoryNode({required this.name, this.children = const []});

  bool get isLeaf => children.isEmpty;

  static List<_CategoryNode> fromProducts(List<CategoryFilterEntry> entries) {
    final tree = <String, Map<String, Set<String>>>{};
    for (final p in entries) {
      final g1 = p.itemGroup1 ?? _kUncategorized;
      final g2 = p.itemGroup2 ?? _kUncategorized;
      final g3 = p.itemGroup3 ?? _kUncategorized;
      tree.putIfAbsent(g1, () => {});
      tree[g1]!.putIfAbsent(g2, () => {});
      tree[g1]![g2]!.add(g3);
    }
    final g1Names = tree.keys.toList()..sort();
    return [
      for (final g1 in g1Names)
        _CategoryNode(
          name: g1,
          children: [
            for (final g2 in (tree[g1]!.keys.toList()..sort()))
              _CategoryNode(
                name: g2,
                children: [
                  for (final g3 in (tree[g1]![g2]!.toList()..sort()))
                    _CategoryNode(name: g3),
                ],
              ),
          ],
        ),
    ];
  }
}

/// One flattened, searchable entry across every level of the taxonomy —
/// lets the user search directly instead of only browsing level by level.
class _SearchHit {
  final String label;
  final List<String> breadcrumb;
  final String itemGroup1;
  final String? itemGroup2;
  final String? itemGroup3;

  const _SearchHit({
    required this.label,
    required this.breadcrumb,
    required this.itemGroup1,
    this.itemGroup2,
    this.itemGroup3,
  });
}

List<_SearchHit> _buildSearchIndex(List<_CategoryNode> groups) {
  final hits = <_SearchHit>[];
  for (final group in groups) {
    hits.add(
      _SearchHit(
        label: group.name,
        breadcrumb: [group.name],
        itemGroup1: group.name,
      ),
    );
    for (final sub2 in group.children) {
      hits.add(
        _SearchHit(
          label: sub2.name,
          breadcrumb: [group.name, sub2.name],
          itemGroup1: group.name,
          itemGroup2: sub2.name,
        ),
      );
      for (final sub3 in sub2.children) {
        hits.add(
          _SearchHit(
            label: sub3.name,
            breadcrumb: [group.name, sub2.name, sub3.name],
            itemGroup1: group.name,
            itemGroup2: sub2.name,
            itemGroup3: sub3.name,
          ),
        );
      }
    }
  }
  return hits;
}

/// Drill-down category filter + brand picker, built from the item groups
/// already present in this month's fetched products — there's no separate
/// filter-options endpoint for sales performance, categories/brands only
/// exist as flat fields per product row. Mirrors the product catalogue's
/// `CategoryFilterSheet` UX (search-across-all-levels, breadcrumb, Category/
/// Brand tabs).
class PerformanceCategoryFilterSheet extends StatefulWidget {
  final List<CategoryFilterEntry> entries;
  final PerformanceCategoryFilter? selected;

  const PerformanceCategoryFilterSheet({
    super.key,
    required this.entries,
    this.selected,
  });

  @override
  State<PerformanceCategoryFilterSheet> createState() =>
      _PerformanceCategoryFilterSheetState();
}

class _PerformanceCategoryFilterSheetState
    extends State<PerformanceCategoryFilterSheet>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  late final _tree = _CategoryNode.fromProducts(widget.entries);
  late final _searchIndex = _buildSearchIndex(_tree);
  late final _brands =
      widget.entries
          .map((p) => p.brand)
          .whereType<String>()
          .where((b) => b.isNotEmpty)
          .toSet()
          .toList()
        ..sort();
  final _path = <_CategoryNode>[];
  final _categorySearchCtrl = TextEditingController();
  final _brandSearchCtrl = TextEditingController();
  String _categoryQuery = '';
  String _brandQuery = '';

  @override
  void dispose() {
    _tabController.dispose();
    _categorySearchCtrl.dispose();
    _brandSearchCtrl.dispose();
    super.dispose();
  }

  void _apply(PerformanceCategoryFilter filter) =>
      Navigator.of(context).pop(filter);

  void _drillInto(_CategoryNode node) => setState(() => _path.add(node));

  void _jumpTo(int depth) =>
      setState(() => _path.removeRange(depth, _path.length));

  void _applyNode(_CategoryNode node) {
    final fullPath = [..._path, node].map((n) => n.name).toList();
    _apply(
      PerformanceCategoryFilter(
        itemGroup1: fullPath[0],
        itemGroup2: fullPath.length > 1 ? fullPath[1] : null,
        itemGroup3: fullPath.length > 2 ? fullPath[2] : null,
        brand: widget.selected?.brand,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return SafeArea(
          top: false,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: kBorderColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                child: Row(
                  children: [
                    const Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kTextDark,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () =>
                          _apply(const PerformanceCategoryFilter()),
                      child: const Text('Clear all'),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: kSecondaryColor,
                unselectedLabelColor: kTextMuted,
                tabs: const [Tab(text: 'Category'), Tab(text: 'Brand')],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildCategoryTab(scrollController),
                    _buildBrandTab(scrollController),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoryTab(ScrollController scrollController) {
    final query = _categoryQuery.trim().toLowerCase();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
          child: TextField(
            controller: _categorySearchCtrl,
            style: const TextStyle(color: kTextDark),
            decoration: InputDecoration(
              hintText: 'Search all ${_searchIndex.length} categories...',
              prefixIcon: const Icon(Icons.search),
              isDense: true,
              filled: true,
              fillColor: kPrimaryLightColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: query.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _categorySearchCtrl.clear();
                        setState(() => _categoryQuery = '');
                      },
                    )
                  : null,
            ),
            onChanged: (v) => setState(() => _categoryQuery = v),
          ),
        ),
        if (query.isEmpty) _buildBreadcrumb(),
        Expanded(
          child: query.isNotEmpty
              ? _buildSearchResults(scrollController, query)
              : _buildLevelList(scrollController),
        ),
      ],
    );
  }

  Widget _buildBreadcrumb() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: SizedBox(
        height: 28,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _BreadcrumbChip(
              label: 'All Categories',
              selected: _path.isEmpty,
              onTap: () => _jumpTo(0),
            ),
            for (var i = 0; i < _path.length; i++) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Icon(Icons.chevron_right, size: 16, color: kTextMuted),
              ),
              _BreadcrumbChip(
                label: _path[i].name,
                selected: i == _path.length - 1,
                onTap: () => _jumpTo(i + 1),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLevelList(ScrollController scrollController) {
    final items = _path.isEmpty ? _tree : _path.last.children;

    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No subcategories',
          style: TextStyle(fontSize: 13, color: kTextMuted),
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final node = items[index];
        final isSelected =
            _path.isEmpty && node.name == widget.selected?.itemGroup1;
        return ListTile(
          title: Text(node.name, style: const TextStyle(color: kTextDark)),
          selected: isSelected,
          trailing: node.isLeaf
              ? (isSelected
                    ? const Icon(Icons.check, color: kSecondaryColor)
                    : null)
              : const Icon(Icons.chevron_right, color: kTextMuted),
          onTap: () => node.isLeaf ? _applyNode(node) : _drillInto(node),
        );
      },
    );
  }

  Widget _buildSearchResults(ScrollController scrollController, String query) {
    final results = _searchIndex
        .where((hit) => hit.label.toLowerCase().contains(query))
        .take(200)
        .toList();

    if (results.isEmpty) {
      return const Center(
        child: Text('No matches', style: TextStyle(color: kTextMuted)),
      );
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: results.length,
      itemBuilder: (context, index) {
        final hit = results[index];
        return ListTile(
          title: Text(hit.label, style: const TextStyle(color: kTextDark)),
          subtitle: Text(
            hit.breadcrumb.join(' › '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: kTextMuted),
          ),
          onTap: () => _apply(
            PerformanceCategoryFilter(
              itemGroup1: hit.itemGroup1,
              itemGroup2: hit.itemGroup2,
              itemGroup3: hit.itemGroup3,
              brand: widget.selected?.brand,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBrandTab(ScrollController scrollController) {
    final query = _brandQuery.trim().toLowerCase();
    final filtered = query.isEmpty
        ? _brands
        : _brands.where((b) => b.toLowerCase().contains(query)).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
          child: TextField(
            controller: _brandSearchCtrl,
            style: const TextStyle(color: kTextDark),
            decoration: InputDecoration(
              hintText: 'Search brands...',
              prefixIcon: const Icon(Icons.search),
              isDense: true,
              filled: true,
              fillColor: kPrimaryLightColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (v) => setState(() => _brandQuery = v),
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? const Center(
                  child: Text(
                    'No brands found',
                    style: TextStyle(color: kTextMuted),
                  ),
                )
              : ListView.builder(
                  controller: scrollController,
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final brand = filtered[index];
                    final isSelected = brand == widget.selected?.brand;
                    return ListTile(
                      title: Text(
                        brand,
                        style: const TextStyle(color: kTextDark),
                      ),
                      selected: isSelected,
                      trailing: isSelected
                          ? const Icon(Icons.check, color: kSecondaryColor)
                          : null,
                      onTap: () => _apply(
                        PerformanceCategoryFilter(
                          itemGroup1: widget.selected?.itemGroup1,
                          itemGroup2: widget.selected?.itemGroup2,
                          itemGroup3: widget.selected?.itemGroup3,
                          brand: brand,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _BreadcrumbChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _BreadcrumbChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            color: selected ? kSecondaryColor : kTextMuted,
          ),
        ),
      ),
    );
  }
}
