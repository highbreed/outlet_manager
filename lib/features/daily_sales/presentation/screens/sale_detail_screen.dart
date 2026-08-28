import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../providers/daily_sale_detail_provider.dart';
import '../providers/usecase_providers.dart';
import '../widgets/order_summary_card.dart';
import '../widgets/sale_status_badge.dart';
import '../widgets/surface_card.dart';

/// Shows a sale's items/status/totals. For a pending sale, offers actions
/// to confirm (scan serials at payment) or cancel.
///
/// Departure from the mock: no per-item/total "incentive earned" figures —
/// neither [DailySale] nor [DailySaleItem] has any incentive data, and the
/// "Outlet" row in the mock's Sale Info card is omitted for the same reason
/// (this screen only has an outlet id, not a display name).
class SaleDetailScreen extends ConsumerWidget {
  final int saleId;

  const SaleDetailScreen({super.key, required this.saleId});

  Future<void> _cancel(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel sale?'),
        content: const Text(
          'This cannot be undone. The customer will need a new sale if they change their mind again.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes, cancel', style: TextStyle(color: kRedColor)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final usecase = await ref.read(cancelDailySaleProvider.future);
    final result = await usecase(saleId);
    if (!context.mounted) return;

    result.fold(
      (failure) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failure.displayMessage), backgroundColor: kRedColor),
      ),
      (sale) {
        ref.invalidate(dailySaleDetailProvider(saleId));
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Sale cancelled')));
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saleAsync = ref.watch(dailySaleDetailProvider(saleId));

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: saleAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(
            child: Text(
              error is Failure ? error.displayMessage : '$error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: kTextDark),
            ),
          ),
          data: (sale) => _SaleDetailBody(
            sale: sale,
            onConfirm: () => context.push('/daily-sales/$saleId/confirm'),
            onCancel: () => _cancel(context, ref),
          ),
        ),
      ),
    );
  }
}

class _SaleDetailBody extends StatelessWidget {
  final DailySale sale;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const _SaleDetailBody({
    required this.sale,
    required this.onConfirm,
    required this.onCancel,
  });

  String get _initials {
    final parts = sale.customerName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    final first = parts.first[0];
    final second = parts.length > 1 && parts.last.isNotEmpty ? parts.last[0] : '';
    return '$first$second'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(customerName: sale.customerName, initials: _initials, sale: sale),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            children: [
              SurfaceCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SALE INFO',
                      style: TextStyle(
                        fontSize: 11,
                        color: kTextFaint,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _InfoRow(label: 'Sale ID', value: 'DS-${sale.id}'),
                    _InfoRow(
                      label: 'Registered',
                      value: sale.createdAt != null
                          ? _formatDateTime(sale.createdAt!.toLocal())
                          : '—',
                      showDivider: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Items (${sale.items.length})',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kTextDark,
                ),
              ),
              const SizedBox(height: 14),
              ...sale.items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _ConfirmedItemCard(item: item),
                ),
              ),
              const SizedBox(height: 4),
              OrderSummaryCard(
                totalWithVat: sale.totalAmountValue,
                itemCount: sale.items.length,
                isEstimate: false,
              ),
              if (sale.isPending) ...[
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onCancel,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: kRedColor,
                          side: const BorderSide(color: kBorderColor),
                          minimumSize: const Size.fromHeight(52),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        child: const Text(
                          'Cancel Sale',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: PrimaryButton(
                        label: 'Confirm',
                        trailingIcon: Icons.arrow_forward,
                        onPressed: onConfirm,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String customerName;
  final String initials;
  final DailySale sale;

  const _Header({
    required this.customerName,
    required this.initials,
    required this.sale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kTextDark,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: const Icon(Icons.arrow_back, size: 18, color: kTextLight),
              ),
              const SizedBox(width: 12),
              const Text(
                'Sale Detail',
                style: TextStyle(
                  color: kTextLight,
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        initials,
                        style: const TextStyle(
                          color: kTextLight,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customerName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: kTextLight,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          if (sale.customerPhone != null &&
                              sale.customerPhone!.isNotEmpty)
                            Text(
                              sale.customerPhone!,
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 11,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SaleStatusBadge(status: sale.status),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool showDivider;

  const _InfoRow({
    required this.label,
    required this.value,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: showDivider
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFF0F0EE))),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: kTextMuted)),
          Text(
            value,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _ConfirmedItemCard extends StatelessWidget {
  final DailySaleItem item;

  const _ConfirmedItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${item.productName} × ${item.quantity}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextDark,
                  ),
                ),
              ),
              Text(
                '${AppConfig.defaultCurrency} ${item.totalPriceValue.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: kTextDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          if (item.isFullySerialized)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: kBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Wrap(
                spacing: 6,
                runSpacing: 4,
                children: [
                  for (final serial in item.serialNumbers)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check, size: 13, color: kSuccessText),
                        const SizedBox(width: 4),
                        Text(
                          serial.serialNumber,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: kSuccessText,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: kRedColor.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 13, color: kRedColor),
                  const SizedBox(width: 6),
                  const Text(
                    'Serial not yet captured',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: kRedColor,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

String _formatDateTime(DateTime dt) {
  final now = DateTime.now();
  final isToday =
      dt.year == now.year && dt.month == now.month && dt.day == now.day;
  final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
  final period = dt.hour >= 12 ? 'PM' : 'AM';
  final time = '$hour:${dt.minute.toString().padLeft(2, '0')} $period';
  return isToday ? 'Today, $time' : '${dt.month}/${dt.day} $time';
}
