import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'region_config.dart';

export 'region_config.dart';

enum Environment { dev, staging, prod }

class AppConfig {
  static late Environment environment;
  static late String apiBaseUrl;
  static late String appVersion;
  static late Uint8List? pinnedCertificate;

  /// Resolved at compile time via --dart-define=APP_REGION=ke|rw
  static final RegionConfig region = Regions.resolve(
    const String.fromEnvironment('APP_REGION', defaultValue: 'ke'),
  );

  static Future<void> initialize(Environment env) async {
    environment = env;

    pinnedCertificate = null;
    switch (env) {
      case Environment.dev:
        apiBaseUrl = 'http://192.168.1.18:8002/api/v1';
      case Environment.staging:
        apiBaseUrl = 'https://${region.stagingHost}/api/v1';
      case Environment.prod:
        apiBaseUrl = 'https://${region.host}/api/v1';
    }

    final packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  }

  // ── Environment helpers ────────────────────────────────────────────────────

  static bool get isDev => environment == Environment.dev;
  static bool get isStaging => environment == Environment.staging;
  static bool get isProd => environment == Environment.prod;
  static bool get isProduction => isProd;

  static String get platform => Platform.isIOS ? 'ios' : 'android';

  // ── Region helpers ─────────────────────────────────────────────────────────

  static bool get isKenya => region.code == 'KENYA';
  static bool get isRwanda => region.code == 'RWANDA';

  /// VAT rate as a percentage value, e.g. 16.0 for 16%.
  static double get defaultVatPercent => region.vatRate * 100;

  static String get defaultCurrency => region.currency;
  static String get taxPinName => region.taxPinName;
  static String get taxPinValue => region.taxPinValue;
  static String get regionPhonePrefix => region.phonePrefix;
  static String get regionName => region.companyName;

  // ── Certificate pinning ────────────────────────────────────────────────────
}
