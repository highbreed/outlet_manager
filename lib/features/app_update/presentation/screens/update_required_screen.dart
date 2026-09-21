import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/utils/assets.dart';
import '../../data/app_version_info.dart';
import '../providers/app_update_providers.dart';

/// Full-screen block shown in place of the whole app when the backend
/// reports this build is no longer supported (§03 of the version-gate
/// contract) — replaces `OutletManagerApp`'s router entirely, so there is
/// no way to navigate around it back into the app.
class UpdateRequiredScreen extends ConsumerStatefulWidget {
  final AppVersionInfo info;

  const UpdateRequiredScreen({super.key, required this.info});

  @override
  ConsumerState<UpdateRequiredScreen> createState() =>
      _UpdateRequiredScreenState();
}

class _UpdateRequiredScreenState extends ConsumerState<UpdateRequiredScreen> {
  bool _opening = false;
  bool _checking = false;

  Future<String?> _resolveStoreUrl() async {
    if (widget.info.updateUrl != null) return widget.info.updateUrl;
    if (Platform.isAndroid) {
      final packageInfo = await PackageInfo.fromPlatform();
      return 'https://play.google.com/store/apps/details?id=${packageInfo.packageName}';
    }
    // No reliable App Store fallback without a numeric app ID from the
    // backend — don't guess a URL that might point at the wrong app.
    return null;
  }

  Future<void> _handleUpdatePressed() async {
    setState(() => _opening = true);
    try {
      final url = await _resolveStoreUrl();
      if (url == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please update from the App Store to continue.'),
            ),
          );
        }
        return;
      }
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } finally {
      if (mounted) setState(() => _opening = false);
    }
  }

  Future<void> _handleCheckAgain() async {
    setState(() => _checking = true);
    ref.invalidate(appVersionCheckProvider);
    // Give the interceptor-driven signal a chance too — if the user updated
    // in the background and relaunched, this re-evaluates on the next frame
    // once the poll resolves.
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (mounted) setState(() => _checking = false);
  }

  @override
  Widget build(BuildContext context) {
    final info = widget.info;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kBackground,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.logoBlack,
                    height: 72,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.store,
                      size: 56,
                      color: kSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      color: kWarningBg,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.system_update_outlined,
                      color: kWarningColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Update Required',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kTextDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    info.message ??
                        'Your app version is no longer supported. '
                            'Please update to continue.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: kTextMuted),
                  ),
                  if (info.currentVersion != null ||
                      info.minimumSupportedVersion != null) ...[
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryLightColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Installed: ${info.currentVersion ?? '—'}   '
                        'Required: ${info.minimumSupportedVersion ?? '—'}+',
                        style: const TextStyle(
                          fontSize: 12,
                          color: kSecondaryColor,
                          fontFeatures: [FontFeature.tabularFigures()],
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _opening ? null : _handleUpdatePressed,
                      child: _opening
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Update Now'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: _checking ? null : _handleCheckAgain,
                    child: Text(
                      _checking ? 'Checking…' : 'I\'ve already updated',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
