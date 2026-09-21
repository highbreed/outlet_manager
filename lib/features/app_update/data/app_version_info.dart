/// Backend's view of whether this app build is still supported.
///
/// Populated either from a `GET /app/version` poll (§02 of the version-gate
/// contract) or from a 426 `upgrade_required` error body encountered on any
/// other request (§03) — both shapes carry the same fields, so both are
/// normalized into this one type.
class AppVersionInfo {
  final String? platform;
  final String? currentVersion;
  final String? minimumSupportedVersion;
  final String? latestVersion;
  final bool updateRequired;
  final bool updateRecommended;
  final String? updateUrl;
  final bool enforced;

  /// Only present when this came from a 426 error body — the poll response
  /// doesn't include one, so callers fall back to a generic message.
  final String? message;

  const AppVersionInfo({
    this.platform,
    this.currentVersion,
    this.minimumSupportedVersion,
    this.latestVersion,
    required this.updateRequired,
    required this.updateRecommended,
    this.updateUrl,
    required this.enforced,
    this.message,
  });

  factory AppVersionInfo.fromJson(Map<String, dynamic> json) {
    return AppVersionInfo(
      platform: json['platform'] as String?,
      currentVersion: json['current_version'] as String?,
      minimumSupportedVersion: json['minimum_supported_version'] as String?,
      latestVersion: json['latest_version'] as String?,
      updateRequired: json['update_required'] as bool? ?? false,
      updateRecommended: json['update_recommended'] as bool? ?? false,
      updateUrl: json['update_url'] as String?,
      enforced: json['enforced'] as bool? ?? false,
    );
  }

  /// The `error` object inside a 426 `{"error": {...}}` body (§03). A 426
  /// always means blocked, regardless of what the last poll said.
  factory AppVersionInfo.fromUpgradeRequiredError(Map<String, dynamic> error) {
    return AppVersionInfo(
      platform: error['platform'] as String?,
      currentVersion: error['current_version'] as String?,
      minimumSupportedVersion: error['minimum_supported_version'] as String?,
      latestVersion: error['latest_version'] as String?,
      updateRequired: true,
      updateRecommended: true,
      updateUrl: error['update_url'] as String?,
      enforced: true,
      message: error['message'] as String?,
    );
  }
}
