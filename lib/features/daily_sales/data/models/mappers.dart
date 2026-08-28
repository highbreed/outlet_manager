import '../../domain/entities/entities.dart' as domain;
import 'daily_sale_item_embedded.dart';
import 'daily_sale_model.dart';

extension DailySaleItemEmbeddedMapper on DailySaleItemEmbedded {
  domain.DailySaleItem toEntity() {
    return domain.DailySaleItem(
      id: serverId,
      dailySalesId: dailySalesId,
      productCode: productCode,
      productName: productName,
      quantity: quantity,
      unitPrice: unitPrice.toStringAsFixed(2),
      totalPrice: totalPrice.toStringAsFixed(2),
      serialNumbers: [
        for (var i = 0; i < serialNumbers.length; i++)
          domain.SaleSerialNumber(id: i, serialNumber: serialNumbers[i]),
      ],
    );
  }
}

extension DailySaleModelMapper on DailySaleModel {
  domain.DailySale toEntity() {
    return domain.DailySale(
      id: serverId,
      outletId: outletId,
      userId: userId,
      customerName: customerName,
      customerPhone: customerPhone,
      totalAmount: totalAmount.toStringAsFixed(2),
      totalItems: totalItems,
      saleDate: saleDate,
      status: domain.DailySaleStatusX.fromApiValue(status),
      items: items.map((item) => item.toEntity()).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      proofOfPurchasePath: proofOfPurchasePath,
    );
  }
}
