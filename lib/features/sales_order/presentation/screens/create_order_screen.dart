import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../daily_route/presentation/widgets/widgets.dart'
    show RouteBackHeader, showRouteBottomSheet;
import '../../data/datasources/sales_customer_remote_datasource.dart';
import '../../domain/entities/entities.dart';
import '../providers/sales_order_providers.dart';
import '../widgets/widgets.dart';
import 'product_picker_screen.dart';

/// Shared create screen used for both Sales Orders and Sales Quotations.
///
/// Navigation: `/sales-orders/create?kind=order|quotation&customerId=<id>`
class CreateOrderScreen extends ConsumerStatefulWidget {
  final SalesDocumentKind kind;
  final int customerId;

  /// Pre-seeds the draft's line items — used by Replenishment's "Convert
  /// to Sales Order" flow, which resolves suggested reorder items to real
  /// catalogue products before landing here. Empty for a normal manual
  /// order/quotation.
  final List<OrderLineItem> initialItems;

  const CreateOrderScreen({
    super.key,
    required this.kind,
    required this.customerId,
    this.initialItems = const [],
  });

  @override
  ConsumerState<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends ConsumerState<CreateOrderScreen> {
  late final SalesDraft _initialDraft;
  late final StateNotifierProvider<SalesDraftNotifier, SalesDraft>
  _draftProvider;

  final _notesController = TextEditingController();
  final _lpoController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    final customer = ref.read(customerByIdProvider(widget.customerId));
    _initialDraft = SalesDraft(
      kind: widget.kind,
      customer:
          customer ??
          const SalesCustomer(
            id: -1,
            code: 'UNKNOWN',
            name: 'Unknown Customer',
            type: CustomerType.credit,
          ),
      items: widget.initialItems,
      taxPercent: AppConfig.defaultVatPercent,
      validUntil: widget.kind == SalesDocumentKind.quotation
          ? DateTime.now().add(const Duration(days: 14))
          : null,
    );
    _draftProvider = salesDraftProvider(_initialDraft);
  }

  @override
  void dispose() {
    _notesController.dispose();
    _lpoController.dispose();
    super.dispose();
  }

  bool get _isQuotation => widget.kind == SalesDocumentKind.quotation;

  String get _title => _isQuotation ? 'New Quotation' : 'New Order';

  Future<void> _addProduct() async {
    final product = await Navigator.of(context).push<SalesProduct>(
      MaterialPageRoute(
        builder: (_) =>
            ProductPickerScreen(cardCode: _initialDraft.customer.code),
      ),
    );
    if (product != null) {
      ref.read(_draftProvider.notifier).addProduct(product);
    }
  }

  Future<void> _pickValidUntil(DateTime current) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      ref.read(_draftProvider.notifier).setValidUntil(picked);
    }
  }

  Future<(String?, String?, String, String)?> _collectSubmissionMeta(
    double total,
  ) async {
    final warehouses = await ref.read(salesWarehousesProvider.future);
    if (!mounted) return null;
    if (warehouses.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No active warehouses found.')),
      );
      return null;
    }

    SalesWarehouse selectedWarehouse = warehouses.first;

    String? submittedLpo;
    String? submittedNotes;
    String? submittedWarehouseCode;
    String? submittedWarehouseName;

    await showRouteBottomSheet<void>(
      context,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      builder: (ctx) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom,
            ),
            child: StatefulBuilder(
              builder: (ctx, setSheetState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'A few more details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (_isQuotation) ...[
                      const Text(
                        'Warehouse',
                        style: TextStyle(fontSize: 11, color: kTextMuted),
                      ),
                      const SizedBox(height: 5),
                      _SheetDropdownRow(
                        value: selectedWarehouse,
                        warehouses: warehouses,
                        onChanged: (w) =>
                            setSheetState(() => selectedWarehouse = w),
                      ),
                      const SizedBox(height: 14),
                    ] else
                      const Padding(
                        padding: EdgeInsets.only(bottom: 14),
                        child: Text(
                          'Warehouse is assigned automatically by SAP based '
                          'on the customer\'s sales territory.',
                          style: TextStyle(fontSize: 12, color: kTextMuted),
                        ),
                      ),
                    const Text(
                      'LPO number (optional)',
                      style: TextStyle(fontSize: 11, color: kTextMuted),
                    ),
                    const SizedBox(height: 5),
                    _SheetTextField(
                      controller: _lpoController,
                      hintText: 'e.g. LPO-4471',
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Notes (optional)',
                      style: TextStyle(fontSize: 11, color: kTextMuted),
                    ),
                    const SizedBox(height: 5),
                    _SheetTextField(
                      controller: _notesController,
                      hintText: 'Add a note for this order',
                    ),
                    const SizedBox(height: 18),
                    PrimaryButton(
                      label:
                          'Submit ${_isQuotation ? 'Quotation' : 'Order'} · '
                          '${AppConfig.defaultCurrency} ${total.toStringAsFixed(0)}',
                      onPressed: () {
                        submittedLpo = _lpoController.text.trim().isEmpty
                            ? null
                            : _lpoController.text.trim();
                        submittedNotes = _notesController.text.trim().isEmpty
                            ? null
                            : _notesController.text.trim();
                        submittedWarehouseCode =
                            selectedWarehouse.warehouseCode;
                        submittedWarehouseName =
                            selectedWarehouse.warehouseName;
                        Navigator.of(ctx).pop();
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );

    if (submittedWarehouseCode == null || submittedWarehouseName == null) {
      return null;
    }

    return (
      submittedLpo,
      submittedNotes,
      submittedWarehouseCode!,
      submittedWarehouseName!,
    );
  }

  Future<void> _save() async {
    if (_isSubmitting) return;

    final draft = ref.read(_draftProvider);
    if (draft.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add at least one product.')),
      );
      return;
    }

    final submissionMeta = await _collectSubmissionMeta(draft.total);
    if (!mounted) return;
    if (submissionMeta == null) return;
    final (lpoNumber, notes, warehouseCode, warehouseName) = submissionMeta;

    setState(() => _isSubmitting = true);

    try {
      if (_isQuotation) {
        final dataSource = ref.read(salesCustomerRemoteDataSourceProvider);
        SubmitQuotationResponse submitted;
        try {
          submitted = await dataSource.submitQuotation(
            SubmitQuotationRequest(
              cardCode: draft.customer.code,
              warehouseCode: warehouseCode,
              lpoNumber: lpoNumber,
              comments: notes,
              remarks: notes,
              items: draft.items
                  .map(
                    (i) => SubmitQuotationItemRequest(
                      itemCode: i.productCode,
                      quantity: i.quantity,
                    ),
                  )
                  .toList(),
            ),
          );
        } catch (e) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit quotation: $e')),
          );
          return;
        }

        final q = ref
            .read(salesQuotationsProvider.notifier)
            .create(
              customer: draft.customer,
              items: draft.items,
              taxPercent: draft.taxPercent,
              additionalDiscountPercent: 0,
              lpoNumber: lpoNumber,
              warehouseCode: warehouseCode,
              warehouseName: warehouseName,
              notes: notes,
              serverId: submitted.id,
              sapDocNum: submitted.sapDocNum,
              status: SalesQuotationsNotifier.statusFromApi(submitted.status),
              validUntil: draft.validUntil,
            );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Quotation ${q.quotationNumber} submitted')),
        );
        // pushReplacement (not go): go() recomputes the whole match stack
        // for the target route, which — since sales-order routes aren't
        // nested under a shell — wipes out everything the user navigated
        // through to get here, leaving back navigation with nothing to pop
        // to. pushReplacement drops just this create screen (so back can't
        // return to an already-submitted form) while keeping the rest of
        // the stack intact.
        context.pushReplacement('/sales-orders/quotation/${q.localId}');
      } else {
        final dataSource = ref.read(salesCustomerRemoteDataSourceProvider);
        DirectOrderResponse submitted;
        try {
          submitted = await dataSource.submitDirectOrder(
            SubmitDirectOrderRequest(
              cardCode: draft.customer.code,
              lpoNumber: lpoNumber,
              comments: notes,
              remarks: notes,
              items: draft.items
                  .map(
                    (i) => SubmitQuotationItemRequest(
                      itemCode: i.productCode,
                      quantity: i.quantity,
                    ),
                  )
                  .toList(),
            ),
          );
        } on DirectOrderException catch (e) {
          if (!mounted) return;
          if (e.code == 'CASH_REQUIRES_QUOTATION') {
            await _showCashRequiresQuotationDialog();
          } else if (e.code == 'CREDIT_LIMIT_EXCEEDED') {
            await _showCreditLimitExceededDialog(e);
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(e.message)));
          }
          return;
        } catch (e) {
          if (!mounted) return;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Failed to submit order: $e')));
          return;
        }

        if (!submitted.isPosted) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                submitted.sapErrorMessage ?? 'Order was rejected by SAP.',
              ),
            ),
          );
          return;
        }

        // Warehouse is resolved server-side from the customer's SAP sales
        // territory — use what the server actually assigned, not whatever
        // was picked in the (ignored) warehouse step above.
        final o = ref
            .read(salesOrdersProvider.notifier)
            .create(
              customer: draft.customer,
              items: draft.items,
              taxPercent: draft.taxPercent,
              additionalDiscountPercent: 0,
              lpoNumber: submitted.lpoNumber ?? lpoNumber,
              warehouseCode: submitted.warehouseCode,
              warehouseName: submitted.warehouseName,
              notes: notes,
              serverId: submitted.id,
              sapDocNum: submitted.sapDocNum,
            );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Order ${o.orderNumber} created')),
        );
        // See the matching comment above for the quotation branch: push
        // replacement, not go(), to avoid wiping the navigation stack.
        context.pushReplacement('/sales-orders/order/${o.localId}');
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _showCashRequiresQuotationDialog() {
    return showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cash Customer'),
        content: Text(
          '${_initialDraft.customer.name} is a cash customer and needs a '
          'quotation first. Once they pay, convert the quotation to a '
          'sales order.',
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
                '/sales-orders/create'
                '?kind=quotation&customerId=${_initialDraft.customer.id}',
              );
            },
            child: const Text('Create Quotation'),
          ),
        ],
      ),
    );
  }

  Future<void> _showCreditLimitExceededDialog(DirectOrderException e) {
    final details = e.details;
    // Field names mirror SalesCustomer.fromApiJson's credit fields
    // (credit_line, balance, available_credit) since this is the same
    // backend/customer model.
    final creditLimit = details?['credit_line'] ?? details?['credit_limit'];
    final outstanding = details?['balance'] ?? details?['exposure'];
    final available = details?['available_credit'];

    return showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Credit Limit Exceeded'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(e.message),
            if (creditLimit != null ||
                outstanding != null ||
                available != null) ...[
              const SizedBox(height: 12),
              if (creditLimit != null) Text('Credit limit: $creditLimit'),
              if (outstanding != null) Text('Outstanding: $outstanding'),
              if (available != null) Text('Available credit: $available'),
            ],
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(_draftProvider);
    final notifier = ref.read(_draftProvider.notifier);

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                RouteBackHeader(title: _title, onBack: () => context.pop()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${draft.customer.name} · ${draft.customer.typeLabel}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: kTextMuted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Material(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(14),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: _addProduct,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 13,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: kBorderColor),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 16,
                                    color: kTextFaint,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Add products',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: kTextFaint,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Material(
                        color: kTextDark,
                        borderRadius: BorderRadius.circular(14),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: _addProduct,
                          child: const Padding(
                            padding: EdgeInsets.all(13),
                            child: Icon(
                              Icons.playlist_add,
                              size: 20,
                              color: kTextLight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isQuotation)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                    child: Material(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(14),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () =>
                            _pickValidUntil(draft.validUntil ?? DateTime.now()),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 13,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: kBorderColor),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.event,
                                size: 16,
                                color: kSecondaryColor,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Valid until',
                                style: TextStyle(fontSize: 13),
                              ),
                              const Spacer(),
                              Text(
                                draft.validUntil != null
                                    ? _formatDate(draft.validUntil!)
                                    : 'Not set',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: draft.items.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Text(
                              'No items yet. Tap "Add products" to get started.',
                              style: const TextStyle(color: kTextMuted),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                          itemCount: draft.items.length,
                          itemBuilder: (context, index) {
                            final item = draft.items[index];
                            return LineItemTile(
                              item: item,
                              onQuantityChanged: (q) =>
                                  notifier.updateQuantity(item.localId, q),
                              onRemove: () => notifier.removeItem(item.localId),
                            );
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                  child: Column(
                    children: [
                      OrderTotalsCard(
                        subtotal: draft.subtotal,
                        discountPercent: 0,
                        discountAmount: 0,
                        taxPercent: draft.taxPercent,
                        taxAmount: draft.taxAmount,
                        total: draft.total,
                        itemCount: draft.totalQuantity,
                      ),
                      const SizedBox(height: 10),
                      PrimaryButton(
                        label: 'Review ${_isQuotation ? 'Quotation' : 'Order'}',
                        isLoading: _isSubmitting,
                        onPressed: _isSubmitting ? null : _save,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_isSubmitting)
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

  static String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

class _SheetDropdownRow extends StatelessWidget {
  final SalesWarehouse value;
  final List<SalesWarehouse> warehouses;
  final ValueChanged<SalesWarehouse> onChanged;

  const _SheetDropdownRow({
    required this.value,
    required this.warehouses,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: kBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<SalesWarehouse>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.expand_more, size: 18, color: kTextFaint),
          style: const TextStyle(fontSize: 14, color: kTextDark),
          items: warehouses
              .map(
                (w) => DropdownMenuItem<SalesWarehouse>(
                  value: w,
                  child: Text('${w.warehouseName} (${w.warehouseCode})'),
                ),
              )
              .toList(),
          onChanged: (w) {
            if (w != null) onChanged(w);
          },
        ),
      ),
    );
  }
}

class _SheetTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const _SheetTextField({required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 14, color: kTextDark),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: kTextFaint),
        filled: true,
        fillColor: kBackground,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
