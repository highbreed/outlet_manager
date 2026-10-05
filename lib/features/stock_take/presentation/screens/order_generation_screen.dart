import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../daily_route/presentation/widgets/widgets.dart';
import '../../data/models/proposed_order_model.dart';
import '../providers/session_providers.dart';

/// Shown right after a stock take session is completed — matches the
/// mock's "Session completed → generate order" and "Proposed Order —
/// generating" frames. Also reachable later from Stock Take Home's prompt
/// cards, so it defensively re-checks every gating condition rather than
/// assuming it was only ever reached via the happy path.
///
/// This extracts (not rewrites) the state machine that used to live in
/// the Home screen's "Proposed Order" tab — same seven cases, same
/// controller methods, just displayed as its own screen instead of a tab.
class OrderGenerationScreen extends ConsumerStatefulWidget {
  final int visitId;

  const OrderGenerationScreen({super.key, required this.visitId});

  @override
  ConsumerState<OrderGenerationScreen> createState() =>
      _OrderGenerationScreenState();
}

class _OrderGenerationScreenState extends ConsumerState<OrderGenerationScreen> {
  bool _isStarting = false;
  bool _isCheckingExisting = true;
  ProposedOrderDetail? _existingOrder;

  @override
  void initState() {
    super.initState();
    _checkExistingOrder();
  }

  Future<void> _checkExistingOrder() async {
    setState(() => _isCheckingExisting = true);
    try {
      final order = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .getProposedOrderDetail(visitId: widget.visitId);
      if (mounted) {
        setState(() {
          _existingOrder = order;
          _isCheckingExisting = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _existingOrder = null;
          _isCheckingExisting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(stockTakeSessionControllerProvider);
    final jobState = sessionState.proposedOrderJob;

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteBackHeader(title: 'Proposed Order', onBack: () => context.pop()),
            Expanded(child: _buildBody(sessionState, jobState)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(StockTakeSessionState sessionState, ProposedOrderJobState? jobState) {
    if (sessionState.hasActiveSession) {
      return _EmptyState(
        icon: Icons.pending_actions,
        iconColor: kWarningText,
        title: 'Active Session Running',
        message: 'Close all active stock take sessions before generating a proposed order.',
      );
    }

    if (sessionState.completedSessions.isEmpty) {
      return const _EmptyState(
        icon: Icons.inventory_2_outlined,
        title: 'No Completed Sessions',
        message: 'Complete at least one stock take session to generate a proposed order.',
      );
    }

    if (jobState != null) {
      return _JobProgressView(
        job: jobState,
        onViewOrder: (visitId, quotationNumber) => context.pushReplacement(
          '/stock-take/proposed-order/$visitId',
          extra: {'quotationNumber': quotationNumber},
        ),
        onDismiss: () {
          ref.read(stockTakeSessionControllerProvider.notifier).clearProposedOrderJob();
          _checkExistingOrder();
        },
        onRetry: _generateProposedOrder,
        onCheckAgain: () =>
            ref.read(stockTakeSessionControllerProvider.notifier).retryProposedOrderCheck(),
        isStarting: _isStarting,
      );
    }

    if (_isCheckingExisting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_existingOrder != null) {
      return _ExistingOrderView(
        order: _existingOrder!,
        onView: () => context.pushReplacement(
          '/stock-take/proposed-order/${widget.visitId}',
          extra: {'quotationNumber': _existingOrder!.quotationNumber},
        ),
      );
    }

    return _ReadyToGenerateView(
      sessionCount: sessionState.completedSessions.length,
      productCount: sessionState.completedSessions
          .fold<int>(0, (sum, s) => sum + s.totalProducts),
      serialCount: sessionState.completedSessions
          .fold<int>(0, (sum, s) => sum + s.totalSerials),
      isStarting: _isStarting,
      onGenerate: _generateProposedOrder,
      onViewSessionDetails: sessionState.completedSessions.isNotEmpty
          ? () => context.push(
              '/stock-take/session/${sessionState.completedSessions.first.localId}',
              extra: {
                'warehouseName': sessionState.completedSessions.first.warehouseName,
                'readOnly': true,
              },
            )
          : null,
    );
  }

  Future<void> _generateProposedOrder() async {
    final email = await _showEmailInputDialog();
    if (!mounted) return;
    if (email == null) return;

    setState(() {
      _isStarting = true;
      _existingOrder = null;
    });

    try {
      final success = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .generateProposedOrder(
            visitId: widget.visitId,
            customerEmail: email.isEmpty ? null : email,
          );

      if (mounted && !success) {
        _checkExistingOrder();
        final errorMessage = ref.read(stockTakeSessionControllerProvider).errorMessage;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage ?? 'Failed to start proposed order generation')),
        );
      }
    } catch (e) {
      if (mounted) {
        _checkExistingOrder();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isStarting = false);
    }
  }

  Future<String?> _showEmailInputDialog() async {
    final emailController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Customer Email'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Enter the customer email to send the proposed order quotation:'),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'customer@example.com',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(emailController.text.trim()),
              child: const Text('Generate'),
            ),
          ],
        );
      },
    );
  }
}

extension on StockTakeSessionState {
  bool get hasActiveSession => activeSession != null;
}

// ─────────────────────────────────────────────────────────────────────────
// Ready to generate — matches mock's "Session completed" frame
// ─────────────────────────────────────────────────────────────────────────

class _ReadyToGenerateView extends StatelessWidget {
  final int sessionCount;
  final int productCount;
  final int serialCount;
  final bool isStarting;
  final VoidCallback onGenerate;
  final VoidCallback? onViewSessionDetails;

  const _ReadyToGenerateView({
    required this.sessionCount,
    required this.productCount,
    required this.serialCount,
    required this.isStarting,
    required this.onGenerate,
    required this.onViewSessionDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(color: kSuccessBg, shape: BoxShape.circle),
              child: const Icon(Icons.check, color: kSuccessText, size: 26),
            ),
            const SizedBox(height: 18),
            const Text(
              'Session completed',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Text(
              '$productCount products counted · $serialCount serials scanned',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: kTextMuted),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Generate Proposed Order',
              isLoading: isStarting,
              onPressed: onGenerate,
            ),
            if (onViewSessionDetails != null) ...[
              const SizedBox(height: 10),
              TextButton(
                onPressed: onViewSessionDetails,
                child: const Text(
                  'View Session Details',
                  style: TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w700, fontSize: 13),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Job progress — matches mock's "Proposed Order — generating" frame
// ─────────────────────────────────────────────────────────────────────────

class _JobProgressView extends StatelessWidget {
  final ProposedOrderJobState job;
  final void Function(int visitId, String? quotationNumber) onViewOrder;
  final VoidCallback onDismiss;
  final VoidCallback onRetry;
  final VoidCallback onCheckAgain;
  final bool isStarting;

  const _JobProgressView({
    required this.job,
    required this.onViewOrder,
    required this.onDismiss,
    required this.onRetry,
    required this.onCheckAgain,
    required this.isStarting,
  });

  @override
  Widget build(BuildContext context) {
    if (job.isInProgress) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 56,
                height: 56,
                child: CircularProgressIndicator(strokeWidth: 3, color: kSecondaryColor),
              ),
              const SizedBox(height: 20),
              const Text(
                'Calculating replenishment…',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                job.latestProgress?.status ?? 'Your request has been submitted.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13, color: kTextMuted),
              ),
              const SizedBox(height: 6),
              const Text(
                'You can navigate away — progress is tracked automatically.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: kTextFaint),
              ),
            ],
          ),
        ),
      );
    }

    final isSuccess = job.isSuccess;
    final hasFailed = job.hasFailed;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isSuccess
                    ? kSuccessBg
                    : hasFailed
                    ? kRedColor.withValues(alpha: 0.1)
                    : kWarningBg,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSuccess
                    ? Icons.check
                    : hasFailed
                    ? Icons.error_outline
                    : Icons.timer_off_outlined,
                color: isSuccess ? kSuccessText : hasFailed ? kRedColor : kWarningText,
                size: 26,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              isSuccess
                  ? 'Order Generated!'
                  : hasFailed
                  ? 'Generation Failed'
                  : 'Taking Longer Than Expected',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Text(
              isSuccess
                  ? 'Your proposed order has been generated successfully.'
                  : hasFailed
                  ? (job.latestProgress?.errorMessage ?? 'The proposed order generation failed.')
                  : 'The server is still processing your request.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: kTextMuted),
            ),
            const SizedBox(height: 24),
            if (isSuccess) ...[
              PrimaryButton(
                label: 'View Order',
                onPressed: () => onViewOrder(job.visitId, job.latestProgress?.quotationNumber),
              ),
              const SizedBox(height: 10),
              SecondaryButton(label: 'Dismiss', onPressed: onDismiss),
            ] else if (hasFailed) ...[
              PrimaryButton(label: 'Try Again', isLoading: isStarting, onPressed: onRetry),
              const SizedBox(height: 10),
              SecondaryButton(label: 'Dismiss', onPressed: onDismiss),
            ] else ...[
              PrimaryButton(label: 'Check Again', onPressed: onCheckAgain),
              const SizedBox(height: 10),
              SecondaryButton(label: 'Dismiss', onPressed: onDismiss),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Existing order — already generated
// ─────────────────────────────────────────────────────────────────────────

class _ExistingOrderView extends StatelessWidget {
  final ProposedOrderDetail order;
  final VoidCallback onView;

  const _ExistingOrderView({required this.order, required this.onView});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(color: kSuccessBg, shape: BoxShape.circle),
              child: const Icon(Icons.check, color: kSuccessText, size: 26),
            ),
            const SizedBox(height: 18),
            const Text(
              'Proposed Order Generated',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            const Text(
              'A proposed order has already been generated for this visit.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
            const SizedBox(height: 24),
            PrimaryButton(label: 'View Full Order', onPressed: onView),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Shared empty state
// ─────────────────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String message;

  const _EmptyState({
    required this.icon,
    this.iconColor,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: iconColor ?? kTextFaint),
            const SizedBox(height: 18),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: kTextMuted),
            ),
          ],
        ),
      ),
    );
  }
}
