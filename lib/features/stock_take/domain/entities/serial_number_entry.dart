import 'package:freezed_annotation/freezed_annotation.dart';

part 'serial_number_entry.freezed.dart';

/// Serial validation status
enum SerialStatus {
  valid,
  duplicate,
  duplicateCrossItem,
  invalid,
  pendingValidation,
}

/// Domain entity for serial number entry
@freezed
abstract class SerialNumberEntry with _$SerialNumberEntry {
  const factory SerialNumberEntry({
    required String localId,
    int? serverId,
    required String sessionLocalId,
    required String itemLocalId,
    required String serialNumberRaw,
    required String serialNumberNorm,
    required String deviceScanId,
    required DateTime deviceScannedAt,
    int? scanSequence,
    required SerialStatus status,
    String? validationError,
    required DateTime scannedAt,
  }) = _SerialNumberEntry;

  const SerialNumberEntry._();

  /// Display-friendly serial number (uses raw)
  String get displaySerial => serialNumberRaw;

  bool get isValid => status == SerialStatus.valid;
  bool get isDuplicate =>
      status == SerialStatus.duplicate ||
      status == SerialStatus.duplicateCrossItem;
  bool get isInvalid => status == SerialStatus.invalid;
  bool get isPending => status == SerialStatus.pendingValidation;

  String get statusDisplayName {
    switch (status) {
      case SerialStatus.valid:
        return 'Valid';
      case SerialStatus.duplicate:
        return 'Duplicate';
      case SerialStatus.duplicateCrossItem:
        return 'Duplicate (Different Product)';
      case SerialStatus.invalid:
        return 'Invalid';
      case SerialStatus.pendingValidation:
        return 'Pending Validation';
    }
  }

  String? get errorMessage {
    if (validationError != null) return validationError;
    if (isDuplicate) return 'Serial number already scanned';
    if (isInvalid) return 'Invalid serial number format';
    return null;
  }
}
