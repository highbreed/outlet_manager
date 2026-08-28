import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../domain/entities/shelf_share_session.dart';
import '../providers/shelf_share_session_controller.dart';

/// Session detail screen showing item groups and their brand entries
class ShelfShareSessionScreen extends ConsumerStatefulWidget {
  final String sessionLocalId;
  final bool readOnly;

  const ShelfShareSessionScreen({
    super.key,
    required this.sessionLocalId,
    this.readOnly = false,
  });

  @override
  ConsumerState<ShelfShareSessionScreen> createState() =>
      _ShelfShareSessionScreenState();
}

class _ShelfShareSessionScreenState
    extends ConsumerState<ShelfShareSessionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentSession = ref
          .read(shelfShareSessionControllerProvider)
          .activeSession;
      if (currentSession != null &&
          currentSession.localId == widget.sessionLocalId) {
        // Session already in state — just refresh
        ref
            .read(shelfShareSessionControllerProvider.notifier)
            .refreshActiveSession();
      } else {
        // Load session by localId (e.g. viewing a completed session)
        ref
            .read(shelfShareSessionControllerProvider.notifier)
            .loadSessionByLocalId(widget.sessionLocalId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(shelfShareSessionControllerProvider);
    final session = sessionState.activeSession;

    if (session == null) {
      return AppScaffold(
        title: 'Shelf Share',
        body: Center(
          child: sessionState.isLoading
              ? const CircularProgressIndicator(color: kSecondaryColor)
              : const Text(
                  'Session not found',
                  style: TextStyle(color: kTextMuted, fontSize: 16),
                ),
        ),
      );
    }

    final isReadOnly = widget.readOnly || !session.canEdit;

    return AppScaffold(
      title: 'Shelf Share',
      body: Column(
        children: [
          // Session info header
          _SessionInfoHeader(session: session),

          // Error banner
          if (sessionState.errorMessage != null)
            _ErrorBanner(
              message: sessionState.errorMessage!,
              onDismiss: () => ref
                  .read(shelfShareSessionControllerProvider.notifier)
                  .clearError(),
            ),

          // Loading indicator
          if (sessionState.isLoading)
            LinearProgressIndicator(
              color: kSecondaryColor,
              backgroundColor: kSecondaryLightColor,
            ),

          // Item groups list
          Expanded(
            child: session.itemGroups.isEmpty
                ? _EmptyGroupsView(isReadOnly: isReadOnly)
                : _ItemGroupsList(
                    itemGroups: session.itemGroups,
                    isReadOnly: isReadOnly,
                    sessionLocalId: widget.sessionLocalId,
                  ),
          ),

          // Bottom action bar
          if (!isReadOnly)
            _BottomActionBar(
              hasData: session.hasData,
              isLoading: sessionState.isLoading,
              onSubmit: _submitSession,
              onEndSession: _endSession,
              onAddItemGroup: _navigateToItemGroupSelection,
            ),
        ],
      ),
    );
  }

  Future<void> _navigateToItemGroupSelection() async {
    await context.push(
      '/shelf-share/session/${widget.sessionLocalId}/select-groups',
      extra: {
        'existingGroupIds':
            ref
                .read(shelfShareSessionControllerProvider)
                .activeSession
                ?.itemGroups
                .map((g) => g.itemGroupId)
                .toList() ??
            [],
      },
    );

    // Refresh session when returning from selection/brand entry flow
    if (mounted) {
      ref
          .read(shelfShareSessionControllerProvider.notifier)
          .refreshActiveSession();
    }
  }

  Future<void> _submitSession() async {
    final session = ref.read(shelfShareSessionControllerProvider).activeSession;
    if (session == null || !session.hasData) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kSecondaryLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.upload_rounded,
                color: kSecondaryColor,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            const Text('Submit Shelf Share'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Are you sure you want to submit this shelf share? '
              'You will not be able to edit it after submission.',
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  _DialogStat(
                    label: 'Groups',
                    value: '${session.itemGroups.length}',
                  ),
                  const SizedBox(width: 20),
                  _DialogStat(
                    label: 'Brands',
                    value: '${session.totalBrandEntries}',
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel', style: TextStyle(color: kTextMuted)),
          ),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: kSecondaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            icon: const Icon(Icons.check, size: 18),
            label: const Text('Submit'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final success = await ref
          .read(shelfShareSessionControllerProvider.notifier)
          .submitSession();

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Shelf share submitted successfully'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
        context.pop();
      }
    }
  }

  Future<void> _endSession() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kRedColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.delete_outline_rounded,
                color: kRedColor,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            const Text('End Session'),
          ],
        ),
        content: const Text(
          'Are you sure you want to end this session? '
          'All unsaved data will be permanently deleted and cannot be recovered.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel', style: TextStyle(color: kTextMuted)),
          ),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: kRedColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            icon: const Icon(Icons.delete_forever, size: 18),
            label: const Text('End Session'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final success = await ref
          .read(shelfShareSessionControllerProvider.notifier)
          .deleteSession();

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Session ended'),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
          ),
        );
        context.pop();
      }
    }
  }
}

// =============================================================================
// Session Info Header
// =============================================================================

class _SessionInfoHeader extends StatelessWidget {
  final ShelfShareSession session;

  const _SessionInfoHeader({required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session.customerName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kTextDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${session.completedItemGroups} groups · ${session.totalBrandEntries} brand entries',
                  style: const TextStyle(fontSize: 13, color: kTextMuted),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: session.canEdit
                  ? kSecondaryLightColor
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              session.statusDisplayName,
              style: TextStyle(
                color: session.canEdit ? kSecondaryColor : kTextMuted,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Error Banner
// =============================================================================

class _ErrorBanner extends StatelessWidget {
  final String message;
  final VoidCallback onDismiss;

  const _ErrorBanner({required this.message, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: kRedColor.withValues(alpha: 0.1),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: kRedColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: kRedColor, fontSize: 13),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: onDismiss,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// Empty Groups View
// =============================================================================

class _EmptyGroupsView extends StatelessWidget {
  final bool isReadOnly;

  const _EmptyGroupsView({required this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.category_outlined,
              size: 48,
              color: kTextMuted.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              isReadOnly
                  ? 'No item groups recorded'
                  : 'No item groups added yet',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 8),
            if (!isReadOnly)
              const Text(
                'Tap the + button to add item groups\nand record brand facings',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: kTextMuted),
              ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// Item Groups List
// =============================================================================

class _ItemGroupsList extends StatelessWidget {
  final List<ShelfShareItemGroup> itemGroups;
  final bool isReadOnly;
  final String sessionLocalId;

  const _ItemGroupsList({
    required this.itemGroups,
    required this.isReadOnly,
    required this.sessionLocalId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: itemGroups.length,
      itemBuilder: (context, index) {
        final group = itemGroups[index];
        return _ItemGroupCard(
          group: group,
          isReadOnly: isReadOnly,
          sessionLocalId: sessionLocalId,
        );
      },
    );
  }
}

class _ItemGroupCard extends StatelessWidget {
  final ShelfShareItemGroup group;
  final bool isReadOnly;
  final String sessionLocalId;

  const _ItemGroupCard({
    required this.group,
    required this.isReadOnly,
    required this.sessionLocalId,
  });

  @override
  Widget build(BuildContext context) {
    final hasBrands = group.brandEntries.isNotEmpty;

    return GestureDetector(
      onTap: () {
        context.push(
          '/shelf-share/session/$sessionLocalId/brand-entry',
          extra: {
            'itemGroupId': group.itemGroupId,
            'itemGroupName': group.itemGroupName,
            'readOnly': isReadOnly,
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: kBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: hasBrands
                ? kSecondaryColor.withValues(alpha: 0.15)
                : Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // ── Header section ──
            Container(
              padding: const EdgeInsets.fromLTRB(14, 14, 10, 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(16),
                  bottom: hasBrands ? Radius.zero : const Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          kSecondaryColor.withValues(alpha: 0.15),
                          kSecondaryLightColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.category_rounded,
                      color: kSecondaryColor,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          group.itemGroupName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kTextDark,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            _InfoChip(
                              icon: Icons.branding_watermark_outlined,
                              label:
                                  '${group.brandEntries.length} brand${group.brandEntries.length != 1 ? 's' : ''}',
                            ),
                            const SizedBox(width: 10),
                            _InfoChip(
                              icon: Icons.bar_chart_rounded,
                              label: '${group.totalFacings} qty',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      color: kSecondaryColor,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            // ── Brand entries preview ──
            if (hasBrands)
              Container(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
                child: Column(
                  children: [
                    ...group.brandEntries.take(3).map((entry) {
                      final percent = group.totalFacings > 0
                          ? (entry.facings / group.totalFacings * 100)
                          : 0.0;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: kSecondaryColor.withValues(
                                      alpha: 0.6,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    entry.brandName,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: kTextDark,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  child: Text(
                                    '${entry.facings}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: kTextDark,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                SizedBox(
                                  width: 48,
                                  child: Text(
                                    '${percent.toStringAsFixed(1)}%',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: kSecondaryColor.withValues(
                                        alpha: 0.8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: LinearProgressIndicator(
                                value: percent / 100,
                                backgroundColor: Colors.grey.shade200,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  kSecondaryColor.withValues(alpha: 0.5),
                                ),
                                minHeight: 3,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    if (group.brandEntries.length > 3)
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.more_horiz,
                              size: 16,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '+${group.brandEntries.length - 3} more brand${group.brandEntries.length - 3 != 1 ? 's' : ''}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// Info Chip (used in item group card header)
// =============================================================================

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: kTextMuted),
        const SizedBox(width: 3),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: kTextMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// Bottom Action Bar
// =============================================================================

class _BottomActionBar extends StatelessWidget {
  final bool hasData;
  final bool isLoading;
  final VoidCallback onSubmit;
  final VoidCallback onEndSession;
  final VoidCallback onAddItemGroup;

  const _BottomActionBar({
    required this.hasData,
    required this.isLoading,
    required this.onSubmit,
    required this.onEndSession,
    required this.onAddItemGroup,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // First row: Add Item Group + Submit
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: isLoading ? null : onAddItemGroup,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Item Group'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      minimumSize: const Size(0, 48),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: (isLoading || !hasData) ? null : onSubmit,
                    icon: isLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.cloud_upload_outlined),
                    label: const Text('Submit'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      minimumSize: const Size(0, 48),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Second row: End Session (full width)
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: (isLoading || !hasData) ? null : onEndSession,
                icon: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.done_all),
                label: const Text('End Session'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(0, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// Dialog Stat (used in submit confirmation dialog)
// =============================================================================

class _DialogStat extends StatelessWidget {
  final String label;
  final String value;

  const _DialogStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: kSecondaryColor,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: kTextMuted)),
      ],
    );
  }
}
