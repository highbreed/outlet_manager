import 'package:flutter/material.dart';

import '../daily_route/domain/entities/outlet_visit.dart';
import 'presentation/screens/outlet_mapping_intro_screen.dart';

/// The one entry point `daily_route` screens should use (spec §9/§80,
/// mirrors `verifyBiometric()`'s role for the biometric feature) — no
/// mapping-internal types (Isar models, the notifier, the location
/// service) leak past this function.
///
/// Pushed on the ROOT `Navigator`, not through `GoRouter`'s route table —
/// the exact same reason `FaceVerificationScreen` is (see
/// `biometric_verification_gate.dart`'s doc comment): this is a long-lived
/// screen sitting under the router's frequently-firing `refreshListenable`,
/// which has already been confirmed on-device to orphan a `GoRouter.push()`
/// Completer in this exact codebase. The mapping session itself does NOT
/// live or die with this push, though (spec §18/§29) — it's owned by the
/// `keepAlive` `MappingSessionNotifier`, independent of whatever's
/// currently on screen.
Future<void> startOutletMapping(BuildContext context, OutletVisit visit) {
  return Navigator.of(context, rootNavigator: true).push<void>(
    MaterialPageRoute(
      builder: (_) => OutletMappingIntroScreen(visit: visit),
      fullscreenDialog: true,
    ),
  );
}
