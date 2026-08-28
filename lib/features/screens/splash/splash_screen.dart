import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import 'widgets/widgets.dart';

/// Initial splash screen shown while app initializes.
///
/// Must NOT request the location permission itself — the OS prompt has to
/// appear only after the user sees the disclosure on `/location-permission`
/// (Play Store background-location policy requirement). Permission status is
/// only *checked* (never requested) via [locationPermissionStatusProvider],
/// which router_provider.dart uses to redirect here when needed.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    developer.log('🚀 Splash screen initialized', name: 'Splash');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: SplashContent()));
  }
}
