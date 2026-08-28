import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../daily_route/presentation/widgets/widgets.dart' show RouteBackHeader;
import '../../../daily_route/providers/daily_route_providers.dart';
import '../../../stock_take/domain/entities/entities.dart' show CustomerProduct;
import '../../../stock_take/presentation/providers/stock_take_providers.dart';
import '../../../stock_take/presentation/screens/barcode_scanner_screen.dart';
import '../controllers/sale_cart_controller.dart';
import '../widgets/widgets.dart';

/// Register a new pending sale as a 3-step wizard: add products to a cart,
/// record the buying customer, then review the estimated total and submit.
class RegisterSaleScreen extends ConsumerStatefulWidget {
  final int customerId;
  final String customerName;
  final String? customerCode;

  const RegisterSaleScreen({
    super.key,
    required this.customerId,
    required this.customerName,
    this.customerCode,
  });

  @override
  ConsumerState<RegisterSaleScreen> createState() =>
      _RegisterSaleScreenState();
}

class _RegisterSaleScreenState extends ConsumerState<RegisterSaleScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  int _step = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(saleCartControllerProvider.notifier)
          .warmCatalogue(widget.customerId);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _scanBarcode() async {
    final result = await Navigator.of(context).push<BarcodeScanResult>(
      MaterialPageRoute(
        builder: (_) => const BarcodeScannerScreen(
          title: 'Scan Product Barcode',
          singleScan: true,
          hintText: 'Align the product barcode within the frame',
        ),
      ),
    );
    if (result == null || !mounted) return;
    await ref
        .read(saleCartControllerProvider.notifier)
        .addByBarcode(result.barcode);
  }

  bool get _canAdvance {
    final cartState = ref.read(saleCartControllerProvider);
    switch (_step) {
      case 0:
        return cartState.items.isNotEmpty;
      case 1:
        return _nameController.text.trim().isNotEmpty;
      default:
        return true;
    }
  }

  void _goNext() {
    if (_step == 1) {
      ref
          .read(saleCartControllerProvider.notifier)
          .setCustomer(
            name: _nameController.text,
            phone: _phoneController.text,
          );
    }
    if (_step < 2) setState(() => _step++);
  }

  void _goBack() {
    if (_step > 0) setState(() => _step--);
  }

  Future<void> _showStockTakeRequiredDialog(String message) async {
    final activeVisit = ref.read(activeVisitProvider);
    final goToStockTake = await showDialog<bool>(
      context: context,
      barrierColor: kTextDark.withValues(alpha: 0.35),
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: kWarningBg,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  color: kWarningText,
                  size: 24,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Stock take required',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: kTextMuted,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                label: 'Go to Stock Take',
                onPressed: () => Navigator.of(ctx).pop(true),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    if (goToStockTake != true || !mounted) return;

    context.push(
      '/stock-take',
      extra: activeVisit == null
          ? {'customerId': 0, 'customerName': 'Select from visit'}
          : {
              'customerId': int.tryParse(activeVisit.outletId) ?? 0,
              'customerCode': activeVisit.outletCode,
              'customerName': activeVisit.outletName,
              'visitLocalId': activeVisit.localId,
              'visitServerId': activeVisit.serverId == null
                  ? null
                  : int.tryParse(activeVisit.serverId!),
            },
    );
  }

  Future<void> _submit() async {
    final ok = await ref.read(saleCartControllerProvider.notifier).submit();
    if (!mounted) return;

    if (ok) {
      final sale = ref.read(saleCartControllerProvider).submittedSale;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sale registered as pending')),
      );
      if (sale != null) {
        context.pushReplacement('/daily-sales/${sale.id}');
      } else {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(saleCartControllerProvider);

    ref.listen(saleCartControllerProvider, (previous, next) {
      if (next.error != null && next.error != previous?.error) {
        if (next.requiresStockTake) {
          _showStockTakeRequiredDialog(next.error!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next.error!), backgroundColor: kRedColor),
          );
        }
      }
    });

    return PopScope(
      // On step 0 there's nothing to go "back" to within the wizard, so let
      // the system back button leave the screen as normal. On later steps,
      // back should step backwards through the wizard instead of discarding
      // everything the agent just entered.
      canPop: _step == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _goBack();
      },
      child: Scaffold(
        backgroundColor: kBackground,
        body: SafeArea(
          child: Column(
            children: [
              RouteBackHeader(
                title: 'New Sale',
                onBack: () {
                  if (_step > 0) {
                    _goBack();
                  } else {
                    context.pop();
                  }
                },
              ),
              SaleStepHeader(currentStep: _step),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: switch (_step) {
                    0 => _ProductsStep(
                      customerId: widget.customerId,
                      customerName: widget.customerName,
                      cartState: cartState,
                      onScanBarcode: _scanBarcode,
                    ),
                    1 => _CustomerStep(
                      nameController: _nameController,
                      phoneController: _phoneController,
                      onChanged: () => setState(() {}),
                    ),
                    _ => _ReviewStep(
                      customerName: _nameController.text,
                      customerPhone: _phoneController.text,
                      cartState: cartState,
                      onEditCustomer: () => setState(() => _step = 1),
                    ),
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: Row(
                  children: [
                    if (_step > 0)
                      Expanded(
                        child: SecondaryButton(
                          label: 'Back',
                          onPressed: cartState.isSubmitting ? null : _goBack,
                        ),
                      ),
                    if (_step > 0) const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: PrimaryButton(
                        label: _step == 2
                            ? 'Submit Sale'
                            : (_step == 0 ? 'Continue to Customer' : 'Continue'),
                        trailingIcon: _step == 2 ? null : Icons.arrow_forward,
                        isLoading: cartState.isSubmitting,
                        onPressed: _step == 2
                            ? (cartState.canSubmit ? _submit : null)
                            : (_canAdvance ? _goNext : null),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductsStep extends ConsumerStatefulWidget {
  final int customerId;
  final String customerName;
  final SaleCartState cartState;
  final VoidCallback onScanBarcode;

  const _ProductsStep({
    required this.customerId,
    required this.customerName,
    required this.cartState,
    required this.onScanBarcode,
  });

  @override
  ConsumerState<_ProductsStep> createState() => _ProductsStepState();
}

class _ProductsStepState extends ConsumerState<_ProductsStep> {
  // Lets us reset the dropdown's field back to empty right after a pick,
  // so the next search starts from a blank state instead of showing the
  // model that was just added to the cart.
  final _dropdownKey = GlobalKey<DropdownSearchState<CustomerProduct>>();

  @override
  Widget build(BuildContext context) {
    final customerId = widget.customerId;
    final customerName = widget.customerName;
    final cartState = widget.cartState;
    final onScanBarcode = widget.onScanBarcode;
    final controller = ref.read(saleCartControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          customerName,
          style: const TextStyle(fontSize: 13, color: kTextMuted),
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DropdownSearch<CustomerProduct>(
                key: _dropdownKey,
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintText: 'Search by name, model number or code',
                    ),
                  ),
                ),
                compareFn: (a, b) => a.id == b.id,
                itemAsString: (product) =>
                    '${product.itemName}${product.modelNumber != null ? ' (${product.modelNumber})' : ''}',
                items: (filter, _) async {
                  final repository = await ref.read(
                    stockTakeRepositoryProvider.future,
                  );
                  final result = filter.trim().isEmpty
                      ? await repository.getCustomerProducts(customerId)
                      : await repository.searchProducts(filter);
                  return result.fold((_) => <CustomerProduct>[], (p) => p);
                },
                onChanged: (product) {
                  if (product == null) return;
                  controller.addProduct(product);
                  // Reset the field so the next scan/search starts blank
                  // instead of leaving the just-added model showing.
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => _dropdownKey.currentState?.clear(),
                  );
                },
                decoratorProps: DropDownDecoratorProps(
                  baseStyle: const TextStyle(color: kTextDark, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search or select product',
                    hintStyle: const TextStyle(color: kTextFaint),
                    prefixIcon: const Icon(Icons.search, color: kTextMuted),
                    filled: true,
                    fillColor: kPrimaryLightColor,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: kBorderColor),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            _ScanBarcodeButton(
              isLoading: cartState.isResolvingBarcode,
              onTap: cartState.isResolvingBarcode ? null : onScanBarcode,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'CART · ${cartState.items.length} ITEM${cartState.items.length == 1 ? '' : 'S'}',
          style: const TextStyle(
            fontSize: 11,
            color: kTextFaint,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        if (cartState.items.isEmpty)
          SurfaceCard(
            child: Column(
              children: [
                const Icon(
                  Icons.remove_shopping_cart_outlined,
                  size: 28,
                  color: kTextFaint,
                ),
                const SizedBox(height: 8),
                const Text(
                  'No products added yet. Scan a barcode or search the '
                  'catalogue above.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kTextMuted, fontSize: 13),
                ),
              ],
            ),
          )
        else
          ...List.generate(cartState.items.length, (index) {
            final item = cartState.items[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CartItemCard(
                item: item,
                onIncrement: () =>
                    controller.updateQuantity(index, item.quantity + 1),
                onDecrement: () =>
                    controller.updateQuantity(index, item.quantity - 1),
                onRemove: () => controller.removeItem(index),
              ),
            );
          }),
      ],
    );
  }
}

/// Black rounded-square scan button beside the products search field,
/// matching the mock's Register Sale Step 1 layout.
class _ScanBarcodeButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onTap;

  const _ScanBarcodeButton({required this.isLoading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kTextDark,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: SizedBox(
          width: 52,
          height: 52,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: kTextLight,
                    ),
                  )
                : const Icon(
                    Icons.qr_code_scanner,
                    color: kTextLight,
                    size: 22,
                  ),
          ),
        ),
      ),
    );
  }
}

class _CustomerStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final VoidCallback onChanged;

  const _CustomerStep({
    required this.nameController,
    required this.phoneController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'OR ADD NEW',
          style: TextStyle(
            fontSize: 11,
            color: kTextFaint,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Full name',
          style: TextStyle(fontSize: 11, color: kTextMuted),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: nameController,
          textCapitalization: TextCapitalization.words,
          autofocus: true,
          style: const TextStyle(color: kTextDark, fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Customer name',
            filled: true,
            fillColor: kPrimaryLightColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: kBorderColor),
            ),
          ),
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(height: 16),
        const Text(
          'Phone number',
          style: TextStyle(fontSize: 11, color: kTextMuted),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          style: const TextStyle(color: kTextDark, fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Phone number (optional)',
            filled: true,
            fillColor: kPrimaryLightColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: kBorderColor),
            ),
          ),
          onChanged: (_) => onChanged(),
        ),
      ],
    );
  }
}

class _ReviewStep extends StatelessWidget {
  final String customerName;
  final String customerPhone;
  final SaleCartState cartState;
  final VoidCallback onEditCustomer;

  const _ReviewStep({
    required this.customerName,
    required this.customerPhone,
    required this.cartState,
    required this.onEditCustomer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SurfaceCard(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'CUSTOMER',
                      style: TextStyle(
                        fontSize: 11,
                        color: kTextFaint,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      customerName.trim().isEmpty ? '—' : customerName.trim(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: kTextDark,
                      ),
                    ),
                    if (customerPhone.trim().isNotEmpty)
                      Text(
                        customerPhone.trim(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: kTextMuted,
                        ),
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onEditCustomer,
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 12,
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        ...cartState.items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CartItemCard(item: item),
          ),
        ),
        const SizedBox(height: 4),
        OrderSummaryCard(
          totalWithVat: cartState.estimatedTotalWithVat,
          allPricesResolved: cartState.allPricesResolved,
          itemCount: cartState.items.length,
        ),
      ],
    );
  }
}
