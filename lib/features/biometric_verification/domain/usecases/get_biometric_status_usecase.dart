import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/biometric_status.dart';
import '../repositories/biometric_repository.dart';

class GetBiometricStatusUseCase {
  final BiometricRepository _repository;

  GetBiometricStatusUseCase(this._repository);

  Future<Either<Failure, BiometricStatus>> call() => _repository.getStatus();
}
