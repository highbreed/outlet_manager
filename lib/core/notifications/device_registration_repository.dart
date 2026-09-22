import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../device/device_fingerprint.dart';

class DeviceRegistrationRepository {
  static const _fingerprintKey = 'device_fingerprint';

  final Dio _dio;

  DeviceRegistrationRepository({required Dio dio}) : _dio = dio;

  Future<void> registerDevice(String fcmToken) async {
    try {
      final fingerprint = await _getOrCreateFingerprint();
      await _dio.post(
        '/notifications/devices',
        data: {
          'platform': Platform.isIOS ? 'ios' : 'android',
          'push_token': fcmToken,
          'device_fingerprint': fingerprint,
        },
      );
      developer.log('[FCM] Device registered');
    } on DioException catch (e) {
      developer.log('[FCM] Device registration failed: ${e.message}');
    } catch (e) {
      developer.log('[FCM] Device registration failed: $e');
    }
  }

  Future<void> deregisterDevice() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final fingerprint = prefs.getString(_fingerprintKey);
      if (fingerprint == null) return;
      await _dio.delete('/notifications/devices/$fingerprint');
      developer.log('[FCM] Device deregistered');
    } on DioException catch (e) {
      developer.log('[FCM] Device deregistration failed: ${e.message}');
    } catch (e) {
      developer.log('[FCM] Device deregistration failed: $e');
    }
  }

  Future<String> _getOrCreateFingerprint() => DeviceFingerprint.getOrCreate();
}
