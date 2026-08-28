import 'package:isar_community/isar.dart';

import '../models/models.dart';

/// Local Isar read-cache for daily sales. This is only ever written from a
/// successful server response — never the source of truth for a mutation.
class DailySalesLocalDataSource {
  final Isar _isar;

  const DailySalesLocalDataSource(this._isar);

  Future<List<DailySaleModel>> getCachedSales({
    int? outletId,
    String? status,
  }) async {
    List<DailySaleModel> results;
    if (outletId != null && status != null) {
      results = await _isar.dailySaleModels
          .filter()
          .outletIdEqualTo(outletId)
          .statusEqualTo(status)
          .findAll();
    } else if (outletId != null) {
      results = await _isar.dailySaleModels
          .filter()
          .outletIdEqualTo(outletId)
          .findAll();
    } else if (status != null) {
      results = await _isar.dailySaleModels
          .filter()
          .statusEqualTo(status)
          .findAll();
    } else {
      results = await _isar.dailySaleModels.where().findAll();
    }

    results.sort((a, b) => b.saleDate.compareTo(a.saleDate));
    return results;
  }

  Future<DailySaleModel?> getCachedSale(int serverId) async {
    return _isar.dailySaleModels.filter().serverIdEqualTo(serverId).findFirst();
  }

  Future<void> upsertSale(DailySaleModel model) async {
    await _isar.writeTxn(() async {
      final existing = await _isar.dailySaleModels
          .filter()
          .serverIdEqualTo(model.serverId)
          .findFirst();
      if (existing != null) {
        model.id = existing.id;
      }
      await _isar.dailySaleModels.put(model);
    });
  }

  Future<void> upsertSales(List<DailySaleModel> models) async {
    await _isar.writeTxn(() async {
      for (final model in models) {
        final existing = await _isar.dailySaleModels
            .filter()
            .serverIdEqualTo(model.serverId)
            .findFirst();
        if (existing != null) {
          model.id = existing.id;
        }
        await _isar.dailySaleModels.put(model);
      }
    });
  }
}
