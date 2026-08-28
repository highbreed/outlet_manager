import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../daily_route/presentation/widgets/widgets.dart' show showRouteBottomSheet;
import '../../domain/entities/entities.dart';
import '../providers/sales_order_providers.dart';

/// Filter bar used on the Sales home screen.
///
/// Shows a search field plus a "Filters" button that opens a bottom sheet
/// with status + customer type + date range controls.
class SalesFilterBar extends ConsumerStatefulWidget {
  /// Which tab is currently active (affects which status options show).
  final bool showOrderStatus;
  final bool showQuotationStatus;

  const SalesFilterBar({
    super.key,
    required this.showOrderStatus,
    required this.showQuotationStatus,
  });

  @override
  ConsumerState<SalesFilterBar> createState() => _SalesFilterBarState();
}

class _SalesFilterBarState extends ConsumerState<SalesFilterBar> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: ref.read(salesFilterProvider).search,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openFilterSheet() {
    showRouteBottomSheet<void>(
      context,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      builder: (_) => _FilterSheet(
        showOrderStatus: widget.showOrderStatus,
        showQuotationStatus: widget.showQuotationStatus,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(salesFilterProvider);
    final notifier = ref.read(salesFilterProvider.notifier);
    final activeCount = _countActive(filter);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              style: const TextStyle(fontSize: 13, color: kTextDark),
              decoration: InputDecoration(
                hintText: 'Search by #, customer...',
                hintStyle: const TextStyle(fontSize: 13, color: kTextFaint),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 18,
                  color: kTextFaint,
                ),
                suffixIcon: filter.search.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close, size: 16),
                        onPressed: () {
                          _searchController.clear();
                          notifier.setSearch('');
                        },
                      )
                    : null,
                isDense: true,
                filled: true,
                fillColor: kPrimaryLightColor,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: kBorderColor),
                ),
              ),
              onChanged: notifier.setSearch,
            ),
          ),
          const SizedBox(width: 8),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Material(
                color: activeCount > 0 ? kTextDark : kPrimaryLightColor,
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: _openFilterSheet,
                  child: Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: activeCount > 0
                          ? null
                          : Border.all(color: kBorderColor),
                    ),
                    child: Icon(
                      Icons.tune,
                      size: 18,
                      color: activeCount > 0 ? kTextLight : kTextDark,
                    ),
                  ),
                ),
              ),
              if (activeCount > 0)
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: kRedColor,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$activeCount',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: kTextLight,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  int _countActive(SalesFilter f) {
    var n = 0;
    if (f.customerType != null) n++;
    if (widget.showOrderStatus && f.orderStatus != null) n++;
    if (widget.showQuotationStatus && f.quotationStatus != null) n++;
    if (f.fromDate != null || f.toDate != null) n++;
    return n;
  }
}

class _FilterSheet extends ConsumerStatefulWidget {
  final bool showOrderStatus;
  final bool showQuotationStatus;

  const _FilterSheet({
    required this.showOrderStatus,
    required this.showQuotationStatus,
  });

  @override
  ConsumerState<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends ConsumerState<_FilterSheet> {
  late String? _selectedCardCode;
  final _customerSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final filter = ref.read(salesFilterProvider);
    _selectedCardCode = filter.cardCode;
    Future.microtask(() => ref.read(salesCustomersProvider.notifier).refresh());
  }

  @override
  void dispose() {
    _customerSearchController.dispose();
    super.dispose();
  }

  Future<void> _pickCustomer() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
              top: 8,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _customerSearchController,
                  decoration: const InputDecoration(
                    hintText: 'Search customers...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) =>
                      ref.read(salesCustomersProvider.notifier).search(v),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 360,
                  child: Consumer(
                    builder: (context, ref, _) {
                      final state = ref.watch(salesCustomersProvider);
                      final customers = state.customers;

                      if (state.isLoading && customers.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                        itemCount: customers.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return ListTile(
                              leading: const Icon(Icons.filter_alt_off),
                              title: const Text('All Customers'),
                              onTap: () {
                                setState(() => _selectedCardCode = null);
                                ref
                                    .read(salesFilterProvider.notifier)
                                    .setCardCode(null);
                                Navigator.of(ctx).pop();
                              },
                            );
                          }
                          final c = customers[index - 1];
                          return ListTile(
                            title: Text(c.name),
                            subtitle: Text(c.code),
                            onTap: () {
                              setState(() => _selectedCardCode = c.code);
                              ref
                                  .read(salesFilterProvider.notifier)
                                  .setCardCode(c.code);
                              Navigator.of(ctx).pop();
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickDateRange() async {
    final filter = ref.read(salesFilterProvider);
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 2),
      lastDate: now,
      initialDateRange: (filter.fromDate != null && filter.toDate != null)
          ? DateTimeRange(start: filter.fromDate!, end: filter.toDate!)
          : null,
    );
    if (picked != null) {
      ref.read(salesFilterProvider.notifier)
        ..setFromDate(picked.start)
        ..setToDate(picked.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(salesFilterProvider);
    final notifier = ref.read(salesFilterProvider.notifier);
    final customersState = ref.watch(salesCustomersProvider);
    final customers = customersState.customers;

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 4,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                if (filter.isActive)
                  TextButton.icon(
                    onPressed: () {
                      notifier.clear();
                    },
                    icon: const Icon(Icons.refresh, size: 16),
                    label: const Text('Reset'),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            _sectionLabel('Endpoint Filters'),
            OutlinedButton.icon(
              onPressed: _pickCustomer,
              icon: const Icon(Icons.person_search),
              label: Text(
                _selectedCardCode == null
                    ? 'All Customers'
                    : customers
                              .where((c) => c.code == _selectedCardCode)
                              .firstOrNull
                              ?.name !=
                          null
                    ? '$_selectedCardCode • ${customers.where((c) => c.code == _selectedCardCode).first.name}'
                    : _selectedCardCode!,
              ),
            ),
            if (!customersState.isLoading && customers.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  customersState.error ?? 'No customers found from API.',
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
              ),
            const SizedBox(height: 16),
            _sectionLabel('Customer Type'),
            Wrap(
              spacing: 8,
              children: [
                _choice(
                  label: 'All',
                  selected: filter.customerType == null,
                  onSelected: () => notifier.setCustomerType(null),
                ),
                _choice(
                  label: 'Cash',
                  selected: filter.customerType == CustomerType.cash,
                  onSelected: () => notifier.setCustomerType(CustomerType.cash),
                ),
                _choice(
                  label: 'Credit',
                  selected: filter.customerType == CustomerType.credit,
                  onSelected: () =>
                      notifier.setCustomerType(CustomerType.credit),
                ),
              ],
            ),
            if (widget.showOrderStatus) ...[
              const SizedBox(height: 16),
              _sectionLabel('Order Status'),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _choice(
                    label: 'All',
                    selected: filter.orderStatus == null,
                    onSelected: () => notifier.setOrderStatus(null),
                  ),
                  ...SalesOrderStatus.values.map(
                    (s) => _choice(
                      label: s.label,
                      selected: filter.orderStatus == s,
                      onSelected: () => notifier.setOrderStatus(s),
                    ),
                  ),
                ],
              ),
            ],
            if (widget.showQuotationStatus) ...[
              const SizedBox(height: 16),
              _sectionLabel('Quotation Status'),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _choice(
                    label: 'All',
                    selected: filter.quotationStatus == null,
                    onSelected: () => notifier.setQuotationStatus(null),
                  ),
                  ...QuotationStatus.values.map(
                    (s) => _choice(
                      label: s.label,
                      selected: filter.quotationStatus == s,
                      onSelected: () => notifier.setQuotationStatus(s),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            _sectionLabel('Date Range'),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickDateRange,
                    icon: const Icon(Icons.event),
                    label: Text(
                      (filter.fromDate == null && filter.toDate == null)
                          ? 'Any date'
                          : '${_fmt(filter.fromDate)} → ${_fmt(filter.toDate)}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                if (filter.fromDate != null || filter.toDate != null)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      notifier
                        ..setFromDate(null)
                        ..setToDate(null);
                    },
                  ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Apply',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: kTextMuted,
      ),
    ),
  );

  Widget _choice({
    required String label,
    required bool selected,
    required VoidCallback onSelected,
  }) => ChoiceChip(
    label: Text(label),
    selected: selected,
    onSelected: (_) => onSelected(),
    selectedColor: kSecondaryColor,
    labelStyle: TextStyle(
      color: selected ? Colors.white : kTextDark,
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),
  );

  static String _fmt(DateTime? d) {
    if (d == null) return '…';
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }
}
