import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../locations/data/location_region.dart';
import '../../../locations/data/location_town.dart';
import '../../../locations/data/location_zone.dart';
import '../../../locations/presentation/providers/location_providers.dart';
import '../../../stock_take/presentation/screens/barcode_scanner_screen.dart';
import '../../../auth/auth.dart';
import '../../../sales_order/data/datasources/sales_customer_remote_datasource.dart';
import '../../../sales_order/domain/entities/customer.dart';
import '../../../sales_order/presentation/providers/sales_order_providers.dart';
import '../../domain/entities/complaint.dart';
import '../../domain/entities/complaint_product.dart';
import '../../domain/entities/complaint_source.dart';
import '../../domain/entities/complaint_type.dart';
import '../providers/complaint_providers.dart';

/// `DropdownSearch`'s modal-bottom-sheet popup falls back to a hardcoded
/// white background when no `bottomSheetTheme` is set (which this app's
/// dark theme doesn't define) — combined with list text inheriting the
/// app's dark-theme white text color, every picker in this form rendered
/// unreadable white-on-white. Force an explicit white sheet with explicit
/// dark text everywhere instead of relying on ambient theme defaults.
ModalBottomSheetProps _lightModalSheetProps() => const ModalBottomSheetProps(
  backgroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  ),
);

const _kPickerTitleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: kTextDark,
);

class RegisterComplaintScreen extends ConsumerStatefulWidget {
  const RegisterComplaintScreen({super.key});

  @override
  ConsumerState<RegisterComplaintScreen> createState() =>
      _RegisterComplaintScreenState();
}

class _RegisterComplaintScreenState
    extends ConsumerState<RegisterComplaintScreen> {
  int _step = 0;
  bool _isSubmitting = false;
  bool _isNavigatingAway = false;

  // Step 1 – Consumer info
  final _nameCtrl = TextEditingController();
  String _phoneNumber = '';
  LocationRegion? _selectedRegion;
  LocationZone? _selectedZone;
  LocationTown? _selectedTown;
  final _addressCtrl = TextEditingController();

  // Step 2 – Product info
  ComplaintProduct? _selectedProduct;
  bool _isLookingUpProduct = false;
  String? _productError;
  String _productHasSerialNumber = 'YES';
  String? _serialNumberErrorText;
  bool _serialNumberRemarksHasError = false;
  final _serialCtrl = TextEditingController();
  final _serialRemarksCtrl = TextEditingController();
  DateTime? _dateOfPurchase;
  WarrantyStatus _warrantyStatus = WarrantyStatus.outOfWarranty;
  final _descriptionCtrl = TextEditingController();

  // Step 3 – Complaint type & source
  ComplaintType? _complaintType;
  ComplaintSource? _complaintSource;
  SalesCustomer? _selectedStockist;

  final _step1Key = GlobalKey<FormState>();
  final _step2Key = GlobalKey<FormState>();

  @override
  void dispose() {
    for (final c in [
      _nameCtrl, _addressCtrl, _serialCtrl, _serialRemarksCtrl, _descriptionCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  /// Removes all DropdownSearch widgets from the tree via a normal setState
  /// rebuild, then navigates on the next frame. This prevents the
  /// DropdownSearch dispose → Navigator.pop from firing during Flutter's
  /// locked finalizeTree phase and causing the "widget tree was locked" error.
  void _safeNavigate(VoidCallback navigate) {
    setState(() => _isNavigatingAway = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) navigate();
    });
  }

  void _nextStep() {
    if (_step == 0 && !(_step1Key.currentState?.validate() ?? false)) return;
    if (_step == 1) {
      if (_selectedProduct == null) {
        setState(() => _productError = 'Please search or scan a product');
        return;
      }
      if (_productHasSerialNumber == 'YES') {
        final err = _validateSerialNumber(_serialCtrl.text.trim());
        if (err != null) {
          setState(() => _serialNumberErrorText = err);
          return;
        }
      } else {
        if (_serialRemarksCtrl.text.trim().isEmpty) {
          setState(() => _serialNumberRemarksHasError = true);
          return;
        }
      }
      if (!(_step2Key.currentState?.validate() ?? false)) return;
    }
    setState(() => _step++);
  }

  void _prevStep() => setState(() => _step--);

  Future<void> _submit() async {
    if (_isSubmitting) return;

    if (_complaintType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a complaint type.')),
      );
      return;
    }
    if (_complaintSource == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a complaint source.')),
      );
      return;
    }

    final sourceKey = _complaintSource!.name.toLowerCase();
    final isStockist = sourceKey.contains('stockist');
    if (isStockist && _selectedStockist == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a stockist.')),
      );
      return;
    }

    final isStaff = sourceKey.contains('staff');
    final sourcePersonName = isStaff
        ? ref.read(currentUserProvider)?.fullName
        : _selectedStockist?.name;
    final sourcePersonCode = isStockist ? _selectedStockist?.code : null;

    final confirmed = await _showConfirmDialog();
    if (!confirmed || !mounted) return;

    setState(() => _isSubmitting = true);
    try {
      final body = {
        'consumer_name': _nameCtrl.text.trim(),
        'consumer_phone': _phoneNumber,
        'consumer_region': _selectedRegion?.name,
        'consumer_zone': _selectedZone?.name,
        'consumer_area': _selectedTown?.name,
        'consumer_address': _addressCtrl.text.trim().isEmpty
            ? null
            : _addressCtrl.text.trim(),
        'product_code': _selectedProduct?.itemCode ?? '',
        'product_name': _selectedProduct?.itemName ?? '',
        'product_brand': _selectedProduct?.brandName,
        'product_model_no': _selectedProduct?.modelNumber,
        'serial_number':
            _productHasSerialNumber == 'YES' ? _serialCtrl.text.trim() : '',
        'serial_defaced': _productHasSerialNumber == 'NO',
        'serial_defaced_note': _productHasSerialNumber == 'NO'
            ? (_serialRemarksCtrl.text.trim().isEmpty
                ? null
                : _serialRemarksCtrl.text.trim())
            : null,
        'date_of_purchase': _dateOfPurchase != null
            ? '${_dateOfPurchase!.year.toString().padLeft(4, '0')}-'
                '${_dateOfPurchase!.month.toString().padLeft(2, '0')}-'
                '${_dateOfPurchase!.day.toString().padLeft(2, '0')}'
            : null,
        'warranty_status': _warrantyStatus == WarrantyStatus.inWarranty
            ? 'in_warranty'
            : 'out_of_warranty',
        'description': _descriptionCtrl.text.trim(),
        'complaint_type_id': _complaintType?.id,
        'complaint_type_name': _complaintType?.name,
        'complaint_source_id': _complaintSource?.id,
        'complaint_source_name': _complaintSource?.name,
        'source_person_name': sourcePersonName,
        'source_person_code': sourcePersonCode,
      };

      final dio = ref.read(dioProvider);
      final response = await dio.post(
        ApiEndpoints.afterSalesRegistrations,
        data: body,
      );

      final data = response.data as Map<String, dynamic>? ?? {};
      final complaint = ref.read(complaintsProvider.notifier).create(
        consumerName: _nameCtrl.text.trim(),
        consumerPhone: _phoneNumber,
        consumerRegion: _selectedRegion?.name,
        consumerZone: _selectedZone?.name,
        consumerArea: _selectedTown?.name,
        consumerAddress: _addressCtrl.text.trim().isEmpty
            ? null
            : _addressCtrl.text.trim(),
        productCode: _selectedProduct?.itemCode ?? '',
        productName: _selectedProduct?.itemName ?? '',
        productBrand: _selectedProduct?.brandName,
        productModelNo: _selectedProduct?.modelNumber,
        serialNumber:
            _productHasSerialNumber == 'YES' ? _serialCtrl.text.trim() : '',
        serialDefaced: _productHasSerialNumber == 'NO',
        serialDefacedNote: _productHasSerialNumber == 'NO'
            ? (_serialRemarksCtrl.text.trim().isEmpty
                ? null
                : _serialRemarksCtrl.text.trim())
            : null,
        dateOfPurchase: _dateOfPurchase,
        warrantyStatus: _warrantyStatus,
        description: _descriptionCtrl.text.trim(),
        complaintTypeId: _complaintType?.id,
        complaintTypeName: _complaintType?.name,
        complaintSourceId: _complaintSource?.id,
        complaintSourceName: _complaintSource?.name,
        sourcePersonName: sourcePersonName,
        sourcePersonCode: sourcePersonCode,
      );

      // Attach server ID if the API returned one
      final serverId = data['id'] as int?;
      if (serverId != null) {
        ref.read(complaintsProvider.notifier).update(
          complaint.copyWith(serverId: serverId),
        );
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('After Sales ${complaint.complaintNo} registered'),
        ),
      );
      ref.read(aftersalesListProvider.notifier).load(refresh: true);
      _safeNavigate(() => context.go('/after-sales'));
    } on DioException catch (e) {
      if (!mounted) return;
      final message = (e.response?.data as Map<String, dynamic>?)?['message']
              as String? ??
          'Submission failed. Please try again.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred.')),
      );
    } finally {
      if (mounted && !_isNavigatingAway) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<bool> _showConfirmDialog() async {
    final serial = _productHasSerialNumber == 'NO'
        ? 'No serial number'
        : _serialCtrl.text.trim();

    return await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Confirm Submission'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please review before submitting:',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                _ConfirmRow('Consumer', _nameCtrl.text.trim()),
                _ConfirmRow('Phone', _phoneNumber),
                _ConfirmRow(
                  'Product',
                  _selectedProduct?.itemName ?? '—',
                ),
                _ConfirmRow('Serial No', serial.isEmpty ? '—' : serial),
                _ConfirmRow('Warranty', _warrantyStatus.label),
                _ConfirmRow('Type', _complaintType?.name ?? '—'),
                _ConfirmRow('Source', _complaintSource?.name ?? '—'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                ),
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Submit'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _safeNavigate(() => context.pop());
      },
      child: AppScaffold(
        title: 'Register After Sales',
        body: Column(
          children: [
            _StepIndicator(currentStep: _step),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: _isNavigatingAway
                    ? const SizedBox.shrink()
                    : [
                        _buildStep1(),
                        _buildStep2(),
                        _buildStep3(),
                      ][_step],
              ),
            ),
            if (!_isNavigatingAway) _buildNavButtons(),
          ],
        ),
      ),
    );
  }

  // ── Step 1: Consumer info ──────────────────────────────────────────────────

  Widget _buildStep1() {
    return Form(
      key: _step1Key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader('Consumer Information', Icons.person_outline),
          const SizedBox(height: 12),
          TextFormField(
            controller: _nameCtrl,
            textCapitalization: TextCapitalization.words,
            decoration: _inputDecoration('Full Name *'),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Name is required' : null,
          ),
          const SizedBox(height: 12),
          IntlPhoneField(
            decoration: _inputDecoration('Phone Number *'),
            initialCountryCode: AppConfig.region.countryCode,
            onChanged: (phone) =>
                setState(() => _phoneNumber = phone.completeNumber),
            validator: (phone) =>
                (phone == null || phone.number.trim().isEmpty)
                    ? 'Phone is required'
                    : null,
          ),
          const SizedBox(height: 20),
          _sectionHeader('Location', Icons.location_on_outlined),
          const SizedBox(height: 12),
          _RegionDropdown(
            selected: _selectedRegion,
            onChanged: (r) => setState(() {
              _selectedRegion = r;
              _selectedZone = null;
              _selectedTown = null;
            }),
            decoration: _inputDecoration('Region *'),
            validator: (v) => v == null ? 'Region is required' : null,
          ),
          const SizedBox(height: 12),
          _ZoneDropdown(
            regionId: _selectedRegion?.id,
            selected: _selectedZone,
            onChanged: (z) => setState(() {
              _selectedZone = z;
              _selectedTown = null;
            }),
            decoration: _inputDecoration('Zone *'),
            validator: (v) => v == null ? 'Zone is required' : null,
          ),
          const SizedBox(height: 12),
          _TownDropdown(
            zoneId: _selectedZone?.id,
            selected: _selectedTown,
            onChanged: (t) => setState(() => _selectedTown = t),
            decoration: _inputDecoration('Town *'),
            validator: (v) => v == null ? 'Town is required' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _addressCtrl,
            maxLines: 2,
            textCapitalization: TextCapitalization.sentences,
            decoration: _inputDecoration('Physical Address *'),
            validator: (v) => (v == null || v.trim().isEmpty)
                ? 'Address is required'
                : null,
          ),
        ],
      ),
    );
  }

  // ── Step 2: Product info ───────────────────────────────────────────────────

  Widget _buildStep2() {
    return Form(
      key: _step2Key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader('Product Details', Icons.inventory_2_outlined),
          const SizedBox(height: 12),
          _ProductPicker(
            selected: _selectedProduct,
            isLoading: _isLookingUpProduct,
            onProductSelected: (p) => setState(() {
              _selectedProduct = p;
              _productError = null;
            }),
            onScan: _scanBarcode,
            onClear: () => setState(() => _selectedProduct = null),
          ),
          if (_productError != null)
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 12),
              child: Text(
                _productError!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          const SizedBox(height: 20),
          _sectionHeader('Serial Number', Icons.qr_code_outlined),
          const SizedBox(height: 10),
          const Text(
            'Product has Serial Number',
            style: TextStyle(fontSize: 13, color: kTextMuted),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              _buildToggle(
                'YES',
                selected: _productHasSerialNumber == 'YES',
                onTap: () => setState(() {
                  _productHasSerialNumber = 'YES';
                  _serialRemarksCtrl.clear();
                  _serialNumberRemarksHasError = false;
                }),
              ),
              const SizedBox(width: 8),
              _buildToggle(
                'NO',
                selected: _productHasSerialNumber == 'NO',
                onTap: () => setState(() {
                  _productHasSerialNumber = 'NO';
                  _serialCtrl.clear();
                  _serialNumberErrorText = null;
                }),
              ),
            ],
          ),
          if (_productHasSerialNumber == 'YES') ...[
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: _serialCtrl,
                    decoration: _inputDecoration('Serial Number *').copyWith(
                      errorText: _serialNumberErrorText,
                      focusedBorder: _serialNumberErrorText != null
                          ? const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            )
                          : null,
                      enabledBorder: _serialNumberErrorText != null
                          ? const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            )
                          : null,
                    ),
                    onChanged: (v) {
                      final stripped = _stripModelPrefix(v);
                      if (stripped != v) {
                        _serialCtrl.value = _serialCtrl.value.copyWith(
                          text: stripped,
                          selection: TextSelection.collapsed(
                            offset: stripped.length,
                          ),
                        );
                      }
                      setState(() =>
                          _serialNumberErrorText =
                              _validateSerialNumber(stripped));
                    },
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: _scanSerialNumber,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Icon(Icons.qr_code_scanner),
                  ),
                ),
              ],
            ),
          ] else ...[
            const SizedBox(height: 12),
            TextField(
              controller: _serialRemarksCtrl,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              decoration: _inputDecoration(
                'Explain why product has no serial number',
              ).copyWith(
                errorText: _serialNumberRemarksHasError
                    ? 'This field is required'
                    : null,
                enabledBorder: _serialNumberRemarksHasError
                    ? const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      )
                    : null,
                focusedBorder: _serialNumberRemarksHasError
                    ? const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      )
                    : null,
              ),
              onChanged: (_) {
                if (_serialNumberRemarksHasError) {
                  setState(() => _serialNumberRemarksHasError = false);
                }
              },
            ),
          ],
          const SizedBox(height: 20),
          _sectionHeader(
            'Purchase & Warranty',
            Icons.verified_outlined,
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: _pickDateOfPurchase,
            borderRadius: BorderRadius.circular(8),
            child: InputDecorator(
              decoration: _inputDecoration('Date of Purchase'),
              child: Text(
                _dateOfPurchase != null
                    ? _fmtDate(_dateOfPurchase!)
                    : 'Tap to select',
                style: TextStyle(
                  color: _dateOfPurchase != null ? null : kTextMuted,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Warranty Status',
            style: TextStyle(fontSize: 13, color: kTextMuted),
          ),
          const SizedBox(height: 6),
          Row(
            children: WarrantyStatus.values.map((ws) {
              final selected = _warrantyStatus == ws;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () => setState(() => _warrantyStatus = ws),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selected ? kSecondaryColor : null,
                        border: Border.all(
                          color: selected ? kSecondaryColor : kTextMuted,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        ws.label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: selected ? Colors.white : kTextMuted,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          _sectionHeader('Issue Description', Icons.report_problem_outlined),
          const SizedBox(height: 12),
          TextFormField(
            controller: _descriptionCtrl,
            maxLines: 4,
            textCapitalization: TextCapitalization.sentences,
            decoration: _inputDecoration('Describe the issue in detail *'),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Description is required' : null,
          ),
        ],
      ),
    );
  }

  // ── Step 3: Complaint type + review ───────────────────────────────────────

  Widget _buildStep3() {
    final typesAsync = ref.watch(complaintTypesProvider);
    final sourcesAsync = ref.watch(complaintSourcesProvider);
    final currentUser = ref.watch(currentUserProvider);

    final types = typesAsync.value ?? <ComplaintType>[];
    final sources = sourcesAsync.value ?? <ComplaintSource>[];

    final sourceKey = _complaintSource?.name.toLowerCase() ?? '';
    final isStaff = sourceKey.contains('staff');
    final isStockist = sourceKey.contains('stockist');

    final sourcePersonDisplay = isStaff
        ? (currentUser?.fullName ?? '')
        : (_selectedStockist?.name ?? '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('After Sales Type', Icons.category_outlined),
        const SizedBox(height: 12),
        DropdownButtonFormField<ComplaintType>(
          initialValue: _complaintType,
          decoration: _inputDecoration('Complaint Type *').copyWith(
            suffixIcon: typesAsync.isLoading
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : null,
          ),
          items: types
              .map((t) => DropdownMenuItem(value: t, child: Text(t.name)))
              .toList(),
          onChanged: (v) => setState(() => _complaintType = v),
        ),
        const SizedBox(height: 16),
        _sectionHeader('Complaint Source', Icons.source_outlined),
        const SizedBox(height: 12),
        DropdownButtonFormField<ComplaintSource>(
          initialValue: _complaintSource,
          decoration: _inputDecoration('Complaint Source *').copyWith(
            suffixIcon: sourcesAsync.isLoading
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : null,
          ),
          items: sources
              .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
              .toList(),
          onChanged: (v) => setState(() {
            _complaintSource = v;
            _selectedStockist = null;
          }),
        ),
        if (isStaff) ...[
          const SizedBox(height: 12),
          TextField(
            readOnly: true,
            controller: TextEditingController(
              text: currentUser?.fullName ?? '',
            ),
            decoration: _inputDecoration('Staff Name').copyWith(
              prefixIcon: const Icon(Icons.person_outline),
              filled: true,
            ),
          ),
        ] else if (isStockist) ...[
          const SizedBox(height: 12),
          DropdownSearch<SalesCustomer>(
            selectedItem: _selectedStockist,
            items: (filter, _) async {
              final ds = ref.read(salesCustomerRemoteDataSourceProvider);
              final result = await ds.fetchCustomers(
                cardName: filter.isNotEmpty ? filter : null,
                size: 30,
              );
              return result.items;
            },
            itemAsString: (c) => c.name,
            compareFn: (a, b) => a.code == b.code,
            decoratorProps: DropDownDecoratorProps(
              decoration: _inputDecoration('Select Stockist *').copyWith(
                prefixIcon: const Icon(Icons.storefront_outlined),
              ),
            ),
            popupProps: PopupProps.modalBottomSheet(
              showSearchBox: true,
              searchFieldProps: const TextFieldProps(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search by name or code...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              modalBottomSheetProps: _lightModalSheetProps(),
              title: const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text('Select Stockist', style: _kPickerTitleStyle),
              ),
              itemBuilder: (context, c, isSelected, _) => ListTile(
                leading: const Icon(Icons.storefront_outlined, color: kTextDark),
                title: Text(c.name, style: const TextStyle(color: kTextDark)),
                subtitle: Text(c.code, style: const TextStyle(color: kTextMuted)),
                selected: isSelected,
              ),
            ),
            onChanged: (c) => setState(() => _selectedStockist = c),
          ),
        ],
        const SizedBox(height: 20),
        _sectionHeader('Review Summary', Icons.checklist_outlined),
        const SizedBox(height: 10),
        _SummaryCard(
          consumer: _nameCtrl.text,
          phone: _phoneNumber,
          product: _selectedProduct?.itemName ?? '—',
          serial: _productHasSerialNumber == 'NO'
              ? 'No serial number${_serialRemarksCtrl.text.trim().isNotEmpty ? ' – ${_serialRemarksCtrl.text.trim()}' : ''}'
              : _serialCtrl.text,
          warranty: _warrantyStatus.label,
          type: _complaintType?.name ?? 'Not selected',
          source: _complaintSource == null
              ? 'Not selected'
              : sourcePersonDisplay.isNotEmpty
                  ? '${_complaintSource!.name} – $sourcePersonDisplay'
                  : _complaintSource!.name,
        ),
      ],
    );
  }

  // ── Shared helpers ─────────────────────────────────────────────────────────

  Widget _buildNavButtons() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_step > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: _prevStep,
                child: const Text('Back'),
              ),
            ),
          if (_step > 0) const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: kSecondaryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _isSubmitting
                  ? null
                  : (_step < 2 ? _nextStep : _submit),
              child: _isSubmitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      _step < 2 ? 'Next' : 'Submit After Sales',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, IconData icon) => Row(
    children: [
      Icon(icon, size: 16, color: kSecondaryColor),
      const SizedBox(width: 6),
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: kSecondaryColor,
        ),
      ),
    ],
  );

  InputDecoration _inputDecoration(String label) => InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
  );

  Future<void> _pickDateOfPurchase() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dateOfPurchase ?? now.subtract(const Duration(days: 30)),
      firstDate: DateTime(now.year - 10),
      lastDate: now,
    );
    if (picked != null) setState(() => _dateOfPurchase = picked);
  }

  String _fmtDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')} ${_month(d.month)} ${d.year}';

  String _month(int m) => const [
    '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ][m];

  Widget _buildToggle(
    String label, {
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? kSecondaryColor : null,
            border: Border.all(
              color: selected ? kSecondaryColor : kTextMuted,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : kTextMuted,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _scanSerialNumber() async {
    final result = await Navigator.push<BarcodeScanResult>(
      context,
      MaterialPageRoute(
        builder: (_) => const BarcodeScannerScreen(
          title: 'Scan Serial Number',
          hintText: 'Scan the serial number barcode',
        ),
      ),
    );
    if (result == null || !mounted) return;
    final stripped = _stripModelPrefix(result.barcode);
    final error = _validateSerialNumber(stripped);
    if (error != null) {
      if (!mounted) return;
      showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Invalid Serial Number'),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    setState(() {
      _serialCtrl.text = stripped;
      _serialNumberErrorText = null;
    });
  }

  String _stripModelPrefix(String value) {
    final parts = value.split(';');
    return parts.length >= 2 ? parts.last.trim() : value.trim();
  }

  String? _validateSerialNumber(String value) {
    final v = value.trim();
    if (v.isEmpty) return 'Serial number is required';
    if (RegExp(r'https?://|www\.|ftp://').hasMatch(v)) {
      return 'Serial number cannot be a URL';
    }
    if (v.length < 8) return 'Serial number must be at least 8 characters';
    if (RegExp(r'^\d+$').hasMatch(v)) return 'Serial number cannot be all numeric';
    if (_selectedProduct != null) {
      final combined =
          '${_selectedProduct!.itemName} ${_selectedProduct!.itemGroup ?? ''}'
              .toLowerCase();
      if (combined.contains('mika')) {
        if (!RegExp(r'^[a-zA-Z]{2}').hasMatch(v)) {
          return 'Mika serial number must start with 2 letters';
        }
      }
    }
    return null;
  }

  Future<void> _scanBarcode() async {
    final result = await Navigator.push<BarcodeScanResult>(
      context,
      MaterialPageRoute(
        builder: (_) => const BarcodeScannerScreen(
          title: 'Scan Product Barcode',
          hintText: 'Scan the product barcode or QR code',
        ),
      ),
    );
    if (result == null || !mounted) return;

    setState(() => _isLookingUpProduct = true);
    try {
      final dio = ref.read(dioProvider);
      final response = await dio.get(
        ApiEndpoints.afterSalesProducts,
        queryParameters: {'search': result.barcode},
      );
      final items = (response.data as List<dynamic>?) ?? [];
      if (items.isNotEmpty) {
        final product = ComplaintProduct.fromJson(
          items.first as Map<String, dynamic>,
        );
        setState(() {
          _selectedProduct = product;
          _productError = null;
        });
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No product found for barcode: ${result.barcode}'),
            ),
          );
        }
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to look up product')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLookingUpProduct = false);
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Product picker — search by text or scan barcode
// ─────────────────────────────────────────────────────────────────────────────

class _ProductPicker extends ConsumerWidget {
  final ComplaintProduct? selected;
  final bool isLoading;
  final ValueChanged<ComplaintProduct> onProductSelected;
  final VoidCallback onScan;
  final VoidCallback onClear;

  const _ProductPicker({
    required this.selected,
    required this.isLoading,
    required this.onProductSelected,
    required this.onScan,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final searchProducts = ref.watch(afterSalesProductSearchProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (selected != null) ...[
          _buildSelectedCard(selected!),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: onClear,
            icon: const Icon(Icons.swap_horiz, size: 16),
            label: const Text('Change product'),
            style: TextButton.styleFrom(
              foregroundColor: kSecondaryColor,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
        // Keep DropdownSearch in the tree (maintainState: true) so that its
        // dispose() doesn't fire a spurious Navigator.pop() while the
        // modal bottom sheet is still closing — which would pop this screen.
        Visibility(
          visible: selected == null,
          maintainState: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownSearch<ComplaintProduct>(
                items: (filter, _) => searchProducts(filter),
                itemAsString: (p) => '${p.itemCode} – ${p.itemName}',
                compareFn: (a, b) => a.itemCode == b.itemCode,
                decoratorProps: const DropDownDecoratorProps(
                  decoration: InputDecoration(
                    labelText: 'Search product',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                  ),
                ),
                popupProps: PopupProps.modalBottomSheet(
                  showSearchBox: true,
                  searchDelay: const Duration(milliseconds: 400),
                  // The backend already searches by code/name/model/brand —
                  // don't let dropdown_search re-filter the results locally
                  // afterward using itemAsString (code + name only), which
                  // would silently drop every model-number match.
                  disableFilter: true,
                  searchFieldProps: const TextFieldProps(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Type product name, code or model...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  modalBottomSheetProps: _lightModalSheetProps(),
                  title: const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text('Select Product', style: _kPickerTitleStyle),
                  ),
                  emptyBuilder: (context, searchEntry) => const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(
                      child: Text(
                        'No product found',
                        style: TextStyle(color: kTextMuted),
                      ),
                    ),
                  ),
                  errorBuilder: (context, searchEntry, exception) => Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Text(
                        'Failed to search products',
                        style: const TextStyle(color: kTextMuted),
                      ),
                    ),
                  ),
                  loadingBuilder: (context, searchEntry) => const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  itemBuilder: (context, p, isSelected, _) => ListTile(
                    leading: const Icon(
                      Icons.inventory_2_outlined,
                      color: kTextDark,
                    ),
                    title: Text(
                      p.itemName,
                      style: const TextStyle(color: kTextDark),
                    ),
                    subtitle: Text(
                      [p.brandName, if (p.modelNumber != null) p.modelNumber!]
                          .join(' · '),
                      style: const TextStyle(color: kTextMuted),
                    ),
                    trailing: Text(
                      p.itemCode,
                      style: const TextStyle(
                        fontSize: 11,
                        color: kTextMuted,
                        fontFamily: 'monospace',
                      ),
                    ),
                    selected: isSelected,
                  ),
                ),
                onChanged: (p) {
                  if (p != null) onProductSelected(p);
                },
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: onScan,
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text('Scan Barcode'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedCard(ComplaintProduct p) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kSecondaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.inventory_2, size: 16, color: kSecondaryColor),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  p.itemName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            [p.brandName, if (p.modelNumber != null) p.modelNumber!].join(' · '),
            style: const TextStyle(fontSize: 12, color: kTextMuted),
          ),
          const SizedBox(height: 2),
          Text(
            'Code: ${p.itemCode}',
            style: const TextStyle(
              fontSize: 12,
              color: kTextMuted,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Step indicator widget
// ─────────────────────────────────────────────────────────────────────────────

class _StepIndicator extends StatelessWidget {
  final int currentStep;
  const _StepIndicator({required this.currentStep});

  static const _labels = ['Consumer', 'Product', 'Type'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryLightColor,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: List.generate(_labels.length * 2 - 1, (i) {
          if (i.isOdd) {
            // Connector line
            return Expanded(
              child: Container(
                height: 2,
                color: i ~/ 2 < currentStep
                    ? kSecondaryColor
                    : const Color(0xFFBDBDBD),
              ),
            );
          }
          final step = i ~/ 2;
          final done = step < currentStep;
          final active = step == currentStep;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: done || active ? kSecondaryColor : Colors.white,
                  border: Border.all(
                    color: done || active
                        ? kSecondaryColor
                        : const Color(0xFFBDBDBD),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: done
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : Text(
                          '${step + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: active ? Colors.white : kTextMuted,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _labels[step],
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                  color: active ? kSecondaryColor : kTextMuted,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Zone dropdown — enabled only after a region is selected
// ─────────────────────────────────────────────────────────────────────────────

class _ZoneDropdown extends ConsumerWidget {
  final int? regionId;
  final LocationZone? selected;
  final ValueChanged<LocationZone?> onChanged;
  final InputDecoration decoration;
  final FormFieldValidator<LocationZone>? validator;

  const _ZoneDropdown({
    required this.regionId,
    required this.selected,
    required this.onChanged,
    required this.decoration,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (regionId == null) {
      return DropdownSearch<LocationZone>(
        items: (_, _) => [],
        enabled: false,
        compareFn: (a, b) => a.id == b.id,
        decoratorProps: DropDownDecoratorProps(
          decoration: decoration.copyWith(hintText: 'Select a region first'),
        ),
        popupProps: PopupProps.modalBottomSheet(showSearchBox: true),
        onChanged: (_) {},
        validator: validator,
      );
    }

    final zonesAsync = ref.watch(locationZonesProvider(regionId!));
    final zones = zonesAsync.value ?? <LocationZone>[];
    final isLoading = zonesAsync.isLoading;

    return DropdownSearch<LocationZone>(
      items: (_, _) => zones,
      selectedItem: selected,
      itemAsString: (z) => z.name,
      compareFn: (a, b) => a.id == b.id,
      decoratorProps: DropDownDecoratorProps(
        decoration: decoration.copyWith(
          suffixIcon: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : null,
        ),
      ),
      popupProps: PopupProps.modalBottomSheet(
        showSearchBox: true,
        showSelectedItems: true,
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Search zone...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        modalBottomSheetProps: _lightModalSheetProps(),
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text('Select Zone', style: _kPickerTitleStyle),
        ),
        itemBuilder: (context, z, isSelected, _) => ListTile(
          title: Text(z.name, style: const TextStyle(color: kTextDark)),
          selected: isSelected,
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Town dropdown — enabled only after a zone is selected
// ─────────────────────────────────────────────────────────────────────────────

class _TownDropdown extends ConsumerWidget {
  final int? zoneId;
  final LocationTown? selected;
  final ValueChanged<LocationTown?> onChanged;
  final InputDecoration decoration;
  final FormFieldValidator<LocationTown>? validator;

  const _TownDropdown({
    required this.zoneId,
    required this.selected,
    required this.onChanged,
    required this.decoration,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (zoneId == null) {
      return DropdownSearch<LocationTown>(
        items: (_, _) => [],
        enabled: false,
        compareFn: (a, b) => a.id == b.id,
        decoratorProps: DropDownDecoratorProps(
          decoration: decoration.copyWith(hintText: 'Select a zone first'),
        ),
        popupProps: PopupProps.modalBottomSheet(showSearchBox: true),
        onChanged: (_) {},
        validator: validator,
      );
    }

    final townsAsync = ref.watch(locationTownsProvider(zoneId!));
    final towns = townsAsync.value ?? <LocationTown>[];
    final isLoading = townsAsync.isLoading;

    return DropdownSearch<LocationTown>(
      items: (_, _) => towns,
      selectedItem: selected,
      itemAsString: (t) => t.name,
      compareFn: (a, b) => a.id == b.id,
      decoratorProps: DropDownDecoratorProps(
        decoration: decoration.copyWith(
          suffixIcon: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : null,
        ),
      ),
      popupProps: PopupProps.modalBottomSheet(
        showSearchBox: true,
        showSelectedItems: true,
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Search town...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        modalBottomSheetProps: _lightModalSheetProps(),
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text('Select Town', style: _kPickerTitleStyle),
        ),
        itemBuilder: (context, t, isSelected, _) => ListTile(
          title: Text(t.name, style: const TextStyle(color: kTextDark)),
          selected: isSelected,
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Summary card (step 3)
// ─────────────────────────────────────────────────────────────────────────────

class _SummaryCard extends StatelessWidget {
  final String consumer, phone, product, serial, warranty, type, source;

  const _SummaryCard({
    required this.consumer,
    required this.phone,
    required this.product,
    required this.serial,
    required this.warranty,
    required this.type,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryLightColor,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            _SummaryRow(Icons.person_outline, 'Consumer', consumer),
            _SummaryRow(Icons.phone_outlined, 'Phone', phone),
            _SummaryRow(Icons.inventory_2_outlined, 'Product', product),
            _SummaryRow(Icons.qr_code, 'Serial No', serial),
            _SummaryRow(Icons.verified_outlined, 'Warranty', warranty),
            _SummaryRow(Icons.category_outlined, 'Type', type),
            _SummaryRow(Icons.source_outlined, 'Source', source),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Region dropdown — fetches from /locations/regions
// ─────────────────────────────────────────────────────────────────────────────

class _RegionDropdown extends ConsumerWidget {
  final LocationRegion? selected;
  final ValueChanged<LocationRegion?> onChanged;
  final InputDecoration decoration;
  final FormFieldValidator<LocationRegion>? validator;

  const _RegionDropdown({
    required this.selected,
    required this.onChanged,
    required this.decoration,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regionsAsync = ref.watch(locationRegionsProvider);

    final regions = regionsAsync.value ?? <LocationRegion>[];
    final isLoading = regionsAsync.isLoading;

    return DropdownSearch<LocationRegion>(
      items: (_, _) => regions,
      selectedItem: selected,
      itemAsString: (r) => r.name,
      compareFn: (a, b) => a.id == b.id,
      decoratorProps: DropDownDecoratorProps(
        decoration: decoration.copyWith(
          suffixIcon: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : null,
        ),
      ),
      popupProps: PopupProps.modalBottomSheet(
        showSearchBox: true,
        showSelectedItems: true,
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Search region...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
        modalBottomSheetProps: _lightModalSheetProps(),
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text('Select Region', style: _kPickerTitleStyle),
        ),
        itemBuilder: (context, r, isSelected, _) => ListTile(
          title: Text(r.name, style: const TextStyle(color: kTextDark)),
          selected: isSelected,
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SummaryRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 14, color: kSecondaryColor),
          const SizedBox(width: 8),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: kTextMuted),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? '—' : value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConfirmRow extends StatelessWidget {
  final String label;
  final String value;

  const _ConfirmRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 76,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: kTextMuted),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value.isEmpty ? '—' : value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
