import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import 'feature_navigation.dart';

/// Home screen's curated shortcut row — a subset of [homeFeatures] shown as
/// circular icon buttons, matching the redesign's Quick Actions layout.
/// The full module list lives on the Tasks screen.
class QuickActionsSection extends ConsumerWidget {
  final List<HomeFeatureItem> items;

  const QuickActionsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 6,
            crossAxisSpacing: 4,
            childAspectRatio: 1.05,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final feature = items[index];
            return _QuickActionTile(
              feature: feature,
              onTap: () => navigateToFeature(context, ref, feature),
            );
          },
        ),
      ],
    );
  }
}

/// Compact grid labels — shorter than [HomeFeatureItem.title], matching
/// the mock's one/two-word Quick Actions captions.
const Map<String, String> _shortLabels = {
  'Orders & Quotations': 'Orders',
  'Facings Count': 'Facings',
  'My Performance': 'Performance',
};

class _QuickActionTile extends StatelessWidget {
  final HomeFeatureItem feature;
  final VoidCallback onTap;

  const _QuickActionTile({required this.feature, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: kBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(feature.iconData, size: 22, color: kTextDark),
            ),
            const SizedBox(height: 6),
            Text(
              _shortLabels[feature.title] ?? feature.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
