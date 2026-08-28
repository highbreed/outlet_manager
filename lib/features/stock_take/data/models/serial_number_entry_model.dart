import 'package:isar_community/isar.dart';
import 'stock_take_session_model.dart' show SyncState;

part 'serial_number_entry_model.g.dart';

/// Serial validation status
enum SerialStatus {
  valid, // Serial validated successfully
  duplicate, // Already scanned in this session (same item)
  duplicateCrossItem, // Scanned under different item
  invalid, // Failed validation
  pendingValidation, // Awaiting SAP check
}

/// Individual serial number entry within an item count
@collection
class SerialNumberEntryModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String localId; // UUID

  int? serverId; // Backend serial ID

  @Index()
  late String sessionLocalId; // FK to StockTakeSession

  @Index()
  late String itemLocalId; // FK to StockTakeItem

  late String serialNumberRaw; // Original input (preserves case)

  @Index(unique: true, composite: [CompositeIndex('sessionLocalId')])
  late String serialNumberNorm; // Normalized (uppercase) for uniqueness

  late String deviceScanId; // Unique scan ID from device
  late DateTime deviceScannedAt; // When scanned on device
  int? scanSequence; // Order within batch

  @Enumerated(EnumType.name)
  late SerialStatus status; // valid, duplicate, invalid, pending

  String? validationError;

  DateTime scannedAt = DateTime.now();

  @Index()
  @Enumerated(EnumType.name)
  late SyncState syncState;

  String? syncError;

  SerialNumberEntryModel();

  /// Create new local serial entry
  factory SerialNumberEntryModel.create({
    required String localId,
    required String sessionLocalId,
    required String itemLocalId,
    required String serialNumberRaw,
    required String serialNumberNorm,
    required String deviceScanId,
    required DateTime deviceScannedAt,
    int? scanSequence,
    SerialStatus status = SerialStatus.valid,
  }) {
    return SerialNumberEntryModel()
      ..localId = localId
      ..sessionLocalId = sessionLocalId
      ..itemLocalId = itemLocalId
      ..serialNumberRaw = serialNumberRaw
      ..serialNumberNorm = serialNumberNorm
      ..deviceScanId = deviceScanId
      ..deviceScannedAt = deviceScannedAt
      ..scanSequence = scanSequence
      ..status = status
      ..scannedAt = DateTime.now()
      ..syncState = SyncState.pending;
  }

  /// Create from API response
  factory SerialNumberEntryModel.fromJson(Map<String, dynamic> json) {
    final serialRaw = json['serial_number'] as String;
    return SerialNumberEntryModel()
      ..serverId = json['id'] as int
      ..localId = json['local_id'] as String? ?? ''
      ..serialNumberRaw = serialRaw
      ..serialNumberNorm = serialRaw.trim().toUpperCase()
      ..deviceScanId = json['device_scan_id'] as String? ?? ''
      ..deviceScannedAt = json['device_scanned_at'] != null
          ? DateTime.parse(json['device_scanned_at'] as String)
          : DateTime.now()
      ..scanSequence = json['scan_sequence'] as int?
      ..status = _parseStatus(json['status'] as String)
      ..validationError = json['validation_message'] as String?
      ..scannedAt = json['scanned_at'] != null
          ? DateTime.parse(json['scanned_at'] as String)
          : DateTime.now()
      ..syncState = SyncState.synced;
  }

  /// Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      if (serverId != null) 'id': serverId,
      'local_id': localId,
      'serial_number': serialNumberRaw,
      'device_scan_id': deviceScanId,
      'device_scanned_at': deviceScannedAt.toIso8601String(),
      if (scanSequence != null) 'scan_sequence': scanSequence,
    };
  }

  /// Parse backend status to mobile enum
  static SerialStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'valid':
        return SerialStatus.valid;
      case 'duplicate':
        return SerialStatus.duplicate;
      case 'duplicate_cross_item':
        return SerialStatus.duplicateCrossItem;
      case 'invalid':
        return SerialStatus.invalid;
      case 'pending_validation':
        return SerialStatus.pendingValidation;
      default:
        return SerialStatus.valid;
    }
  }

  /// Display-friendly serial number (uses raw)
  String get displaySerial => serialNumberRaw;

  bool get isValid => status == SerialStatus.valid;
  bool get isDuplicate =>
      status == SerialStatus.duplicate ||
      status == SerialStatus.duplicateCrossItem;
  bool get isInvalid => status == SerialStatus.invalid;
}
