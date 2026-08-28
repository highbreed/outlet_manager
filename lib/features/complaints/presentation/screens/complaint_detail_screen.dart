import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/aftersales_registration_detail.dart';
import '../providers/complaint_providers.dart';

class ComplaintDetailScreen extends ConsumerWidget {
  final String complaintNo;
  const ComplaintDetailScreen({super.key, required this.complaintNo});

  Future<void> _handleBack(BuildContext context) async {
    if (context.canPop()) {
      context.pop();
      return;
    }
    final leave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Leave After Sales?'),
        content: const Text(
          'Go back to the After Sales list, or stay on this record.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Stay'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: kSecondaryColor),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Go to List'),
          ),
        ],
      ),
    );
    if ((leave ?? false) && context.mounted) {
      context.go('/after-sales');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(aftersalesRegistrationDetailProvider(complaintNo));

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _handleBack(context);
      },
      child: async.when(
        loading: () => AppScaffold(
          title: complaintNo,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _handleBack(context),
          ),
          body: const Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => AppScaffold(
          title: complaintNo,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _handleBack(context),
          ),
          body: _ErrorBody(
            message: e.toString(),
            onRetry: () => ref.invalidate(
              aftersalesRegistrationDetailProvider(complaintNo),
            ),
          ),
        ),
        data: (detail) => AppScaffold(
          title: detail.complaintNo,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _handleBack(context),
          ),
          body: _DetailBody(detail: detail),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Body
// ─────────────────────────────────────────────────────────────────────────────

class _DetailBody extends StatelessWidget {
  final AftersalesRegistrationDetail detail;
  const _DetailBody({required this.detail});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 32),
      children: [
        _HeaderCard(detail: detail),
        const SizedBox(height: 10),
        _SectionCard(
          title: 'Consumer Information',
          icon: Icons.person_outline,
          rows: [
            if (detail.consumerName != null)
              _Row('Name', detail.consumerName!),
            if (detail.consumerPhone != null)
              _Row('Phone', detail.consumerPhone!),
            if (detail.consumerRegion != null)
              _Row('Region', detail.consumerRegion!),
            if (detail.consumerZone != null)
              _Row('Zone', detail.consumerZone!),
            if (detail.consumerArea != null)
              _Row('Area', detail.consumerArea!),
            if (detail.consumerAddress != null)
              _Row('Address', detail.consumerAddress!, multiline: true),
          ],
        ),
        const SizedBox(height: 10),
        _SectionCard(
          title: 'Product Information',
          icon: Icons.inventory_2_outlined,
          rows: [
            if (detail.productCode != null)
              _Row('Item Code', detail.productCode!),
            if (detail.productModelNo != null)
              _Row('Model No.', detail.productModelNo!),
            if (detail.productItemGroup != null)
              _Row('Item Group', detail.productItemGroup!),
            if (detail.serialNumber != null)
              _Row('Serial No.', detail.serialNumber!),
            if (detail.serialDefaced != null)
              _Row(
                'Serial Defaced',
                detail.isSerialDefaced ? 'Yes' : 'No',
                valueColor: detail.isSerialDefaced
                    ? const Color(0xFFC62828)
                    : null,
              ),
            if (detail.isSerialDefaced && detail.serialDefacedNote != null)
              _Row('Defaced Note', detail.serialDefacedNote!, multiline: true),
          ],
        ),
        const SizedBox(height: 10),
        _SectionCard(
          title: 'Complaint Details',
          icon: Icons.report_problem_outlined,
          rows: [
            if (detail.complaintTypeName != null)
              _Row('Type', detail.complaintTypeName!),
            if (detail.complaintSourceName != null)
              _Row('Source', detail.complaintSourceName!),
            if (detail.sourcePersonName != null)
              _Row('Source Person', detail.sourcePersonName!),
            if (detail.description != null)
              _Row('Description', detail.description!, multiline: true),
          ],
        ),
        const SizedBox(height: 10),
        _SectionCard(
          title: 'Warranty & Purchase',
          icon: Icons.verified_outlined,
          rows: [
            if (detail.warrantyStatus != null)
              _Row(
                'Warranty',
                detail.warrantyLabel,
                valueColor: detail.isInWarranty
                    ? const Color(0xFF2E7D32)
                    : const Color(0xFFC62828),
              ),
            if (detail.dateOfPurchase != null)
              _Row('Date of Purchase', _fmtDate(detail.dateOfPurchase!)),
          ],
        ),
        const SizedBox(height: 10),
        _SectionCard(
          title: 'Record Info',
          icon: Icons.info_outline,
          rows: [
            _Row('Complaint No.', detail.complaintNo),
            if (detail.createdAt != null)
              _Row('Registered On', _fmtDateTime(detail.createdAt!)),
            if (detail.createdBy != null)
              _Row('Registered By', detail.createdBy!),
          ],
        ),
      ],
    );
  }

  String _fmtDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')} ${_month(d.month)} ${d.year}';

  String _fmtDateTime(DateTime d) =>
      '${_fmtDate(d)}  ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';

  String _month(int m) => const [
        '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ][m];
}

// ─────────────────────────────────────────────────────────────────────────────
// Header card — consumer name + phone + warranty badge
// ─────────────────────────────────────────────────────────────────────────────

class _HeaderCard extends StatelessWidget {
  final AftersalesRegistrationDetail detail;
  const _HeaderCard({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.consumerName ?? '—',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                if (detail.consumerPhone != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    detail.consumerPhone!,
                    style: const TextStyle(fontSize: 13, color: kTextMuted),
                  ),
                ],
                if (detail.consumerRegion != null) ...[
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 13,
                        color: kTextMuted,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        [
                          detail.consumerRegion,
                          detail.consumerZone,
                          detail.consumerArea,
                        ].where((s) => s != null).join(', '),
                        style: const TextStyle(
                          fontSize: 12,
                          color: kTextMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (detail.warrantyStatus != null) _WarrantyBadge(detail: detail),
        ],
      ),
    );
  }
}

class _WarrantyBadge extends StatelessWidget {
  final AftersalesRegistrationDetail detail;
  const _WarrantyBadge({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: detail.isInWarranty
            ? const Color(0xFFE8F5E9)
            : const Color(0xFFFFEBEE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        detail.warrantyLabel,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: detail.isInWarranty
              ? const Color(0xFF2E7D32)
              : const Color(0xFFC62828),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Error body
// ─────────────────────────────────────────────────────────────────────────────

class _ErrorBody extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorBody({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off_outlined, size: 48, color: kTextMuted),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kTextMuted),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              style: FilledButton.styleFrom(backgroundColor: kSecondaryColor),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared section card + row widgets
// ─────────────────────────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<_Row> rows;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) return const SizedBox.shrink();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: kSecondaryColor),
                const SizedBox(width: 6),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
            ...rows,
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  final bool multiline;
  final Color? valueColor;

  const _Row(
    this.label,
    this.value, {
    this.multiline = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: multiline
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: kTextMuted),
                ),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 13)),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 12, color: kTextMuted),
                  ),
                ),
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: valueColor,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
