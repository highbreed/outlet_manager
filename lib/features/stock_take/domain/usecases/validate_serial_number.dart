import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class ValidateSerialParams {
  final String serialNumber;
  final String sessionLocalId;

  const ValidateSerialParams({
    required this.serialNumber,
    required this.sessionLocalId,
  });
}

/// Use case to validate a serial number before adding it
class ValidateSerialNumber
    implements UseCase<ValidationResult, ValidateSerialParams> {
  final StockTakeRepository _repository;

  const ValidateSerialNumber(this._repository);

  @override
  Future<Either<Failure, ValidationResult>> call(
    ValidateSerialParams params,
  ) async {
    final serialNumber = params.serialNumber.trim();

    if (serialNumber.isEmpty) {
      return right(ValidationResult.invalid('Serial number cannot be empty'));
    }

    // Reject URLs — barcodes that point to websites are never serial numbers
    if (_isUrl(serialNumber)) {
      return right(
        ValidationResult.invalid('URLs are not valid serial numbers'),
      );
    }

    // All-digit strings are not valid serial numbers
    if (RegExp(r'^\d+$').hasMatch(serialNumber)) {
      return right(
        ValidationResult.invalid('Serial number cannot be all digits'),
      );
    }

    if (serialNumber.length < 3) {
      return right(
        ValidationResult.invalid('Serial number must be at least 3 characters'),
      );
    }

    if (serialNumber.length > 50) {
      return right(
        ValidationResult.invalid(
          'Serial number must be no more than 50 characters',
        ),
      );
    }

    // Check for duplicates via repository
    return _repository.validateSerial(
      serialNumber.toUpperCase(),
      params.sessionLocalId,
    );
  }

  static bool _isUrl(String input) {
    final lower = input.toLowerCase();
    if (lower.startsWith('http') ||
        lower.startsWith('www') ||
        lower.startsWith('ftp')) {
      return true;
    }
    return RegExp(
      r'^[a-z0-9]+([\-\.][a-z0-9]+)*\.[a-z]{2,}(\/.*)?$',
      caseSensitive: false,
    ).hasMatch(input);
  }
}
