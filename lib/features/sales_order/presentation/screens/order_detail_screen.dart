import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/auth.dart';
import '../../../daily_sales/presentation/widgets/surface_card.dart';
import '../../domain/entities/entities.dart';
import '../providers/sales_order_providers.dart';
import '../widgets/widgets.dart';

class OrderDetailScreen extends ConsumerWidget {
  final String localId;

  const OrderDetailScreen({super.key, required this.localId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(salesOrderByIdProvider(localId));
    if (order == null) {
      return Scaffold(
        backgroundColor: kBackground,
        body: const SafeArea(child: Center(child: Text('Order not found'))),
      );
    }

    final createdBy = ref.watch(currentUserProvider)?.fullName;

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            _Header(order: order),
            if (order.status != SalesOrderStatus.cancelled)
              _StatusTracker(status: order.status)
            else
              const _CancelledBanner(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                children: [
                  ...order.lineItems.map(
                    (i) => LineItemTile(item: i, readOnly: true),
                  ),
                  const SizedBox(height: 4),
                  OrderTotalsCard(
                    subtotal: order.subtotal,
                    discountPercent: order.additionalDiscountPercent,
                    discountAmount: order.discountAmount,
                    taxPercent: order.taxPercent,
                    taxAmount: order.taxAmount,
                    total: order.total,
                    itemCount: order.totalItems,
                  ),
                  const SizedBox(height: 14),
                  SurfaceCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ORDER INFO',
                          style: TextStyle(
                            fontSize: 11,
                            color: kTextFaint,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (order.sapDocNum != null && order.sapDocNum! > 0)
                          _InfoRow(
                            label: 'SAP document number',
                            value: '${order.sapDocNum}',
                          ),
                        _InfoRow(
                          label: 'Warehouse',
                          value: order.warehouseName ?? '—',
                        ),
                        if (order.warehouseCode != null &&
                            order.warehouseCode!.trim().isNotEmpty)
                          _InfoRow(
                            label: 'Warehouse code',
                            value: order.warehouseCode!,
                          ),
                        if (order.lpoNumber != null &&
                            order.lpoNumber!.trim().isNotEmpty)
                          _InfoRow(
                            label: 'LPO number',
                            value: order.lpoNumber!,
                          ),
                        if (order.notes != null &&
                            order.notes!.trim().isNotEmpty)
                          _InfoRow(label: 'Notes', value: order.notes!),
                        _InfoRow(
                          label: 'Created by',
                          value: createdBy ?? '—',
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),
                  if (order.status != SalesOrderStatus.cancelled &&
                      order.status != SalesOrderStatus.fulfilled) ...[
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _confirmCancel(context, ref, order),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: kRedColor,
                              side: const BorderSide(color: kBorderColor),
                              minimumSize: const Size.fromHeight(52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: PrimaryButton(
                            label: order.status == SalesOrderStatus.confirmed
                                ? 'Mark Fulfilled'
                                : 'Confirm',
                            onPressed: () {
                              ref
                                  .read(salesOrdersProvider.notifier)
                                  .update(
                                    order.copyWith(
                                      status:
                                          order.status ==
                                              SalesOrderStatus.confirmed
                                          ? SalesOrderStatus.fulfilled
                                          : SalesOrderStatus.confirmed,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ],
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

  void _confirmCancel(BuildContext context, WidgetRef ref, SalesOrder order) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cancel Order?'),
        content: Text('Cancel ${order.orderNumber}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('No'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: kRedColor),
            onPressed: () {
              ref
                  .read(salesOrdersProvider.notifier)
                  .update(order.copyWith(status: SalesOrderStatus.cancelled));
              Navigator.of(ctx).pop();
              context.pop();
            },
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final SalesOrder order;
  const _Header({required this.order});

  String get _initials => order.customerName.isNotEmpty
      ? order.customerName
            .trim()
            .split(RegExp(r'\s+'))
            .take(2)
            .map((s) => s[0])
            .join()
            .toUpperCase()
      : '?';

  @override
  Widget build(BuildContext context) {
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
                order.orderNumber,
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
                        _initials,
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
                            order.customerName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: kTextLight,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Placed ${_formatDate(order.createdAt)} · ${order.customerType.typeLabel}',
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
              if (order.status == SalesOrderStatus.cancelled)
                const StatusChip(label: 'Cancelled', variant: StatusChipVariant.danger)
              else
                StatusChip(
                  label: order.status.label,
                  variant: switch (order.status) {
                    SalesOrderStatus.pending => StatusChipVariant.warning,
                    SalesOrderStatus.confirmed => StatusChipVariant.info,
                    SalesOrderStatus.fulfilled => StatusChipVariant.success,
                    _ => StatusChipVariant.neutral,
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

/// 3-step Placed → Confirm → Fulfil tracker, matching [SaleStepHeader]'s
/// inline circle+label convention.
class _StatusTracker extends StatelessWidget {
  final SalesOrderStatus status;

  const _StatusTracker({required this.status});

  @override
  Widget build(BuildContext context) {
    // pending: step1 done, step2 active. confirmed: step1-2 done, step3
    // active. fulfilled: all done. draft (unused in practice) reads as
    // step1 active.
    final stepIndex = switch (status) {
      SalesOrderStatus.draft => 0,
      SalesOrderStatus.pending => 1,
      SalesOrderStatus.confirmed => 2,
      SalesOrderStatus.fulfilled => 3,
      SalesOrderStatus.cancelled => 0,
    };
    const labels = ['Placed', 'Confirm', 'Fulfil'];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++) ...[
            _StepDot(
              index: i + 1,
              label: labels[i],
              state: i < stepIndex
                  ? _StepState.completed
                  : i == stepIndex
                  ? _StepState.active
                  : _StepState.upcoming,
            ),
            if (i != labels.length - 1)
              Expanded(
                child: Container(
                  height: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  color: i < stepIndex ? kSuccessColor : kBorderColor,
                ),
              ),
          ],
        ],
      ),
    );
  }
}

enum _StepState { completed, active, upcoming }

class _StepDot extends StatelessWidget {
  final int index;
  final String label;
  final _StepState state;

  const _StepDot({
    required this.index,
    required this.label,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = switch (state) {
      _StepState.completed => kSuccessColor,
      _StepState.active => kWarningColor,
      _StepState.upcoming => kBorderColor,
    };
    final labelColor = switch (state) {
      _StepState.completed => kSuccessColor,
      _StepState.active => kWarningColor,
      _StepState.upcoming => kTextMuted,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 22,
          height: 22,
          alignment: Alignment.center,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: state == _StepState.completed
              ? const Icon(Icons.check, size: 11, color: kTextLight)
              : Text(
                  '$index',
                  style: TextStyle(
                    color: state == _StepState.upcoming
                        ? kTextMuted
                        : kTextLight,
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                  ),
                ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: state == _StepState.upcoming
                ? FontWeight.w600
                : FontWeight.w700,
            color: labelColor,
          ),
        ),
      ],
    );
  }
}

class _CancelledBanner extends StatelessWidget {
  const _CancelledBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: kRedColor.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.cancel_outlined, size: 15, color: kRedColor),
          SizedBox(width: 8),
          Text(
            'This order was cancelled',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kRedColor,
            ),
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

extension on CustomerType {
  String get typeLabel => this == CustomerType.cash ? 'Cash' : 'Credit';
}
