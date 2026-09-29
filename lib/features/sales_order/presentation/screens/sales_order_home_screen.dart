import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/theme/colors.dart';
import '../../domain/entities/entities.dart';
import '../providers/sales_order_providers.dart';
import '../widgets/widgets.dart';

/// Sales home — toggle between Orders & Quotations with search + filter and
/// a new-document FAB.
class SalesOrderHomeScreen extends ConsumerStatefulWidget {
  const SalesOrderHomeScreen({super.key});

  @override
  ConsumerState<SalesOrderHomeScreen> createState() =>
      _SalesOrderHomeScreenState();
}

class _SalesOrderHomeScreenState extends ConsumerState<SalesOrderHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _newDocument() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: kTextDark.withValues(alpha: 0.35),
      builder: (ctx) => SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          decoration: const BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kBorderColor,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const Text(
                'What are you creating?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 16),
              _NewDocOption(
                icon: Icons.receipt_long_outlined,
                iconBg: kSecondaryLightColor,
                iconColor: kSecondaryColor,
                title: 'Sales Order',
                subtitle: 'Credit customers only',
                onTap: () {
                  Navigator.of(ctx).pop();
                  context.push('/sales-orders/customers?kind=order');
                },
              ),
              const SizedBox(height: 10),
              _NewDocOption(
                icon: Icons.description_outlined,
                iconBg: kSecondaryColor2,
                iconColor: const Color(0xFF8A5A00),
                title: 'Sales Quotation',
                subtitle: 'Cash or credit customers',
                onTap: () {
                  Navigator.of(ctx).pop();
                  context.push('/sales-orders/customers?kind=quotation');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(salesOrdersProvider);
    final quotationsAsync = ref.watch(salesTodayQuotationsProvider);
    final quotations = quotationsAsync.value ?? const <SalesQuotation>[];
    final isOrdersTab = _tabController.index == 0;

    return Scaffold(
      backgroundColor: kBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _newDocument,
        backgroundColor: kSecondaryColor,
        icon: const Icon(Icons.add, color: kTextLight),
        label: const Text('New', style: TextStyle(color: kTextLight)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _StatsHeroHeader(
              isOrdersTab: isOrdersTab,
              orders: orders,
              quotations: quotations,
              onToggle: (i) => setState(() => _tabController.animateTo(i)),
            ),
            SalesFilterBar(
              showOrderStatus: isOrdersTab,
              showQuotationStatus: !isOrdersTab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [_OrdersTab(), _QuotationsTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsHeroHeader extends StatelessWidget {
  final bool isOrdersTab;
  final List<SalesOrder> orders;
  final List<SalesQuotation> quotations;
  final ValueChanged<int> onToggle;

  const _StatsHeroHeader({
    required this.isOrdersTab,
    required this.orders,
    required this.quotations,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final currency = AppConfig.defaultCurrency;
    final now = DateTime.now();
    bool isToday(DateTime d) =>
        d.year == now.year && d.month == now.month && d.day == now.day;

    late String v1, l1, v2, l2, v3, l3;

    if (isOrdersTab) {
      final openValue = orders
          .where(
            (o) =>
                o.status != SalesOrderStatus.fulfilled &&
                o.status != SalesOrderStatus.cancelled,
          )
          .fold(0.0, (sum, o) => sum + o.total);
      final awaitingAction = orders
          .where((o) => o.status == SalesOrderStatus.pending)
          .length;
      final fulfilledToday = orders
          .where(
            (o) =>
                o.status == SalesOrderStatus.fulfilled &&
                isToday(o.updatedAt),
          )
          .length;
      v1 = '$currency ${_compact(openValue)}';
      l1 = 'OPEN VALUE';
      v2 = '$awaitingAction';
      l2 = 'AWAITING ACTION';
      v3 = '$fulfilledToday';
      l3 = 'FULFILLED TODAY';
    } else {
      final open = quotations.where(
        (q) =>
            !q.isExpired &&
            (q.status == QuotationStatus.draft ||
                q.status == QuotationStatus.sent ||
                q.status == QuotationStatus.accepted),
      );
      final quotedValue = open.fold(0.0, (sum, q) => sum + q.total);
      final converted = quotations
          .where((q) => q.status == QuotationStatus.converted)
          .length;
      v1 = '${open.length}';
      l1 = 'OPEN QUOTES';
      v2 = '$currency ${_compact(quotedValue)}';
      l2 = 'QUOTED VALUE';
      v3 = '$converted';
      l3 = 'CONVERTED';
    }

    return Container(
      width: double.infinity,
      color: kTextDark,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Orders & Quotations',
            style: TextStyle(
              color: kTextLight,
              fontWeight: FontWeight.w800,
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _Stat(value: v1, label: l1)),
              Expanded(child: _Stat(value: v2, label: l2)),
              Expanded(
                child: _Stat(
                  value: v3,
                  label: l3,
                  color: const Color(0xFF7ED99A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                Expanded(
                  child: _ToggleTab(
                    label: 'Orders',
                    selected: isOrdersTab,
                    onTap: () => onToggle(0),
                  ),
                ),
                Expanded(
                  child: _ToggleTab(
                    label: 'Quotations',
                    selected: !isOrdersTab,
                    onTap: () => onToggle(1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _compact(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(2)}M';
    }
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}K';
    }
    return value.toStringAsFixed(0);
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  final Color? color;

  const _Stat({required this.value, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            color: color ?? kTextLight,
            fontWeight: FontWeight.w800,
            fontSize: 17,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 9,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

class _ToggleTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ToggleTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? kPrimaryLightColor : null,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: selected ? kTextDark : Colors.white70,
          ),
        ),
      ),
    );
  }
}

class _NewDocOption extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _NewDocOption({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPrimaryLightColor,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: kBorderColor),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 11, color: kTextFaint),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, size: 16, color: kTextFaint),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrdersTab extends ConsumerWidget {
  const _OrdersTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(filteredSalesOrdersProvider);
    final total = ref.watch(salesOrdersProvider).length;
    if (orders.isEmpty) {
      return _EmptyState(
        icon: Icons.receipt_long_outlined,
        title: total == 0 ? 'No sales orders yet' : 'No matches',
        message: total == 0
            ? 'Tap "New" to create your first sales order.'
            : 'Try adjusting your search or filters.',
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 90),
      itemCount: orders.length,
      itemBuilder: (_, i) {
        final o = orders[i];
        return OrderCard(
          order: o,
          onTap: () => context.push('/sales-orders/order/${o.localId}'),
        );
      },
    );
  }
}

class _QuotationsTab extends ConsumerWidget {
  const _QuotationsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(salesFilterProvider);
    final quotationsAsync = ref.watch(salesTodayQuotationsProvider);

    return quotationsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => _EmptyState(
        icon: Icons.error_outline,
        title: 'Failed to load quotations',
        message: error.toString(),
      ),
      data: (allQuotations) {
        final q = filter.search.trim().toLowerCase();
        final quotations = allQuotations.where((qt) {
          if (q.isNotEmpty) {
            final hit =
                qt.quotationNumber.toLowerCase().contains(q) ||
                qt.customerName.toLowerCase().contains(q) ||
                qt.customerCode.toLowerCase().contains(q);
            if (!hit) return false;
          }
          if (filter.customerType != null &&
              qt.customerType != filter.customerType) {
            return false;
          }
          if (filter.quotationStatus != null &&
              qt.status != filter.quotationStatus) {
            return false;
          }
          if (filter.fromDate != null &&
              qt.createdAt.isBefore(filter.fromDate!)) {
            return false;
          }
          if (filter.toDate != null &&
              qt.createdAt.isAfter(
                filter.toDate!.add(const Duration(days: 1)),
              )) {
            return false;
          }
          return true;
        }).toList();

        if (quotations.isEmpty) {
          return _EmptyState(
            icon: Icons.description_outlined,
            title: allQuotations.isEmpty ? 'No quotations today' : 'No matches',
            message: allQuotations.isEmpty
                ? 'No quotations have been created today.'
                : 'Try adjusting your search or filters.',
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 90),
          itemCount: quotations.length,
          itemBuilder: (_, i) {
            final item = quotations[i];
            return QuotationCard(
              quotation: item,
              onTap: () =>
                  context.push('/sales-orders/quotation/${item.localId}'),
              onConvert: () => context.push(
                '/sales-orders/quotation/${item.localId}/convert',
              ),
            );
          },
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  const _EmptyState({
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: kSecondaryLightColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: kSecondaryColor),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kTextMuted, fontSize: 13.5),
            ),
          ],
        ),
      ),
    );
  }
}
