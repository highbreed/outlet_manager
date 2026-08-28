import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

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

/// Human-readable "Jul 2026" label for a (year, month) pair.
String monthYearLabel(int year, int month) =>
    '${_kMonthNames[month - 1]} $year';

/// Bottom sheet to pick a (year, month) period — there's no month/year
/// picker anywhere else in this app to reuse, so this is a small
/// purpose-built one: a year stepper plus a 3x4 grid of month chips.
/// Returns `(year, month)` via `Navigator.pop`, or `null` if dismissed.
class MonthYearPickerSheet extends StatefulWidget {
  final int initialYear;
  final int initialMonth;

  const MonthYearPickerSheet({
    super.key,
    required this.initialYear,
    required this.initialMonth,
  });

  @override
  State<MonthYearPickerSheet> createState() => _MonthYearPickerSheetState();
}

class _MonthYearPickerSheetState extends State<MonthYearPickerSheet> {
  late int _year = widget.initialYear;
  late int _month = widget.initialMonth;

  static const _minYear = 2020;
  int get _maxYear => DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom +
            MediaQuery.of(context).padding.bottom +
            20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Select period',
                  style: TextStyle(
                    fontSize: 16,
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
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _year > _minYear
                    ? () => setState(() => _year--)
                    : null,
                icon: const Icon(Icons.chevron_left),
              ),
              Text(
                '$_year',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kTextDark,
                ),
              ),
              IconButton(
                onPressed: _year < _maxYear
                    ? () => setState(() => _year++)
                    : null,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 2.4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              for (var m = 1; m <= 12; m++)
                _MonthChip(
                  label: _kMonthNames[m - 1],
                  selected: m == _month,
                  onTap: () => setState(() => _month = m),
                ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () =>
                  Navigator.of(context).pop((_year, _month)),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}

class _MonthChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _MonthChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? kSecondaryColor : kSecondaryLightColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected ? kTextLight : kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
