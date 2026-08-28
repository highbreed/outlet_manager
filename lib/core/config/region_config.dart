/// Data class holding all region-specific configuration values.
class RegionConfig {
  final String code;
  final String countryCode;
  final String host;
  final String stagingHost;
  final double vatRate; // decimal fraction, e.g. 0.16 for 16%
  final String currency;
  final String taxPinName;
  final String taxPinValue;
  final String phonePrefix;
  final String phoneRegex;
  final String phoneValidationMessage;
  final String telephone;
  final String email;
  final String poBox;
  final String companyName;
  final bool loyaltyProgramEnabled;
  final String fiscalUnitType; // "SCU" for Kenya/Rwanda, "FDN" for Uganda
  final String imageNamespace; // S3 namespace for product images

  const RegionConfig({
    required this.code,
    required this.countryCode,
    required this.host,
    required this.stagingHost,
    required this.vatRate,
    required this.currency,
    required this.taxPinName,
    required this.taxPinValue,
    required this.phonePrefix,
    required this.phoneRegex,
    required this.phoneValidationMessage,
    required this.telephone,
    required this.email,
    required this.poBox,
    required this.companyName,
    this.loyaltyProgramEnabled = false,
    required this.fiscalUnitType,
    this.imageNamespace = 'mikaimgs',
  });
}

/// Registry of all supported regions.
class Regions {
  static const kenya = RegionConfig(
    code: 'KENYA',
    countryCode: 'KE',
    host: 'api-ke.mikaappliances.com',
    stagingHost: 'api-ke-staging.mikaappliances.com',
    vatRate: 0.16,
    currency: 'KES',
    taxPinName: 'KRA PIN',
    taxPinValue: '',
    phonePrefix: '+254',
    phoneRegex: r'^(?:\+254|254)?(?:1\d{8}|7\d{8})$',
    phoneValidationMessage: 'Please enter a valid Kenyan phone number',
    telephone: '',
    email: '',
    poBox: '',
    companyName: 'MIKA TRADING COMPANY LIMITED',
    fiscalUnitType: 'SCU',
  );

  static const rwanda = RegionConfig(
    code: 'RWANDA',
    countryCode: 'RW',
    host: 'api-rw.mikaappliances.com',
    stagingHost: 'api-rw-staging.mikaappliances.com',
    vatRate: 0.18,
    currency: 'RWF',
    taxPinName: 'TIN',
    taxPinValue: '',
    phonePrefix: '+250',
    phoneRegex: r'^(?:\+250|250)?7\d{8}$',
    phoneValidationMessage: 'Please enter a valid Rwandan phone number',
    telephone: '',
    email: '',
    poBox: '',
    companyName: 'MIKA LIMITED',
    fiscalUnitType: 'SCU',
  );

  // To add a new region, add a const entry here. No changes needed elsewhere.

  static RegionConfig resolve(String code) => switch (code.toUpperCase()) {
    'RW' || 'RWANDA' => rwanda,
    _ => kenya,
  };
}
