import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class AddSerialParams {
  final String sessionLocalId;
  final String itemLocalId;
  final String serialNumberRaw;
  final String serialNumberNorm;
  final String deviceScanId;
  final DateTime deviceScannedAt;
  final int? scanSequence;

  const AddSerialParams({
    required this.sessionLocalId,
    required this.itemLocalId,
    required this.serialNumberRaw,
    required this.serialNumberNorm,
    required this.deviceScanId,
    required this.deviceScannedAt,
    this.scanSequence,
  });
}

/// Use case to add a serial number to a stock take item
class AddSerialNumber implements UseCase<SerialNumberEntry, AddSerialParams> {
  final StockTakeRepository _repository;

  const AddSerialNumber(this._repository);

  @override
  Future<Either<Failure, SerialNumberEntry>> call(
    AddSerialParams params,
  ) async {
    return _repository.addSerial(
      sessionLocalId: params.sessionLocalId,
      itemLocalId: params.itemLocalId,
      serialNumberRaw: params.serialNumberRaw,
      serialNumberNorm: params.serialNumberNorm,
      deviceScanId: params.deviceScanId,
      deviceScannedAt: params.deviceScannedAt,
      scanSequence: params.scanSequence,
    );
  }
}
