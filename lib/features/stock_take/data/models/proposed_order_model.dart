/// Refill strategy options for proposed order generation
enum RefillStrategy {
  toMax('to_max'),
  toMin('to_min'),
  average('average');

  final String value;
  const RefillStrategy(this.value);
}

/// Request model for generating a proposed order
class GenerateProposedOrderRequest {
  final RefillStrategy refillStrategy;
  final bool notifyOnComplete;
  final String? customerEmail;
  final bool autoSendEmail;

  const GenerateProposedOrderRequest({
    this.refillStrategy = RefillStrategy.toMax,
    this.notifyOnComplete = true,
    this.customerEmail,
    this.autoSendEmail = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'refill_strategy': refillStrategy.value,
      'notify_on_complete': notifyOnComplete,
      if (customerEmail != null) 'customer_email': customerEmail,
      'auto_send_email': autoSendEmail,
    };
  }
}

/// Response model for proposed order generation job
class ProposedOrderJobResponse {
  final String jobId;
  final String status;
  final int? estimatedDurationSeconds;
  final DateTime? startedAt;

  const ProposedOrderJobResponse({
    required this.jobId,
    required this.status,
    this.estimatedDurationSeconds,
    this.startedAt,
  });

  factory ProposedOrderJobResponse.fromJson(Map<String, dynamic> json) {
    return ProposedOrderJobResponse(
      jobId: json['job_id'] as String,
      status: json['status'] as String,
      estimatedDurationSeconds: json['estimated_duration_seconds'] as int?,
      startedAt: json['started_at'] != null
          ? DateTime.parse(json['started_at'] as String)
          : null,
    );
  }
}

/// Job status enum
enum ProposedOrderJobStatus {
  pending,
  processing,
  completed,
  failed,
  unknown;

  static ProposedOrderJobStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return ProposedOrderJobStatus.pending;
      case 'processing':
      case 'in_progress':
        return ProposedOrderJobStatus.processing;
      case 'completed':
      case 'success':
        return ProposedOrderJobStatus.completed;
      case 'failed':
      case 'error':
        return ProposedOrderJobStatus.failed;
      default:
        return ProposedOrderJobStatus.unknown;
    }
  }

  bool get isComplete =>
      this == ProposedOrderJobStatus.completed ||
      this == ProposedOrderJobStatus.failed;

  bool get isSuccess => this == ProposedOrderJobStatus.completed;
}

/// Response model for proposed order progress
class ProposedOrderProgressResponse {
  final String jobId;
  final String status;
  final Map<String, dynamic>? progress;
  final int? proposedOrderId;
  final String? quotationNumber;
  final int? quotationDocEntry;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final String? redirectUrl;
  final String? errorMessage;

  const ProposedOrderProgressResponse({
    required this.jobId,
    required this.status,
    this.progress,
    this.proposedOrderId,
    this.quotationNumber,
    this.quotationDocEntry,
    this.startedAt,
    this.completedAt,
    this.redirectUrl,
    this.errorMessage,
  });

  factory ProposedOrderProgressResponse.fromJson(Map<String, dynamic> json) {
    return ProposedOrderProgressResponse(
      jobId: json['job_id'] as String,
      status: json['status'] as String,
      progress: json['progress'] as Map<String, dynamic>?,
      proposedOrderId: json['proposed_order_id'] as int?,
      quotationNumber: json['quotation_number'] as String?,
      quotationDocEntry: json['quotation_doc_entry'] as int?,
      startedAt: json['started_at'] != null
          ? DateTime.parse(json['started_at'] as String)
          : null,
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : null,
      redirectUrl: json['redirect_url'] as String?,
      errorMessage: json['error_message'] as String?,
    );
  }

  ProposedOrderJobStatus get jobStatus =>
      ProposedOrderJobStatus.fromString(status);

  bool get isComplete => jobStatus.isComplete;
  bool get isSuccess => jobStatus.isSuccess;
  bool get hasFailed => jobStatus == ProposedOrderJobStatus.failed;
}

// ============================================================================
// Proposed Order Detail Models
// ============================================================================

/// Status of a proposed order
enum ProposedOrderStatus {
  draft,
  pending,
  approved,
  rejected,
  converted,
  expired,
  unknown;

  static ProposedOrderStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'draft':
        return ProposedOrderStatus.draft;
      case 'pending':
        return ProposedOrderStatus.pending;
      case 'approved':
        return ProposedOrderStatus.approved;
      case 'rejected':
        return ProposedOrderStatus.rejected;
      case 'converted':
        return ProposedOrderStatus.converted;
      case 'expired':
        return ProposedOrderStatus.expired;
      default:
        return ProposedOrderStatus.unknown;
    }
  }

  String get displayName {
    switch (this) {
      case ProposedOrderStatus.draft:
        return 'Draft';
      case ProposedOrderStatus.pending:
        return 'Pending';
      case ProposedOrderStatus.approved:
        return 'Approved';
      case ProposedOrderStatus.rejected:
        return 'Rejected';
      case ProposedOrderStatus.converted:
        return 'Converted to Order';
      case ProposedOrderStatus.expired:
        return 'Expired';
      case ProposedOrderStatus.unknown:
        return 'Unknown';
    }
  }
}

/// A line item in a proposed order
class ProposedOrderLineItem {
  final int id;
  final int proposedOrderId;
  final int? stockCountItemId;
  final String itemCode;
  final String itemName;
  final String? warehouseCode;
  final int currentStock;
  final int minStockLevel;
  final int maxStockLevel;
  final int proposedQuantity;
  final double unitPrice;
  final double lineTotal;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ProposedOrderLineItem({
    required this.id,
    required this.proposedOrderId,
    this.stockCountItemId,
    required this.itemCode,
    required this.itemName,
    this.warehouseCode,
    required this.currentStock,
    required this.minStockLevel,
    required this.maxStockLevel,
    required this.proposedQuantity,
    required this.unitPrice,
    required this.lineTotal,
    this.createdAt,
    this.updatedAt,
  });

  factory ProposedOrderLineItem.fromJson(Map<String, dynamic> json) {
    return ProposedOrderLineItem(
      id: json['id'] as int,
      proposedOrderId: json['proposed_order_id'] as int,
      stockCountItemId: json['stock_count_item_id'] as int?,
      itemCode: json['item_code'] as String,
      itemName: json['item_name'] as String,
      warehouseCode: json['warehouse_code'] as String?,
      currentStock: json['current_stock'] as int? ?? 0,
      minStockLevel: json['min_stock_level'] as int? ?? 0,
      maxStockLevel: json['max_stock_level'] as int? ?? 0,
      proposedQuantity: json['proposed_quantity'] as int? ?? 0,
      unitPrice: double.tryParse('${json['unit_price']}') ?? 0.0,
      lineTotal: double.tryParse('${json['line_total']}') ?? 0.0,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  /// Gap between max stock and current stock
  int get stockGap => maxStockLevel - currentStock;
}

/// Full proposed order detail response
/// Matches: GET /api/v1/visits/{visit_id}/proposed-order
class ProposedOrderDetail {
  final int id;
  final int outletVisitId;
  final int customerId;
  final int salesAgentId;
  final ProposedOrderStatus status;
  final String? refillStrategy;
  final String? jobId;
  final int totalItems;
  final int totalQuantity;
  final double estimatedTotal;
  final String currency;
  final String? quotationNumber;
  final int? quotationDocEntry;
  final String? quotationPdfUrl;
  final String? customerEmail;
  final DateTime? emailSentAt;
  final String? customerResponse;
  final DateTime? customerResponseAt;
  final String? notes;
  final List<ProposedOrderLineItem> items;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const ProposedOrderDetail({
    required this.id,
    required this.outletVisitId,
    required this.customerId,
    required this.salesAgentId,
    required this.status,
    this.refillStrategy,
    this.jobId,
    required this.totalItems,
    required this.totalQuantity,
    required this.estimatedTotal,
    required this.currency,
    this.quotationNumber,
    this.quotationDocEntry,
    this.quotationPdfUrl,
    this.customerEmail,
    this.emailSentAt,
    this.customerResponse,
    this.customerResponseAt,
    this.notes,
    required this.items,
    required this.createdAt,
    this.updatedAt,
  });

  factory ProposedOrderDetail.fromJson(Map<String, dynamic> json) {
    return ProposedOrderDetail(
      id: json['id'] as int,
      outletVisitId: json['outlet_visit_id'] as int,
      customerId: json['customer_id'] as int,
      salesAgentId: json['sales_agent_id'] as int,
      status: ProposedOrderStatus.fromString(
        json['status'] as String? ?? 'draft',
      ),
      refillStrategy: json['refill_strategy'] as String?,
      jobId: json['job_id'] as String?,
      totalItems: json['total_items'] as int? ?? 0,
      totalQuantity: json['total_quantity'] as int? ?? 0,
      estimatedTotal: double.tryParse('${json['estimated_total']}') ?? 0.0,
      currency: json['currency'] as String? ?? 'KES',
      quotationNumber: json['quotation_number'] as String?,
      quotationDocEntry: json['quotation_doc_entry'] as int?,
      quotationPdfUrl: json['quotation_pdf_url'] as String?,
      customerEmail: json['customer_email'] as String?,
      emailSentAt: json['email_sent_at'] != null
          ? DateTime.tryParse(json['email_sent_at'] as String)
          : null,
      customerResponse: json['customer_response'] as String?,
      customerResponseAt: json['customer_response_at'] != null
          ? DateTime.tryParse(json['customer_response_at'] as String)
          : null,
      notes: json['notes'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ProposedOrderLineItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
    );
  }

  /// Display label for the refill strategy
  String get refillStrategyLabel {
    switch (refillStrategy) {
      case 'to_max':
        return 'To Max';
      case 'to_min':
        return 'To Min';
      case 'average':
        return 'Average';
      default:
        return refillStrategy ?? 'Unknown';
    }
  }
}
