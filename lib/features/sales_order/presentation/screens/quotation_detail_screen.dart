import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../daily_sales/presentation/widgets/surface_card.dart';
import '../../domain/entities/entities.dart';
import '../providers/sales_order_providers.dart';
import '../widgets/widgets.dart';

/// No direct mock frame exists for this screen — styled using the same
/// dark-header + purple-totals-band language as [OrderDetailScreen] for
/// visual consistency across the module.
class QuotationDetailScreen extends ConsumerWidget {
  final String localId;

  const QuotationDetailScreen({super.key, required this.localId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localQuotation = ref.watch(salesQuotationByIdProvider(localId));
    final serverQuotationsAsync = ref.watch(salesTodayQuotationsProvider);

    final q =
        localQuotation ??
        serverQuotationsAsync.maybeWhen(
          data: (items) => items.where((e) => e.localId == localId).firstOrNull,
          orElse: () => null,
        );

    if (q == null) {
      return Scaffold(
        backgroundColor: kBackground,
        body: SafeArea(
          child: Center(
            child: serverQuotationsAsync.isLoading
                ? const CircularProgressIndicator()
                : const Text('Quotation not found'),
          ),
        ),
      );
    }

    final hasWarehouseName =
        q.warehouseName != null && q.warehouseName!.trim().isNotEmpty;
    final hasWarehouseCode =
        q.warehouseCode != null && q.warehouseCode!.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            _Header(quotation: q),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                children: [
                  ...q.lineItems.map(
                    (i) => LineItemTile(item: i, readOnly: true),
                  ),
                  const SizedBox(height: 4),
                  OrderTotalsCard(
                    subtotal: q.subtotal,
                    discountPercent: q.additionalDiscountPercent,
                    discountAmount: q.discountAmount,
                    taxPercent: q.taxPercent,
                    taxAmount: q.taxAmount,
                    total: q.total,
                    itemCount: q.totalItems,
                  ),
                  const SizedBox(height: 14),
                  SurfaceCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'QUOTATION INFO',
                          style: TextStyle(
                            fontSize: 11,
                            color: kTextFaint,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (q.sapDocNum != null && q.sapDocNum! > 0)
                          _InfoRow(
                            label: 'SAP document number',
                            value: '${q.sapDocNum}',
                          ),
                        if (hasWarehouseName)
                          _InfoRow(label: 'Warehouse', value: q.warehouseName!),
                        if (hasWarehouseCode)
                          _InfoRow(
                            label: hasWarehouseName
                                ? 'Warehouse code'
                                : 'Warehouse',
                            value: q.warehouseCode!,
                          ),
                        if (q.lpoNumber != null &&
                            q.lpoNumber!.trim().isNotEmpty)
                          _InfoRow(label: 'LPO number', value: q.lpoNumber!),
                        _InfoRow(
                          label: 'Notes',
                          value: (q.notes != null && q.notes!.trim().isNotEmpty)
                              ? q.notes!
                              : '—',
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),
                  if (q.canConvert) ...[
                    const SizedBox(height: 20),
                    PrimaryButton(
                      label: 'Convert to Sales Order',
                      trailingIcon: Icons.swap_horiz,
                      onPressed: () => context.push(
                        '/sales-orders/quotation/${q.localId}/convert',
                      ),
                    ),
                  ],
                  if (q.status == QuotationStatus.converted &&
                      q.convertedOrderLocalId != null) ...[
                    const SizedBox(height: 12),
                    SecondaryButton(
                      label: 'View Related Sales Order',
                      leadingIcon: Icons.receipt_long,
                      onPressed: () => context.push(
                        '/sales-orders/order/${q.convertedOrderLocalId}',
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final SalesQuotation quotation;
  const _Header({required this.quotation});

  @override
  Widget build(BuildContext context) {
    final isExpired = quotation.isExpired;
    return Container(
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
                child: const Icon(Icons.arrow_back, size: 18, color: kTextLight),
              ),
              const SizedBox(width: 12),
              Text(
                quotation.quotationNumber,
                style: const TextStyle(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quotation.customerName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kTextLight,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Valid until ${_formatDate(quotation.validUntil)}',
                      style: const TextStyle(color: Colors.white54, fontSize: 11),
                    ),
                  ],
                ),
              ),
              StatusChip(
                label: isExpired ? 'Expired' : quotation.status.label,
                variant: isExpired
                    ? StatusChipVariant.danger
                    : switch (quotation.status) {
                        QuotationStatus.sent ||
                        QuotationStatus.accepted => StatusChipVariant.warning,
                        QuotationStatus.converted => StatusChipVariant.success,
                        QuotationStatus.expired ||
                        QuotationStatus.cancelled => StatusChipVariant.danger,
                        QuotationStatus.draft => StatusChipVariant.neutral,
                      },
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _formatDate(DateTime d) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
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
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
