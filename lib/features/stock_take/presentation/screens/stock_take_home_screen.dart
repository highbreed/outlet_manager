import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../providers/session_providers.dart';
import '../widgets/widgets.dart';

/// Stock Take home screen — a sessions dashboard matching the redesign's
/// "Stock Take — Home (sessions)" mock: at most one active/paused session
/// card (the app enforces one session per customer at a time, see
/// `StartStockTakeSession`), a prompt to generate a proposed order once a
/// session is complete, or an empty state with a "Start New" FAB.
class StockTakeHomeScreen extends ConsumerStatefulWidget {
  final int customerId;
  final String customerCode;
  final String customerName;
  final String? visitLocalId;
  final int? visitServerId;

  const StockTakeHomeScreen({
    super.key,
    required this.customerId,
    required this.customerCode,
    required this.customerName,
    this.visitLocalId,
    this.visitServerId,
  });

  @override
  ConsumerState<StockTakeHomeScreen> createState() =>
      _StockTakeHomeScreenState();
}

class _StockTakeHomeScreenState extends ConsumerState<StockTakeHomeScreen> {
  bool _hasProposedOrder = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = ref.read(stockTakeSessionControllerProvider.notifier);
      if (widget.customerId > 0) {
        controller.loadForCustomer(widget.customerId);
      } else {
        controller.loadAllActiveSessions();
      }
      _checkProposedOrderExists();
    });
  }

  Future<void> _checkProposedOrderExists() async {
    if (widget.visitServerId == null) return;
    try {
      final order = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .getProposedOrderDetail(visitId: widget.visitServerId!);
      if (mounted && order != null) {
        setState(() => _hasProposedOrder = true);
      }
    } catch (_) {
      // No existing order — allow new sessions.
    }
  }

  void _handleStartNew(StockTakeSessionState state) {
    if (state.otherActiveSessions.isNotEmpty) {
      showSessionConflictDialog(
        context,
        ref,
        session: state.otherActiveSessions.first,
      );
      return;
    }
    context.push(
      '/stock-take/start',
      extra: {
        'customerId': widget.customerId,
        'customerName': widget.customerName,
        'visitLocalId': widget.visitLocalId,
        'visitServerId': widget.visitServerId,
      },
    );
  }

  void _openHistory() {
    context.push(
      '/stock-take/history',
      extra: {
        'customerId': widget.customerId,
        'customerName': widget.customerName,
      },
    );
  }

  void _openOrderGeneration() {
    if (widget.visitServerId == null) return;
    context.push('/stock-take/order/${widget.visitServerId}');
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(stockTakeSessionControllerProvider);

    if (widget.customerId <= 0) {
      // loadAllActiveSessions() (called from initState for this exact
      // scenario) already fetched every pending session across all
      // outlets — show them instead of a dead end if there are any,
      // rather than discarding that data behind a hard block.
      final pendingElsewhere = [
        if (sessionState.activeSession != null) sessionState.activeSession!,
        ...sessionState.otherActiveSessions,
      ];
      if (sessionState.isLoading) {
        return const Scaffold(
          backgroundColor: kBackground,
          body: SafeArea(child: Center(child: CircularProgressIndicator())),
        );
      }
      if (pendingElsewhere.isEmpty) {
        return _NotClockedInScaffold();
      }
      return _PendingSessionsScaffold(sessions: pendingElsewhere);
    }

    final showFab =
        sessionState.activeSession == null && !sessionState.isLoading;

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              customerName: widget.customerName,
              customerCode: widget.customerCode,
              onHistoryTap: _openHistory,
            ),
            if (sessionState.errorMessage != null)
              _ErrorBanner(
                message: sessionState.errorMessage!,
                onDismiss: () => ref
                    .read(stockTakeSessionControllerProvider.notifier)
                    .clearError(),
              ),
            Expanded(
              child: sessionState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _Body(
                      state: sessionState,
                      hasProposedOrder: _hasProposedOrder,
                      onGenerateOrder: _openOrderGeneration,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: showFab
          ? _StartNewFab(onTap: () => _handleStartNew(sessionState))
          : null,
    );
  }
}

class _NotClockedInScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: kBackground,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_off_outlined,
                    color: kTextFaint,
                    size: 26,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Not Clocked In',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                const Text(
                  "You need to clock in to an outlet before you can access Stock Take.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: kTextMuted,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  label: 'Go to Daily Route',
                  trailingIcon: Icons.arrow_forward,
                  expand: false,
                  onPressed: () => context.push('/daily-route'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Shown instead of [_NotClockedInScaffold] when the agent isn't currently
/// clocked into an outlet but still has pending stock take sessions open
/// elsewhere — lets them resume without first navigating back through
/// Daily Route.
class _PendingSessionsScaffold extends StatelessWidget {
  final List<StockTakeSession> sessions;

  const _PendingSessionsScaffold({required this.sessions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 6, 20, 14),
              child: Text(
                'Stock Take',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "You're not clocked in to an outlet, but you still "
                      'have pending stock take sessions:',
                      style: TextStyle(
                        fontSize: 13,
                        color: kTextMuted,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _OtherPendingSessionsSection(
                      sessions: sessions,
                      title: 'PENDING SESSION',
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      label: 'Go to Daily Route',
                      trailingIcon: Icons.arrow_forward,
                      onPressed: () => context.push('/daily-route'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String customerName;
  final String customerCode;
  final VoidCallback onHistoryTap;

  const _Header({
    required this.customerName,
    required this.customerCode,
    required this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 6, 12, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Stock Take',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 2),
                Text(
                  customerCode.isNotEmpty
                      ? '$customerName · $customerCode'
                      : customerName,
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onHistoryTap,
            icon: const Icon(Icons.history, color: kTextDark),
            tooltip: 'Session History',
          ),
        ],
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  final String message;
  final VoidCallback onDismiss;

  const _ErrorBanner({required this.message, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kRedColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kRedColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: kRedColor, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: kRedColor, fontSize: 12),
            ),
          ),
          GestureDetector(
            onTap: onDismiss,
            child: const Icon(Icons.close, color: kRedColor, size: 18),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final StockTakeSessionState state;
  final bool hasProposedOrder;
  final VoidCallback onGenerateOrder;

  const _Body({
    required this.state,
    required this.hasProposedOrder,
    required this.onGenerateOrder,
  });

  @override
  Widget build(BuildContext context) {
    final session = state.activeSession;

    Widget? primary;
    if (session != null) {
      primary = session.isPaused
          ? _PausedSessionCard(session: session)
          : _InProgressSessionCard(session: session);
    } else if (state.completedSessions.isNotEmpty && !hasProposedOrder) {
      primary = _ReadyToGenerateCard(
        sessionCount: state.completedSessions.length,
        onTap: onGenerateOrder,
      );
    } else if (hasProposedOrder) {
      primary = _ProposedOrderReadyCard(onTap: onGenerateOrder);
    }

    if (primary == null) {
      return _EmptyState();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
      child: primary,
    );
  }
}

/// Active/paused stock take sessions the agent left open at *other*
/// outlets today — previously fetched (`otherActiveSessions`) but only
/// ever used to block starting a new session via [showSessionConflictDialog].
/// Surfacing them here lets the agent see and resume pending work
/// proactively instead of only discovering it when blocked.
class _OtherPendingSessionsSection extends ConsumerWidget {
  final List<StockTakeSession> sessions;
  final String title;

  const _OtherPendingSessionsSection({
    required this.sessions,
    this.title = 'OTHER PENDING SESSION',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title${sessions.length == 1 ? '' : 'S'}',
          style: const TextStyle(
            fontSize: 11,
            color: kTextFaint,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        for (final session in sessions) ...[
          _OtherPendingSessionCard(session: session),
          if (session != sessions.last) const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _OtherPendingSessionCard extends ConsumerWidget {
  final StockTakeSession session;

  const _OtherPendingSessionCard({required this.session});

  Future<void> _resume(BuildContext context, WidgetRef ref) async {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppCard(
      onTap: () => _resume(context, ref),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        session.outletName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _StatusPill(
                      label: session.isPaused ? 'Paused' : 'Active',
                      bg: session.isPaused
                          ? const Color(0xFFF0F0EE)
                          : kSecondaryLightColor,
                      fg: session.isPaused ? kTextMuted : kSecondaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${session.warehouseTypeDisplayName} · '
                  '${session.isPaused ? _formatPaused(session) : _formatStarted(session)}',
                  style: const TextStyle(fontSize: 11, color: kTextFaint),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, color: kTextMuted, size: 16),
        ],
      ),
    );
  }
}

class _InProgressSessionCard extends ConsumerWidget {
  final StockTakeSession session;

  const _InProgressSessionCard({required this.session});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'IN PROGRESS',
          style: TextStyle(
            fontSize: 11,
            color: kTextFaint,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: kSecondaryColor, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      session.warehouseName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const _StatusPill(
                    label: 'Active',
                    bg: kSecondaryLightColor,
                    fg: kSecondaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '${_formatStarted(session)} · ${session.totalProducts} products · ${session.totalSerials} serials',
                style: const TextStyle(fontSize: 11, color: kTextFaint),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _CompactButton(
                      label: 'Pause',
                      onTap: () async {
                        await ref
                            .read(stockTakeSessionControllerProvider.notifier)
                            .pauseSession(session.localId);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _CompactButton(
                      label: 'Complete',
                      onTap: () => _confirmAndComplete(context, ref, session),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _CompactButton(
                      label: 'Continue',
                      filled: true,
                      onTap: () async {
                        await context.push(
                          '/stock-take/session/${session.localId}',
                          extra: {'warehouseName': session.warehouseName},
                        );
                        if (context.mounted) {
                          ref
                              .read(stockTakeSessionControllerProvider.notifier)
                              .loadSessionItems(session.localId);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Confirms via a modal before completing a session directly from its
/// summary card (no item-by-item review here - that's what "Continue"
/// leads to; this is the quick path for "I'm done, close it out").
Future<void> _confirmAndComplete(
  BuildContext context,
  WidgetRef ref,
  StockTakeSession session,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Complete Session?'),
      content: Text(
        'This will close out the stock take at ${session.warehouseName} '
        'with ${session.totalProducts} product(s) and '
        '${session.totalSerials} serial(s) counted so far. '
        'This cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(dialogContext, true),
          child: const Text('Complete'),
        ),
      ],
    ),
  );
  if (confirmed != true || !context.mounted) return;

  final success = await ref
      .read(stockTakeSessionControllerProvider.notifier)
      .completeSession(session.localId);

  if (!context.mounted) return;

  if (success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${session.warehouseName} session completed')),
    );
  } else {
    final message =
        ref.read(stockTakeSessionControllerProvider).errorMessage ??
        'Failed to complete session';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: kRedColor),
    );
  }
}

class _PausedSessionCard extends ConsumerWidget {
  final StockTakeSession session;

  const _PausedSessionCard({required this.session});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PAUSED',
          style: TextStyle(
            fontSize: 11,
            color: kTextFaint,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: kBorderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      session.warehouseName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const _StatusPill(
                    label: 'Paused',
                    bg: Color(0xFFF0F0EE),
                    fg: kTextMuted,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '${_formatPaused(session)} · ${session.totalProducts} products · ${session.totalSerials} serials',
                style: const TextStyle(fontSize: 11, color: kTextFaint),
              ),
              const SizedBox(height: 12),
              _CompactButton(
                label: 'Resume Session',
                filled: true,
                expand: true,
                onTap: () async {
                  await ref
                      .read(stockTakeSessionControllerProvider.notifier)
                      .resumeSession(session.localId);
                  if (context.mounted) {
                    await context.push(
                      '/stock-take/session/${session.localId}',
                      extra: {'warehouseName': session.warehouseName},
                    );
                    if (context.mounted) {
                      ref
                          .read(stockTakeSessionControllerProvider.notifier)
                          .loadSessionItems(session.localId);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReadyToGenerateCard extends StatelessWidget {
  final int sessionCount;
  final VoidCallback onTap;

  const _ReadyToGenerateCard({required this.sessionCount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      borderColor: kSuccessColor.withValues(alpha: 0.35),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kSuccessBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.receipt_long_outlined,
              color: kSuccessText,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ready to Generate Order',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 2),
                Text(
                  '$sessionCount session${sessionCount == 1 ? '' : 's'} completed — generate a proposed order',
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward, color: kSuccessText, size: 18),
        ],
      ),
    );
  }
}

class _ProposedOrderReadyCard extends StatelessWidget {
  final VoidCallback onTap;

  const _ProposedOrderReadyCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kSuccessBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.check_circle_outline,
              color: kSuccessText,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Proposed Order Generated',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 2),
                Text(
                  'A proposed order already exists for this visit',
                  style: TextStyle(fontSize: 12, color: kTextMuted),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward, color: kTextMuted, size: 18),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: kBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.inventory_2_outlined,
                color: kTextFaint,
                size: 26,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Active Session',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            const Text(
              'Start a new stock take to count inventory',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
          ],
        ),
      ),
    );
  }
}

class _StartNewFab extends StatelessWidget {
  final VoidCallback onTap;

  const _StartNewFab({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: kTextDark,
          borderRadius: BorderRadius.circular(999),
          boxShadow: [
            BoxShadow(
              color: kTextDark.withValues(alpha: 0.25),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: kTextLight, size: 16),
            SizedBox(width: 8),
            Text(
              'Start New',
              style: TextStyle(
                color: kTextLight,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String label;
  final Color bg;
  final Color fg;

  const _StatusPill({required this.label, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: fg),
      ),
    );
  }
}

/// Compact in-card pill button matching the mock's smaller session-card
/// actions (Pause/Continue/Resume) — the app-wide `PrimaryButton`/
/// `SecondaryButton` are sized for full-width primary CTAs, too large for
/// these paired in-card rows.
class _CompactButton extends StatelessWidget {
  final String label;
  final bool filled;
  final bool expand;
  final VoidCallback onTap;

  const _CompactButton({
    required this.label,
    this.filled = false,
    this.expand = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: expand ? double.infinity : null,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: filled ? kTextDark : null,
          border: filled ? null : Border.all(color: kBorderColor),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: filled ? kTextLight : kTextDark,
          ),
        ),
      ),
    );
  }
}

String _formatStarted(StockTakeSession session) {
  return 'Started ${_formatTime(session.startedAt)}';
}

String _formatPaused(StockTakeSession session) {
  final at = session.pausedAt ?? session.startedAt;
  return 'Paused ${_formatTime(at)}';
}

String _formatTime(DateTime dt) {
  final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
  final period = dt.hour >= 12 ? 'PM' : 'AM';
  return '$hour:${dt.minute.toString().padLeft(2, '0')} $period';
}
