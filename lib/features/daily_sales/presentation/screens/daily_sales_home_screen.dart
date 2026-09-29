import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../replenishment/presentation/providers/replenishment_providers.dart';
import '../../domain/entities/entities.dart';
import '../controllers/controllers.dart';
import '../widgets/sale_status_badge.dart';

/// Daily Sales home screen — lists the active outlet's in-store sales and
/// lets the agent start a new one.
///
/// Departure from the mock: the header only shows "Today's Total" and
/// "Sales Today" — the mock's third stat ("Incentive Earned") has no
/// backing data anywhere in [DailySale]/[DailySaleItem], so it's omitted
/// rather than fabricated.
class DailySalesHomeScreen extends ConsumerWidget {
  final int customerId;
  final String customerCode;
  final String customerName;
  final String? visitLocalId;
  final int? visitServerId;

  const DailySalesHomeScreen({
    super.key,
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    this.visitLocalId,
    this.visitServerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (customerId <= 0) {
      return _NotClockedInScaffold(onGoToRoute: () => context.push('/daily-route'));
    }

    final salesAsync = ref.watch(dailySalesListControllerProvider(customerId));
    final selectedStatus = ref.watch(dailySalesStatusFilterProvider);
    final sales = salesAsync.value?.items ?? const <DailySale>[];

    return Scaffold(
      backgroundColor: kBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(
          '/daily-sales/register',
          extra: {
            'customerId': customerId,
            'customerName': customerName,
            'customerCode': customerCode,
          },
        ),
        backgroundColor: kTextDark,
        icon: const Icon(Icons.add, color: kTextLight),
        label: const Text('New Sale', style: TextStyle(color: kTextLight)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _Header(customerName: customerName, sales: sales),
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  _FilterChip(
                    label: 'All',
                    selected: selectedStatus == null,
                    onTap: () => ref
                        .read(dailySalesStatusFilterProvider.notifier)
                        .set(null),
                  ),
                  const SizedBox(width: 8),
                  for (final status in DailySaleStatus.values) ...[
                    _FilterChip(
                      label: status.label,
                      selected: selectedStatus == status,
                      onTap: () => ref
                          .read(dailySalesStatusFilterProvider.notifier)
                          .set(status),
                    ),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => ref
                    .read(dailySalesListControllerProvider(customerId).notifier)
                    .refresh(),
                child: salesAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => _ErrorState(
                    message: error is Failure ? error.displayMessage : '$error',
                    onRetry: () => ref.invalidate(
                      dailySalesListControllerProvider(customerId),
                    ),
                  ),
                  data: (page) => page.items.isEmpty
                      ? ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: const [_EmptyState()],
                        )
                      : ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(20, 6, 20, 100),
                          children: [
                            const _ReorderCard(),
                            const Text(
                              'TODAY',
                              style: TextStyle(
                                fontSize: 11,
                                color: kTextFaint,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            for (final sale in page.items) ...[
                              _SaleCard(
                                sale: sale,
                                onTap: () =>
                                    context.push('/daily-sales/${sale.id}'),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String customerName;
  final List<DailySale> sales;

  const _Header({required this.customerName, required this.sales});

  @override
  Widget build(BuildContext context) {
    final confirmedTotal = sales
        .where((s) => s.isConfirmed)
        .fold(0.0, (sum, s) => sum + s.totalAmountValue);
    final dateLabel = _formatDate(DateTime.now());

    return Container(
      width: double.infinity,
      color: kTextDark,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daily Sales',
            style: TextStyle(
              color: kTextLight,
              fontWeight: FontWeight.w800,
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$customerName · $dateLabel',
            style: const TextStyle(color: Colors.white54, fontSize: 11),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _DarkStat(
                label: "TODAY'S TOTAL",
                value:
                    '${AppConfig.defaultCurrency} ${confirmedTotal.toStringAsFixed(0)}',
              ),
              const SizedBox(width: 24),
              _DarkStat(label: 'SALES TODAY', value: '${sales.length}'),
            ],
          ),
        ],
      ),
    );
  }
}

class _DarkStat extends StatelessWidget {
  final String label;
  final String value;

  const _DarkStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: kTextLight,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 10,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}

/// Live "what to reorder" summary, recomputed automatically as sales are
/// confirmed. Omitted entirely while loading, on error, or when there's
/// nothing to reorder yet — a 404 from the backend means exactly that, not
/// an error.
class _ReorderCard extends ConsumerWidget {
  const _ReorderCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(replenishmentCurrentProvider);
    final order = orderAsync.value;

    if (order == null || order.totalItems <= 0) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => context.push('/daily-sales/reorder'),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.storefront_outlined,
                    color: kSecondaryColor,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SUGGESTED REORDER',
                        style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 0.5,
                          color: kSecondaryColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${order.totalItems} item${order.totalItems == 1 ? '' : 's'} running low',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: kSecondaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: kTextDark,
      showCheckmark: false,
      side: BorderSide(color: selected ? kTextDark : kBorderColor),
      labelStyle: TextStyle(
        color: selected ? kTextLight : kTextDark,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      backgroundColor: kPrimaryLightColor,
    );
  }
}

class _SaleCard extends StatelessWidget {
  final DailySale sale;
  final VoidCallback onTap;

  const _SaleCard({required this.sale, required this.onTap});

  String get _initials {
    final parts = sale.customerName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    final first = parts.first[0];
    final second = parts.length > 1 && parts.last.isNotEmpty ? parts.last[0] : '';
    return '$first$second'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final isCancelled = sale.isCancelled;
    final time = sale.createdAt != null
        ? _formatTime(sale.createdAt!.toLocal())
        : null;

    return Opacity(
      opacity: isCancelled ? 0.6 : 1,
      child: Material(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: kBorderColor),
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isCancelled ? kBackground : kSecondaryLightColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    _initials,
                    style: TextStyle(
                      color: isCancelled ? kTextFaint : kSecondaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sale.customerName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: kTextDark,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${sale.totalItems} item${sale.totalItems == 1 ? '' : 's'}'
                        '${time != null ? ' · $time' : ''}',
                        style: const TextStyle(fontSize: 11, color: kTextFaint),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${AppConfig.defaultCurrency} ${sale.totalAmountValue.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: kTextDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    SaleStatusBadge(status: sale.status),
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

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 80, 32, 32),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kSecondaryColor.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.point_of_sale_outlined,
              color: kSecondaryColor,
              size: 32,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'No sales yet',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: kTextDark,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Scan a product barcode to register your first sale for this outlet.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.5, color: kTextMuted, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: kRedColor, size: 40),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kTextDark),
            ),
            const SizedBox(height: 12),
            SecondaryButton(label: 'Retry', onPressed: onRetry, expand: false),
          ],
        ),
      ),
    );
  }
}

const _months = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

String _formatDate(DateTime dt) => '${_months[dt.month - 1]} ${dt.day}';

String _formatTime(DateTime dt) {
  final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
  final period = dt.hour >= 12 ? 'PM' : 'AM';
  return '$hour:${dt.minute.toString().padLeft(2, '0')} $period';
}

class _NotClockedInScaffold extends StatelessWidget {
  final VoidCallback onGoToRoute;

  const _NotClockedInScaffold({required this.onGoToRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: kBackground,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_off_outlined,
                    color: kTextFaint,
                    size: 26,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Not Clocked In',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                const Text(
                  'You need to clock in to an outlet before you can register a sale.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: kTextMuted, height: 1.4),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  label: 'Go to Daily Route',
                  trailingIcon: Icons.arrow_forward,
                  expand: false,
                  onPressed: onGoToRoute,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
