import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../daily_route/presentation/widgets/widgets.dart'
    show RouteBackHeader;
import '../../../daily_route/providers/daily_route_providers.dart';
import '../../data/datasources/products_remote_datasource.dart';
import '../../domain/entities/product.dart';
import '../providers/products_providers.dart';
import '../widgets/alternatives_card.dart';
import '../widgets/competitor_mapping_card.dart';
import '../widgets/product_card.dart';
import '../widgets/report_not_selling_sheet.dart';
import '../widgets/section_card.dart';
import '../widgets/sales_target_card.dart';
import '../widgets/sell_out_card.dart';
import '../widgets/stock_ageing_card.dart';
import '../widgets/stock_status_badge.dart';

/// Re-resolves a product by [code] when the detail route is entered without
/// its `Product` already in hand (see `/products/detail/:code` in
/// router_provider.dart for why that happens) instead of silently dropping
/// the user back to the catalogue list.
class ProductDetailResolverScreen extends ConsumerWidget {
  final String code;

  const ProductDetailResolverScreen({super.key, required this.code});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productByCodeProvider(code));

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            RouteBackHeader(
              title: 'Product',
              onBack: () => Navigator.of(context).maybePop(),
            ),
            Expanded(
              child: productAsync.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (error, _) => _ResolveError(
                  message: error is Failure
                      ? error.displayMessage
                      : 'Unable to load this product',
                  onRetry: () =>
                      ref.invalidate(productByCodeProvider(code)),
                ),
                data: (product) => product == null
                    ? const _ResolveError(
                        message: 'This product could not be found.',
                      )
                    : ProductDetailScreen(product: product),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResolveError extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const _ResolveError({required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off, size: 40, color: kTextMuted),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kTextMuted),
            ),
            const SizedBox(height: 16),
            SecondaryButton(
              label: onRetry != null ? 'Retry' : 'Back to products',
              expand: false,
              onPressed: onRetry ?? () => context.go('/products'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Detail page for a catalogue product: identity, pricing, and
/// per-warehouse stock (fetched live — the catalogue list doesn't include
/// it). Item codes are an internal SAP key the field team doesn't
/// recognize, so they're intentionally not shown here.
///
/// Departure from the mock: no "Add to Order" button. Nothing today links
/// a product-detail view to an in-progress Sales Order draft — Sales
/// Orders' `CreateOrderScreen` always starts from picking a customer first
/// — so the button is omitted rather than wired to a fabricated action.
class ProductDetailScreen extends ConsumerWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeVisit = ref.watch(activeVisitProvider);

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              RouteBackHeader(
                title: 'Product',
                onBack: () => Navigator.of(context).maybePop(),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: kBorderColor)),
                ),
                child: const TabBar(
                  isScrollable: false,
                  labelColor: kSecondaryColor,
                  unselectedLabelColor: kTextFaint,
                  indicatorColor: kSecondaryColor,
                  indicatorWeight: 2,
                  dividerColor: Colors.transparent,
                  labelStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: [
                    Tab(text: 'Overview'),
                    Tab(text: 'Insights'),
                    Tab(text: 'Alternatives'),
                    Tab(text: 'Competitors'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                      children: [
                        const AspectRatio(
                          aspectRatio: 16 / 10,
                          child: ProductPhotoPlaceholder(
                            size: double.infinity,
                            radius: 18,
                            label: 'product photo',
                          ),
                        ),
                        const SizedBox(height: 14),
                        _Header(product: product),
                        const SizedBox(height: 14),
                        _IdentityCard(product: product),
                        const SizedBox(height: 20),
                        _StockCard(itemCode: product.code),
                        const SizedBox(height: 20),
                        StockAgeingCard(itemCode: product.code),
                        if (product.description != null &&
                            product.description!.trim().isNotEmpty) ...[
                          const SizedBox(height: 20),
                          SectionCard(
                            title: 'Description',
                            child: Text(
                              product.description!,
                              style: const TextStyle(
                                fontSize: 13,
                                height: 1.4,
                                color: kTextDark,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    ListView(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                      children: [
                        SellOutCard(itemCode: product.code),
                        const SizedBox(height: 20),
                        SalesTargetCard(itemCode: product.code),
                        const SizedBox(height: 20),
                        _NotSellingCard(
                          cardCode: activeVisit?.outletCode,
                          itemCode: product.code,
                        ),
                      ],
                    ),
                    ListView(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                      children: [
                        AlternativesCard(itemCode: product.code),
                      ],
                    ),
                    CompetitorMappingCard(
                      itemCode: product.code,
                      modelNo: product.modelNumber,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotSellingCard extends StatelessWidget {
  final String? cardCode;
  final String itemCode;

  const _NotSellingCard({required this.cardCode, required this.itemCode});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Not Selling Well?',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Report why this product isn\'t moving at this outlet.',
            style: TextStyle(fontSize: 12, color: kTextMuted),
          ),
          const SizedBox(height: 12),
          if (cardCode != null)
            SecondaryButton(
              label: 'Report an issue',
              leadingIcon: Icons.flag_outlined,
              onPressed: () => showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: kPrimaryLightColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (_) => ReportNotSellingSheet(
                  cardCode: cardCode!,
                  itemCode: itemCode,
                ),
              ),
            )
          else
            const Text(
              'Clock in to an outlet to report this.',
              style: TextStyle(
                fontSize: 12,
                color: kRedColor,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final Product product;

  const _Header({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        if (product.category != null && product.category!.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            [
              product.subGroup3,
              product.subGroup2,
              product.category,
            ].whereType<String>().firstWhere(
              (s) => s.isNotEmpty,
              orElse: () => '',
            ),
            style: const TextStyle(fontSize: 13, color: kTextMuted),
          ),
        ],
      ],
    );
  }
}

/// Un-headed bordered card combining identity + pricing — matches the
/// mock's single SKU/Category/Price/Incentive card exactly, with a few
/// extra real rows (brand, barcode, unit of measure) appended below when
/// present, rather than splitting into separate "Pricing"/"Details" cards.
class _IdentityCard extends StatelessWidget {
  final Product product;

  const _IdentityCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final rows = <(String, String, {bool emphasize})>[
      if (product.modelNumber != null && product.modelNumber!.isNotEmpty)
        (
          'SKU',
          product.modelNumber!,
          emphasize: false,
        ),
      if (product.category != null && product.category!.isNotEmpty)
        (
          'Category',
          [
            product.category,
            product.subGroup2,
            product.subGroup3,
          ].whereType<String>().where((s) => s.isNotEmpty).join(' › '),
          emphasize: false,
        ),
      ('Price', formatKes(product.unitPrice), emphasize: false),
      if (product.incentiveAmount > 0)
        ('Incentive', formatKes(product.incentiveAmount), emphasize: true),
      if (product.brand != null && product.brand!.isNotEmpty)
        ('Brand', product.brand!, emphasize: false),
      if (product.barcode != null && product.barcode!.isNotEmpty)
        ('Barcode', product.barcode!, emphasize: false),
      ('Unit of measure', product.uom, emphasize: false),
      if (product.productStatus != null && product.productStatus!.isNotEmpty)
        ('Status', product.productStatus!, emphasize: false),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBorderColor),
      ),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 11),
              decoration: i == rows.length - 1
                  ? null
                  : const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFF0F0EE)),
                      ),
                    ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    rows[i].$1,
                    style: const TextStyle(fontSize: 13, color: kTextMuted),
                  ),
                  Text(
                    rows[i].$2,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: rows[i].emphasize ? kSecondaryColor : kTextDark,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Stock card: fetches the live per-warehouse breakdown for [itemCode] via
/// `GET /products/stocks/{item_code}` (the catalogue list never returns
/// stock, so this only happens once the rep opens a specific product).
class _StockCard extends ConsumerWidget {
  final String itemCode;

  const _StockCard({required this.itemCode});

  StockStatus _statusFor(int available) {
    if (available <= 0) return StockStatus.outOfStock;
    if (available <= Product.lowStockThreshold) return StockStatus.lowStock;
    return StockStatus.inStock;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockAsync = ref.watch(productStockProvider(itemCode));

    return stockAsync.when(
      loading: () => const SectionCard(
        title: 'Warehouse stock',
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              SizedBox(width: 10),
              Text(
                'Checking warehouses...',
                style: TextStyle(fontSize: 13, color: kTextMuted),
              ),
            ],
          ),
        ),
      ),
      error: (error, _) => SectionCard(
        title: 'Warehouse stock',
        child: Row(
          children: [
            Expanded(
              child: Text(
                error is Failure
                    ? error.displayMessage
                    : 'Unable to load stock levels',
                style: const TextStyle(fontSize: 13, color: kTextMuted),
              ),
            ),
            TextButton(
              onPressed: () => ref.invalidate(productStockProvider(itemCode)),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
      data: (stock) {
        final available = stock.totalAvailable;
        return SectionCard(
          title: 'Warehouse stock',
          trailing: StockStatusBadge(status: _statusFor(available)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$available',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: kTextDark,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      'available across ${stock.warehouses.length} warehouse${stock.warehouses.length == 1 ? '' : 's'}',
                      style: const TextStyle(fontSize: 13, color: kTextMuted),
                    ),
                  ),
                ],
              ),
              if (stock.warehouses.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(height: 1, color: Color(0xFFF0F0EE)),
                ),
                for (var i = 0; i < stock.warehouses.length; i++) ...[
                  if (i > 0) const SizedBox(height: 10),
                  _WarehouseRow(warehouse: stock.warehouses[i]),
                ],
              ],
            ],
          ),
        );
      },
    );
  }
}

class _WarehouseRow extends StatelessWidget {
  final WarehouseStock warehouse;

  const _WarehouseRow({required this.warehouse});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                warehouse.warehouseName,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: kTextDark,
                ),
              ),
              Text(
                'On hand ${warehouse.onHand} · Committed ${warehouse.committed}'
                '${warehouse.onOrder > 0 ? ' · On order ${warehouse.onOrder}' : ''}',
                style: const TextStyle(fontSize: 11, color: kTextFaint),
              ),
            ],
          ),
        ),
        Text(
          '${warehouse.available} units',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: warehouse.available > 0 ? kTextDark : kTextFaint,
          ),
        ),
      ],
    );
  }
}
