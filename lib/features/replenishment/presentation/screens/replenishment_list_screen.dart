import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../daily_route/presentation/widgets/widgets.dart' show RouteBackHeader;
import '../../../daily_route/providers/daily_route_providers.dart';
import '../../../sales_order/sales_order.dart';
import '../../data/datasources/replenishment_remote_datasource.dart';
import '../providers/replenishment_providers.dart';
import '../widgets/replenishment_item_row.dart';

/// Live suggested-reorder list for the agent's current visit — a read-only
/// snapshot recomputed automatically every time a sale is confirmed.
///
/// Departure from the mock: the "All Products" tab is dropped since it
/// needs a full catalogue-with-stock data source this screen doesn't have.
/// "Convert to Sales Order" (see `_convertToSalesOrder`) resolves the
/// current outlet and each suggested item against the real Sales Order
/// catalogue before landing on a pre-filled Create Order draft — it never
/// fabricates a match; an unresolved outlet or item falls back to manual
/// entry instead of guessing.
class ReplenishmentListScreen extends ConsumerWidget {
  const ReplenishmentListScreen({super.key});

  Future<void> _convertToSalesOrder(
    BuildContext context,
    WidgetRef ref,
    ReplenishmentOrder order,
  ) async {
    final outletName = ref.read(activeVisitProvider)?.outletName;
    if (outletName == null || outletName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No active visit to match against a customer — pick one manually.',
          ),
        ),
      );
      context.push('/sales-orders/customers');
      return;
    }

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    SalesCustomer? customer;
    try {
      final customersNotifier = ref.read(salesCustomersProvider.notifier);
      await customersNotifier.search(outletName);
      final matches = ref
          .read(salesCustomersProvider)
          .customers
          .where(
            (c) => c.name.trim().toLowerCase() == outletName.trim().toLowerCase(),
          )
          .toList();
      customer = matches.length == 1 ? matches.single : null;
    } finally {
      if (context.mounted) Navigator.of(context, rootNavigator: true).pop();
    }

    if (customer == null) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Couldn\'t confidently match "$outletName" to a sales customer — pick one manually.',
          ),
        ),
      );
      context.push('/sales-orders/customers');
      return;
    }

    if (!context.mounted) return;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    final resolvedItems = <OrderLineItem>[];
    final skipped = <String>[];
    try {
      final dataSource = ref.read(salesCustomerRemoteDataSourceProvider);
      for (final item in order.items) {
        final response = await dataSource.fetchProducts(
          cardCode: customer.code,
          search: item.itemCode,
        );
        final product = response.items
            .where((p) => p.code == item.itemCode)
            .firstOrNull;
        if (product == null) {
          skipped.add(item.itemName ?? item.itemCode);
          continue;
        }
        resolvedItems.add(
          OrderLineItem.fromProduct(
            localId: '${item.itemCode}-${item.id}',
            product: product,
            quantity: item.proposedQuantity,
          ),
        );
      }
    } finally {
      if (context.mounted) Navigator.of(context, rootNavigator: true).pop();
    }

    if (!context.mounted) return;

    if (resolvedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'None of the suggested items were found in the sales catalogue.',
          ),
        ),
      );
      return;
    }

    if (skipped.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${resolvedItems.length} of ${order.items.length} items added — '
            'not found in catalogue: ${skipped.join(', ')}',
          ),
        ),
      );
    }

    context.push(
      '/sales-orders/create?kind=order&customerId=${customer.id}',
      extra: resolvedItems,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(replenishmentCurrentProvider);

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            RouteBackHeader(
              title: 'Replenishment',
              onBack: () => Navigator.of(context).maybePop(),
            ),
            Expanded(
              child: orderAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => _ErrorState(
                  message: error is Failure ? error.displayMessage : '$error',
                  onRetry: () => ref.invalidate(replenishmentCurrentProvider),
                ),
                data: (order) {
                  if (order == null || order.items.isEmpty) {
                    return const _EmptyState();
                  }

                  return RefreshIndicator(
                    onRefresh: () async =>
                        ref.invalidate(replenishmentCurrentProvider),
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 6, 20, 24),
                      children: [
                        _StatsBand(order: order),
                        const SizedBox(height: 18),
                        const Text(
                          'SUGGESTED',
                          style: TextStyle(
                            fontSize: 11,
                            color: kTextFaint,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        for (final item in order.items) ...[
                          ReplenishmentItemRow(item: item),
                          const SizedBox(height: 10),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: orderAsync.valueOrNull?.items.isNotEmpty == true
          ? SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: PrimaryButton(
                  label: 'Convert to Sales Order',
                  trailingIcon: Icons.arrow_forward,
                  onPressed: () => _convertToSalesOrder(
                    context,
                    ref,
                    orderAsync.requireValue!,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class _StatsBand extends StatelessWidget {
  final ReplenishmentOrder order;

  const _StatsBand({required this.order});

  @override
  Widget build(BuildContext context) {
    final currency = AppConfig.defaultCurrency;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kTextDark,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: _Stat(label: 'TO REORDER', value: '${order.totalItems}'),
          ),
          Expanded(
            child: _Stat(
              label: 'UNITS TO ORDER',
              value: '${order.totalQuantity}',
            ),
          ),
          Expanded(
            child: _Stat(
              label: 'EST. REORDER',
              value: '$currency ${order.estimatedTotal.toStringAsFixed(0)}',
              color: const Color(0xFF7ED99A),
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const _Stat({required this.label, required this.value, this.color});

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
            fontSize: 16,
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

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                Icons.playlist_add_check_outlined,
                color: kSecondaryColor,
                size: 32,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nothing to reorder yet',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Suggestions appear here automatically as confirmed sales '
              'drop items to or below their minimum stock level.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.5, color: kTextMuted, height: 1.4),
            ),
          ],
        ),
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
