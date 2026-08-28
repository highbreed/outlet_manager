import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../home/widgets/feature_navigation.dart';

/// Bottom nav "Tasks" destination — the full list of task modules a rep can
/// jump into (a restyled, flat version of what used to be Home's 13-tile
/// grid). Reuses [homeFeatures] and [navigateToFeature] so the active-visit
/// context injection stays identical to Home's Quick Actions row.
class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: 'Tasks',
      showBottomNav: true,
      currentNavIndex: 2,
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 110),
          itemCount: homeFeatures.length,
          itemBuilder: (context, index) {
            final feature = homeFeatures[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AppCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                onTap: feature.isComingSoon
                    ? null
                    : () => navigateToFeature(context, ref, feature),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: kBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(feature.iconData, size: 18, color: kTextDark),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            feature.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (feature.subtitle != null)
                            Text(
                              feature.subtitle!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: kTextMuted,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (feature.isComingSoon)
                      const StatusChip(label: 'SOON', variant: StatusChipVariant.neutral)
                    else
                      const Icon(
                        Icons.chevron_right,
                        size: 18,
                        color: kTextFaint,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
