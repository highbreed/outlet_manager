import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class AddProductParams {
  final String sessionLocalId;
  final CustomerProduct product;

  const AddProductParams({
    required this.sessionLocalId,
    required this.product,
  });
}

/// Use case to add a product to a stock take session
class AddProductToSession implements UseCase<StockTakeItem, AddProductParams> {
  final StockTakeRepository _repository;

  const AddProductToSession(this._repository);

  @override
  Future<Either<Failure, StockTakeItem>> call(AddProductParams params) async {
    return _repository.addProduct(
      sessionLocalId: params.sessionLocalId,
      product: params.product,
    );
  }
}
