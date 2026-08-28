import 'package:flutter/material.dart';

import '../../../../core/widgets/status_chip.dart';
import '../../domain/entities/entities.dart';

class SaleStatusBadge extends StatelessWidget {
  final DailySaleStatus status;

  const SaleStatusBadge({super.key, required this.status});

  StatusChipVariant get _variant {
    switch (status) {
      case DailySaleStatus.pending:
        return StatusChipVariant.warning;
      case DailySaleStatus.confirmed:
        return StatusChipVariant.success;
      case DailySaleStatus.cancelled:
        return StatusChipVariant.danger;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatusChip(label: status.label, variant: _variant);
  }
}
