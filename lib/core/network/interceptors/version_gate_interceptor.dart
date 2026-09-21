import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/app_update/data/app_version_info.dart';
import '../../../features/app_update/presentation/providers/app_update_providers.dart';

/// Watches for the backend's version gate (see app/core/version_gate.py):
/// once a platform's minimum-supported-version floor is enforced, any
/// request from a client below it gets a 426 `upgrade_required` instead of
/// its normal response — including login. This can happen on any endpoint
/// at any time (enforcement can be switched on mid-session), so it's
/// handled globally here rather than per-screen: flags
/// [upgradeRequiredProvider] the moment it's seen, and the app root reacts
/// by swapping the whole app for a blocking update screen.
class VersionGateInterceptor extends Interceptor {
  final Ref _ref;

  VersionGateInterceptor(this._ref);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 426) {
      final data = err.response?.data;
      final error = data is Map ? data['error'] : null;
      if (error is Map && error['type'] == 'upgrade_required') {
        _ref.read(upgradeRequiredProvider.notifier).state =
            AppVersionInfo.fromUpgradeRequiredError(
          Map<String, dynamic>.from(error),
        );
      }
    }
    handler.next(err);
  }
}
