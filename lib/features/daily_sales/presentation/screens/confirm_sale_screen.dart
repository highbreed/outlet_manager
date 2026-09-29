import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/core.dart';
import '../../../daily_route/presentation/widgets/widgets.dart'
    show showRouteBottomSheet;
import '../../../replenishment/presentation/providers/replenishment_providers.dart';
import '../../domain/entities/entities.dart';
import '../../../stock_take/presentation/screens/barcode_scanner_screen.dart';
import '../controllers/confirm_sale_controller.dart';
import '../providers/daily_sale_detail_provider.dart';
import '../widgets/surface_card.dart';

const _kProgressGreen = Color(0xFF7ED99A);

/// Confirms a pending sale at payment: scan/enter exactly `quantity`
/// distinct serial numbers for every item before submitting.
class ConfirmSaleScreen extends ConsumerStatefulWidget {
  final int saleId;

  const ConfirmSaleScreen({super.key, required this.saleId});

  @override
  ConsumerState<ConfirmSaleScreen> createState() => _ConfirmSaleScreenState();
}

class _ConfirmSaleScreenState extends ConsumerState<ConfirmSaleScreen> {
  final Map<int, TextEditingController> _controllers = {};

  TextEditingController _controllerFor(int itemId) =>
      _controllers.putIfAbsent(itemId, TextEditingController.new);

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _addManualSerial(int itemId) {
    final controller = _controllerFor(itemId);
    final value = controller.text;
    if (value.trim().isEmpty) return;

    final error = ref
        .read(confirmSaleControllerProvider(widget.saleId).notifier)
        .addSerial(itemId, value);
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.redAccent),
      );
      return;
    }
    controller.clear();
  }

  Future<void> _scanSerial(int itemId) async {
    final result = await Navigator.of(context).push<BarcodeScanResult>(
      MaterialPageRoute(
        builder: (_) => const BarcodeScannerScreen(
          title: 'Scan Serial Number',
          singleScan: true,
          hintText: 'Align the serial number barcode within the frame',
        ),
      ),
    );
    if (result == null || !mounted) return;

    final error = ref
        .read(confirmSaleControllerProvider(widget.saleId).notifier)
        .addSerial(itemId, result.barcode);
    if (error != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.redAccent),
      );
    }
  }

  Future<void> _openFinalizeSheet() async {
    final confirmed = await showRouteBottomSheet<bool>(
      context,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      builder: (ctx) => _FinalizeSaleSheet(saleId: widget.saleId),
    );
    if (!mounted) return;

    if (confirmed == true) {
      ref.invalidate(dailySaleDetailProvider(widget.saleId));
      // A confirmed sale may have just dropped an item to/below its min
      // stock level — refresh the live reorder suggestion list.
      ref.invalidate(replenishmentCurrentProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sale confirmed')),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(confirmSaleControllerProvider(widget.saleId));

    // The controller sets `state.error` on a failed confirm, but nothing
    // was reading it — confirm failures used to produce no UI feedback.
    ref.listen(confirmSaleControllerProvider(widget.saleId), (previous, next) {
      final error = next.value?.error;
      if (error != null && error != previous?.value?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error), backgroundColor: kRedColor),
        );
      }
    });

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: asyncState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(
            child: Text(
              error is Failure ? error.displayMessage : '$error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: kTextDark),
            ),
          ),
          data: (state) {
            if (!state.sale.isPending) {
              return Center(
                child: Text(
                  'This sale is already ${state.sale.status.label.toLowerCase()}.',
                  style: const TextStyle(color: kTextDark),
                ),
              );
            }

            final completedCount = state.sale.items
                .where((item) => state.isItemComplete(item))
                .length;
            final totalCount = state.sale.items.length;
            final progress = totalCount == 0 ? 0.0 : completedCount / totalCount;

            return Column(
              children: [
                _ProgressHeader(
                  customerName: state.sale.customerName,
                  customerPhone: state.sale.customerPhone,
                  progress: progress,
                  completedCount: completedCount,
                  totalCount: totalCount,
                  totalAmountValue: state.sale.totalAmountValue,
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    children: [
                      for (final item in state.sale.items)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _ItemSerialCard(
                            item: item,
                            scanned: state.serialsFor(item.id),
                            controller: _controllerFor(item.id),
                            onScan: () => _scanSerial(item.id),
                            onAddManual: () => _addManualSerial(item.id),
                            onRemove: (serial) => ref
                                .read(
                                  confirmSaleControllerProvider(
                                    widget.saleId,
                                  ).notifier,
                                )
                                .removeSerial(item.id, serial),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                  child: Column(
                    children: [
                      PrimaryButton(
                        label: 'Confirm Sale',
                        isLoading: state.isSubmitting,
                        onPressed: state.canSubmit ? _openFinalizeSheet : null,
                      ),
                      if (!state.canSubmit) ...[
                        const SizedBox(height: 8),
                        const Text(
                          'Serialize every unit to enable Confirm',
                          style: TextStyle(fontSize: 11, color: kTextFaint),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ProgressHeader extends StatelessWidget {
  final String customerName;
  final String? customerPhone;
  final double progress;
  final int completedCount;
  final int totalCount;
  final double totalAmountValue;

  const _ProgressHeader({
    required this.customerName,
    required this.customerPhone,
    required this.progress,
    required this.completedCount,
    required this.totalCount,
    required this.totalAmountValue,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Confirm Sale',
                      style: TextStyle(
                        color: kTextLight,
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      customerPhone != null && customerPhone!.isNotEmpty
                          ? '$customerName · $customerPhone'
                          : customerName,
                      style: const TextStyle(color: Colors.white54, fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Colors.white.withValues(alpha: 0.15),
              valueColor: const AlwaysStoppedAnimation(_kProgressGreen),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$completedCount of $totalCount items fully serialized',
                style: const TextStyle(color: Colors.white54, fontSize: 11),
              ),
              Text(
                '${AppConfig.defaultCurrency} ${totalAmountValue.toStringAsFixed(0)}',
                style: const TextStyle(
                  color: kTextLight,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ItemSerialCard extends StatelessWidget {
  final DailySaleItem item;
  final List<String> scanned;
  final TextEditingController controller;
  final VoidCallback onScan;
  final VoidCallback onAddManual;
  final ValueChanged<String> onRemove;

  const _ItemSerialCard({
    required this.item,
    required this.scanned,
    required this.controller,
    required this.onScan,
    required this.onAddManual,
    required this.onRemove,
  });

  bool get isComplete => scanned.length == item.quantity;

  @override
  Widget build(BuildContext context) {
    final bg = isComplete ? kSuccessBg : kWarningBg;
    final fg = isComplete ? kSuccessText : kWarningText;

    return SurfaceCard(
      padding: const EdgeInsets.all(14),
      borderColor: isComplete ? kBorderColor : kWarningColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: kTextDark,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isComplete ? Icons.check_circle : Icons.hourglass_empty,
                      size: 13,
                      color: fg,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${scanned.length}/${item.quantity}',
                      style: TextStyle(
                        color: fg,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (!isComplete) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(color: kTextDark),
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Or type serial manually',
                      hintStyle: const TextStyle(color: kTextFaint),
                      filled: true,
                      fillColor: kBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => onAddManual(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: kSecondaryColor),
                  onPressed: onAddManual,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    color: kSecondaryColor,
                  ),
                  onPressed: onScan,
                ),
              ],
            ),
          ],
          if (scanned.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final serial in scanned)
                  Chip(
                    label: Text(serial),
                    backgroundColor: kBackground,
                    labelStyle: const TextStyle(
                      color: kTextDark,
                      fontSize: 12,
                    ),
                    onDeleted: () => onRemove(serial),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    visualDensity: VisualDensity.compact,
                    side: BorderSide.none,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Finalizes a fully-serialized sale: verify a customer OTP, attach a
/// proof-of-purchase photo, then submit. Opened from [ConfirmSaleScreen]
/// once every item has its full set of serials.
///
/// Wrapped in `SafeArea(top: false)` with explicit `viewInsets.bottom`
/// padding — `showRouteBottomSheet` only pads for the keyboard, and this
/// app has previously hit its Submit button being hidden behind a 3-button
/// Android nav bar (fixed the same way in Sales Orders' Submit Details
/// sheet), so it's applied proactively here.
class _FinalizeSaleSheet extends ConsumerStatefulWidget {
  final int saleId;

  const _FinalizeSaleSheet({required this.saleId});

  @override
  ConsumerState<_FinalizeSaleSheet> createState() =>
      _FinalizeSaleSheetState();
}

class _FinalizeSaleSheetState extends ConsumerState<_FinalizeSaleSheet> {
  final _otpController = TextEditingController();
  bool _requestedOtp = false;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  ConfirmSaleController get _notifier =>
      ref.read(confirmSaleControllerProvider(widget.saleId).notifier);

  Future<void> _pickProofOfPurchase() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Take Photo'),
              onTap: () => Navigator.of(ctx).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from Gallery'),
              onTap: () => Navigator.of(ctx).pop(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
    if (source == null) return;

    final picked = await ImagePicker().pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1600,
    );
    if (picked == null || !mounted) return;

    _notifier.setProofOfPurchase(File(picked.path));
  }

  Future<void> _submit() async {
    final ok = await _notifier.submit();
    if (!mounted) return;
    if (ok) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(confirmSaleControllerProvider(widget.saleId));
    final state = asyncState.value;

    if (state != null && !_requestedOtp && state.otpMessage == null) {
      _requestedOtp = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => _notifier.requestOtp());
    }

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: state == null
            ? const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator()),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Finalize Sale',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: kTextDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Verify the customer and attach proof of purchase to confirm.',
                    style: TextStyle(fontSize: 12, color: kTextMuted),
                  ),
                  const SizedBox(height: 20),
                  const _StepLabel(label: 'Step 1 · Verify customer'),
                  const SizedBox(height: 8),
                  _OtpStep(
                    state: state,
                    controller: _otpController,
                    onSend: _notifier.requestOtp,
                    onVerify: () => _notifier.verifyOtp(_otpController.text),
                  ),
                  if (state.otpVerified) ...[
                    const SizedBox(height: 20),
                    const _StepLabel(label: 'Step 2 · Proof of purchase'),
                    const SizedBox(height: 8),
                    _ProofOfPurchaseStep(
                      file: state.proofOfPurchase,
                      onPick: _pickProofOfPurchase,
                    ),
                  ],
                  const SizedBox(height: 20),
                  PrimaryButton(
                    label: 'Submit',
                    isLoading: state.isSubmitting,
                    onPressed: state.canFinalize ? _submit : null,
                  ),
                ],
              ),
      ),
    );
  }
}

class _StepLabel extends StatelessWidget {
  final String label;

  const _StepLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: kTextFaint,
        letterSpacing: 0.5,
      ),
    );
  }
}

class _OtpStep extends StatelessWidget {
  final ConfirmSaleState state;
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onVerify;

  const _OtpStep({
    required this.state,
    required this.controller,
    required this.onSend,
    required this.onVerify,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isSendingOtp && state.otpMessage == null) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 10),
            Text('Sending code…', style: TextStyle(fontSize: 12, color: kTextMuted)),
          ],
        ),
      );
    }

    if (state.otpVerified) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: kSuccessBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.check_circle, size: 16, color: kSuccessText),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Code verified',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: kSuccessText,
                ),
              ),
            ),
            TextButton(
              onPressed: onSend,
              child: const Text('Resend', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.otpMessage != null)
          Text(
            state.otpMessage!,
            style: const TextStyle(fontSize: 12, color: kTextMuted),
          ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                maxLength: 8,
                style: const TextStyle(color: kTextDark),
                decoration: InputDecoration(
                  isDense: true,
                  counterText: '',
                  hintText: 'Enter code',
                  hintStyle: const TextStyle(color: kTextFaint),
                  filled: true,
                  fillColor: kBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (_) => onVerify(),
              ),
            ),
            const SizedBox(width: 8),
            SecondaryButton(
              label: state.isVerifyingOtp ? 'Verifying…' : 'Verify',
              onPressed: state.isVerifyingOtp ? null : onVerify,
              expand: false,
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: state.isSendingOtp ? null : onSend,
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text('Resend code', style: TextStyle(fontSize: 12)),
          ),
        ),
      ],
    );
  }
}

class _ProofOfPurchaseStep extends StatelessWidget {
  final File? file;
  final VoidCallback onPick;

  const _ProofOfPurchaseStep({required this.file, required this.onPick});

  @override
  Widget build(BuildContext context) {
    if (file == null) {
      return InkWell(
        onTap: onPick,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: kBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kBorderColor),
          ),
          child: const Column(
            children: [
              Icon(Icons.add_a_photo_outlined, color: kSecondaryColor),
              SizedBox(height: 6),
              Text(
                'Add receipt photo',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(file!, width: 56, height: 56, fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'Proof of purchase attached',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: kTextDark),
          ),
        ),
        TextButton(
          onPressed: onPick,
          child: const Text('Retake', style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }
}
