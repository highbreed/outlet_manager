import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

import '../../../../core/core.dart';
import '../../../daily_route/presentation/widgets/widgets.dart';
import '../../data/models/proposed_order_model.dart';
import '../providers/session_providers.dart';

String _formatDateTime(DateTime dt) {
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
  final period = dt.hour >= 12 ? 'PM' : 'AM';
  return '${months[dt.month - 1]} ${dt.day}, ${dt.year} · $hour:${dt.minute.toString().padLeft(2, '0')} $period';
}

String _formatCurrency(double amount, String currency) {
  final parts = amount.toStringAsFixed(2).split('.');
  final intPart = parts[0];
  final decPart = parts[1];
  final buffer = StringBuffer();
  for (var i = 0; i < intPart.length; i++) {
    if (i > 0 && (intPart.length - i) % 3 == 0) {
      buffer.write(',');
    }
    buffer.write(intPart[i]);
  }
  return '$currency $buffer.$decPart';
}

/// Screen displaying the details of a generated proposed order
/// Fetches via GET /visits/{visit_id}/proposed-order
class ProposedOrderDetailScreen extends ConsumerStatefulWidget {
  final int visitId;
  final String? quotationNumber;

  const ProposedOrderDetailScreen({
    super.key,
    required this.visitId,
    this.quotationNumber,
  });

  @override
  ConsumerState<ProposedOrderDetailScreen> createState() =>
      _ProposedOrderDetailScreenState();
}

class _ProposedOrderDetailScreenState
    extends ConsumerState<ProposedOrderDetailScreen> {
  ProposedOrderDetail? _order;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadOrder();
  }

  Future<void> _loadOrder() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final order = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .getProposedOrderDetail(visitId: widget.visitId);

      if (mounted) {
        setState(() {
          _order = order;
          _isLoading = false;
          if (order == null) {
            _error =
                ref.read(stockTakeSessionControllerProvider).errorMessage ??
                'Failed to load proposed order';
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteBackHeader(
              title: widget.quotationNumber ?? 'Proposed Order',
              onBack: () => Navigator.of(context).pop(),
            ),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: kRedColor),
              const SizedBox(height: 16),
              const Text(
                'Failed to load order',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                _error!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13, color: kTextMuted),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                label: 'Retry',
                trailingIcon: Icons.refresh,
                expand: false,
                onPressed: _loadOrder,
              ),
            ],
          ),
        ),
      );
    }

    if (_order == null) {
      return const Center(child: Text('Order not found', style: TextStyle(color: kTextMuted)));
    }

    return RefreshIndicator(
      onRefresh: _loadOrder,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _OrderHeader(order: _order!),
            const SizedBox(height: 14),
            _TotalsBand(order: _order!),
            if (_order!.refillStrategy != null ||
                _order!.customerEmail != null ||
                (_order!.notes?.isNotEmpty ?? false)) ...[
              const SizedBox(height: 14),
              _OrderInfoSection(order: _order!),
            ],
            const SizedBox(height: 18),
            _LineItemsSection(items: _order!.items, currency: _order!.currency),
            const SizedBox(height: 24),
            _ActionButtons(order: _order!, visitId: widget.visitId),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────────────────

class _OrderHeader extends StatelessWidget {
  final ProposedOrderDetail order;

  const _OrderHeader({required this.order});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Order #${order.id}',
                  style: const TextStyle(fontSize: 13, color: kTextMuted),
                ),
              ),
              _StatusChip(status: order.status),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14, color: kTextFaint),
              const SizedBox(width: 6),
              Text(
                _formatDateTime(order.createdAt),
                style: const TextStyle(fontSize: 12, color: kTextMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final ProposedOrderStatus status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final variant = switch (status) {
      ProposedOrderStatus.approved => StatusChipVariant.success,
      ProposedOrderStatus.converted => StatusChipVariant.info,
      ProposedOrderStatus.pending => StatusChipVariant.warning,
      ProposedOrderStatus.rejected => StatusChipVariant.danger,
      ProposedOrderStatus.draft => StatusChipVariant.neutral,
      ProposedOrderStatus.expired => StatusChipVariant.neutral,
      ProposedOrderStatus.unknown => StatusChipVariant.neutral,
    };
    return StatusChip(label: status.displayName, variant: variant);
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Purple totals band — matches the mock's TOTAL ITEMS / TOTAL QTY / ESTIMATED
// ─────────────────────────────────────────────────────────────────────────

class _TotalsBand extends StatelessWidget {
  final ProposedOrderDetail order;

  const _TotalsBand({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TotalTile(label: 'TOTAL ITEMS', value: '${order.totalItems}'),
          _TotalTile(label: 'TOTAL QTY', value: '${order.totalQuantity} units'),
          _TotalTile(
            label: 'ESTIMATED',
            value: _formatCurrency(order.estimatedTotal, order.currency),
          ),
        ],
      ),
    );
  }
}

class _TotalTile extends StatelessWidget {
  final String label;
  final String value;

  const _TotalTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: kSecondaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: kSecondaryColor,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Secondary order info (strategy / email / notes) — real data the mock's
// simple frame doesn't happen to show, kept rather than dropped.
// ─────────────────────────────────────────────────────────────────────────

class _OrderInfoSection extends StatelessWidget {
  final ProposedOrderDetail order;

  const _OrderInfoSection({required this.order});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (order.refillStrategy != null)
            Row(
              children: [
                const Icon(Icons.tune, size: 15, color: kTextFaint),
                const SizedBox(width: 8),
                Text(
                  'Strategy: ${order.refillStrategyLabel}',
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
              ],
            ),
          if (order.customerEmail != null) ...[
            if (order.refillStrategy != null) const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.email_outlined, size: 15, color: kTextFaint),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    order.customerEmail!,
                    style: const TextStyle(fontSize: 12, color: kTextMuted),
                  ),
                ),
                if (order.emailSentAt != null)
                  const StatusChip(label: 'Sent', variant: StatusChipVariant.success),
              ],
            ),
          ],
          if (order.notes != null && order.notes!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                order.notes!,
                style: const TextStyle(fontSize: 12, color: kTextMuted, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Line items
// ─────────────────────────────────────────────────────────────────────────

class _LineItemsSection extends StatelessWidget {
  final List<ProposedOrderLineItem> items;
  final String currency;

  const _LineItemsSection({required this.items, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Items (${items.length})',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        AppCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            children: [
              for (var i = 0; i < items.length; i++)
                _LineItemRow(
                  item: items[i],
                  currency: currency,
                  isLast: i == items.length - 1,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LineItemRow extends StatelessWidget {
  final ProposedOrderLineItem item;
  final String currency;
  final bool isLast;

  const _LineItemRow({required this.item, required this.currency, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: isLast ? null : const Border(bottom: BorderSide(color: kBorderColor)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.itemName,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '+${item.proposedQuantity}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Current ${item.currentStock} · Min ${item.minStockLevel} · Max ${item.maxStockLevel}',
            style: const TextStyle(fontSize: 11, color: kTextMuted),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Action buttons — the app's real actions, not the mock's Edit/Send
// Quotation labels, since those specific behaviors don't exist.
// ─────────────────────────────────────────────────────────────────────────

class _ActionButtons extends ConsumerStatefulWidget {
  final ProposedOrderDetail order;
  final int visitId;

  const _ActionButtons({required this.order, required this.visitId});

  @override
  ConsumerState<_ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends ConsumerState<_ActionButtons> {
  _PdfState _pdfState = _PdfState.idle;
  String? _pdfError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.order.status == ProposedOrderStatus.draft ||
            widget.order.status == ProposedOrderStatus.pending ||
            widget.order.status == ProposedOrderStatus.approved)
          PrimaryButton(
            label: 'Convert to Sales Order',
            trailingIcon: Icons.shopping_cart_outlined,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Convert to order coming soon')),
              );
            },
          ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: SecondaryButton(
                label: 'Email',
                leadingIcon: Icons.email_outlined,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email feature coming soon')),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SecondaryButton(
                label: _pdfButtonLabel,
                leadingIcon: Icons.picture_as_pdf_outlined,
                onPressed: _pdfState == _PdfState.generating || _pdfState == _PdfState.downloading
                    ? null
                    : _handlePdfAction,
              ),
            ),
          ],
        ),
        if (_pdfState == _PdfState.generating || _pdfState == _PdfState.downloading) ...[
          const SizedBox(height: 12),
          const LinearProgressIndicator(borderRadius: BorderRadius.all(Radius.circular(4))),
          const SizedBox(height: 6),
          Text(
            _pdfState == _PdfState.generating ? 'Generating PDF...' : 'Downloading PDF...',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: kTextMuted),
          ),
        ],
        if (_pdfError != null) ...[
          const SizedBox(height: 8),
          Text(
            _pdfError!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: kRedColor),
          ),
        ],
      ],
    );
  }

  String get _pdfButtonLabel {
    switch (_pdfState) {
      case _PdfState.generating:
        return 'Generating...';
      case _PdfState.downloading:
        return 'Downloading...';
      default:
        return 'PDF';
    }
  }

  Future<void> _handlePdfAction() async {
    setState(() {
      _pdfState = _PdfState.generating;
      _pdfError = null;
    });

    try {
      final jobResponse = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .generateProposedOrderPdf(visitId: widget.visitId);

      if (jobResponse == null) {
        _setError('Failed to start PDF generation');
        return;
      }

      final completed = await _pollPdfProgress(jobId: jobResponse.jobId);
      if (!completed) return;

      if (!mounted) return;
      setState(() => _pdfState = _PdfState.downloading);

      final pdfBytes = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .downloadProposedOrderPdf(visitId: widget.visitId);

      if (pdfBytes == null || pdfBytes.isEmpty) {
        _setError('Failed to download PDF');
        return;
      }

      if (!mounted) return;
      final tempDir = await getTemporaryDirectory();
      final fileName =
          'proposed_order_${widget.order.id}_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final file = File('${tempDir.path}/$fileName');
      await file.writeAsBytes(pdfBytes);

      if (!mounted) return;
      setState(() => _pdfState = _PdfState.idle);

      final result = await OpenFilex.open(file.path, type: 'application/pdf');
      if (result.type != ResultType.done && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open PDF: ${result.message}')),
        );
      }
    } catch (e) {
      _setError('Error: $e');
    }
  }

  Future<bool> _pollPdfProgress({required String jobId}) async {
    const maxAttempts = 60;
    for (var i = 0; i < maxAttempts; i++) {
      if (!mounted) return false;

      await Future.delayed(const Duration(seconds: 2));

      final progress = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .getProposedOrderPdfProgress(visitId: widget.visitId, jobId: jobId);

      if (progress == null) continue;
      if (progress.isSuccess) return true;

      if (progress.hasFailed) {
        _setError(progress.errorMessage ?? 'PDF generation failed');
        return false;
      }
    }

    _setError('PDF generation timed out. Please try again.');
    return false;
  }

  void _setError(String message) {
    if (mounted) {
      setState(() {
        _pdfState = _PdfState.idle;
        _pdfError = message;
      });
    }
  }
}

enum _PdfState { idle, generating, downloading }
