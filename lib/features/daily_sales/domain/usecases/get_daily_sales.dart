import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../entities/entities.dart';
import '../repositories/daily_sales_repository.dart';
import 'base_usecase.dart';

class GetDailySalesParams {
  final int page;
  final int size;
  final int? outletId;
  final int? userId;
  final DailySaleStatus? status;

  const GetDailySalesParams({
    this.page = 1,
    this.size = 20,
    this.outletId,
    this.userId,
    this.status,
  });
}

/// Lists sales, paginated and optionally filtered by outlet/user/status.
class GetDailySales implements UseCase<DailySalesPage, GetDailySalesParams> {
  final DailySalesRepository _repository;

  const GetDailySales(this._repository);

  @override
  Future<Either<Failure, DailySalesPage>> call(
    GetDailySalesParams params,
  ) async {
    return _repository.listSales(
      page: params.page,
      size: params.size,
      outletId: params.outletId,
      userId: params.userId,
      status: params.status,
    );
  }
}
