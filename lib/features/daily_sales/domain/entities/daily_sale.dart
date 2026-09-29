import 'package:freezed_annotation/freezed_annotation.dart';

import 'daily_sale_item.dart';
import 'daily_sale_status.dart';

part 'daily_sale.freezed.dart';

/// An in-store sale registered by a sales agent at an outlet.
///
/// Created as [DailySaleStatus.pending] via a barcode-scanned cart, then
/// moved to [DailySaleStatus.confirmed] once every unit's serial number is
/// scanned at payment, or to [DailySaleStatus.cancelled] if the customer
/// backs out. Both `confirmed` and `cancelled` are terminal.
@freezed
abstract class DailySale with _$DailySale {
  const factory DailySale({
    required int id,
    required int outletId,
    required int userId,
    required String customerName,
    String? customerPhone,

    /// Kept as returned by the API (decimal string, e.g. "45000.00").
    required String totalAmount,

    /// Total unit count across all items (not line count).
    required int totalItems,
    required DateTime saleDate,
    required DailySaleStatus status,
    @Default(<DailySaleItem>[]) List<DailySaleItem> items,
    DateTime? createdAt,
    DateTime? updatedAt,

    /// Server-side path to the uploaded proof-of-purchase file, present
    /// once the sale has been confirmed with a photo attached.
    String? proofOfPurchasePath,
  }) = _DailySale;

  const DailySale._();

  double get totalAmountValue => double.tryParse(totalAmount) ?? 0;

  bool get isPending => status == DailySaleStatus.pending;

  bool get isConfirmed => status == DailySaleStatus.confirmed;

  bool get isCancelled => status == DailySaleStatus.cancelled;

  /// Whether the sale is ready to confirm (every item has its full set of
  /// serial numbers scanned).
  bool get isReadyToConfirm =>
      items.isNotEmpty && items.every((item) => item.isFullySerialized);
}
