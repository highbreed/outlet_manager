import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_serial_number.freezed.dart';

/// A single serial number recorded against a sale item at confirmation.
@freezed
class SaleSerialNumber with _$SaleSerialNumber {
  const factory SaleSerialNumber({
    required int id,
    required String serialNumber,
  }) = _SaleSerialNumber;
}
