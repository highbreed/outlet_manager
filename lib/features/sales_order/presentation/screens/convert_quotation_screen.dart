import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../daily_route/presentation/widgets/widgets.dart'
    show RouteBackHeader;
import '../../../daily_sales/presentation/widgets/surface_card.dart';
import '../../data/datasources/sales_customer_remote_datasource.dart';
import '../../domain/entities/entities.dart';
import '../providers/sales_order_providers.dart';
import '../widgets/widgets.dart';

/// Confirms payment, then converts a quotation into a sales order.
class ConvertQuotationScreen extends ConsumerStatefulWidget {
  final String localId;

  const ConvertQuotationScreen({super.key, required this.localId});

  @override
  ConsumerState<ConvertQuotationScreen> createState() =>
      _ConvertQuotationScreenState();
}

class _ConvertQuotationScreenState
    extends ConsumerState<ConvertQuotationScreen> {
  PaymentMethod _method = PaymentMethod.cash;
  final _referenceController = TextEditingController();
  bool _isConverting = false;

  @override
  void dispose() {
    _referenceController.dispose();
    super.dispose();
  }

  void _convert(SalesQuotation quotation) {
    _convertRemote(quotation);
  }

  Future<void> _convertRemote(SalesQuotation quotation) async {
    if (_isConverting) return;

    final serverId = quotation.serverId;
    if (serverId == null || serverId <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quotation has no server id to convert.')),
      );
      return;
    }

    // Cash customers MUST have payment info before converting.
    if (quotation.customerType == CustomerType.cash) {
      if (_referenceController.text.trim().isEmpty &&
          _method != PaymentMethod.cash) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment reference is required.')),
        );
        return;
      }
    }

    final dataSource = ref.read(salesCustomerRemoteDataSourceProvider);
    setState(() => _isConverting = true);
    try {
      await dataSource.convertQuotationToOrder(
        quotationId: serverId,
        request: ConvertQuotationToOrderRequest(
          lpoNumber: quotation.lpoNumber ?? '',
          warehouseCode: quotation.warehouseCode ?? '',
          comments: quotation.notes ?? '',
        ),
      );

      // Mark it converted locally so neither this quotation's detail screen
      // nor the list can offer "Convert" again — canConvert/_isOpen both
      // gate on status, but nothing wrote the new status back before this.
      final quotationsNotifier = ref.read(salesQuotationsProvider.notifier);
      final localCopy = quotationsNotifier.byId(quotation.localId);
      if (localCopy != null) {
        quotationsNotifier.update(
          localCopy.copyWith(status: QuotationStatus.converted),
        );
      }
      // Quotations sourced from the server list aren't in the local
      // notifier above — force a refetch so they pick up the true
      // post-conversion status too.
      ref.invalidate(salesTodayQuotationsProvider);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quotation converted successfully.')),
      );
      context.go('/sales-orders');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to convert quotation: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isConverting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localQuotation = ref.watch(
      salesQuotationByIdProvider(widget.localId),
    );
    final serverQuotationsAsync = ref.watch(salesTodayQuotationsProvider);
    final q =
        localQuotation ??
        serverQuotationsAsync.maybeWhen(
          data: (items) =>
              items.where((e) => e.localId == widget.localId).firstOrNull,
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

    // Defensive: reaching this screen for an already-converted (or
    // cancelled/expired) quotation shouldn't be possible from the list or
    // detail screens anymore, but guard here too in case of a stale link.
    if (!q.canConvert) {
      return Scaffold(
        backgroundColor: kBackground,
        body: SafeArea(
          child: Column(
            children: [
              RouteBackHeader(
                title: 'Convert to Order',
                onBack: () => context.pop(),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      q.status == QuotationStatus.converted
                          ? '${q.quotationNumber} has already been '
                                'converted to a sales order.'
                          : '${q.quotationNumber} can no longer be '
                                'converted.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: kTextMuted),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final isCash = q.customerType == CustomerType.cash;

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                RouteBackHeader(
                  title: 'Convert to Order',
                  onBack: () => context.pop(),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    children: [
                      SurfaceCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              q.quotationNumber,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              q.customerName,
                              style: const TextStyle(
                                color: kTextMuted,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                CustomerTypeBadge(type: q.customerType),
                                const Spacer(),
                                Text(
                                  q.total.toStringAsFixed(0),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                    color: kSecondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (isCash) ...[
                        const Text(
                          'Payment Details',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SurfaceCard(
                          child: Column(
                            children: [
                              DropdownButtonFormField<PaymentMethod>(
                                initialValue: _method,
                                decoration: const InputDecoration(
                                  labelText: 'Payment Method',
                                  border: OutlineInputBorder(),
                                ),
                                items: PaymentMethod.values
                                    .map(
                                      (m) => DropdownMenuItem<PaymentMethod>(
                                        value: m,
                                        child: Text(m.label),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) {
                                  if (v != null) {
                                    setState(() => _method = v);
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _referenceController,
                                decoration: InputDecoration(
                                  labelText: _method == PaymentMethod.cash
                                      ? 'Receipt # (optional)'
                                      : 'Reference # (required)',
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: kWarningBg,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 16,
                                color: kWarningText,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Confirm that payment has been received '
                                  'before converting this quotation.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kWarningText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ] else
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: kSecondaryLightColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 16,
                                color: kSecondaryColor,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Credit customer — this will be booked '
                                  'against their account.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kSecondaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        label: 'Confirm & Convert',
                        isLoading: _isConverting,
                        onPressed: _isConverting ? null : () => _convert(q),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_isConverting)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withValues(alpha: 0.08),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
