import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/colors.dart';

/// Bottom sheet form for clock-out data collection
class ClockOutForm extends StatefulWidget {
  final String outletName;
  final Function({
    required double transportExpense,
    required String routeCovered,
    required bool hasOrder,
  })
  onSubmit;
  final VoidCallback onCancel;
  final bool isLoading;

  const ClockOutForm({
    super.key,
    required this.outletName,
    required this.onSubmit,
    required this.onCancel,
    this.isLoading = false,
  });

  @override
  State<ClockOutForm> createState() => _ClockOutFormState();
}

class _ClockOutFormState extends State<ClockOutForm> {
  final _formKey = GlobalKey<FormState>();
  final _transportExpenseController = TextEditingController();
  final _routeCoveredController = TextEditingController();
  bool _hasOrder = false;

  @override
  void dispose() {
    _transportExpenseController.dispose();
    _routeCoveredController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final expense = double.tryParse(_transportExpenseController.text) ?? 0.0;
      widget.onSubmit(
        transportExpense: expense,
        routeCovered: _routeCoveredController.text.trim(),
        hasOrder: _hasOrder,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              'Clock Out',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(widget.outletName, style: const TextStyle(color: kTextMuted)),
            const SizedBox(height: 24),

            // Transport Expense
            TextFormField(
              controller: _transportExpenseController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              decoration: const InputDecoration(
                labelText: 'Transport Expense',
                hintText: '0.00',
                prefixText: 'KES ',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter transport expense';
                }
                final expense = double.tryParse(value);
                if (expense == null || expense < 0) {
                  return 'Please enter a valid amount';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Route Covered
            TextFormField(
              controller: _routeCoveredController,
              maxLines: 2,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Route Covered',
                hintText: 'e.g., Main Street → Market Road → Back Street',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please describe the route covered';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Has Order toggle
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Placed',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Did you place an order at this outlet?',
                        style: TextStyle(fontSize: 12, color: kTextMuted),
                      ),
                    ],
                  ),
                  Switch(
                    value: _hasOrder,
                    onChanged: widget.isLoading
                        ? null
                        : (value) => setState(() => _hasOrder = value),
                    activeColor: kSecondaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.isLoading ? null : widget.onCancel,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: widget.isLoading ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kRedColor,
                      foregroundColor: kTextLight,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: widget.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: kTextLight,
                            ),
                          )
                        : const Text(
                            'Confirm Clock Out',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
