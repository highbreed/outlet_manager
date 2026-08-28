import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/theme/colors.dart';
import '../providers/complaint_providers.dart';

enum _DatePreset { today, yesterday, last7, last30, custom }

class AftersalesFilterSheet extends ConsumerStatefulWidget {
  const AftersalesFilterSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      builder: (_) => const AftersalesFilterSheet(),
    );
  }

  @override
  ConsumerState<AftersalesFilterSheet> createState() =>
      _AftersalesFilterSheetState();
}

class _AftersalesFilterSheetState
    extends ConsumerState<AftersalesFilterSheet> {
  late DateTime? _fromDate;
  late DateTime? _toDate;
  _DatePreset _preset = _DatePreset.today;

  final _nameCtrl = TextEditingController();
  final _regionCtrl = TextEditingController();
  final _phoneNationalCtrl = TextEditingController();
  String? _phoneComplete;

  @override
  void initState() {
    super.initState();
    final filter = ref.read(complaintFilterProvider);
    _fromDate = filter.fromDate;
    _toDate = filter.toDate;
    _nameCtrl.text = filter.consumerName ?? '';
    _regionCtrl.text = filter.consumerRegion ?? '';
    _phoneComplete = filter.consumerPhone;
    _phoneNationalCtrl.text = _nationalPart(filter.consumerPhone);
    _preset = _detectPreset(filter.fromDate, filter.toDate);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _regionCtrl.dispose();
    _phoneNationalCtrl.dispose();
    super.dispose();
  }

  /// Strip the region phone prefix from a complete number to get the national part.
  String _nationalPart(String? complete) {
    if (complete == null || complete.isEmpty) return '';
    final prefix = AppConfig.region.phonePrefix; // e.g. "+254"
    if (complete.startsWith(prefix)) {
      return complete.substring(prefix.length);
    }
    return complete;
  }

  _DatePreset _detectPreset(DateTime? from, DateTime? to) {
    final today = _dateOnly(DateTime.now());
    if (from == today && to == today) return _DatePreset.today;
    if (from == today.subtract(const Duration(days: 1)) &&
        to == today.subtract(const Duration(days: 1))) {
      return _DatePreset.yesterday;
    }
    if (from == today.subtract(const Duration(days: 6)) && to == today) {
      return _DatePreset.last7;
    }
    if (from == today.subtract(const Duration(days: 29)) && to == today) {
      return _DatePreset.last30;
    }
    return _DatePreset.custom;
  }

  void _selectPreset(_DatePreset preset) {
    final today = _dateOnly(DateTime.now());
    if (preset == _DatePreset.custom) {
      setState(() => _preset = preset);
      _pickCustomRange();
      return;
    }
    setState(() {
      _preset = preset;
      switch (preset) {
        case _DatePreset.today:
          _fromDate = today;
          _toDate = today;
        case _DatePreset.yesterday:
          final y = today.subtract(const Duration(days: 1));
          _fromDate = y;
          _toDate = y;
        case _DatePreset.last7:
          _fromDate = today.subtract(const Duration(days: 6));
          _toDate = today;
        case _DatePreset.last30:
          _fromDate = today.subtract(const Duration(days: 29));
          _toDate = today;
        case _DatePreset.custom:
          break;
      }
    });
  }

  Future<void> _pickCustomRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 2),
      lastDate: now,
      initialDateRange: _fromDate != null && _toDate != null
          ? DateTimeRange(start: _fromDate!, end: _toDate!)
          : null,
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme:
              Theme.of(ctx).colorScheme.copyWith(primary: kSecondaryColor),
        ),
        child: child!,
      ),
    );
    if (picked != null && mounted) {
      setState(() {
        _fromDate = _dateOnly(picked.start);
        _toDate = _dateOnly(picked.end);
      });
    }
  }

  void _apply() {
    final name = _nameCtrl.text.trim();
    final region = _regionCtrl.text.trim();
    final phone =
        _phoneNationalCtrl.text.trim().isEmpty ? null : _phoneComplete;

    ref.read(complaintFilterProvider.notifier).apply(
          ComplaintFilter(
            fromDate: _fromDate,
            toDate: _toDate,
            consumerName: name.isEmpty ? null : name,
            consumerRegion: region.isEmpty ? null : region,
            consumerPhone: phone,
          ),
        );
    Navigator.pop(context);
  }

  void _reset() {
    ref.read(complaintFilterProvider.notifier).resetToToday();
    Navigator.pop(context);
  }

  DateTime _dateOnly(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.88,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 8, 0),
              child: Row(
                children: [
                  const Text(
                    'Filter After Sales',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: _reset,
                    child: const Text(
                      'Reset to Today',
                      style: TextStyle(color: kSecondaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // ── Scrollable fields ────────────────────────────────────────
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Date Range ───────────────────────────────────────
                    _sectionLabel('Date Range'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _PresetChip(
                          label: 'Today',
                          selected: _preset == _DatePreset.today,
                          onTap: () => _selectPreset(_DatePreset.today),
                        ),
                        _PresetChip(
                          label: 'Yesterday',
                          selected: _preset == _DatePreset.yesterday,
                          onTap: () => _selectPreset(_DatePreset.yesterday),
                        ),
                        _PresetChip(
                          label: 'Last 7 Days',
                          selected: _preset == _DatePreset.last7,
                          onTap: () => _selectPreset(_DatePreset.last7),
                        ),
                        _PresetChip(
                          label: 'Last 30 Days',
                          selected: _preset == _DatePreset.last30,
                          onTap: () => _selectPreset(_DatePreset.last30),
                        ),
                        _PresetChip(
                          label: 'Custom',
                          selected: _preset == _DatePreset.custom,
                          onTap: () => _selectPreset(_DatePreset.custom),
                          icon: Icons.edit_calendar_outlined,
                        ),
                      ],
                    ),
                    if (_fromDate != null && _toDate != null) ...[
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: _preset == _DatePreset.custom
                            ? _pickCustomRange
                            : null,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: kSecondaryLightColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                size: 15,
                                color: kSecondaryColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _fromDate == _toDate
                                    ? _fmtDate(_fromDate!)
                                    : '${_fmtDate(_fromDate!)}  →  ${_fmtDate(_toDate!)}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: kSecondaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (_preset == _DatePreset.custom) ...[
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.chevron_right,
                                  size: 16,
                                  color: kSecondaryColor,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // ── Consumer Name ────────────────────────────────────
                    _sectionLabel('Consumer Name'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _nameCtrl,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'e.g. John Doe',
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── Consumer Region ──────────────────────────────────
                    _sectionLabel('Consumer Region'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _regionCtrl,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'e.g. Nairobi, Kigali…',
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── Consumer Phone ───────────────────────────────────
                    _sectionLabel('Consumer Phone'),
                    const SizedBox(height: 8),
                    IntlPhoneField(
                      controller: _phoneNationalCtrl,
                      initialCountryCode: AppConfig.region.countryCode,
                      disableLengthCheck: true,
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                      onChanged: (phone) {
                        _phoneComplete = phone.completeNumber;
                      },
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // ── Apply button ─────────────────────────────────────────────
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: kSecondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _apply,
                  child: const Text(
                    'Apply Filters',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) => Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: kTextMuted,
          letterSpacing: 0.4,
        ),
      );

  String _fmtDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')} ${_month(d.month)} ${d.year}';

  String _month(int m) => const [
        '',
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
      ][m];
}

class _PresetChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;

  const _PresetChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      avatar: icon != null ? Icon(icon, size: 15) : null,
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: kSecondaryLightColor,
      checkmarkColor: kSecondaryColor,
      labelStyle: TextStyle(
        fontSize: 13,
        color: selected ? kSecondaryColor : null,
        fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
      ),
      side: selected
          ? const BorderSide(color: kSecondaryColor, width: 1.2)
          : null,
    );
  }
}
