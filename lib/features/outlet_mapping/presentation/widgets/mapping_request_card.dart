import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../daily_route/domain/entities/outlet_visit.dart';
import '../../domain/entities/mapping_enums.dart';
import '../../outlet_mapping_gate.dart';
import '../../providers/mapping_session_notifier.dart';
import '../screens/outlet_mapping_capture_screen.dart';

/// Shown on `ActiveVisitScreen` whenever the visit has a mapping request
/// (spec §21/§43) or a local session is in flight for it. Reflects
/// background/upload state so the employee never forgets a capture is
/// still running (spec §91) — this is a live, `ref.watch`-driven card, not
/// a static banner.
class MappingRequestCard extends ConsumerWidget {
  final OutletVisit visit;

  const MappingRequestCard({super.key, required this.visit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(mappingSessionNotifierProvider);
    final session = uiState.session;
    final belongsToThisVisit = session != null && session.visitLocalId == visit.localId;

    // No local session for this visit yet — fall back to the
    // backend-reported mapping_request from the last visit/route fetch
    // (spec §J's merge rule: local session wins once it exists).
    if (!belongsToThisVisit) {
      final request = visit.mappingRequest;
      if (request == null || !request.isOfferable) return const SizedBox.shrink();
      return _Card(
        icon: Icons.location_searching,
        iconColor: kWarningText,
        title: 'Outlet Mapping Required',
        subtitle: 'This outlet needs to be mapped so attendance can use the correct working area.',
        actionLabel: 'Map Outlet',
        onAction: () => startOutletMapping(context, visit),
      );
    }

    switch (session.localState) {
      case MappingLocalState.idle:
      case MappingLocalState.preparing:
        return const SizedBox.shrink();

      case MappingLocalState.capturing:
        return _Card(
          icon: Icons.location_on,
          iconColor: kSuccessText,
          title: 'Outlet Mapping In Progress',
          subtitle: '${uiState.localSampleCount} readings captured'
              '${uiState.pendingUploadCount > 0 ? ' • ${uiState.pendingUploadCount} waiting to upload' : ''}',
          actionLabel: 'Resume Mapping',
          onAction: () => Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (_) => OutletMappingCaptureScreen(visit: visit)),
          ),
        );

      case MappingLocalState.captureFinishedLocal:
      case MappingLocalState.uploadPending:
      case MappingLocalState.submitting:
      case MappingLocalState.finishResultUnknown:
        return _Card(
          icon: Icons.cloud_upload_outlined,
          iconColor: kWarningText,
          title: 'Mapping Saved',
          subtitle: uiState.pendingUploadCount > 0
              ? '${uiState.pendingUploadCount} readings waiting to upload'
              : 'Submitting for review…',
        );

      case MappingLocalState.pendingReview:
        return const _Card(
          icon: Icons.check_circle_outline,
          iconColor: kSuccessText,
          title: 'Mapping Submitted',
          subtitle: 'Waiting for review.',
        );

      case MappingLocalState.captureFailed:
      case MappingLocalState.abandoned:
        return _Card(
          icon: Icons.warning_amber_outlined,
          iconColor: kRedColor,
          title: 'Mapping Needs Retrying',
          subtitle: session.failureCode?.displayMessage ?? session.failureMessage ?? '',
          actionLabel: 'Map Again',
          onAction: () => startOutletMapping(context, visit),
        );

      case MappingLocalState.abandoning:
      case MappingLocalState.cancelled:
        return const SizedBox.shrink();
    }
  }
}

class _Card extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _Card({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: AppCard(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: iconColor, size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    const SizedBox(height: 2),
                    Text(subtitle, style: const TextStyle(fontSize: 12, color: kTextMuted)),
                    if (actionLabel != null && onAction != null) ...[
                      const SizedBox(height: 10),
                      SecondaryButton(label: actionLabel!, onPressed: onAction, expand: false),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
