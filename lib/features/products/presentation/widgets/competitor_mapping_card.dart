import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../daily_route/domain/entities/outlet_visit.dart';
import '../../../daily_route/providers/daily_route_providers.dart';
import '../../data/datasources/products_remote_datasource.dart';
import '../providers/products_providers.dart';
import 'add_competitor_mapping_sheet.dart';
import 'product_card.dart' show ProductPhotoPlaceholder;
import 'stock_status_badge.dart' show formatKes;

ModalBottomSheetProps _lightModalSheetProps() => const ModalBottomSheetProps(
  backgroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  ),
);

/// Full-tab browser for the competitor SKUs mapped to this item — not
/// outlet-scoped, so it always loads regardless of clock-in state. A single
/// item can have 100+ competitor SKUs mapped, so this paginates
/// (infinite-scroll) and is searchable/filterable by competitor brand and
/// model rather than dumping everything into one card. Tapping a mapping
/// opens it pre-filled to record an updated price/offer/model check —
/// there's no edit endpoint, so this submits a new dated snapshot (see
/// [AddCompetitorMappingSheet]). Adding or updating requires an active
/// visit.
class CompetitorMappingCard extends ConsumerStatefulWidget {
  final String itemCode;
  final String? modelNo;

  const CompetitorMappingCard({
    super.key,
    required this.itemCode,
    this.modelNo,
  });

  @override
  ConsumerState<CompetitorMappingCard> createState() =>
      _CompetitorMappingCardState();
}

class _CompetitorMappingCardState
    extends ConsumerState<CompetitorMappingCard> {
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
    if (current >= max * 0.85) {
      ref
          .read(competitorMappingsControllerProvider(widget.itemCode).notifier)
          .loadMore();
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      ref
          .read(competitorMappingsControllerProvider(widget.itemCode).notifier)
          .search(value.trim());
    });
  }

  Future<void> _openSheet(
    OutletVisit? activeVisit, {
    CompetitorMapping? existing,
  }) async {
    if (activeVisit == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Clock in to an outlet to update a competitor SKU.'),
        ),
      );
      return;
    }
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: kPrimaryLightColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => AddCompetitorMappingSheet(
        cardCode: activeVisit.outletCode,
        itemCode: widget.itemCode,
        modelNo: widget.modelNo,
        existing: existing,
      ),
    );
    if (result == true) {
      ref
          .read(competitorMappingsControllerProvider(widget.itemCode).notifier)
          .refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeVisit = ref.watch(activeVisitProvider);
    final state = ref.watch(competitorMappingsControllerProvider(widget.itemCode));
    final notifier = ref.read(
      competitorMappingsControllerProvider(widget.itemCode).notifier,
    );

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      style: const TextStyle(fontSize: 13, color: kTextDark),
                      decoration: InputDecoration(
                        hintText: 'Search competitor model...',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          color: kTextFaint,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 18,
                          color: kTextFaint,
                        ),
                        isDense: true,
                        filled: true,
                        fillColor: kPrimaryLightColor,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: kBorderColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 130,
                    child: _BrandFilterDropdown(
                      selected: state.brandFilter,
                      onChanged: notifier.setBrandFilter,
                    ),
                  ),
                ],
              ),
            ),
            if (activeVisit == null)
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  'Clock in to an outlet to add or update a competitor SKU.',
                  style: TextStyle(
                    fontSize: 12,
                    color: kRedColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            Expanded(child: _buildBody(state, notifier, activeVisit)),
          ],
        ),
        if (activeVisit != null)
          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton.extended(
              onPressed: () => _openSheet(activeVisit),
              backgroundColor: kSecondaryColor,
              icon: const Icon(Icons.add),
              label: const Text('Add SKU'),
            ),
          ),
      ],
    );
  }

  Widget _buildBody(
    CompetitorMappingsState state,
    CompetitorMappingsNotifier notifier,
    OutletVisit? activeVisit,
  ) {
    if (state.isLoading && state.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null && state.items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.cloud_off, size: 40, color: kTextMuted),
              const SizedBox(height: 12),
              Text(
                state.error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: kTextMuted),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: notifier.refresh,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }
    if (state.items.isEmpty) {
      final filtered = state.modelQuery.isNotEmpty || state.brandFilter != null;
      return Center(
        child: Text(
          filtered
              ? 'No competitor SKUs match your search.'
              : 'No competitor SKUs mapped yet.',
          style: const TextStyle(fontSize: 13, color: kTextMuted),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: notifier.refresh,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 88),
        itemCount: state.items.length + (state.isLoading ? 1 : 0),
        itemBuilder: (_, i) {
          if (i >= state.items.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            );
          }
          final mapping = state.items[i];
          return _MappingCard(
            mapping: mapping,
            onTap: () => _openSheet(activeVisit, existing: mapping),
          );
        },
      ),
    );
  }
}

class _BrandFilterDropdown extends ConsumerWidget {
  final CompetitorBrand? selected;
  final ValueChanged<CompetitorBrand?> onChanged;

  const _BrandFilterDropdown({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brandsAsync = ref.watch(competitorBrandsProvider);

    return brandsAsync.maybeWhen(
      data: (brands) => DropdownSearch<CompetitorBrand>(
        selectedItem: selected,
        items: (filter, _) {
          if (filter.trim().isEmpty) return brands;
          final q = filter.trim().toLowerCase();
          return brands.where((b) => b.name.toLowerCase().contains(q)).toList();
        },
        itemAsString: (b) => b.name,
        compareFn: (a, b) => a.id == b.id,
        suffixProps: const DropdownSuffixProps(
          clearButtonProps: ClearButtonProps(isVisible: true),
        ),
        decoratorProps: DropDownDecoratorProps(
          baseStyle: const TextStyle(fontSize: 12, color: kTextDark),
          decoration: InputDecoration(
            hintText: 'Brand ▾',
            hintStyle: const TextStyle(fontSize: 12, color: kTextFaint),
            isDense: true,
            filled: true,
            fillColor: kPrimaryLightColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(999),
              borderSide: const BorderSide(color: kBorderColor),
            ),
          ),
        ),
        popupProps: PopupProps.modalBottomSheet(
          showSearchBox: true,
          searchFieldProps: const TextFieldProps(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search brand...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          modalBottomSheetProps: _lightModalSheetProps(),
          title: const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'Filter by brand',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: kTextDark,
              ),
            ),
          ),
          itemBuilder: (context, b, isSelected, _) => ListTile(
            title: Text(b.name, style: const TextStyle(color: kTextDark)),
          ),
        ),
        onChanged: onChanged,
      ),
      orElse: () => IgnorePointer(
        child: DropdownSearch<CompetitorBrand>(
          enabled: false,
          items: (_, _) => const [],
          compareFn: (a, b) => a.id == b.id,
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(
              hintText: 'Brand',
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// One competitor SKU as its own card in the list — with 100+ mappings on
/// some items, a single dividers-in-one-card layout doesn't scale.
class _MappingCard extends StatelessWidget {
  final CompetitorMapping mapping;
  final VoidCallback onTap;

  const _MappingCard({required this.mapping, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final hasOffer = mapping.offerRrp > 0 && mapping.offerRrp < mapping.rrp;
    final displayPrice = mapping.offerRrp > 0 ? mapping.offerRrp : mapping.rrp;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBorderColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductPhotoPlaceholder(size: 52, radius: 14),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mapping.compModelNo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: kTextDark,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        mapping.compBrand,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11, color: kTextFaint),
                      ),
                      if ((mapping.additionalFeatures ?? '').isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          '+ ${mapping.additionalFeatures}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 11, color: kTextMuted),
                        ),
                      ],
                      if ((mapping.lessFeatures ?? '').isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          '- ${mapping.lessFeatures}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 11, color: kTextMuted),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (hasOffer)
                      Text(
                        formatKes(mapping.rrp),
                        style: const TextStyle(
                          fontSize: 11,
                          color: kTextFaint,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Text(
                      formatKes(displayPrice),
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _StatusPill(status: mapping.status),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String status;

  const _StatusPill({required this.status});

  @override
  Widget build(BuildContext context) {
    final approved = status.toLowerCase() == 'approved';
    final color = approved ? kSuccessColor : kWarningColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        status,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color),
      ),
    );
  }
}
