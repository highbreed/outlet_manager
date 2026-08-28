class AftersalesRegistrationDetail {
  final int docEntry;
  final String complaintNo;
  final String? consumerName;
  final String? consumerPhone;
  final String? consumerRegion;
  final String? consumerZone;
  final String? consumerArea;
  final String? consumerAddress;
  final String? productCode;
  final String? productModelNo;
  final String? productItemGroup;
  final String? serialNumber;
  final String? serialDefaced;
  final String? serialDefacedNote;
  final DateTime? dateOfPurchase;
  final String? warrantyStatus;
  final String? description;
  final String? complaintTypeName;
  final String? complaintSourceName;
  final String? sourcePersonName;
  final DateTime? createdAt;
  final String? createdBy;

  const AftersalesRegistrationDetail({
    required this.docEntry,
    required this.complaintNo,
    this.consumerName,
    this.consumerPhone,
    this.consumerRegion,
    this.consumerZone,
    this.consumerArea,
    this.consumerAddress,
    this.productCode,
    this.productModelNo,
    this.productItemGroup,
    this.serialNumber,
    this.serialDefaced,
    this.serialDefacedNote,
    this.dateOfPurchase,
    this.warrantyStatus,
    this.description,
    this.complaintTypeName,
    this.complaintSourceName,
    this.sourcePersonName,
    this.createdAt,
    this.createdBy,
  });

  factory AftersalesRegistrationDetail.fromJson(Map<String, dynamic> json) {
    return AftersalesRegistrationDetail(
      docEntry: json['doc_entry'] as int,
      complaintNo: json['complaint_no'] as String? ?? '',
      consumerName: json['consumer_name'] as String?,
      consumerPhone: json['consumer_phone'] as String?,
      consumerRegion: json['consumer_region'] as String?,
      consumerZone: json['consumer_zone'] as String?,
      consumerArea: json['consumer_area'] as String?,
      consumerAddress: json['consumer_address'] as String?,
      productCode: json['product_code'] as String?,
      productModelNo: json['product_model_no'] as String?,
      productItemGroup: json['product_item_group'] as String?,
      serialNumber: json['serial_number'] as String?,
      serialDefaced: json['serial_defaced'] as String?,
      serialDefacedNote: json['serial_defaced_note'] as String?,
      dateOfPurchase: json['date_of_purchase'] != null
          ? DateTime.tryParse(json['date_of_purchase'] as String)
          : null,
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

  bool get isInWarranty =>
      warrantyStatus?.toLowerCase() == 'in_warranty';

  String get warrantyLabel =>
      isInWarranty ? 'In Warranty' : 'Out of Warranty';

  bool get isSerialDefaced =>
      serialDefaced?.toLowerCase() == 'yes';
}
