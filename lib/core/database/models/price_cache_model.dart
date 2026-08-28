import 'package:isar_community/isar.dart';

part 'price_cache_model.g.dart';

@collection
class PriceCacheModel {
  Id? id;

  @Index(unique: true)
  late String productId;

  late String productName;
  late String productCode;

  late double unitPrice;
  late String currency;

  late int version; // Server-provided version

  @Index()
  late DateTime updatedAt;

  late DateTime expiresAt;
}
