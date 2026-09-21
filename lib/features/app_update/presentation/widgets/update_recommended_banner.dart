import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/colors.dart';
import '../providers/app_update_providers.dart';

/// Soft, dismissible nudge shown app-wide when a newer build is available
/// but not yet enforced (`update_recommended`, §02 of the version-gate
/// contract) — never blocks anything, unlike [UpdateRequiredScreen].
class UpdateRecommendedBanner extends ConsumerStatefulWidget {
  final Widget child;

  const UpdateRecommendedBanner({super.key, required this.child});

  @override
  ConsumerState<UpdateRecommendedBanner> createState() =>
      _UpdateRecommendedBannerState();
}

class _UpdateRecommendedBannerState
    extends ConsumerState<UpdateRecommendedBanner> {
  bool _dismissed = false;

  Future<void> _openStore(String? updateUrl) async {
    var url = updateUrl;
    if (url == null && Platform.isAndroid) {
      final packageInfo = await PackageInfo.fromPlatform();
      url =
          'https://play.google.com/store/apps/details?id=${packageInfo.packageName}';
    }
    if (url == null) return;
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final poll = ref.watch(appVersionCheckProvider);
    final show = !_dismissed &&
        poll.maybeWhen(
          data: (info) => info.updateRecommended && !info.updateRequired,
          orElse: () => false,
        );
    final updateUrl = poll.maybeWhen(
      data: (info) => info.updateUrl,
      orElse: () => null,
    );

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: show ? 40 : 0,
          child: Material(
            color: kWarningBg,
            child: InkWell(
              onTap: show ? () => _openStore(updateUrl) : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.system_update_outlined,
                      size: 16,
                      color: kWarningText,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'A new version is available. Tap to update.',
                        style: TextStyle(color: kWarningText, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() => _dismissed = true),
                      child: const Icon(
                        Icons.close,
                        size: 16,
                        color: kWarningText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(child: widget.child),
      ],
    );
  }
}
