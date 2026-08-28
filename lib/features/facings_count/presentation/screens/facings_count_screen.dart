import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../domain/entities/facings_count.dart';
import '../providers/facings_count_controller.dart';

/// Cart-style screen for building/editing a facings count, and for viewing
/// a previously submitted count in read-only mode.
class FacingsCountScreen extends ConsumerStatefulWidget {
  final String countLocalId;
  final bool readOnly;

  const FacingsCountScreen({
    super.key,
    required this.countLocalId,
    this.readOnly = false,
  });

  @override
  ConsumerState<FacingsCountScreen> createState() =>
      _FacingsCountScreenState();
}

class _FacingsCountScreenState extends ConsumerState<FacingsCountScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final current = ref.read(facingsCountControllerProvider).activeDraft;
      if (current != null && current.localId == widget.countLocalId) {
        ref.read(facingsCountControllerProvider.notifier).refreshActiveDraft();
      } else {
        ref
            .read(facingsCountControllerProvider.notifier)
            .loadCountByLocalId(widget.countLocalId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final countState = ref.watch(facingsCountControllerProvider);
    final count = countState.activeDraft;

    if (count == null) {
      return AppScaffold(
        title: 'Facings Count',
        body: Center(
          child: countState.isLoading
              ? const CircularProgressIndicator(color: kSecondaryColor)
              : const Text(
                  'Count not found',
                  style: TextStyle(color: kTextMuted, fontSize: 16),
                ),
        ),
      );
    }

    final isReadOnly = widget.readOnly || !count.canEdit;

    return AppScaffold(
      title: 'Facings Count',
      body: Column(
        children: [
          _CountInfoHeader(count: count),

          if (countState.errorMessage != null)
            _ErrorBanner(
              message: countState.errorMessage!,
              onDismiss: () => ref
                  .read(facingsCountControllerProvider.notifier)
                  .clearError(),
            ),

          if (countState.isLoading)
            const LinearProgressIndicator(
              color: kSecondaryColor,
              backgroundColor: kSecondaryLightColor,
            ),

          Expanded(
            child: count.items.isEmpty
                ? _EmptyItemsView(isReadOnly: isReadOnly)
                : _ItemsList(
                    items: count.items,
                    isReadOnly: isReadOnly,
                    isLoading: countState.isLoading,
                  ),
          ),

          if (!isReadOnly)
            _BottomActionBar(
              hasData: count.hasData,
              isLoading: countState.isLoading,
              onSubmit: _submitCount,
              onDiscard: _discardDraft,
              onAddItemGroup: _navigateToItemGroupSelection,
            ),
        ],
      ),
    );
  }

  Future<void> _navigateToItemGroupSelection() async {
    await context.push(
      '/facings/count/${widget.countLocalId}/select-groups',
      extra: {
        'existingGroupIds':
            ref
                .read(facingsCountControllerProvider)
                .activeDraft
                ?.items
                .map((i) => i.itemGroupId)
                .toList() ??
            [],
      },
    );

    if (mounted) {
      ref.read(facingsCountControllerProvider.notifier).refreshActiveDraft();
    }
  }

  Future<void> _submitCount() async {
    final count = ref.read(facingsCountControllerProvider).activeDraft;
    if (count == null || !count.hasData) return;

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
            const Text('Submit Facings Count'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Are you sure you want to submit this facings count? '
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
                    label: 'Item Groups',
                    value: '${count.totalItemGroups}',
                  ),
                  const SizedBox(width: 20),
                  _DialogStat(
                    label: 'Total Facings',
                    value: '${count.totalFacings}',
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
          .read(facingsCountControllerProvider.notifier)
          .submitCount();

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Facings count submitted successfully'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
        context.pop();
      }
    }
  }

  Future<void> _discardDraft() async {
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
            const Text('Discard Count'),
          ],
        ),
        content: const Text(
          'Are you sure you want to discard this count? '
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
            label: const Text('Discard'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final success = await ref
          .read(facingsCountControllerProvider.notifier)
          .discardDraft();

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Count discarded'),
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
// Count Info Header
// =============================================================================

class _CountInfoHeader extends StatelessWidget {
  final FacingsCount count;

  const _CountInfoHeader({required this.count});

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
                  count.customerName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kTextDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${count.totalItemGroups} groups · ${count.totalFacings} facings',
                  style: const TextStyle(fontSize: 13, color: kTextMuted),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: count.canEdit ? kSecondaryLightColor : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              count.statusDisplayName,
              style: TextStyle(
                color: count.canEdit ? kSecondaryColor : kTextMuted,
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
// Empty Items View
// =============================================================================

class _EmptyItemsView extends StatelessWidget {
  final bool isReadOnly;

  const _EmptyItemsView({required this.isReadOnly});

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
              isReadOnly ? 'No item groups recorded' : 'No item groups added yet',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 8),
            if (!isReadOnly)
              const Text(
                'Tap the + button to add item groups\nand record shelf facings',
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
// Items List
// =============================================================================

class _ItemsList extends ConsumerWidget {
  final List<FacingsCountItem> items;
  final bool isReadOnly;
  final bool isLoading;

  const _ItemsList({
    required this.items,
    required this.isReadOnly,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _ItemRow(
          item: item,
          isReadOnly: isReadOnly,
          isLoading: isLoading,
          onQuantityChanged: (qty) => ref
              .read(facingsCountControllerProvider.notifier)
              .updateQuantity(item.itemGroupId, qty),
          onRemove: () => ref
              .read(facingsCountControllerProvider.notifier)
              .removeItem(item.itemGroupId),
        );
      },
    );
  }
}

class _ItemRow extends StatelessWidget {
  final FacingsCountItem item;
  final bool isReadOnly;
  final bool isLoading;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  const _ItemRow({
    required this.item,
    required this.isReadOnly,
    required this.isLoading,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: kSecondaryLightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.category_rounded,
              color: kSecondaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item.itemGroupName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kTextDark,
              ),
            ),
          ),
          if (isReadOnly)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: kBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${item.quantity}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: kTextDark,
                ),
              ),
            )
          else
            _QuantityStepper(
              quantity: item.quantity,
              isLoading: isLoading,
              onChanged: onQuantityChanged,
            ),
          if (!isReadOnly) ...[
            const SizedBox(width: 4),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: kRedColor, size: 20),
              onPressed: isLoading ? null : onRemove,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ],
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  final int quantity;
  final bool isLoading;
  final ValueChanged<int> onChanged;

  const _QuantityStepper({
    required this.quantity,
    required this.isLoading,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _StepperButton(
          icon: Icons.remove,
          onTap: (!isLoading && quantity > 1)
              ? () => onChanged(quantity - 1)
              : null,
        ),
        SizedBox(
          width: 32,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: kTextDark,
            ),
          ),
        ),
        _StepperButton(
          icon: Icons.add,
          onTap: isLoading ? null : () => onChanged(quantity + 1),
        ),
      ],
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: onTap != null
              ? kSecondaryColor.withValues(alpha: 0.1)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 16,
          color: onTap != null ? kSecondaryColor : Colors.grey.shade400,
        ),
      ),
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
  final VoidCallback onDiscard;
  final VoidCallback onAddItemGroup;

  const _BottomActionBar({
    required this.hasData,
    required this.isLoading,
    required this.onSubmit,
    required this.onDiscard,
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
                    onPressed: isLoading ? null : onDiscard,
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Discard'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: kRedColor,
                      side: const BorderSide(color: kRedColor),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      minimumSize: const Size(0, 48),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: (isLoading || !hasData) ? null : onSubmit,
                icon: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.cloud_upload_outlined),
                label: const Text('Submit Count'),
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
// Dialog Stat
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
