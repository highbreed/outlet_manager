import '../../domain/entities/entities.dart';

/// Mock seed data for the sales order feature.
///
/// Replace these with real data sources once the backend is available.
class SalesOrderMockData {
  static final List<SalesCustomer> customers = [
    const SalesCustomer(
      id: 1,
      code: 'C-1001',
      name: 'Acme Supermarket',
      phone: '+254 711 000 001',
      address: 'Nairobi CBD',
      type: CustomerType.credit,
      creditLimit: 500000,
      outstandingBalance: 120000,
    ),
    const SalesCustomer(
      id: 2,
      code: 'C-1002',
      name: 'Savannah Stores',
      phone: '+254 711 000 002',
      address: 'Westlands',
      type: CustomerType.cash,
    ),
    const SalesCustomer(
      id: 3,
      code: 'C-1003',
      name: 'Highlands Mart',
      phone: '+254 711 000 003',
      address: 'Karen',
      type: CustomerType.credit,
      creditLimit: 250000,
      outstandingBalance: 45000,
    ),
    const SalesCustomer(
      id: 4,
      code: 'C-1004',
      name: 'Corner Duka',
      phone: '+254 711 000 004',
      type: CustomerType.cash,
    ),
    const SalesCustomer(
      id: 5,
      code: 'C-1005',
      name: 'Greenline Wholesalers',
      phone: '+254 711 000 005',
      address: 'Industrial Area',
      type: CustomerType.credit,
      creditLimit: 1000000,
      outstandingBalance: 300000,
    ),
  ];

  static final List<SalesProduct> products = [
    const SalesProduct(
      id: 101,
      code: 'P-0001',
      name: 'Cooking Oil 5L',
      brand: 'Fresh Fri',
      unitPrice: 1250.00,
      stockOnHand: 120,
    ),
    const SalesProduct(
      id: 102,
      code: 'P-0002',
      name: 'Maize Flour 2kg',
      brand: 'Jogoo',
      unitPrice: 180.00,
      stockOnHand: 430,
    ),
    const SalesProduct(
      id: 103,
      code: 'P-0003',
      name: 'Sugar 2kg',
      brand: 'Kabras',
      unitPrice: 280.00,
      stockOnHand: 210,
    ),
    const SalesProduct(
      id: 104,
      code: 'P-0004',
      name: 'Rice 5kg',
      brand: 'Daawat',
      unitPrice: 950.00,
      stockOnHand: 75,
    ),
    const SalesProduct(
      id: 105,
      code: 'P-0005',
      name: 'Detergent 1kg',
      brand: 'Omo',
      unitPrice: 350.00,
      stockOnHand: 180,
    ),
    const SalesProduct(
      id: 106,
      code: 'P-0006',
      name: 'Tea Leaves 500g',
      brand: 'Ketepa',
      unitPrice: 420.00,
      stockOnHand: 260,
    ),
    const SalesProduct(
      id: 107,
      code: 'P-0007',
      name: 'Bar Soap 800g',
      brand: 'Menengai',
      unitPrice: 160.00,
      stockOnHand: 320,
    ),
    const SalesProduct(
      id: 108,
      code: 'P-0008',
      name: 'Milk 500ml',
      brand: 'Brookside',
      uom: 'PKT',
      unitPrice: 55.00,
      stockOnHand: 500,
    ),
  ];
}
