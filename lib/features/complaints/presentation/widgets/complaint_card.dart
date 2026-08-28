import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/aftersales_registration_list_item.dart';

class AftersalesListCard extends StatelessWidget {
  final AftersalesRegistrationListItem item;
  final VoidCallback onTap;

  const AftersalesListCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row 1 — complaint number + complaint status badge
              Row(
                children: [
                  Text(
                    item.complaintNo,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  const _StatusBadge(),
                ],
              ),
              const SizedBox(height: 6),

              // Row 2 — consumer name + phone
              Row(
                children: [
                  const Icon(Icons.person_outline, size: 14, color: kTextMuted),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      item.consumerName ?? '—',
                      style: const TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (item.consumerPhone != null) ...[
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.phone_outlined,
                      size: 14,
                      color: kTextMuted,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.consumerPhone!,
                      style: const TextStyle(fontSize: 12, color: kTextMuted),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 4),

              // Row 3 — product model/code + complaint type chip
              Row(
                children: [
                  const Icon(
                    Icons.inventory_2_outlined,
                    size: 14,
                    color: kTextMuted,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      item.displayProduct,
                      style: const TextStyle(fontSize: 12, color: kTextMuted),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (item.complaintTypeName != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryLightColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item.complaintTypeName!,
                        style: const TextStyle(
                          fontSize: 10,
                          color: kSecondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 4),

              // Row 4 — serial number + warranty dot + date
              Row(
                children: [
                  const Icon(Icons.qr_code, size: 14, color: kTextMuted),
                  const SizedBox(width: 4),
                  Text(
                    'S/N: ${item.serialNumber ?? 'N/A'}',
                    style: const TextStyle(fontSize: 12, color: kTextMuted),
                  ),
                  if (item.warrantyStatus != null) ...[
                    const SizedBox(width: 8),
                    _WarrantyDot(inWarranty: item.isInWarranty),
                    const SizedBox(width: 3),
                    Text(
                      item.warrantyLabel,
                      style: TextStyle(
                        fontSize: 11,
                        color: item.isInWarranty
                            ? const Color(0xFF2E7D32)
                            : const Color(0xFFC62828),
                      ),
                    ),
                  ],
                  const Spacer(),
                  if (item.createdAt != null)
                    Text(
                      _formatDate(item.createdAt!),
                      style: const TextStyle(fontSize: 11, color: kTextMuted),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')} '
      '${_month(d.month)} ${d.year}';

  String _month(int m) => const [
        '',
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ][m];
}

/// Complaint-status badge. The list endpoint doesn't return a processing status,
/// so all listed complaints are treated as "Open" until the API adds a status field.
class _StatusBadge extends StatelessWidget {
  const _StatusBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFF9800), width: 0.8),
      ),
      child: const Text(
        'Open',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Color(0xFFE65100),
        ),
      ),
    );
  }
}

class _WarrantyDot extends StatelessWidget {
  final bool inWarranty;
  const _WarrantyDot({required this.inWarranty});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: inWarranty
            ? const Color(0xFF2E7D32)
            : const Color(0xFFC62828),
      ),
    );
  }
}
