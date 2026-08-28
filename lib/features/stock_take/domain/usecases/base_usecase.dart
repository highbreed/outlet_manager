import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';

/// Base interface for use cases with parameters
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Base interface for use cases without parameters
abstract class NoParamsUseCase<Type> {
  Future<Either<Failure, Type>> call();
}
