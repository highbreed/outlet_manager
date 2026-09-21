import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../daily_route/presentation/widgets/widgets.dart';
import '../../domain/entities/entities.dart';
import '../providers/session_providers.dart';
import 'barcode_scanner_screen.dart';

/// Active stock take session screen - main working screen
class StockTakeSessionScreen extends ConsumerStatefulWidget {
  final String sessionLocalId;
  final int? customerId;
  final String? visitLocalId;
  final int? warehouseId;
  final String? warehouseName;
  final bool readOnly;

  const StockTakeSessionScreen({
    super.key,
    required this.sessionLocalId,
    this.customerId,
    this.visitLocalId,
    this.warehouseId,
    this.warehouseName,
    this.readOnly = false,
  });

  @override
  ConsumerState<StockTakeSessionScreen> createState() =>
      _StockTakeSessionScreenState();
}

class _StockTakeSessionScreenState
    extends ConsumerState<StockTakeSessionScreen> {
  final _cancelReasonController = TextEditingController();
  final _searchController = TextEditingController();
  String _searchQuery = '';
  bool _pendingOnly = false;
  bool _isActionInProgress = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initSession());
  }

  /// Re-validate against the backend before loading this session's items.
  /// Covers both direct/cold entry to this route (cached sessionLocalId
  /// with no already-reconciled state, e.g. a restart landing back here)
  /// and the case where the session went stale in the gap between the
  /// sessions list screen's load and the agent tapping into it.
  ///
  /// Skipped in read-only mode: that's for viewing an already-completed
  /// session (from history / order generation), where "not resumable" is
  /// the expected, correct state rather than something to reject entry for.
  Future<void> _initSession() async {
    final notifier = ref.read(stockTakeSessionControllerProvider.notifier);

    if (widget.readOnly) {
      notifier.loadSessionItems(widget.sessionLocalId);
      return;
    }

    final stillValid = await notifier.validateSessionEntry(
      widget.sessionLocalId,
    );

    if (!mounted) return;

    if (!stillValid) {
      final messenger = ScaffoldMessenger.of(context);
      final message =
          ref.read(stockTakeSessionControllerProvider).errorMessage ??
          'This session is no longer active.';
      context.pop();
      messenger.showSnackBar(
        SnackBar(content: Text(message), backgroundColor: kWarningColor),
      );
      return;
    }

    notifier.loadSessionItems(widget.sessionLocalId);
  }

  @override
  void dispose() {
    _cancelReasonController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(stockTakeSessionControllerProvider);
    final session = sessionState.activeSession;
    final items = sessionState.sessionItems;

    final title =
        session?.warehouseName ?? widget.warehouseName ?? 'Stock Take';
    final isPaused = session?.isPaused ?? false;
    final isReadOnly = widget.readOnly;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: kBackground,
        body: sessionState.isLoading
            ? SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      if (sessionState.loadingMessage != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          sessionState.loadingMessage!,
                          style: const TextStyle(color: kTextMuted),
                        ),
                      ],
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  _SessionHeader(
                    title: title,
                    outletSubtitle: isReadOnly
                        ? '$title (View Only)'
                        : (session != null ? _formatStarted(session) : null),
                    productCount: items.length,
                    serialCount: items.fold<int>(
                      0,
                      (sum, item) => sum + item.serialCount,
                    ),
                    completedCount: items.where((i) => i.isCompleted).length,
                    isPaused: isPaused,
                    showMenu: !isReadOnly,
                    onPause: _pauseSession,
                    onResume: _resumeSession,
                    onCancel: _showCancelDialog,
                    onSubmit: _syncSession,
                  ),

                  Expanded(
                    child: SafeArea(
                      top: false,
                      child: Column(
                        children: [
                          if (isReadOnly)
                            _InlineBanner(
                              icon: Icons.visibility,
                              message:
                                  'View only — this session has been closed',
                              bg: kSecondaryLightColor,
                              fg: kSecondaryColor,
                            ),

                          if (isPaused && !isReadOnly)
                            _InlineBanner(
                              icon: Icons.pause_circle,
                              message: 'Session paused — tap menu to resume',
                              bg: kWarningBg,
                              fg: kWarningText,
                              trailing: TextButton(
                                onPressed: _resumeSession,
                                child: const Text('Resume'),
                              ),
                            ),

                          if (sessionState.errorMessage != null)
                            _InlineBanner(
                              icon: Icons.error_outline,
                              message: sessionState.errorMessage!,
                              bg: kRedColor.withValues(alpha: 0.08),
                              fg: kRedColor,
                              trailing: GestureDetector(
                                onTap: () => ref
                                    .read(
                                      stockTakeSessionControllerProvider
                                          .notifier,
                                    )
                                    .clearError(),
                                child: const Icon(
                                  Icons.close,
                                  color: kRedColor,
                                  size: 18,
                                ),
                              ),
                            ),

                          Expanded(
                            child: items.isEmpty
                                ? _buildEmptyState()
                                : _buildItemsList(
                                    items,
                                    isPaused || isReadOnly,
                                    isReadOnly,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        floatingActionButton: (!isPaused && !isReadOnly && items.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.only(bottom: 76),
                child: FloatingActionButton(
                  onPressed: _addProduct,
                  backgroundColor: kSecondaryColor,
                  elevation: 4,
                  child: const Icon(Icons.add, color: kTextLight),
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.qr_code_scanner, size: 64, color: kTextFaint),
            const SizedBox(height: 20),
            const Text(
              'No Products Added',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            const Text(
              'Scan a barcode or tap "Add Product" to start counting',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: kTextMuted),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SecondaryButton(
                  label: 'Scan Barcode',
                  leadingIcon: Icons.qr_code_scanner,
                  expand: false,
                  onPressed: _scanBarcode,
                ),
                const SizedBox(width: 12),
                PrimaryButton(
                  label: 'Add Product',
                  expand: false,
                  onPressed: _addProduct,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsList(
    List<StockTakeItem> items,
    bool isPaused, [
    bool isReadOnly = false,
  ]) {
    final filteredBySearch = _searchQuery.isEmpty
        ? items
        : items.where((item) {
            final query = _searchQuery.toLowerCase();
            final modelMatch =
                item.modelNumber?.toLowerCase().contains(query) ?? false;
            final nameMatch = item.itemName.toLowerCase().contains(query);
            final codeMatch = item.itemCode.toLowerCase().contains(query);
            return modelMatch || nameMatch || codeMatch;
          }).toList();

    final filteredItems = _pendingOnly
        ? filteredBySearch.where((item) => !item.isCompleted).toList()
        : filteredBySearch;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: kBorderColor),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, size: 16, color: kTextFaint),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(fontSize: 13),
                          decoration: const InputDecoration(
                            hintText: 'Filter items',
                            hintStyle: TextStyle(
                              fontSize: 13,
                              color: kTextFaint,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          onChanged: (value) {
                            setState(() => _searchQuery = value);
                          },
                        ),
                      ),
                      if (_searchQuery.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _searchController.clear();
                              _searchQuery = '';
                            });
                          },
                          child: const Icon(
                            Icons.clear,
                            size: 16,
                            color: kTextFaint,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: kBorderColor),
                ),
                child: Row(
                  children: [
                    _FilterToggle(
                      label: 'All',
                      selected: !_pendingOnly,
                      onTap: () => setState(() => _pendingOnly = false),
                    ),
                    _FilterToggle(
                      label: 'Pending',
                      selected: _pendingOnly,
                      onTap: () => setState(() => _pendingOnly = true),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: filteredItems.isEmpty
              ? const Center(
                  child: Text(
                    'No products match',
                    style: TextStyle(color: kTextMuted),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 6, 20, 110),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    if (isReadOnly) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _ItemCard(
                          item: item,
                          onTap: () => _viewItemDetail(item),
                        ),
                      );
                    }
                    return Dismissible(
                      key: Key(item.localId),
                      direction: isPaused
                          ? DismissDirection.none
                          : DismissDirection.endToStart,
                      confirmDismiss: (_) => _confirmDeleteItem(item),
                      onDismissed: (_) => _deleteItem(item),
                      background: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: kRedColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _ItemCard(
                          item: item,
                          onTap: isPaused ? null : () => _openItemDetail(item),
                          onDelete: isPaused
                              ? null
                              : () => _confirmAndDeleteItem(item),
                          onStartScan: isPaused
                              ? null
                              : () => _openItemDetail(item),
                        ),
                      ),
                    );
                  },
                ),
        ),

        if (!isPaused && !isReadOnly)
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: PrimaryButton(
                label: 'Complete Session',
                isLoading: _isActionInProgress,
                onPressed: items.isNotEmpty && !_isActionInProgress
                    ? _completeSession
                    : null,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _syncSession() async {
    final session = ref.read(stockTakeSessionControllerProvider).activeSession;
    if (session?.serverId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Cannot submit: Session not yet posted to server. Ensure you are clocked into a visit.',
          ),
          backgroundColor: kWarningColor,
        ),
      );
      return;
    }

    setState(() => _isActionInProgress = true);
    try {
      final syncedCount = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .syncSession(widget.sessionLocalId);

      if (mounted && syncedCount != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Submitted $syncedCount items to server')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isActionInProgress = false);
      }
    }
  }

  Future<void> _addProduct() async {
    await context.push(
      '/stock-take/session/${widget.sessionLocalId}/add-product',
      extra: {
        'sessionLocalId': widget.sessionLocalId,
        'customerId': widget.customerId,
      },
    );

    if (mounted) {
      ref
          .read(stockTakeSessionControllerProvider.notifier)
          .loadSessionItems(widget.sessionLocalId);
    }
  }

  Future<void> _scanBarcode() async {
    final result = await Navigator.of(context).push<BarcodeScanResult>(
      MaterialPageRoute(
        builder: (context) => const BarcodeScannerScreen(
          title: 'Scan Product',
          hintText: 'Scan product barcode to add',
        ),
      ),
    );

    if (result == null || !mounted) return;

    HapticFeedback.mediumImpact();
    final barcode = result.barcode.trim();
    await _findAndAddProductByBarcode(barcode);
  }

  Future<void> _findAndAddProductByBarcode(String barcode) async {
    setState(() => _isActionInProgress = true);

    try {
      final matchingProduct = await ref.read(
        findProductByBarcodeProvider(barcode).future,
      );

      if (matchingProduct == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Product not available: $barcode'),
              backgroundColor: kWarningColor,
              action: SnackBarAction(
                label: 'Search',
                textColor: Colors.white,
                onPressed: () => _addProduct(),
              ),
            ),
          );
        }
        return;
      }

      final item = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .addProduct(
            sessionLocalId: widget.sessionLocalId,
            product: matchingProduct,
          );

      if (item != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added ${matchingProduct.itemName}'),
            backgroundColor: kSuccessColor,
          ),
        );

        await context.push(
          '/stock-take/session/${widget.sessionLocalId}/item/${item.localId}',
          extra: {
            'itemLocalId': item.localId,
            'itemName': item.itemName,
            'brandName': item.brandName,
            'category': item.category,
            'modelNumber': item.modelNumber,
            'minStockLevel': item.minStockLevel,
            'maxStockLevel': item.maxStockLevel,
          },
        );

        if (mounted) {
          ref
              .read(stockTakeSessionControllerProvider.notifier)
              .loadSessionItems(widget.sessionLocalId);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: kRedColor),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isActionInProgress = false);
      }
    }
  }

  Future<void> _openItemDetail(StockTakeItem item) async {
    await context.push(
      '/stock-take/session/${widget.sessionLocalId}/item/${item.localId}',
      extra: {
        'itemLocalId': item.localId,
        'itemName': item.itemName,
        'brandName': item.brandName,
        'category': item.category,
        'modelNumber': item.modelNumber,
        'minStockLevel': item.minStockLevel,
        'maxStockLevel': item.maxStockLevel,
      },
    );

    if (mounted) {
      ref
          .read(stockTakeSessionControllerProvider.notifier)
          .loadSessionItems(widget.sessionLocalId);
    }
  }

  Future<void> _viewItemDetail(StockTakeItem item) async {
    await context.push(
      '/stock-take/session/${widget.sessionLocalId}/item/${item.localId}',
      extra: {
        'itemLocalId': item.localId,
        'itemName': item.itemName,
        'brandName': item.brandName,
        'category': item.category,
        'modelNumber': item.modelNumber,
        'minStockLevel': item.minStockLevel,
        'maxStockLevel': item.maxStockLevel,
        'readOnly': true,
      },
    );
  }

  Future<bool> _confirmDeleteItem(StockTakeItem item) async {
    return await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('Remove Product?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Are you sure you want to remove this product from the stock take?',
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.modelNumber ?? item.itemCode,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        item.itemName,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      if (item.serialCount > 0) ...[
                        const SizedBox(height: 8),
                        Text(
                          '${item.serialCount} serial(s) will be deleted',
                          style: const TextStyle(
                            color: kRedColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                style: FilledButton.styleFrom(backgroundColor: kRedColor),
                child: const Text('Remove'),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _deleteItem(StockTakeItem item) {
    ref
        .read(stockTakeSessionControllerProvider.notifier)
        .deleteItem(item.localId);
  }

  Future<void> _confirmAndDeleteItem(StockTakeItem item) async {
    final confirmed = await _confirmDeleteItem(item);
    if (confirmed) {
      _deleteItem(item);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removed ${item.modelNumber ?? item.itemCode}'),
          ),
        );
      }
    }
  }

  Future<void> _pauseSession() async {
    setState(() => _isActionInProgress = true);
    try {
      await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .pauseSession(widget.sessionLocalId);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Session paused')));
      }
    } finally {
      if (mounted) setState(() => _isActionInProgress = false);
    }
  }

  Future<void> _resumeSession() async {
    setState(() => _isActionInProgress = true);
    try {
      await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .resumeSession(widget.sessionLocalId);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Session resumed')));
      }
    } finally {
      if (mounted) setState(() => _isActionInProgress = false);
    }
  }

  void _showCancelDialog() {
    _cancelReasonController.clear();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Cancel Stock Take?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'All progress will be lost. This action cannot be undone.',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cancelReasonController,
              decoration: const InputDecoration(
                labelText: 'Reason for cancellation (required)',
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Keep Session'),
          ),
          FilledButton(
            onPressed: () {
              final reason = _cancelReasonController.text.trim();
              if (reason.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please provide a reason')),
                );
                return;
              }
              Navigator.pop(dialogContext);
              _cancelSession(reason);
            },
            style: FilledButton.styleFrom(backgroundColor: kRedColor),
            child: const Text('Cancel Session'),
          ),
        ],
      ),
    );
  }

  Future<void> _cancelSession(String reason) async {
    setState(() => _isActionInProgress = true);
    try {
      await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .cancelSession(widget.sessionLocalId, reason);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Session cancelled')));
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to cancel: $e')));
      }
    } finally {
      if (mounted) setState(() => _isActionInProgress = false);
    }
  }

  Future<void> _completeSession() async {
    final sessionState = ref.read(stockTakeSessionControllerProvider);
    final items = sessionState.sessionItems;
    // Fetched by this screen's own sessionLocalId, not the shared
    // activeSession field - see getSessionByLocalId's doc comment: if
    // another outlet's session was loaded elsewhere in the app since this
    // screen was opened, activeSession would no longer necessarily match
    // the session this screen (and thus "Complete"/"Submit") is for.
    final session = await ref
        .read(stockTakeSessionControllerProvider.notifier)
        .getSessionByLocalId(widget.sessionLocalId);
    if (session == null || !mounted) return;

    final blankItems = items.where((item) => item.serialCount == 0).toList();

    if (blankItems.isNotEmpty) {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Products With No Count'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${blankItems.length} product(s) have no serial numbers scanned:',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: blankItems
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.warning_amber,
                                  size: 16,
                                  color: kWarningColor,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    item.modelNumber ?? item.itemCode,
                                    style: const TextStyle(fontSize: 13),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Please scan serial numbers for all products or remove products you don't want to count.",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    showRouteBottomSheet<void>(
      context,
      builder: (sheetContext) => _CompleteSessionSheet(
        warehouseName: session.warehouseName,
        productsCounted: items.length,
        serialsScanned: items.fold<int>(0, (sum, i) => sum + i.serialCount),
        onConfirm: () {
          Navigator.of(sheetContext).pop();
          _submitSession();
        },
      ),
    );
  }

  Future<void> _submitSession() async {
    // Fetched by this screen's own sessionLocalId - see
    // getSessionByLocalId's doc comment. Using the shared activeSession
    // field here risked sending the agent to the wrong outlet's
    // proposed-order screen after a correct submission, if a different
    // outlet's session had been loaded elsewhere in the app in the
    // meantime.
    final visitServerId = (await ref
            .read(stockTakeSessionControllerProvider.notifier)
            .getSessionByLocalId(widget.sessionLocalId))
        ?.visitServerId;
    if (!mounted) return;

    setState(() => _isActionInProgress = true);
    try {
      final success = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .completeSession(widget.sessionLocalId);

      if (mounted) {
        if (success) {
          if (visitServerId != null) {
            context.pushReplacement('/stock-take/order/$visitServerId');
          } else {
            context.pop();
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to submit stock take')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to submit: $e')));
      }
    } finally {
      if (mounted) setState(() => _isActionInProgress = false);
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────────────────

class _SessionHeader extends StatelessWidget {
  final String title;
  final String? outletSubtitle;
  final int productCount;
  final int serialCount;
  final int completedCount;
  final bool isPaused;
  final bool showMenu;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const _SessionHeader({
    required this.title,
    required this.outletSubtitle,
    required this.productCount,
    required this.serialCount,
    required this.completedCount,
    required this.isPaused,
    required this.showMenu,
    required this.onPause,
    required this.onResume,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;

    return Container(
      width: double.infinity,
      color: kTextDark,
      padding: EdgeInsets.fromLTRB(20, topInset + 8, 12, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: kTextLight,
                        fontWeight: FontWeight.w800,
                        fontSize: 19,
                      ),
                    ),
                    if (outletSubtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        outletSubtitle!,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (showMenu)
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: kTextLight),
                  onSelected: (value) {
                    switch (value) {
                      case 'pause':
                        onPause();
                      case 'resume':
                        onResume();
                      case 'submit':
                        onSubmit();
                      case 'cancel':
                        onCancel();
                    }
                  },
                  itemBuilder: (context) => [
                    if (isPaused)
                      const PopupMenuItem(
                        value: 'resume',
                        child: ListTile(
                          leading: Icon(Icons.play_arrow, color: kSuccessColor),
                          title: Text('Resume Session'),
                          contentPadding: EdgeInsets.zero,
                        ),
                      )
                    else
                      const PopupMenuItem(
                        value: 'pause',
                        child: ListTile(
                          leading: Icon(Icons.pause, color: kWarningColor),
                          title: Text('Pause Session'),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    const PopupMenuItem(
                      value: 'submit',
                      child: ListTile(
                        leading: Icon(
                          Icons.cloud_upload_outlined,
                          color: kSecondaryColor,
                        ),
                        title: Text('Submit to Server'),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'cancel',
                      child: ListTile(
                        leading: Icon(Icons.cancel, color: kRedColor),
                        title: Text(
                          'Cancel Session',
                          style: TextStyle(color: kRedColor),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _DarkStat(label: 'PRODUCTS', value: '$productCount'),
              const SizedBox(width: 20),
              _DarkStat(label: 'SERIALS', value: '$serialCount'),
              const SizedBox(width: 20),
              _DarkStat(
                label: 'COMPLETED',
                value: '$completedCount',
                color: const Color(0xFF7ED99A),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DarkStat extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const _DarkStat({required this.label, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            color: color ?? kTextLight,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 10,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}

class _InlineBanner extends StatelessWidget {
  final IconData icon;
  final String message;
  final Color bg;
  final Color fg;
  final Widget? trailing;

  const _InlineBanner({
    required this.icon,
    required this.message,
    required this.bg,
    required this.fg,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: bg,
      child: Row(
        children: [
          Icon(icon, color: fg, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: fg,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}

class _FilterToggle extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterToggle({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? kTextDark : null,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            color: selected ? kTextLight : kTextMuted,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Complete session bottom sheet
// ─────────────────────────────────────────────────────────────────────────

class _CompleteSessionSheet extends StatelessWidget {
  final String warehouseName;
  final int productsCounted;
  final int serialsScanned;
  final VoidCallback onConfirm;

  const _CompleteSessionSheet({
    required this.warehouseName,
    required this.productsCounted,
    required this.serialsScanned,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Complete stock take session?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: kBackground,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _SummaryRow(label: 'Warehouse', value: warehouseName),
              const SizedBox(height: 8),
              _SummaryRow(label: 'Products counted', value: '$productsCounted'),
              const SizedBox(height: 8),
              _SummaryRow(
                label: 'Serial numbers scanned',
                value: '$serialsScanned',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SecondaryButton(
          label: 'Cancel',
          onPressed: () => Navigator.of(context).pop(),
        ),
        const SizedBox(height: 10),
        PrimaryButton(label: 'Complete Session', onPressed: onConfirm),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, color: kTextMuted)),
        Text(
          value,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Item card
// ─────────────────────────────────────────────────────────────────────────

class _ItemCard extends StatelessWidget {
  final StockTakeItem item;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onStartScan;

  const _ItemCard({
    required this.item,
    this.onTap,
    this.onDelete,
    this.onStartScan,
  });

  @override
  Widget build(BuildContext context) {
    final notStarted = item.serialCount == 0 && !item.isCompleted;
    final inProgress = !item.isCompleted && !notStarted;

    final (String pillLabel, Color pillBg, Color pillFg) = item.isCompleted
        ? ('Completed', kSuccessBg, kSuccessText)
        : notStarted
        ? ('Not Started', const Color(0xFFF0F0EE), kTextMuted)
        : ('In Progress', kWarningBg, kWarningText);

    final borderColor = inProgress ? kSecondaryColor : kBorderColor;
    final borderWidth = inProgress ? 2.0 : 1.0;
    final fillColor = item.isCompleted
        ? kSuccessColor
        : inProgress
        ? kSecondaryColor
        : kTextFaint;

    return Material(
      color: kPrimaryLightColor,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.modelNumber?.isNotEmpty == true
                              ? item.modelNumber!
                              : item.itemCode,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${item.itemCode} · ${item.brandName}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: kTextFaint,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: pillBg,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (item.isCompleted) ...[
                          Icon(Icons.check, size: 9, color: pillFg),
                          const SizedBox(width: 3),
                        ],
                        Text(
                          pillLabel,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: pillFg,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (!notStarted) ...[
                const SizedBox(height: 8),
                _StockLevelBar(
                  fillFraction: (item.progressPercentage / 100).clamp(0, 1),
                  minFraction: item.maxStockLevel > 0
                      ? (item.minStockLevel / item.maxStockLevel).clamp(
                          0.0,
                          1.0,
                        )
                      : 0.0,
                  fillColor: fillColor,
                ),
                const SizedBox(height: 8),
              ] else
                const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Min ${item.minStockLevel} · Max ${item.maxStockLevel}',
                    style: const TextStyle(fontSize: 11, color: kTextMuted),
                  ),
                  Text(
                    '${item.serialCount} serials',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: notStarted ? kTextFaint : kTextDark,
                    ),
                  ),
                ],
              ),
              if (inProgress && (onDelete != null || onStartScan != null)) ...[
                const SizedBox(height: 10),
                Row(
                  children: [
                    if (onStartScan != null)
                      Expanded(
                        child: GestureDetector(
                          onTap: onStartScan,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: kTextDark,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: const Text(
                              'Continue Scanning',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: kTextLight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (onDelete != null) ...[
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: onDelete,
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            border: Border.all(color: kBorderColor),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.delete_outline,
                            size: 16,
                            color: kRedColor,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ] else if (notStarted && onStartScan != null) ...[
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: onStartScan,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: kBackground,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Text(
                      'Start Scanning',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _StockLevelBar extends StatelessWidget {
  final double fillFraction;
  final double minFraction;
  final Color fillColor;

  const _StockLevelBar({
    required this.fillFraction,
    required this.minFraction,
    required this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 6,
                width: width,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFEC),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Container(
                height: 6,
                width: width * fillFraction,
                decoration: BoxDecoration(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Positioned(
                left: (width * minFraction).clamp(0.0, width - 1.5),
                child: Container(width: 1.5, height: 12, color: kTextFaint),
              ),
              Positioned(
                right: 0,
                child: Container(width: 1.5, height: 12, color: kTextFaint),
              ),
            ],
          );
        },
      ),
    );
  }
}

String _formatStarted(StockTakeSession session) {
  final dt = session.startedAt;
  final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
  final period = dt.hour >= 12 ? 'PM' : 'AM';
  return 'started $hour:${dt.minute.toString().padLeft(2, '0')} $period';
}
