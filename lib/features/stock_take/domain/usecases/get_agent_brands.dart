import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/stock_take_repository.dart';
import 'base_usecase.dart';

class GetAgentBrandsParams {
  final int agentId;

  const GetAgentBrandsParams({required this.agentId});
}

/// Use case to fetch all brands accessible to the current agent
class GetAgentBrands implements UseCase<AgentBrand, GetAgentBrandsParams> {
  final StockTakeRepository _repository;

  const GetAgentBrands(this._repository);

  @override
  Future<Either<Failure, AgentBrand>> call(GetAgentBrandsParams params) async {
    return _repository.getAgentBrands(params.agentId);
  }
}
