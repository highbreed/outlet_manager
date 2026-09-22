import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// A stable per-install identifier, persisted once and reused everywhere a
/// `device_fingerprint` is needed (FCM device registration, minting the
/// device-scoped location-ping token). Same underlying storage key
/// `DeviceRegistrationRepository` already used, so both resolve to the same
/// value — no migration needed.
class DeviceFingerprint {
  static const _key = 'device_fingerprint';

  static Future<String> getOrCreate() async {
    final prefs = await SharedPreferences.getInstance();
    var fingerprint = prefs.getString(_key);
    if (fingerprint == null) {
      fingerprint = const Uuid().v4();
      await prefs.setString(_key, fingerprint);
    }
    return fingerprint;
  }
}
