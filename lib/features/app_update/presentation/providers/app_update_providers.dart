import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../data/app_update_repository.dart';
import '../../data/app_version_info.dart';

final appUpdateRepositoryProvider = Provider<AppUpdateRepository>((ref) {
  return AppUpdateRepository(dio: ref.watch(dioProvider));
});

/// Polled once on app start (see [main.dart]'s `OutletManagerApp`). Left
/// unresolved/errored on a network failure so startup fails open — a device
/// that can't reach the backend yet shouldn't be permanently blocked from
/// opening the app; [VersionGateInterceptor] is the safety net once any
/// request does get through.
final appVersionCheckProvider = FutureProvider<AppVersionInfo>((ref) async {
  return ref.watch(appUpdateRepositoryProvider).checkVersion();
});

/// Set by [VersionGateInterceptor] the moment any request comes back 426
/// `upgrade_required` — this is the freshest signal (enforcement can be
/// switched on mid-session) and always wins over the startup poll below.
final upgradeRequiredProvider = StateProvider<AppVersionInfo?>((ref) => null);

/// Single source of truth the app root gates routing on: the 426 signal if
/// one has arrived, otherwise the startup poll if it came back
/// `update_required`, otherwise null (not blocked).
final effectiveUpdateBlockProvider = Provider<AppVersionInfo?>((ref) {
  final fromInterceptor = ref.watch(upgradeRequiredProvider);
  if (fromInterceptor != null) return fromInterceptor;

  final poll = ref.watch(appVersionCheckProvider);
  return poll.maybeWhen(
    data: (info) => info.updateRequired ? info : null,
    orElse: () => null,
  );
});
