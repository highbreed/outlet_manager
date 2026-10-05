import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../../../core/theme/colors.dart';
import '../../data/datasources/products_remote_datasource.dart';
import '../providers/products_providers.dart';

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

const _kMonthNames = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

String _isoDate(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-'
    '${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';

String _humanDate(DateTime d) =>
    '${d.day} ${_kMonthNames[d.month - 1]} ${d.year}';

/// Bottom sheet form to record a new competitor SKU price/offer check
/// against this product at the rep's outlet. Every submission creates a new
/// dated mapping row — there's no edit endpoint, this is a price-check
/// time series. When [existing] is supplied, the form pre-fills from that
/// mapping so the rep can quickly log an updated price/offer/model check
/// against the same competitor SKU.
class AddCompetitorMappingSheet extends ConsumerStatefulWidget {
  final String cardCode;
  final String itemCode;
  final String? modelNo;
  final CompetitorMapping? existing;

  const AddCompetitorMappingSheet({
    super.key,
    required this.cardCode,
    required this.itemCode,
    this.modelNo,
    this.existing,
  });

  @override
  ConsumerState<AddCompetitorMappingSheet> createState() =>
      _AddCompetitorMappingSheetState();
}

class _AddCompetitorMappingSheetState
    extends ConsumerState<AddCompetitorMappingSheet> {
  CompetitorBrand? _selectedBrand;
  late final _compModelNoController = TextEditingController(
    text: widget.existing?.compModelNo ?? '',
  );
  late final _compBarcodeController = TextEditingController(
    text: widget.existing?.compBarcode ?? '',
  );
  late final _rrpController = TextEditingController(
    text: widget.existing != null && widget.existing!.rrp > 0
        ? widget.existing!.rrp.toStringAsFixed(2)
        : '',
  );
  late final _offerRrpController = TextEditingController(
    text: widget.existing != null && widget.existing!.offerRrp > 0
        ? widget.existing!.offerRrp.toStringAsFixed(2)
        : '',
  );
  late final _itemDescriptionController = TextEditingController(
    text: widget.existing?.itemDescription ?? '',
  );
  late final _additionalFeaturesController = TextEditingController(
    text: widget.existing?.additionalFeatures ?? '',
  );
  late final _lessFeaturesController = TextEditingController(
    text: widget.existing?.lessFeatures ?? '',
  );

  DateTime _offerStartDate = DateTime.now();
  bool _submitting = false;
  String? _error;

  bool get _isUpdate => widget.existing != null;

  @override
  void dispose() {
    _compModelNoController.dispose();
    _compBarcodeController.dispose();
    _rrpController.dispose();
    _offerRrpController.dispose();
    _itemDescriptionController.dispose();
    _additionalFeaturesController.dispose();
    _lessFeaturesController.dispose();
    super.dispose();
  }

  double? get _rrp => double.tryParse(_rrpController.text.trim());
  double? get _offerRrp => double.tryParse(_offerRrpController.text.trim());

  int? get _discountPercent {
    final rrp = _rrp;
    final offer = _offerRrp;
    if (rrp == null || offer == null || rrp <= 0 || offer >= rrp) return null;
    return (((rrp - offer) / rrp) * 100).round();
  }

  bool get _canSubmit =>
      _selectedBrand != null &&
      _compModelNoController.text.trim().isNotEmpty &&
      _rrp != null &&
      _offerRrp != null;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _offerStartDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (!mounted) return;
    if (picked != null) setState(() => _offerStartDate = picked);
  }

  Future<void> _submit() async {
    if (!_canSubmit) return;
    setState(() {
      _submitting = true;
      _error = null;
    });

    try {
      final mapping = await ref
          .read(productsRemoteDataSourceProvider)
          .addCompetitorMapping(
            cardCode: widget.cardCode,
            itemCode: widget.itemCode,
            modelNo: widget.modelNo,
            compBrandId: _selectedBrand!.id,
            compModelNo: _compModelNoController.text.trim(),
            compBarcode: _compBarcodeController.text.trim().isEmpty
                ? null
                : _compBarcodeController.text.trim(),
            rrp: _rrp!,
            offerRrp: _offerRrp!,
            offerStartDate: _isoDate(_offerStartDate),
            itemDescription: _itemDescriptionController.text.trim().isEmpty
                ? null
                : _itemDescriptionController.text.trim(),
            additionalFeatures:
                _additionalFeaturesController.text.trim().isEmpty
                ? null
                : _additionalFeaturesController.text.trim(),
            lessFeatures: _lessFeaturesController.text.trim().isEmpty
                ? null
                : _lessFeaturesController.text.trim(),
          );
      if (!mounted) return;
      Navigator.of(context).pop(mapping);
    } on NetworkException catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toFailure().displayMessage;
        _submitting = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Something went wrong. Please try again.';
        _submitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: kBorderColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 12, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _isUpdate
                            ? 'Update Competitor SKU'
                            : 'Add Competitor SKU',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: kTextDark,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_isUpdate) ...[
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kSecondaryLightColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'This saves a new price-check entry — it won\'t '
                            'overwrite the existing record.',
                            style: TextStyle(
                              fontSize: 12,
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      const _SectionLabel('Competitor product'),
                      const SizedBox(height: 10),
                      _BrandDropdown(
                        selected: _selectedBrand,
                        existingBrandName: widget.existing?.compBrand,
                        onChanged: (b) => setState(() => _selectedBrand = b),
                      ),
                      const SizedBox(height: 12),
                      _Field(
                        label: 'Model number',
                        hint: 'e.g. RM-9000',
                        required: true,
                        controller: _compModelNoController,
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 12),
                      _Field(
                        label: 'Barcode',
                        controller: _compBarcodeController,
                      ),
                      const SizedBox(height: 22),
                      const _SectionLabel('Pricing'),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _Field(
                              label: 'RRP (KES)',
                              required: true,
                              controller: _rrpController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              onChanged: (_) => setState(() {}),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _Field(
                              label: 'Offer RRP (KES)',
                              required: true,
                              controller: _offerRrpController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              onChanged: (_) => setState(() {}),
                            ),
                          ),
                        ],
                      ),
                      if (_discountPercent != null) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF2E7D32,
                            ).withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '$_discountPercent% lower than their RRP',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2E7D32),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 12),
                      Text(
                        'Offer start date',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: kTextMuted,
                        ),
                      ),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: _pickDate,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 16,
                                color: kSecondaryColor,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                _humanDate(_offerStartDate),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: kTextDark,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.chevron_right,
                                size: 18,
                                color: kTextMuted,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      const _SectionLabel('Notes (optional)'),
                      const SizedBox(height: 10),
                      _Field(
                        label: 'Description',
                        controller: _itemDescriptionController,
                      ),
                      const SizedBox(height: 12),
                      _Field(
                        label: 'What do they have that we don\'t?',
                        hint: 'e.g. Larger capacity, extra accessory',
                        controller: _additionalFeaturesController,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 12),
                      _Field(
                        label: 'What do we have that they don\'t?',
                        controller: _lessFeaturesController,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_error != null) ...[
                        Text(
                          _error!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: kRedColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: FilledButton(
                          onPressed: _canSubmit && !_submitting
                              ? _submit
                              : null,
                          child: _submitting
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  _isUpdate
                                      ? 'Save update'
                                      : 'Save competitor SKU',
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BrandDropdown extends ConsumerWidget {
  final CompetitorBrand? selected;
  final String? existingBrandName;
  final ValueChanged<CompetitorBrand?> onChanged;

  const _BrandDropdown({
    required this.selected,
    this.existingBrandName,
    required this.onChanged,
  });

  InputDecoration _decoration({String? errorText}) => InputDecoration(
    labelText: 'Brand *',
    isDense: true,
    filled: true,
    fillColor: Colors.white,
    errorText: errorText,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brandsAsync = ref.watch(competitorBrandsProvider);

    return brandsAsync.when(
      loading: () => IgnorePointer(
        child: DropdownSearch<CompetitorBrand>(
          enabled: false,
          items: (_, _) => const [],
          compareFn: (a, b) => a.id == b.id,
          decoratorProps: DropDownDecoratorProps(
            decoration: _decoration().copyWith(hintText: 'Loading brands...'),
          ),
        ),
      ),
      error: (error, _) => InputDecorator(
        decoration: _decoration(errorText: 'Couldn\'t load brands'),
        child: InkWell(
          onTap: () => ref.invalidate(competitorBrandsProvider),
          child: const Row(
            children: [
              Icon(Icons.refresh, size: 16, color: kSecondaryColor),
              SizedBox(width: 6),
              Text(
                'Tap to retry',
                style: TextStyle(fontSize: 13, color: kSecondaryColor),
              ),
            ],
          ),
        ),
      ),
      data: (brands) {
        var effectiveSelected = selected;
        if (effectiveSelected == null && existingBrandName != null) {
          final matches = brands.where(
            (b) => b.name.toUpperCase() == existingBrandName!.toUpperCase(),
          );
          if (matches.isNotEmpty) {
            effectiveSelected = matches.first;
            final resolved = effectiveSelected;
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => onChanged(resolved),
            );
          }
        }
        return DropdownSearch<CompetitorBrand>(
          selectedItem: effectiveSelected,
          items: (filter, _) {
            if (filter.trim().isEmpty) return brands;
            final q = filter.trim().toLowerCase();
            return brands
                .where((b) => b.name.toLowerCase().contains(q))
                .toList();
          },
          itemAsString: (b) => b.name,
          compareFn: (a, b) => a.id == b.id,
          decoratorProps: DropDownDecoratorProps(
            baseStyle: const TextStyle(fontSize: 14, color: kTextDark),
            decoration: _decoration(),
          ),
          popupProps: PopupProps.modalBottomSheet(
            showSearchBox: true,
            searchFieldProps: const TextFieldProps(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search brand...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            modalBottomSheetProps: _lightModalSheetProps(),
            title: const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text('Select Brand', style: _kPickerTitleStyle),
            ),
            itemBuilder: (context, b, isSelected, _) => ListTile(
              title: Text(b.name, style: const TextStyle(color: kTextDark)),
            ),
          ),
          onChanged: onChanged,
        );
      },
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.4,
        color: kTextMuted,
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final String? hint;
  final bool required;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  const _Field({
    required this.label,
    this.hint,
    this.required = false,
    required this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 14, color: kTextDark),
      decoration: InputDecoration(
        labelText: required ? '$label *' : label,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 13, color: kTextMuted),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
