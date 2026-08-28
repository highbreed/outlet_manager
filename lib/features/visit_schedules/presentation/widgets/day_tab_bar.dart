import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

/// Tab bar for selecting a day of the week.
///
/// Shows day abbreviations with outlet counts as badges.
class DayTabBar extends StatelessWidget {
  final int selectedIndex;
  final Map<int, int> scheduleCounts;
  final ValueChanged<int> onDaySelected;

  const DayTabBar({
    super.key,
    required this.selectedIndex,
    required this.scheduleCounts,
    required this.onDaySelected,
  });

  static const _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? Colors.grey[900] : Colors.white;
    final borderColor = isDark ? Colors.grey[800] : Colors.grey[200];

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(bottom: BorderSide(color: borderColor!)),
      ),
      child: Row(
        children: List.generate(7, (index) {
          final isSelected = index == selectedIndex;
          final count = scheduleCounts[index] ?? 0;
          final isToday = index == (DateTime.now().weekday - 1);

          return Expanded(
            child: GestureDetector(
              onTap: () => onDaySelected(index),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? kSecondaryColor : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _days[index],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: isSelected
                            ? kSecondaryColor
                            : (isToday ? kPrimaryColor : kTextMuted),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: count > 0
                            ? (isSelected
                                  ? kSecondaryColor
                                  : kSecondaryColor.withValues(alpha: 0.15))
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        count.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: count > 0
                              ? (isSelected ? Colors.white : kSecondaryColor)
                              : kTextMuted,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
