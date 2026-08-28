class AftersalesRegistrationListItem {
  final int docEntry;
  final String complaintNo;
  final String? consumerName;
  final String? consumerPhone;
  final String? consumerRegion;
  final String? consumerZone;
  final String? consumerArea;
  final String? productCode;
  final String? productModelNo;
  final String? serialNumber;
  final String? warrantyStatus;
  final String? description;
  final String? complaintTypeName;
  final String? complaintSourceName;
  final String? sourcePersonName;
  final DateTime? createdAt;
  final String? createdBy;

  const AftersalesRegistrationListItem({
    required this.docEntry,
    required this.complaintNo,
    this.consumerName,
    this.consumerPhone,
    this.consumerRegion,
    this.consumerZone,
    this.consumerArea,
    this.productCode,
    this.productModelNo,
    this.serialNumber,
    this.warrantyStatus,
    this.description,
    this.complaintTypeName,
    this.complaintSourceName,
    this.sourcePersonName,
    this.createdAt,
    this.createdBy,
  });

  factory AftersalesRegistrationListItem.fromJson(Map<String, dynamic> json) {
    return AftersalesRegistrationListItem(
      docEntry: json['doc_entry'] as int,
      complaintNo: json['complaint_no'] as String? ?? '',
      consumerName: json['consumer_name'] as String?,
      consumerPhone: json['consumer_phone'] as String?,
      consumerRegion: json['consumer_region'] as String?,
      consumerZone: json['consumer_zone'] as String?,
      consumerArea: json['consumer_area'] as String?,
      productCode: json['product_code'] as String?,
      productModelNo: json['product_model_no'] as String?,
      serialNumber: json['serial_number'] as String?,
      warrantyStatus: json['warranty_status'] as String?,
      description: json['description'] as String?,
      complaintTypeName: json['complaint_type_name'] as String?,
      complaintSourceName: json['complaint_source_name'] as String?,
      sourcePersonName: json['source_person_name'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      createdBy: json['created_by'] as String?,
    );
  }

  /// Normalized warranty label from raw HANA string.
  String get warrantyLabel {
    final v = warrantyStatus?.toLowerCase() ?? '';
    if (v.contains('in') && v.contains('warranty')) return 'In Warranty';
    if (v.contains('out')) return 'Out of Warranty';
    return warrantyStatus ?? '—';
  }

  bool get isInWarranty {
    final v = warrantyStatus?.toLowerCase() ?? '';
    return v.contains('in') && v.contains('warranty');
  }

  String get displayProduct => productModelNo ?? productCode ?? '—';
}
