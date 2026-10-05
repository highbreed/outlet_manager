import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../../../core/theme/colors.dart';
import '../../data/datasources/products_remote_datasource.dart';
import '../providers/products_providers.dart';

const _kReasonNotMeantForOutlet = 'not_meant_for_outlet';
const _kReasonPriceHigherThanCompetitor = 'price_higher_than_competitor';

class _CompetitorDraft {
  final nameController = TextEditingController();
  final modelController = TextEditingController();
  final rrpController = TextEditingController();

  bool get isValid =>
      nameController.text.trim().isNotEmpty &&
      double.tryParse(rrpController.text.trim()) != null;

  CompetitorProductEntry toEntry() => CompetitorProductEntry(
    competitorName: nameController.text.trim(),
    modelNo: modelController.text.trim().isEmpty
        ? null
        : modelController.text.trim(),
    rrp: double.parse(rrpController.text.trim()),
  );

  void dispose() {
    nameController.dispose();
    modelController.dispose();
    rrpController.dispose();
  }
}

/// Bottom sheet form to report why a product isn't selling at this outlet.
/// A one-time, irreversible submission per the API contract.
class ReportNotSellingSheet extends ConsumerStatefulWidget {
  final String cardCode;
  final String itemCode;

  const ReportNotSellingSheet({
    super.key,
    required this.cardCode,
    required this.itemCode,
  });

  @override
  ConsumerState<ReportNotSellingSheet> createState() =>
      _ReportNotSellingSheetState();
}

class _ReportNotSellingSheetState extends ConsumerState<ReportNotSellingSheet> {
  String? _reason;
  bool _similarCompetitorSku = false;
  final List<_CompetitorDraft> _drafts = [];
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    for (final d in _drafts) {
      d.dispose();
    }
    super.dispose();
  }

  bool get _canSubmit {
    if (_reason == null) return false;
    if (!_similarCompetitorSku) return true;
    return _drafts.isNotEmpty && _drafts.every((d) => d.isValid);
  }

  void _addDraft() => setState(() => _drafts.add(_CompetitorDraft()));

  void _removeDraft(_CompetitorDraft draft) => setState(() {
    _drafts.remove(draft);
    draft.dispose();
  });

  Future<void> _submit() async {
    if (!_canSubmit) return;
    setState(() {
      _submitting = true;
      _error = null;
    });

    try {
      final report = await ref
          .read(productsRemoteDataSourceProvider)
          .reportNotSelling(
            cardCode: widget.cardCode,
            itemCode: widget.itemCode,
            reason: _reason!,
            similarCompetitorSku: _similarCompetitorSku,
            competitorProducts: _similarCompetitorSku
                ? _drafts.map((d) => d.toEntry()).toList()
                : const [],
          );
      if (!mounted) return;
      Navigator.of(context).pop(report);
    } on NetworkException catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toFailure().displayMessage;
        _submitting = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Something went wrong. Please try again.';
        _submitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom +
            MediaQuery.of(context).padding.bottom +
            20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Report Why This Isn\'t Selling',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'This is a one-time report and can\'t be edited once sent.',
              style: TextStyle(fontSize: 12, color: kTextMuted),
            ),
            const SizedBox(height: 12),
            RadioGroup<String>(
              groupValue: _reason,
              onChanged: (v) => setState(() => _reason = v),
              child: const Column(
                children: [
                  RadioListTile<String>(
                    value: _kReasonNotMeantForOutlet,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      'Product isn\'t meant for this outlet',
                      style: TextStyle(fontSize: 13, color: kTextDark),
                    ),
                  ),
                  RadioListTile<String>(
                    value: _kReasonPriceHigherThanCompetitor,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      'Our price is greater than the competition SKU price',
                      style: TextStyle(fontSize: 13, color: kTextDark),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Does a competitor have a similar SKU?',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: kTextDark,
              ),
            ),
            const SizedBox(height: 8),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: true, label: Text('Yes')),
                ButtonSegment(value: false, label: Text('No')),
              ],
              selected: {_similarCompetitorSku},
              onSelectionChanged: (s) {
                setState(() {
                  _similarCompetitorSku = s.first;
                  if (_similarCompetitorSku && _drafts.isEmpty) _addDraft();
                });
              },
            ),
            if (_similarCompetitorSku) ...[
              const SizedBox(height: 12),
              for (final draft in _drafts) ...[
                _CompetitorDraftRow(
                  draft: draft,
                  onChanged: () => setState(() {}),
                  onRemove: () => _removeDraft(draft),
                ),
                const SizedBox(height: 8),
              ],
              OutlinedButton.icon(
                onPressed: _addDraft,
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Add competitor product'),
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(
                _error!,
                style: const TextStyle(fontSize: 12, color: kRedColor),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _canSubmit && !_submitting ? _submit : null,
                child: _submitting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Submit report'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CompetitorDraftRow extends StatelessWidget {
  final _CompetitorDraft draft;
  final VoidCallback onChanged;
  final VoidCallback onRemove;

  const _CompetitorDraftRow({
    required this.draft,
    required this.onChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: draft.nameController,
                  onChanged: (_) => onChanged(),
                  style: const TextStyle(fontSize: 13, color: kTextDark),
                  decoration: const InputDecoration(
                    labelText: 'Competitor name *',
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.close, size: 18),
                color: kTextMuted,
                tooltip: 'Remove',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: draft.modelController,
                  onChanged: (_) => onChanged(),
                  style: const TextStyle(fontSize: 13, color: kTextDark),
                  decoration: const InputDecoration(
                    labelText: 'Model no',
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: draft.rrpController,
                  onChanged: (_) => onChanged(),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  style: const TextStyle(fontSize: 13, color: kTextDark),
                  decoration: const InputDecoration(
                    labelText: 'RRP (KES) *',
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
