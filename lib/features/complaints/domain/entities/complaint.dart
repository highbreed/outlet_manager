enum ComplaintStatus {
  open,
  inProgress,
  resolved,
  closed,
  cancelled,
}

extension ComplaintStatusX on ComplaintStatus {
  String get label {
    switch (this) {
      case ComplaintStatus.open:
        return 'Open';
      case ComplaintStatus.inProgress:
        return 'In Progress';
      case ComplaintStatus.resolved:
        return 'Resolved';
      case ComplaintStatus.closed:
        return 'Closed';
      case ComplaintStatus.cancelled:
        return 'Cancelled';
    }
  }

  static ComplaintStatus fromString(String value) {
    switch (value.toLowerCase().replaceAll(' ', '_').replaceAll('-', '_')) {
      case 'in_progress':
      case 'inprogress':
        return ComplaintStatus.inProgress;
      case 'resolved':
        return ComplaintStatus.resolved;
      case 'closed':
        return ComplaintStatus.closed;
      case 'cancelled':
      case 'canceled':
        return ComplaintStatus.cancelled;
      default:
        return ComplaintStatus.open;
    }
  }
}

enum WarrantyStatus { inWarranty, outOfWarranty }

extension WarrantyStatusX on WarrantyStatus {
  String get label =>
      this == WarrantyStatus.inWarranty ? 'In Warranty' : 'Out of Warranty';
}

/// Single progress update on a complaint (timeline entry).
class ComplaintProgressLine {
  final DateTime date;
  final String status;
  final String? statusSub;
  final String? updatedBy;

  const ComplaintProgressLine({
    required this.date,
    required this.status,
    this.statusSub,
    this.updatedBy,
  });
}

/// Product movement/collection record attached to a complaint.
class ComplaintMovementLine {
  final String collectionNo;
  final String movementType;
  final String? packagingCondition;
  final String? damageDetails;
  final DateTime createdAt;

  const ComplaintMovementLine({
    required this.collectionNo,
    required this.movementType,
    this.packagingCondition,
    this.damageDetails,
    required this.createdAt,
  });
}

/// Core complaint entity.
class Complaint {
  final String localId;
  final int? serverId;
  final String complaintNo;

  // Consumer info
  final String consumerName;
  final String consumerPhone;
  final String? consumerRegion;
  final String? consumerZone;
  final String? consumerArea;
  final String? consumerAddress;

  // Product info
  final String productCode;
  final String productName;
  final String? productBrand;
  final String? productModelNo;
  final String serialNumber;
  final bool serialDefaced;
  final String? serialDefacedNote;
  final DateTime? dateOfPurchase;
  final WarrantyStatus warrantyStatus;

  // Complaint info
  final String description;
  final int? complaintTypeId;
  final String? complaintTypeName;
  final int? complaintSourceId;
  final String? complaintSourceName;
  final String? sourcePersonName;
  final String? sourcePersonCode;

  final ComplaintStatus status;
  final List<ComplaintProgressLine> progressLines;
  final List<ComplaintMovementLine> movementLines;

  final DateTime createdAt;
  final DateTime updatedAt;

  const Complaint({
    required this.localId,
    this.serverId,
    required this.complaintNo,
    required this.consumerName,
    required this.consumerPhone,
    this.consumerRegion,
    this.consumerZone,
    this.consumerArea,
    this.consumerAddress,
    required this.productCode,
    required this.productName,
    this.productBrand,
    this.productModelNo,
    required this.serialNumber,
    this.serialDefaced = false,
    this.serialDefacedNote,
    this.dateOfPurchase,
    this.warrantyStatus = WarrantyStatus.outOfWarranty,
    required this.description,
    this.complaintTypeId,
    this.complaintTypeName,
    this.complaintSourceId,
    this.complaintSourceName,
    this.sourcePersonName,
    this.sourcePersonCode,
    this.status = ComplaintStatus.open,
    this.progressLines = const [],
    this.movementLines = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  String get displayProduct =>
      [productBrand, productModelNo].where((s) => s != null && s.isNotEmpty).join(' ').trim().isEmpty
          ? productName
          : [productBrand, productModelNo].where((s) => s != null && s.isNotEmpty).join(' ');

  Complaint copyWith({
    ComplaintStatus? status,
    List<ComplaintProgressLine>? progressLines,
    List<ComplaintMovementLine>? movementLines,
    int? serverId,
  }) => Complaint(
    localId: localId,
    serverId: serverId ?? this.serverId,
    complaintNo: complaintNo,
    consumerName: consumerName,
    consumerPhone: consumerPhone,
    consumerRegion: consumerRegion,
    consumerZone: consumerZone,
    consumerArea: consumerArea,
    consumerAddress: consumerAddress,
    productCode: productCode,
    productName: productName,
    productBrand: productBrand,
    productModelNo: productModelNo,
    serialNumber: serialNumber,
    serialDefaced: serialDefaced,
    serialDefacedNote: serialDefacedNote,
    dateOfPurchase: dateOfPurchase,
    warrantyStatus: warrantyStatus,
    description: description,
    complaintTypeId: complaintTypeId,
    complaintTypeName: complaintTypeName,
    complaintSourceId: complaintSourceId,
    complaintSourceName: complaintSourceName,
    sourcePersonName: sourcePersonName,
    sourcePersonCode: sourcePersonCode,
    status: status ?? this.status,
    progressLines: progressLines ?? this.progressLines,
    movementLines: movementLines ?? this.movementLines,
    createdAt: createdAt,
    updatedAt: DateTime.now(),
  );
}
