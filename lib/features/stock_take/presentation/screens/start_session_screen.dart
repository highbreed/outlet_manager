import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../daily_route/presentation/widgets/widgets.dart';
import '../../domain/entities/entities.dart';
import '../providers/session_providers.dart';

/// Screen to select warehouse and start a new stock take session
class StartSessionScreen extends ConsumerStatefulWidget {
  final int customerId;
  final String customerName;
  final String? visitLocalId;
  final int? visitServerId;

  const StartSessionScreen({
    super.key,
    required this.customerId,
    required this.customerName,
    this.visitLocalId,
    this.visitServerId,
  });

  @override
  ConsumerState<StartSessionScreen> createState() => _StartSessionScreenState();
}

class _StartSessionScreenState extends ConsumerState<StartSessionScreen> {
  Warehouse? _selectedWarehouse;
  final _notesController = TextEditingController();
  bool _isStarting = false;
  String? _error;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final warehousesAsync = ref.watch(
      customerWarehousesProvider(widget.customerId),
    );

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteBackHeader(
              title: 'New Stock Take',
              onBack: () => context.pop(),
            ),
            Expanded(
              child: warehousesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: kRedColor,
                      ),
                      const SizedBox(height: 16),
                      Text('Failed to load warehouses: $error'),
                      const SizedBox(height: 16),
                      SecondaryButton(
                        label: 'Retry',
                        expand: false,
                        onPressed: () => ref.invalidate(
                          customerWarehousesProvider(widget.customerId),
                        ),
                      ),
                    ],
                  ),
                ),
                data: (warehouses) => _buildContent(context, warehouses),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<Warehouse> warehouses) {
    if (_isStarting) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Creating session...', style: TextStyle(color: kTextMuted)),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Error banner
          if (_error != null)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kRedColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline, color: kRedColor, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: const TextStyle(color: kRedColor, fontSize: 13),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 20, color: kRedColor),
                    onPressed: () => setState(() => _error = null),
                  ),
                ],
              ),
            ),

          Text(
            warehouses.length > 1
                ? '${widget.customerName} offers ${warehouses.length} warehouses'
                : 'Choose where you will be counting inventory',
            style: const TextStyle(fontSize: 12, color: kTextMuted),
          ),
          const SizedBox(height: 16),

          // Warehouse cards
          if (warehouses.isEmpty)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: kBackground,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: kBorderColor),
              ),
              child: const Column(
                children: [
                  Icon(Icons.warehouse_outlined, size: 40, color: kTextFaint),
                  SizedBox(height: 12),
                  Text(
                    'No Warehouses Available',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'No active warehouses found for this customer',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: kTextMuted),
                  ),
                ],
              ),
            )
          else
            ...warehouses.map(
              (warehouse) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _WarehouseCard(
                  warehouse: warehouse,
                  isSelected: _selectedWarehouse?.id == warehouse.id,
                  onTap: () {
                    setState(() {
                      _selectedWarehouse = warehouse;
                    });
                  },
                ),
              ),
            ),

          const SizedBox(height: 20),

          // Notes section — a real capability the mock's frame doesn't
          // happen to depict; kept since removing it would be a
          // functional regression, not a style change.
          const Text(
            'Notes (Optional)',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _notesController,
            decoration: const InputDecoration(
              hintText: 'Add any notes about this stock take...',
            ),
            maxLines: 3,
          ),

          const SizedBox(height: 24),

          PrimaryButton(
            label: 'Start Session',
            onPressed: _selectedWarehouse == null ? null : _startSession,
          ),
        ],
      ),
    );
  }

  Future<void> _startSession() async {
    if (_selectedWarehouse == null) return;

    if (widget.visitLocalId == null) {
      // A fabricated visitLocalId here would never match the real active
      // visit's id on any later load, so the session it's attached to
      // would look "stale" and get auto-cancelled the next time this
      // screen (or the stock take home screen) loads. Refuse instead.
      setState(() {
        _error =
            'Cannot start stock take - no active visit found. Please ensure you are clocked in.';
      });
      return;
    }

    setState(() {
      _isStarting = true;
      _error = null;
    });

    try {
      final visitId = widget.visitLocalId!;

      print(
        '[StockTake] Starting session with visitLocalId=$visitId, visitServerId=${widget.visitServerId}',
      );

      final session = await ref
          .read(stockTakeSessionControllerProvider.notifier)
          .startSession(
            customerId: widget.customerId,
            visitLocalId: visitId,
            visitServerId: widget.visitServerId,
            warehouseId: _selectedWarehouse!.id,
            notes: _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
          );

      if (session != null && mounted) {
        // Navigate to the active session screen
        context.pushReplacement(
          '/stock-take/session/${session.localId}',
          extra: {
            'customerId': widget.customerId,
            'visitLocalId': visitId,
            'warehouseId': _selectedWarehouse!.id,
            'warehouseName': _selectedWarehouse!.warehouseName,
          },
        );
      } else if (mounted) {
        // Check controller state for error
        final state = ref.read(stockTakeSessionControllerProvider);
        setState(() {
          _error = state.errorMessage ?? 'Failed to create session';
          _isStarting = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Failed to start session: $e';
          _isStarting = false;
        });
      }
    }
  }
}

/// Warehouse selection card
class _WarehouseCard extends StatelessWidget {
  final Warehouse warehouse;
  final bool isSelected;
  final VoidCallback onTap;

  const _WarehouseCard({
    required this.warehouse,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kPrimaryLightColor,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected ? kSecondaryColor : kBorderColor,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      warehouse.warehouseName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      warehouse.typeDisplayName,
                      style: const TextStyle(fontSize: 12, color: kTextMuted),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? kSecondaryColor : null,
                  border: isSelected
                      ? null
                      : Border.all(color: kBorderColor, width: 1.5),
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: kTextLight, size: 12)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
