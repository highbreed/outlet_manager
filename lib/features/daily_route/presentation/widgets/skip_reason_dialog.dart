import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../domain/entities/skip_reason.dart';
import '../../providers/daily_route_providers.dart';
import 'route_bottom_sheet.dart';

/// Result from skip reason dialog.
class SkipReasonResult {
  final int reasonId;
  final String reasonCode;
  final String reasonLabel;
  final String? notes;

  SkipReasonResult({
    required this.reasonId,
    required this.reasonCode,
    required this.reasonLabel,
    this.notes,
  });
}

/// Bottom sheet for selecting a skip reason, matching the redesign's
/// "Skip Visit — reason" mock: grabber, question, bordered reason cards
/// (selected = purple border + filled checkmark), black "Confirm Skip"
/// pill. [outletName] is accepted for API compatibility with callers but
/// isn't shown — the mock's copy is generic ("this visit").
class SkipReasonDialog {
  /// Shows the sheet and returns the selected reason, or null if dismissed.
  static Future<SkipReasonResult?> show(
    BuildContext context, {
    required String outletName,
    String? title,
  }) {
    return showRouteBottomSheet<SkipReasonResult>(
      context,
      builder: (context) => const _SkipReasonSheetContent(),
    );
  }
}

class _SkipReasonSheetContent extends ConsumerStatefulWidget {
  const _SkipReasonSheetContent();

  @override
  ConsumerState<_SkipReasonSheetContent> createState() =>
      _SkipReasonSheetContentState();
}

class _SkipReasonSheetContentState
    extends ConsumerState<_SkipReasonSheetContent> {
  SkipReason? _selectedReason;
  final _notesController = TextEditingController();
  bool _showNotesError = false;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_selectedReason == null) return;

    if (_selectedReason!.requiresNotes &&
        _notesController.text.trim().isEmpty) {
      setState(() => _showNotesError = true);
      return;
    }

    Navigator.of(context).pop(
      SkipReasonResult(
        reasonId: _selectedReason!.id,
        reasonCode: _selectedReason!.code,
        reasonLabel: _selectedReason!.label,
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final skipReasonsAsync = ref.watch(skipReasonsProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Why are you skipping this visit?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 14),
        skipReasonsAsync.when(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (_, _) => _buildReasonList(_defaultReasons),
          data: (reasons) => _buildReasonList(reasons),
        ),
        if (_selectedReason != null) ...[
          const SizedBox(height: 12),
          TextField(
            controller: _notesController,
            decoration: InputDecoration(
              hintText: _selectedReason!.requiresNotes
                  ? 'Notes (required)'
                  : 'Notes (optional)',
              errorText: _showNotesError ? 'Please provide notes' : null,
            ),
            maxLines: 2,
            onChanged: (_) {
              if (_showNotesError) setState(() => _showNotesError = false);
            },
          ),
        ],
        const SizedBox(height: 14),
        PrimaryButton(
          label: 'Confirm Skip',
          onPressed: _selectedReason == null ? null : _submit,
        ),
      ],
    );
  }

  Widget _buildReasonList(List<SkipReason> reasons) {
    return Column(
      children: [
        for (final reason in reasons) ...[
          _ReasonCard(
            reason: reason,
            isSelected: _selectedReason?.id == reason.id,
            onTap: () => setState(() {
              _selectedReason = reason;
              _showNotesError = false;
            }),
          ),
          if (reason != reasons.last) const SizedBox(height: 8),
        ],
      ],
    );
  }

  List<SkipReason> get _defaultReasons => const [
    SkipReason(id: 1, code: 'CLOSED', label: 'Outlet closed'),
    SkipReason(id: 2, code: 'NO_ACCESS', label: 'Contact unavailable'),
    SkipReason(id: 3, code: 'TIME_CONSTRAINT', label: 'Route re-planned'),
    SkipReason(id: 4, code: 'OTHER', label: 'Other', requiresNotes: true),
  ];
}

class _ReasonCard extends StatelessWidget {
  final SkipReason reason;
  final bool isSelected;
  final VoidCallback onTap;

  const _ReasonCard({
    required this.reason,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? kSecondaryColor : kBorderColor,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  reason.label,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
              if (isSelected)
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: kSecondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, size: 11, color: kTextLight),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Dialog for collecting skip reasons for multiple visits (used when closing route).
class BulkSkipReasonsDialog extends ConsumerStatefulWidget {
  final List<BulkSkipVisit> visits;

  const BulkSkipReasonsDialog({super.key, required this.visits});

  /// Shows the bottom sheet and returns the list of skip results, or null
  /// if cancelled/dismissed.
  static Future<List<BulkSkipResult>?> show(
    BuildContext context, {
    required List<BulkSkipVisit> visits,
  }) {
    return showRouteBottomSheet<List<BulkSkipResult>>(
      context,
      builder: (context) => BulkSkipReasonsDialog(visits: visits),
    );
  }

  @override
  ConsumerState<BulkSkipReasonsDialog> createState() =>
      _BulkSkipReasonsDialogState();
}

class BulkSkipVisit {
  final String localId;
  final String outletName;
  final String outletCode;

  BulkSkipVisit({
    required this.localId,
    required this.outletName,
    required this.outletCode,
  });
}

class BulkSkipResult {
  final String visitLocalId;
  final int reasonId;
  final String reasonCode;
  final String? notes;

  BulkSkipResult({
    required this.visitLocalId,
    required this.reasonId,
    required this.reasonCode,
    this.notes,
  });
}

class _BulkSkipReasonsDialogState extends ConsumerState<BulkSkipReasonsDialog> {
  final Map<String, SkipReason?> _selectedReasons = {};
  final Map<String, TextEditingController> _notesControllers = {};
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    for (final visit in widget.visits) {
      _notesControllers[visit.localId] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (final controller in _notesControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  BulkSkipVisit get _currentVisit => widget.visits[_currentIndex];
  SkipReason? get _currentReason => _selectedReasons[_currentVisit.localId];
  TextEditingController get _currentNotesController =>
      _notesControllers[_currentVisit.localId]!;

  bool get _canProceed {
    final reason = _currentReason;
    if (reason == null) return false;
    if (reason.requiresNotes && _currentNotesController.text.trim().isEmpty) {
      return false;
    }
    return true;
  }

  bool get _isLastVisit => _currentIndex == widget.visits.length - 1;

  void _next() {
    if (!_canProceed) return;
    if (_isLastVisit) {
      _submit();
    } else {
      setState(() => _currentIndex++);
    }
  }

  void _previous() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
    }
  }

  void _submit() {
    final results = <BulkSkipResult>[];
    for (final visit in widget.visits) {
      final reason = _selectedReasons[visit.localId];
      if (reason == null) continue;
      results.add(
        BulkSkipResult(
          visitLocalId: visit.localId,
          reasonId: reason.id,
          reasonCode: reason.code,
          notes: _notesControllers[visit.localId]!.text.trim().isEmpty
              ? null
              : _notesControllers[visit.localId]!.text.trim(),
        ),
      );
    }
    Navigator.of(context).pop(results);
  }

  @override
  Widget build(BuildContext context) {
    final skipReasonsAsync = ref.watch(skipReasonsProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Why are you skipping this visit?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: kSecondaryLightColor,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                '${_currentIndex + 1} / ${widget.visits.length}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: kSecondaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: kBackground,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const Icon(Icons.storefront_outlined, size: 18, color: kTextMuted),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _currentVisit.outletName,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      _currentVisit.outletCode,
                      style: const TextStyle(fontSize: 11, color: kTextFaint),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        skipReasonsAsync.when(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (_, _) => _buildReasonList(_defaultReasons),
          data: (reasons) => _buildReasonList(reasons),
        ),
        if (_currentReason != null) ...[
          const SizedBox(height: 12),
          TextField(
            controller: _currentNotesController,
            decoration: InputDecoration(
              hintText: _currentReason!.requiresNotes
                  ? 'Notes (required)'
                  : 'Notes (optional)',
            ),
            maxLines: 2,
            onChanged: (_) => setState(() {}),
          ),
        ],
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentIndex > 0) ...[
              TextButton(
                onPressed: _previous,
                child: const Text('Previous'),
              ),
              const SizedBox(width: 4),
            ],
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: const Text('Cancel'),
            ),
          ],
        ),
        const SizedBox(height: 6),
        PrimaryButton(
          label: _isLastVisit ? 'Close Route' : 'Next',
          onPressed: _canProceed ? _next : null,
        ),
      ],
    );
  }

  Widget _buildReasonList(List<SkipReason> reasons) {
    return Column(
      children: [
        for (final reason in reasons) ...[
          _ReasonCard(
            reason: reason,
            isSelected: _currentReason?.id == reason.id,
            onTap: () => setState(() {
              _selectedReasons[_currentVisit.localId] = reason;
            }),
          ),
          if (reason != reasons.last) const SizedBox(height: 8),
        ],
      ],
    );
  }

  List<SkipReason> get _defaultReasons => const [
    SkipReason(id: 1, code: 'CLOSED', label: 'Outlet closed'),
    SkipReason(id: 2, code: 'NO_ACCESS', label: 'Contact unavailable'),
    SkipReason(id: 3, code: 'TIME_CONSTRAINT', label: 'Route re-planned'),
    SkipReason(id: 4, code: 'OTHER', label: 'Other', requiresNotes: true),
  ];
}
