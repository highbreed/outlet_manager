import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../theme/colors.dart';
import '../permissions/permissions.dart';
import '../providers/providers.dart';

/// Dialog to request a specific permission with rationale
class PermissionRequestDialog extends ConsumerWidget {
  final AppPermissionType permission;
  final String? customRationale;
  final VoidCallback? onGranted;
  final VoidCallback? onDenied;

  const PermissionRequestDialog({
    super.key,
    required this.permission,
    this.customRationale,
    this.onGranted,
    this.onDenied,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionService = ref.read(permissionServiceProvider);
    final rationale =
        customRationale ?? permissionService.getPermissionRationale(permission);

    return AlertDialog(
      title: Text(_getPermissionTitle(permission)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getPermissionIcon(permission), size: 48, color: kPrimaryColor),
          const SizedBox(height: 16),
          Text(rationale, textAlign: TextAlign.center),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onDenied?.call();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pop();

            final status = await _requestPermission(ref, permission);

            if (status.isGranted) {
              onGranted?.call();
            } else if (status.isPermanentlyDenied) {
              if (context.mounted) {
                _showSettingsDialog(context, ref);
              }
            } else {
              onDenied?.call();
            }
          },
          child: const Text('Grant Permission'),
        ),
      ],
    );
  }

  Future<PermissionStatus> _requestPermission(
    WidgetRef ref,
    AppPermissionType permission,
  ) async {
    final service = ref.read(permissionServiceProvider);

    switch (permission) {
      case AppPermissionType.location:
        final locationStatus = await service.requestLocationPermission();
        return service.locationToPermissionStatus(locationStatus);
      case AppPermissionType.camera:
        return await service.requestCameraPermission();
      case AppPermissionType.storage:
        return await service.requestStoragePermission();
      case AppPermissionType.notification:
        return await service.requestNotificationPermission();
      case AppPermissionType.photos:
        return await service.requestPhotosPermission();
    }
  }

  void _showSettingsDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
          'This permission has been permanently denied. '
          'Please enable it in app settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await ref.read(permissionServiceProvider).openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  String _getPermissionTitle(AppPermissionType permission) {
    switch (permission) {
      case AppPermissionType.location:
        return 'Location Permission';
      case AppPermissionType.camera:
        return 'Camera Permission';
      case AppPermissionType.storage:
        return 'Storage Permission';
      case AppPermissionType.notification:
        return 'Notification Permission';
      case AppPermissionType.photos:
        return 'Photos Permission';
    }
  }

  IconData _getPermissionIcon(AppPermissionType permission) {
    switch (permission) {
      case AppPermissionType.location:
        return Icons.location_on;
      case AppPermissionType.camera:
        return Icons.camera_alt;
      case AppPermissionType.storage:
        return Icons.storage;
      case AppPermissionType.notification:
        return Icons.notifications;
      case AppPermissionType.photos:
        return Icons.photo_library;
    }
  }
}

/// Widget to show permission status with request button
class PermissionStatusCard extends ConsumerWidget {
  final AppPermissionType permission;
  final VoidCallback? onPermissionGranted;

  const PermissionStatusCard({
    super.key,
    required this.permission,
    this.onPermissionGranted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<bool>(
      future: _checkPermission(ref, permission),
      builder: (context, snapshot) {
        final isGranted = snapshot.data ?? false;

        return Card(
          child: ListTile(
            leading: Icon(
              _getPermissionIcon(permission),
              color: isGranted ? Colors.green : Colors.orange,
            ),
            title: Text(_getPermissionTitle(permission)),
            subtitle: Text(isGranted ? 'Granted' : 'Not granted'),
            trailing: isGranted
                ? const Icon(Icons.check_circle, color: Colors.green)
                : ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => PermissionRequestDialog(
                          permission: permission,
                          onGranted: onPermissionGranted,
                        ),
                      );
                    },
                    child: const Text('Grant'),
                  ),
          ),
        );
      },
    );
  }

  Future<bool> _checkPermission(
    WidgetRef ref,
    AppPermissionType permission,
  ) async {
    final service = ref.read(permissionServiceProvider);

    switch (permission) {
      case AppPermissionType.location:
        return await service.hasLocationPermission();
      case AppPermissionType.camera:
        return await service.hasCameraPermission();
      case AppPermissionType.storage:
        return await service.hasStoragePermission();
      case AppPermissionType.notification:
        return await service.hasNotificationPermission();
      case AppPermissionType.photos:
        return await service.hasPhotosPermission();
    }
  }

  String _getPermissionTitle(AppPermissionType permission) {
    switch (permission) {
      case AppPermissionType.location:
        return 'Location';
      case AppPermissionType.camera:
        return 'Camera';
      case AppPermissionType.storage:
        return 'Storage';
      case AppPermissionType.notification:
        return 'Notifications';
      case AppPermissionType.photos:
        return 'Photos';
    }
  }

  IconData _getPermissionIcon(AppPermissionType permission) {
    switch (permission) {
      case AppPermissionType.location:
        return Icons.location_on;
      case AppPermissionType.camera:
        return Icons.camera_alt;
      case AppPermissionType.storage:
        return Icons.storage;
      case AppPermissionType.notification:
        return Icons.notifications;
      case AppPermissionType.photos:
        return Icons.photo_library;
    }
  }
}

/// Widget to check and request critical permissions on app start
class CriticalPermissionsChecker extends ConsumerWidget {
  final Widget child;
  final VoidCallback? onAllGranted;

  const CriticalPermissionsChecker({
    super.key,
    required this.child,
    this.onAllGranted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasAllPermissions = ref.watch(hasAllCriticalPermissionsProvider);

    return hasAllPermissions.when(
      data: (hasAll) {
        if (hasAll) {
          onAllGranted?.call();
          return child;
        }

        // Show permission request screen
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.security, size: 80, color: kPrimaryColor),
                  const SizedBox(height: 24),
                  const Text(
                    'Permissions Required',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'This app requires certain permissions to function properly. '
                    'Please grant the following permissions:',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  PermissionStatusCard(
                    permission: AppPermissionType.location,
                    onPermissionGranted: () {
                      ref.invalidate(hasAllCriticalPermissionsProvider);
                    },
                  ),
                  const SizedBox(height: 16),
                  PermissionStatusCard(
                    permission: AppPermissionType.notification,
                    onPermissionGranted: () {
                      ref.invalidate(hasAllCriticalPermissionsProvider);
                    },
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final service = ref.read(permissionServiceProvider);
                      await service.requestAllCriticalPermissions();
                      ref.invalidate(hasAllCriticalPermissionsProvider);
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Request All Permissions'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) => Scaffold(
        body: Center(child: Text('Error checking permissions: $error')),
      ),
    );
  }
}

/// Helper function to show permission request dialog
Future<void> showPermissionRequest(
  BuildContext context, {
  required AppPermissionType permission,
  String? customRationale,
  VoidCallback? onGranted,
  VoidCallback? onDenied,
}) async {
  return showDialog(
    context: context,
    builder: (context) => PermissionRequestDialog(
      permission: permission,
      customRationale: customRationale,
      onGranted: onGranted,
      onDenied: onDenied,
    ),
  );
}
