import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../../data/models/mapping_response_models.dart';
import '../entities/mapping_sample.dart';

/// Domain repository for outlet-mapping API operations (spec §81). Wraps
/// the frozen backend contract — raw Dio exceptions never reach callers.
abstract class OutletMappingRepository {
  Future<Either<Failure, StartCaptureResponse>> startCapture({
    required int requestId,
    required int visitId,
  });

  Future<Either<Failure, UploadSamplesResponse>> uploadSamples({
    required int footprintId,
    required List<MappingSample> samples,
  });

  Future<Either<Failure, FinishCaptureResponse>> finishCapture(int footprintId);

  Future<Either<Failure, CaptureStatusResponse>> getCaptureStatus(int footprintId);

  Future<Either<Failure, AbandonCaptureResponse>> abandonCapture(int footprintId);
}
