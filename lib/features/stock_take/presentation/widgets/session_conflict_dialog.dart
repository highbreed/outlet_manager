import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../domain/entities/entities.dart';
import '../providers/session_providers.dart';

/// Centered modal shown when the agent tries to start a new stock take
/// while a session from a *different* customer/outlet is still active or
/// paused — the app only allows one session at a time regardless of
/// warehouse, so this is the only way to get unblocked. Matches the mock's
/// "Session already active" dialog; both real actions from the old
/// permanent banner (resume, cancel-with-reason) are kept, just moved
/// on-demand into this dialog.
Future<void> showSessionConflictDialog(
  BuildContext context,
  WidgetRef ref, {
  required StockTakeSession session,
}) {
  return showDialog<void>(
    context: context,
    barrierColor: kTextDark.withValues(alpha: 0.35),
    builder: (dialogContext) => _SessionConflictDialogContent(session: session),
  );
}

class _SessionConflictDialogContent extends ConsumerStatefulWidget {
  final StockTakeSession session;

  const _SessionConflictDialogContent({required this.session});

  @override
  ConsumerState<_SessionConflictDialogContent> createState() =>
      _SessionConflictDialogContentState();
}

class _SessionConflictDialogContentState
    extends ConsumerState<_SessionConflictDialogContent> {
  bool _isResuming = false;

  Future<void> _resume() async {
    setState(() => _isResuming = true);
    final session = widget.session;
    final navigator = Navigator.of(context);
    navigator.pop();

    await context.push(
      '/stock-take/session/${session.localId}',
      extra: {
        'customerId': session.customerId,
        'warehouseId': session.warehouseId,
        'warehouseName': session.warehouseName,
      },
    );

    if (context.mounted) {
      ref
          .read(stockTakeSessionControllerProvider.notifier)
          .loadSessionItems(session.localId);
    }
  }

  Future<void> _cancelSession() async {
    final reasonController = TextEditingController();

    final reason = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cancel Stock Take Session?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'All progress on that session will be lost. This action cannot be undone.',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Reason for cancellation (required)',
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Keep Session'),
          ),
          FilledButton(
            onPressed: () {
              final reason = reasonController.text.trim();
              if (reason.isEmpty) return;
              Navigator.pop(ctx, reason);
            },
            style: FilledButton.styleFrom(backgroundColor: kRedColor),
            child: const Text('Cancel Session'),
          ),
        ],
      ),
    );

    if (reason == null || reason.isEmpty || !mounted) return;

    await ref
        .read(stockTakeSessionControllerProvider.notifier)
        .cancelSession(widget.session.localId, reason);

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final session = widget.session;
    final statusWord = session.isPaused ? 'paused' : 'in progress';

    return Dialog(
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
              'Session already active',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              '${session.warehouseTypeDisplayName} at ${session.outletName} is still $statusWord. '
              'Continue that one instead of starting a new stock take.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: kTextMuted, height: 1.4),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Continue Existing Session',
              isLoading: _isResuming,
              onPressed: _resume,
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: _isResuming ? null : _cancelSession,
              child: const Text(
                'Cancel Session',
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
    );
  }
}
