/// Lifecycle status of a daily sale.
///
/// `pending -> confirmed` (via confirm, serials scanned) or
/// `pending -> cancelled` (via cancel). Both are terminal.
enum DailySaleStatus { pending, confirmed, cancelled }

extension DailySaleStatusX on DailySaleStatus {
  String get apiValue => name;

  String get label {
    switch (this) {
      case DailySaleStatus.pending:
        return 'Pending';
      case DailySaleStatus.confirmed:
        return 'Confirmed';
      case DailySaleStatus.cancelled:
        return 'Cancelled';
    }
  }

  static DailySaleStatus fromApiValue(String value) {
    switch (value) {
      case 'confirmed':
        return DailySaleStatus.confirmed;
      case 'cancelled':
        return DailySaleStatus.cancelled;
      case 'pending':
      default:
        return DailySaleStatus.pending;
    }
  }
}
