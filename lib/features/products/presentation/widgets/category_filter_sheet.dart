import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../data/datasources/products_remote_datasource.dart';

/// Result of the filter sheet: what to apply to the product list.
///
/// [itemGroup1]/[itemGroup2]/[itemGroup3] mirror the backend's three
/// taxonomy levels directly — picking any node in the tree always replaces
/// the full path (e.g. picking a top-level group clears any previously
/// selected sub-group). [modelSearch] is only set when the user picks a
/// specific model number leaf, since there's no dedicated model-number
/// filter param — it's applied via the regular text search instead.
class ProductFilterResult {
  final bool clear;
  final String? itemGroup1;
  final String? itemGroup2;
  final String? itemGroup3;
  final String? modelSearch;
  final String? brand;

  const ProductFilterResult({
    this.clear = false,
    this.itemGroup1,
    this.itemGroup2,
    this.itemGroup3,
    this.modelSearch,
    this.brand,
  });
}

/// Uniform tree node covering group / sub-group-2 / sub-group-3, so the UI
/// can walk the taxonomy recursively without caring which level it's at.
class _CategoryNode {
  final String name;
  final List<_CategoryNode> children;
  final List<String> modelNumbers;

  const _CategoryNode({
    required this.name,
    this.children = const [],
    this.modelNumbers = const [],
  });

  bool get isLeaf => children.isEmpty;

  static List<_CategoryNode> fromGroups(List<ProductGroup> groups) {
    return groups
        .map(
          (g) => _CategoryNode(
            name: g.name,
            children: g.subGroups2
                .map(
                  (s2) => _CategoryNode(
                    name: s2.name,
                    children: s2.subGroups3
                        .map(
                          (s3) => _CategoryNode(
                            name: s3.name,
                            modelNumbers: s3.modelNumbers,
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }
}

/// One flattened, searchable entry across every level of the taxonomy —
/// lets the user search 300+ categories/models directly instead of only
/// browsing level by level.
class _SearchHit {
  final String label;
  final List<String> breadcrumb;
  final String itemGroup1;
  final String? itemGroup2;
  final String? itemGroup3;
  final String? modelSearch;

  const _SearchHit({
    required this.label,
    required this.breadcrumb,
    required this.itemGroup1,
    this.itemGroup2,
    this.itemGroup3,
    this.modelSearch,
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
        for (final model in sub3.modelNumbers) {
          hits.add(
            _SearchHit(
              label: model,
              breadcrumb: [group.name, sub2.name, sub3.name],
              itemGroup1: group.name,
              itemGroup2: sub2.name,
              itemGroup3: sub3.name,
              modelSearch: model,
            ),
          );
        }
      }
    }
  }
  return hits;
}

/// Bottom sheet with every filter option: a searchable, drill-down category
/// tree (group → sub-group → sub-group → model number) and a brand picker.
class CategoryFilterSheet extends StatefulWidget {
  final List<ProductGroup> groups;
  final List<String> brands;
  final String? selectedItemGroup1;
  final String? selectedBrand;

  const CategoryFilterSheet({
    super.key,
    required this.groups,
    required this.brands,
    this.selectedItemGroup1,
    this.selectedBrand,
  });

  @override
  State<CategoryFilterSheet> createState() => _CategoryFilterSheetState();
}

class _CategoryFilterSheetState extends State<CategoryFilterSheet>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final List<_CategoryNode> _tree;
  late final List<_SearchHit> _searchIndex;
  final _path = <_CategoryNode>[];
  final _categorySearchCtrl = TextEditingController();
  final _brandSearchCtrl = TextEditingController();
  String _categoryQuery = '';
  String _brandQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tree = _CategoryNode.fromGroups(widget.groups);
    _searchIndex = _buildSearchIndex(_tree);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _categorySearchCtrl.dispose();
    _brandSearchCtrl.dispose();
    super.dispose();
  }

  void _apply(ProductFilterResult result) => Navigator.of(context).pop(result);

  void _drillInto(_CategoryNode node) => setState(() => _path.add(node));

  void _jumpTo(int depth) =>
      setState(() => _path.removeRange(depth, _path.length));

  void _applyNode(_CategoryNode node) {
    final fullPath = [..._path, node].map((n) => n.name).toList();
    _apply(
      ProductFilterResult(
        itemGroup1: fullPath[0],
        itemGroup2: fullPath.length > 1 ? fullPath[1] : null,
        itemGroup3: fullPath.length > 2 ? fullPath[2] : null,
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
        return Column(
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () =>
                        _apply(const ProductFilterResult(clear: true)),
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
              tabs: const [
                Tab(text: 'Category'),
                Tab(text: 'Brand'),
              ],
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
            decoration: InputDecoration(
              hintText: 'Search all ${_searchIndex.length} categories & models...',
              prefixIcon: const Icon(Icons.search),
              isDense: true,
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
    if (_path.isNotEmpty && _path.last.isLeaf) {
      // Deepest sub-group reached: list its specific model numbers.
      final models = _path.last.modelNumbers;
      if (models.isEmpty) {
        return const Center(child: Text('No models listed for this group'));
      }
      return ListView.builder(
        controller: scrollController,
        itemCount: models.length,
        itemBuilder: (context, index) {
          final model = models[index];
          return ListTile(
            leading: const Icon(Icons.inventory_2_outlined),
            title: Text(model),
            onTap: () => _apply(
              ProductFilterResult(
                itemGroup1: _path[0].name,
                itemGroup2: _path.length > 1 ? _path[1].name : null,
                itemGroup3: _path.length > 2 ? _path[2].name : null,
                modelSearch: model,
              ),
            ),
          );
        },
      );
    }

    final items = _path.isEmpty ? _tree : _path.last.children;

    return ListView.builder(
      controller: scrollController,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final node = items[index];
        final isSelected =
            _path.isEmpty && node.name == widget.selectedItemGroup1;
        return ListTile(
          title: Text(node.name),
          selected: isSelected,
          trailing: node.isLeaf && node.modelNumbers.isEmpty
              ? (isSelected ? const Icon(Icons.check, color: kSecondaryColor) : null)
              : IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => _drillInto(node),
                ),
          onTap: () => _applyNode(node),
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
      return const Center(child: Text('No matches'));
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: results.length,
      itemBuilder: (context, index) {
        final hit = results[index];
        return ListTile(
          title: Text(hit.label),
          subtitle: Text(
            hit.breadcrumb.join(' › '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: kTextMuted),
          ),
          onTap: () => _apply(
            ProductFilterResult(
              itemGroup1: hit.itemGroup1,
              itemGroup2: hit.itemGroup2,
              itemGroup3: hit.itemGroup3,
              modelSearch: hit.modelSearch,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBrandTab(ScrollController scrollController) {
    final query = _brandQuery.trim().toLowerCase();
    final brands = [...widget.brands]..sort();
    final filtered = query.isEmpty
        ? brands
        : brands.where((b) => b.toLowerCase().contains(query)).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
          child: TextField(
            controller: _brandSearchCtrl,
            decoration: InputDecoration(
              hintText: 'Search brands...',
              prefixIcon: const Icon(Icons.search),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (v) => setState(() => _brandQuery = v),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final brand = filtered[index];
              final isSelected = brand == widget.selectedBrand;
              return ListTile(
                title: Text(brand),
                selected: isSelected,
                trailing: isSelected
                    ? const Icon(Icons.check, color: kSecondaryColor)
                    : null,
                onTap: () => _apply(ProductFilterResult(brand: brand)),
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
