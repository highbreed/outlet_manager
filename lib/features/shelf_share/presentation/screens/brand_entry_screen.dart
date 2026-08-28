import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../domain/entities/shelf_share_session.dart';
import '../providers/shelf_share_providers.dart';
import '../providers/shelf_share_session_controller.dart';

/// Brand data fetched from API
class _ApiBrand {
  final int id;
  final String name;
  final String code;

  const _ApiBrand({required this.id, required this.name, required this.code});

  factory _ApiBrand.fromJson(Map<String, dynamic> json) {
    return _ApiBrand(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );
  }

  String get displayName => name.isNotEmpty ? name : code;
}

/// A brand that has been selected with its facing count
class _SelectedBrandEntry {
  final int brandId;
  final String brandName;
  int facings;
  final TextEditingController controller;

  _SelectedBrandEntry({
    required this.brandId,
    required this.brandName,
    required this.facings,
    required this.controller,
  });
}

/// Screen to select brands from API and enter shelf facing quantities
/// for a specific item group in a shelf share session.
class BrandEntryScreen extends ConsumerStatefulWidget {
  final String sessionLocalId;
  final int itemGroupId;
  final String itemGroupName;
  final bool readOnly;

  const BrandEntryScreen({
    super.key,
    required this.sessionLocalId,
    required this.itemGroupId,
    required this.itemGroupName,
    this.readOnly = false,
  });

  @override
  ConsumerState<BrandEntryScreen> createState() => _BrandEntryScreenState();
}

class _BrandEntryScreenState extends ConsumerState<BrandEntryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();

  // Brand selection state
  List<_ApiBrand> _allBrands = [];
  List<_ApiBrand> _filteredBrands = [];
  bool _isBrandsLoading = true;
  String? _brandsError;

  // Selected brands with facings
  final List<_SelectedBrandEntry> _selectedEntries = [];
  final Set<int> _selectedBrandIds = {};
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadExistingEntries();
    _fetchBrands();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    for (final entry in _selectedEntries) {
      entry.controller.dispose();
    }
    super.dispose();
  }

  /// Load any existing brand entries from the session
  void _loadExistingEntries() {
    final session = ref.read(shelfShareSessionControllerProvider).activeSession;
    if (session == null) return;

    final group = session.itemGroups
        .where((g) => g.itemGroupId == widget.itemGroupId)
        .firstOrNull;

    if (group != null) {
      for (final entry in group.brandEntries) {
        final controller = TextEditingController(
          text: entry.facings.toString(),
        );
        _selectedEntries.add(
          _SelectedBrandEntry(
            brandId: entry.brandId,
            brandName: entry.brandName,
            facings: entry.facings,
            controller: controller,
          ),
        );
        _selectedBrandIds.add(entry.brandId);
      }
    }
  }

  /// Fetch brands from the API
  Future<void> _fetchBrands() async {
    setState(() {
      _isBrandsLoading = true;
      _brandsError = null;
    });

    try {
      final brandDS = ref.read(brandRemoteDataSourceProvider);
      final response = await brandDS.getBrands(size: 500);

      final items = (response['items'] as List<dynamic>?) ?? [];
      final brands = items
          .map((e) => _ApiBrand.fromJson(e as Map<String, dynamic>))
          .toList();

      setState(() {
        _allBrands = brands;
        _filteredBrands = brands;
        _isBrandsLoading = false;
      });
    } catch (e) {
      setState(() {
        _isBrandsLoading = false;
        _brandsError = 'Failed to load brands: $e';
      });
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredBrands = _allBrands;
      } else {
        final lowerQuery = query.toLowerCase();
        _filteredBrands = _allBrands
            .where(
              (b) =>
                  b.name.toLowerCase().contains(lowerQuery) ||
                  b.code.toLowerCase().contains(lowerQuery),
            )
            .toList();
      }
    });
  }

  void _toggleBrand(_ApiBrand brand) {
    setState(() {
      if (_selectedBrandIds.contains(brand.id)) {
        // Remove
        _selectedBrandIds.remove(brand.id);
        final idx = _selectedEntries.indexWhere((e) => e.brandId == brand.id);
        if (idx != -1) {
          _selectedEntries[idx].controller.dispose();
          _selectedEntries.removeAt(idx);
        }
      } else {
        // Add
        _selectedBrandIds.add(brand.id);
        _selectedEntries.add(
          _SelectedBrandEntry(
            brandId: brand.id,
            brandName: brand.displayName,
            facings: 0,
            controller: TextEditingController(text: '0'),
          ),
        );
      }
      _hasChanges = true;
    });
  }

  void _updateFacings(int index, String value) {
    final facings = int.tryParse(value) ?? 0;
    setState(() {
      _selectedEntries[index].facings = facings;
      _hasChanges = true;
    });
  }

  void _removeEntry(int index) {
    setState(() {
      final entry = _selectedEntries[index];
      _selectedBrandIds.remove(entry.brandId);
      entry.controller.dispose();
      _selectedEntries.removeAt(index);
      _hasChanges = true;
    });
  }

  int get _totalFacings =>
      _selectedEntries.fold(0, (sum, e) => sum + e.facings);

  Future<void> _saveAndGoBack() async {
    if (!_hasChanges) {
      context.pop();
      return;
    }

    final session = ref.read(shelfShareSessionControllerProvider).activeSession;
    if (session == null) return;

    // Build updated item groups list
    final updatedGroups = <ShelfShareItemGroup>[];

    for (final existingGroup in session.itemGroups) {
      if (existingGroup.itemGroupId == widget.itemGroupId) {
        updatedGroups.add(
          ShelfShareItemGroup(
            itemGroupId: widget.itemGroupId,
            itemGroupName: widget.itemGroupName,
            brandEntries: _selectedEntries
                .map(
                  (e) => ShelfShareBrandEntry(
                    brandId: e.brandId,
                    brandName: e.brandName,
                    facings: e.facings,
                  ),
                )
                .toList(),
          ),
        );
      } else {
        updatedGroups.add(existingGroup);
      }
    }

    // If this is a new group not yet in session, add it
    if (!session.itemGroups.any((g) => g.itemGroupId == widget.itemGroupId)) {
      updatedGroups.add(
        ShelfShareItemGroup(
          itemGroupId: widget.itemGroupId,
          itemGroupName: widget.itemGroupName,
          brandEntries: _selectedEntries
              .map(
                (e) => ShelfShareBrandEntry(
                  brandId: e.brandId,
                  brandName: e.brandName,
                  facings: e.facings,
                ),
              )
              .toList(),
        ),
      );
    }

    await ref
        .read(shelfShareSessionControllerProvider.notifier)
        .saveProgress(itemGroups: updatedGroups);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Brand entries saved'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      context.pop();
    }
  }

  Future<void> _showUnsavedChangesDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Unsaved Changes'),
        content: const Text(
          'You have unsaved changes. What would you like to do?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, 'discard'),
            child: const Text('Discard', style: TextStyle(color: kRedColor)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, 'save'),
            style: ElevatedButton.styleFrom(
              backgroundColor: kSecondaryColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (result == 'discard' && mounted) {
      Navigator.of(context).pop();
    } else if (result == 'save') {
      await _saveAndGoBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_hasChanges,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _hasChanges) {
          _showUnsavedChangesDialog();
        }
      },
      child: AppScaffold(
        title: widget.itemGroupName,
        actions: [
          if (!widget.readOnly && _hasChanges)
            TextButton(
              onPressed: _saveAndGoBack,
              child: const Text(
                'Save',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
        body: Column(
          children: [
            // Summary header
            _SummaryHeader(
              totalFacings: _totalFacings,
              brandCount: _selectedEntries.length,
            ),

            // Tab bar
            if (!widget.readOnly)
              Container(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  labelColor: kSecondaryColor,
                  unselectedLabelColor: kTextMuted,
                  indicatorColor: kSecondaryColor,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.list_alt, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            'Selected (${_selectedEntries.length})',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_circle_outline, size: 18),
                          const SizedBox(width: 6),
                          const Text(
                            'Add Brands',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            // Tab views
            Expanded(
              child: widget.readOnly
                  ? _buildSelectedBrandsTab()
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        _buildSelectedBrandsTab(),
                        _buildBrandSelectionTab(),
                      ],
                    ),
            ),

            // Save button at bottom
            if (!widget.readOnly && _selectedEntries.isNotEmpty && _hasChanges)
              Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: _saveAndGoBack,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      icon: const Icon(Icons.save_outlined, size: 20),
                      label: const Text(
                        'Save Brand Entries',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // Tab 1 — Selected brands with quantity entry
  // ===========================================================================

  Widget _buildSelectedBrandsTab() {
    if (_selectedEntries.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.branding_watermark_outlined,
                size: 56,
                color: kTextMuted.withValues(alpha: 0.4),
              ),
              const SizedBox(height: 16),
              Text(
                widget.readOnly
                    ? 'No brands recorded'
                    : 'No brands selected yet',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kTextDark,
                ),
              ),
              const SizedBox(height: 8),
              if (!widget.readOnly)
                const Text(
                  'Switch to the "Add Brands" tab\nto select brands from the list',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: kTextMuted),
                ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _selectedEntries.length,
      itemBuilder: (context, index) {
        final entry = _selectedEntries[index];
        final percent = _totalFacings > 0
            ? (entry.facings / _totalFacings * 100)
            : 0.0;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: kBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: kSecondaryColor.withValues(alpha: 0.15)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Top section — brand name + remove
              Container(
                padding: const EdgeInsets.fromLTRB(14, 12, 8, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            kSecondaryColor.withValues(alpha: 0.15),
                            kSecondaryLightColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.branding_watermark,
                        color: kSecondaryColor,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.brandName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: kTextDark,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${percent.toStringAsFixed(1)}% share',
                            style: TextStyle(
                              fontSize: 12,
                              color: kSecondaryColor.withValues(alpha: 0.8),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!widget.readOnly)
                      IconButton(
                        onPressed: () => _removeEntry(index),
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey.shade400,
                          size: 20,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: const Size(34, 34),
                          padding: EdgeInsets.zero,
                        ),
                        tooltip: 'Remove brand',
                      ),
                  ],
                ),
              ),

              // Bottom section — quantity controls
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                child: Row(
                  children: [
                    const Text(
                      'Qty',
                      style: TextStyle(
                        fontSize: 13,
                        color: kTextMuted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (widget.readOnly)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Text(
                          '${entry.facings}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: kTextDark,
                          ),
                        ),
                      )
                    else
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: kSecondaryColor.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _QuantityButton(
                              icon: Icons.remove,
                              onPressed: () {
                                if (entry.facings > 0) {
                                  final newVal = entry.facings - 1;
                                  entry.controller.text = newVal.toString();
                                  _updateFacings(index, newVal.toString());
                                }
                              },
                            ),
                            SizedBox(
                              width: 56,
                              child: TextField(
                                controller: entry.controller,
                                onChanged: (v) => _updateFacings(index, v),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  filled: false,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 10,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kTextDark,
                                ),
                              ),
                            ),
                            _QuantityButton(
                              icon: Icons.add,
                              onPressed: () {
                                final newVal = entry.facings + 1;
                                entry.controller.text = newVal.toString();
                                _updateFacings(index, newVal.toString());
                              },
                            ),
                          ],
                        ),
                      ),
                    const Spacer(),
                    // Share percentage chip
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.pie_chart_outline,
                            size: 14,
                            color: kSecondaryColor.withValues(alpha: 0.7),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${percent.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Share progress bar
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
                child: LinearProgressIndicator(
                  value: percent / 100,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    kSecondaryColor,
                  ),
                  minHeight: 4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ===========================================================================
  // Tab 2 — Brand selection from API
  // ===========================================================================

  Widget _buildBrandSelectionTab() {
    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Search brands...',
              prefixIcon: const Icon(Icons.search, color: kTextMuted),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: kSecondaryColor,
                  width: 1.5,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),

        // Content
        Expanded(child: _buildBrandList()),
      ],
    );
  }

  Widget _buildBrandList() {
    if (_isBrandsLoading) {
      return const Center(
        child: CircularProgressIndicator(color: kSecondaryColor),
      );
    }

    if (_brandsError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: kRedColor),
              const SizedBox(height: 16),
              Text(
                _brandsError!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: kTextMuted, fontSize: 14),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _fetchBrands,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_filteredBrands.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 48,
              color: kTextMuted.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'No brands found',
              style: TextStyle(fontSize: 16, color: kTextMuted),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _filteredBrands.length,
      itemBuilder: (context, index) {
        final brand = _filteredBrands[index];
        final isSelected = _selectedBrandIds.contains(brand.id);

        return GestureDetector(
          onTap: () => _toggleBrand(brand),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: isSelected ? kSecondaryLightColor : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? kSecondaryColor : Colors.grey.shade200,
                width: isSelected ? 2 : 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: kSecondaryColor.withValues(alpha: 0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  // Leading icon
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? kSecondaryColor
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      isSelected
                          ? Icons.check
                          : Icons.branding_watermark_outlined,
                      color: isSelected ? Colors.white : kTextMuted,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Brand info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          brand.displayName,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            color: kTextDark,
                          ),
                        ),
                        if (brand.code.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(
                                Icons.label_outline,
                                size: 13,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                brand.code,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Checkbox indicator
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isSelected ? kSecondaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isSelected
                            ? kSecondaryColor
                            : Colors.grey.shade300,
                        width: isSelected ? 0 : 2,
                      ),
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, size: 16, color: Colors.white)
                        : null,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// =============================================================================
// Summary Header
// =============================================================================

class _SummaryHeader extends StatelessWidget {
  final int totalFacings;
  final int brandCount;

  const _SummaryHeader({required this.totalFacings, required this.brandCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      color: Colors.white,
      child: Row(
        children: [
          _SummaryChip(
            icon: Icons.branding_watermark,
            label: 'Brands',
            value: '$brandCount',
          ),
          const SizedBox(width: 16),
          _SummaryChip(
            icon: Icons.bar_chart,
            label: 'Total Qty',
            value: '$totalFacings',
          ),
        ],
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SummaryChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: kSecondaryColor),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kSecondaryColor,
                ),
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 11, color: kTextMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Quantity +/- Button
// =============================================================================

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kSecondaryColor.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: Icon(icon, size: 22, color: kSecondaryColor),
        ),
      ),
    );
  }
}
