import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/entities.dart';
import '../providers/sales_order_providers.dart';

enum _TypeFilter { all, credit, cash }

/// Customer picker for starting a new order or quotation.
///
/// If the requested kind is `order` and the user picks a cash customer, we
/// explain that cash customers must use a quotation first.
class SelectCustomerScreen extends ConsumerStatefulWidget {
  final SalesDocumentKind kind;

  const SelectCustomerScreen({super.key, required this.kind});

  @override
  ConsumerState<SelectCustomerScreen> createState() =>
      _SelectCustomerScreenState();
}

class _SelectCustomerScreenState extends ConsumerState<SelectCustomerScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  _TypeFilter _typeFilter = _TypeFilter.all;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(salesCustomersProvider.notifier).loadMore();
    }
  }

  void _onSearch(String query) {
    ref.read(salesCustomersProvider.notifier).search(query);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(salesCustomersProvider);
    var customers = state.customers;
    if (_typeFilter == _TypeFilter.credit) {
      customers = customers.where((c) => c.isCredit).toList();
    } else if (_typeFilter == _TypeFilter.cash) {
      customers = customers.where((c) => c.isCash).toList();
    }

    final subtitle = widget.kind == SalesDocumentKind.order
        ? 'Sales Order'
        : 'Sales Quotation';

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: kTextDark,
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).maybePop(),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 18,
                          color: kTextLight,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select Customer',
                            style: TextStyle(
                              color: kTextLight,
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _searchController,
                    style: const TextStyle(color: kTextLight, fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'Search customers',
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 18,
                        color: Colors.white54,
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.clear,
                                size: 16,
                                color: Colors.white54,
                              ),
                              onPressed: () {
                                _searchController.clear();
                                _onSearch('');
                              },
                            )
                          : null,
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.1),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 13,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (v) {
                      setState(() {});
                      _onSearch(v);
                    },
                    onSubmitted: _onSearch,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 6),
              child: Row(
                children: [
                  _TypeChip(
                    label: 'All',
                    selected: _typeFilter == _TypeFilter.all,
                    onTap: () => setState(() => _typeFilter = _TypeFilter.all),
                  ),
                  const SizedBox(width: 8),
                  _TypeChip(
                    label: 'Credit',
                    selected: _typeFilter == _TypeFilter.credit,
                    onTap: () =>
                        setState(() => _typeFilter = _TypeFilter.credit),
                  ),
                  const SizedBox(width: 8),
                  _TypeChip(
                    label: 'Cash',
                    selected: _typeFilter == _TypeFilter.cash,
                    onTap: () => setState(() => _typeFilter = _TypeFilter.cash),
                  ),
                ],
              ),
            ),
            Expanded(child: _buildContent(state, customers)),
            if (widget.kind == SalesDocumentKind.order)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 13,
                      color: kWarningColor,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        'Picking a cash customer switches this to a quotation',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: kWarningColor),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    SalesCustomersState state,
    List<SalesCustomer> customers,
  ) {
    if (state.error != null && customers.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 40, color: kRedColor),
              const SizedBox(height: 12),
              const Text(
                'Failed to load customers',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Text(
                state.error!,
                style: const TextStyle(color: kTextMuted, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              SecondaryButton(
                label: 'Retry',
                expand: false,
                onPressed: () =>
                    ref.read(salesCustomersProvider.notifier).refresh(),
              ),
            ],
          ),
        ),
      );
    }

    if (customers.isEmpty && !state.isLoading) {
      return const Center(
        child: Text('No customers found', style: TextStyle(color: kTextMuted)),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 10),
      itemCount: customers.length + (state.hasMore ? 1 : 0),
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        if (index >= customers.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final customer = customers[index];
        return _CustomerTile(customer: customer, onTap: () => _onPick(customer));
      },
    );
  }

  void _onPick(SalesCustomer customer) {
    // Business rule: cash customers cannot start directly with a Sales Order.
    if (widget.kind == SalesDocumentKind.order && customer.isCash) {
      showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Cash Customer'),
          content: Text(
            '${customer.name} is a cash customer. Please create a '
            'quotation first. Once the customer pays, you can convert '
            'the quotation to a sales order.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                context.pushReplacement(
                  '/sales-orders/create?kind=quotation&customerId=${customer.id}',
                );
              },
              child: const Text('Create Quotation'),
            ),
          ],
        ),
      );
      return;
    }

    final kindParam = widget.kind == SalesDocumentKind.order
        ? 'order'
        : 'quotation';
    context.push(
      '/sales-orders/create?kind=$kindParam&customerId=${customer.id}',
    );
  }
}

class _TypeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TypeChip({
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

class _CustomerTile extends StatelessWidget {
  final SalesCustomer customer;
  final VoidCallback onTap;

  const _CustomerTile({required this.customer, required this.onTap});

  String get _initials => customer.name.isNotEmpty
      ? customer.name.trim().split(RegExp(r'\s+')).take(2).map((s) => s[0]).join().toUpperCase()
      : '?';

  @override
  Widget build(BuildContext context) {
    final isCredit = customer.isCredit;
    final showExhausted = isCredit && customer.overCreditLimit;
    final iconBg = isCredit ? kSecondaryLightColor : kSuccessBg;
    final iconFg = isCredit ? kSecondaryColor : kSuccessText;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: showExhausted ? kRedColor : kBorderColor,
          width: showExhausted ? 2 : 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
                    child: Text(
                      _initials,
                      style: TextStyle(
                        color: iconFg,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customer.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          customer.code,
                          style: const TextStyle(fontSize: 11, color: kTextFaint),
                        ),
                      ],
                    ),
                  ),
                  StatusChip(
                    label: customer.typeLabel.toUpperCase(),
                    variant: isCredit
                        ? StatusChipVariant.info
                        : StatusChipVariant.success,
                  ),
                ],
              ),
              if (isCredit) ...[
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: showExhausted
                        ? kRedColor.withValues(alpha: 0.06)
                        : kBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        showExhausted
                            ? 'Credit line nearly exhausted'
                            : 'Credit line available',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: showExhausted ? FontWeight.w600 : null,
                          color: showExhausted ? kRedColor : kTextMuted,
                        ),
                      ),
                      Text(
                        '${customer.effectiveAvailableCredit.toStringAsFixed(0)} / ${customer.creditLimit.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: showExhausted ? kRedColor : kSuccessText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
