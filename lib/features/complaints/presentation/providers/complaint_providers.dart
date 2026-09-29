import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// See products_providers.dart's matching comment — StateNotifier moved to
// this explicit legacy import in Riverpod 3.x, kept as-is rather than
// rewritten given this file's real complaint-handling business logic.
import 'package:flutter_riverpod/legacy.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/complaint_product.dart';
import '../../domain/entities/entities.dart';

// ============================================================================
// After-Sales Products — live search against the backend
// ============================================================================

/// Searches GET /aftersales/products?search=...&size=... live, matching the
/// server-side name/code/model/brand search used by the sales products
/// endpoint, instead of filtering a locally cached page of results.
final afterSalesProductSearchProvider =
    Provider<Future<List<ComplaintProduct>> Function(String)>((ref) {
  return (String query) async {
    final dio = ref.read(dioProvider);
    try {
      final response = await dio.get(
        ApiEndpoints.afterSalesProducts,
        queryParameters: {
          if (query.trim().isNotEmpty) 'search': query.trim(),
          'size': 50,
        },
      );
      final data = response.data;
      // The backend returns a flat array for this endpoint normally, but
      // other list endpoints on this API wrap results as {"items": [...]}
      // (see SalesProductsResponse) — accept either shape defensively.
      final List<dynamic> list;
      if (data is List) {
        list = data;
      } else if (data is Map<String, dynamic>) {
        list = (data['items'] ?? data['data'] ?? data['products'] ?? [])
            as List<dynamic>;
      } else {
        list = const [];
      }
      if (kDebugMode) {
        debugPrint(
          '[afterSalesProductSearch] query="$query" -> ${list.length} item(s)',
        );
      }
      return list
          .map((e) => ComplaintProduct.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  };
});

final _uuid = const Uuid();

// ============================================================================
// Complaint Types (fetched from /aftersales/complaint-origins)
// ============================================================================

final complaintTypesProvider = FutureProvider<List<ComplaintType>>((ref) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get(ApiEndpoints.afterSalesComplaintOrigins);
    final list = response.data as List<dynamic>? ?? [];
    return list
        .map((e) => ComplaintType.fromJson(e as Map<String, dynamic>))
        .toList();
  } on DioException catch (e) {
    throw NetworkException.fromDioException(e);
  }
});

// ============================================================================
// Complaint Sources (fetched from /aftersales/complaint-sources)
// ============================================================================

final complaintSourcesProvider =
    FutureProvider<List<ComplaintSource>>((ref) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get(ApiEndpoints.afterSalesComplaintSources);
    final list = response.data as List<dynamic>? ?? [];
    return list
        .map((e) => ComplaintSource.fromJson(e as Map<String, dynamic>))
        .toList();
  } on DioException catch (e) {
    throw NetworkException.fromDioException(e);
  }
});

// ============================================================================
// Complaints list
// ============================================================================

class ComplaintsNotifier extends StateNotifier<List<Complaint>> {
  ComplaintsNotifier() : super(_mockComplaints());

  String _newComplaintNo() {
    final year = DateTime.now().year;
    final n = state.length + 1;
    return 'AF-$year-${n.toString().padLeft(4, '0')}';
  }

  Complaint create({
    required String consumerName,
    required String consumerPhone,
    String? consumerRegion,
    String? consumerZone,
    String? consumerArea,
    String? consumerAddress,
    required String productCode,
    required String productName,
    String? productBrand,
    String? productModelNo,
    required String serialNumber,
    bool serialDefaced = false,
    String? serialDefacedNote,
    DateTime? dateOfPurchase,
    WarrantyStatus warrantyStatus = WarrantyStatus.outOfWarranty,
    required String description,
    int? complaintTypeId,
    String? complaintTypeName,
    int? complaintSourceId,
    String? complaintSourceName,
    String? sourcePersonName,
    String? sourcePersonCode,
  }) {
    final now = DateTime.now();
    final complaint = Complaint(
      localId: _uuid.v4(),
      complaintNo: _newComplaintNo(),
      consumerName: consumerName,
      consumerPhone: consumerPhone,
      consumerRegion: consumerRegion,
      consumerZone: consumerZone,
      consumerArea: consumerArea,
      consumerAddress: consumerAddress,
      productCode: productCode,
      productName: productName,
      productBrand: productBrand,
      productModelNo: productModelNo,
      serialNumber: serialNumber,
      serialDefaced: serialDefaced,
      serialDefacedNote: serialDefacedNote,
      dateOfPurchase: dateOfPurchase,
      warrantyStatus: warrantyStatus,
      description: description,
      complaintTypeId: complaintTypeId,
      complaintTypeName: complaintTypeName,
      complaintSourceId: complaintSourceId,
      complaintSourceName: complaintSourceName,
      sourcePersonName: sourcePersonName,
      sourcePersonCode: sourcePersonCode,
      status: ComplaintStatus.open,
      progressLines: [
        ComplaintProgressLine(
          date: now,
          status: 'Open',
          statusSub: 'Complaint registered',
          updatedBy: 'System',
        ),
      ],
      createdAt: now,
      updatedAt: now,
    );
    state = [complaint, ...state];
    return complaint;
  }

  void update(Complaint complaint) {
    state = [
      for (final c in state)
        if (c.localId == complaint.localId) complaint else c,
    ];
  }

  Complaint? byId(String localId) =>
      state.where((c) => c.localId == localId).firstOrNull;
}

final complaintsProvider =
    StateNotifierProvider<ComplaintsNotifier, List<Complaint>>(
      (ref) => ComplaintsNotifier(),
    );

final complaintByIdProvider = Provider.family<Complaint?, String>((ref, localId) {
  return ref
      .watch(complaintsProvider)
      .where((c) => c.localId == localId)
      .firstOrNull;
});

// ============================================================================
// Filter
// ============================================================================

class ComplaintFilter {
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? consumerName;
  final String? consumerRegion;
  final String? consumerPhone;

  const ComplaintFilter({
    this.fromDate,
    this.toDate,
    this.consumerName,
    this.consumerRegion,
    this.consumerPhone,
  });

  /// Default filter: today only.
  static ComplaintFilter today() {
    final d = _dateOnly(DateTime.now());
    return ComplaintFilter(fromDate: d, toDate: d);
  }

  static DateTime _dateOnly(DateTime dt) =>
      DateTime(dt.year, dt.month, dt.day);

  /// Number of non-default active filters (used for the badge on the filter button).
  int get activeFilterCount {
    final todayDate = _dateOnly(DateTime.now());
    int count = 0;
    if (fromDate != todayDate || toDate != todayDate) count++;
    if (consumerName != null) count++;
    if (consumerRegion != null) count++;
    if (consumerPhone != null) count++;
    return count;
  }

  ComplaintFilter copyWith({
    DateTime? fromDate,
    DateTime? toDate,
    String? consumerName,
    String? consumerRegion,
    String? consumerPhone,
  }) => ComplaintFilter(
    fromDate: fromDate ?? this.fromDate,
    toDate: toDate ?? this.toDate,
    consumerName: consumerName ?? this.consumerName,
    consumerRegion: consumerRegion ?? this.consumerRegion,
    consumerPhone: consumerPhone ?? this.consumerPhone,
  );
}

class ComplaintFilterNotifier extends StateNotifier<ComplaintFilter> {
  ComplaintFilterNotifier() : super(ComplaintFilter.today());

  void apply(ComplaintFilter filter) => state = filter;
  void resetToToday() => state = ComplaintFilter.today();
}

final complaintFilterProvider =
    StateNotifierProvider<ComplaintFilterNotifier, ComplaintFilter>(
      (ref) => ComplaintFilterNotifier(),
    );

// Local text search over the already-fetched list (client-side).
final aftersalesSearchProvider = StateProvider<String>((ref) => '');

// ============================================================================
// After-Sales Registrations — server-side paginated list
// ============================================================================

class AftersalesListState {
  final List<AftersalesRegistrationListItem> items;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final int page;
  final String? error;

  const AftersalesListState({
    this.items = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.page = 1,
    this.error,
  });

  AftersalesListState copyWith({
    List<AftersalesRegistrationListItem>? items,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    int? page,
    String? error,
    bool clearError = false,
  }) => AftersalesListState(
    items: items ?? this.items,
    isLoading: isLoading ?? this.isLoading,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    hasMore: hasMore ?? this.hasMore,
    page: page ?? this.page,
    error: clearError ? null : (error ?? this.error),
  );
}

class AftersalesListNotifier extends StateNotifier<AftersalesListState> {
  final Ref _ref;
  static const _pageSize = 20;

  AftersalesListNotifier(this._ref) : super(const AftersalesListState());

  Future<void> load({bool refresh = false}) async {
    if (state.isLoading || state.isLoadingMore) return;

    final page = refresh ? 1 : state.page;
    final existingItems = refresh
        ? <AftersalesRegistrationListItem>[]
        : List<AftersalesRegistrationListItem>.of(state.items);

    state = state.copyWith(
      items: existingItems,
      isLoading: existingItems.isEmpty,
      isLoadingMore: existingItems.isNotEmpty,
      clearError: true,
      page: page,
      hasMore: refresh ? true : state.hasMore,
    );

    try {
      final dio = _ref.read(dioProvider);
      final filter = _ref.read(complaintFilterProvider);

      final params = <String, dynamic>{'page': page, 'size': _pageSize};

      if (filter.fromDate != null) {
        params['date_from'] = _fmtDate(filter.fromDate!);
      }
      if (filter.toDate != null) {
        params['date_to'] = _fmtDate(filter.toDate!);
      }
      if (filter.consumerName != null) {
        params['consumer_name'] = filter.consumerName;
      }
      if (filter.consumerRegion != null) {
        params['consumer_region'] = filter.consumerRegion;
      }
      if (filter.consumerPhone != null) {
        params['consumer_phone'] = filter.consumerPhone;
      }

      final response = await dio.get(
        ApiEndpoints.afterSalesRegistrations,
        queryParameters: params,
      );

      final data = response.data as Map<String, dynamic>;
      final newItems = (data['items'] as List<dynamic>? ?? [])
          .map((e) => AftersalesRegistrationListItem.fromJson(
                e as Map<String, dynamic>,
              ))
          .toList();
      final meta = data['meta'] as Map<String, dynamic>? ?? {};
      final totalPages = meta['total_pages'] as int? ?? 1;
      final allItems = [...existingItems, ...newItems];

      state = state.copyWith(
        items: allItems,
        isLoading: false,
        isLoadingMore: false,
        hasMore: page < totalPages,
        page: page + 1,
      );
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        error: NetworkException.fromDioException(e).message,
      );
    }
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoadingMore || state.isLoading) return;
    await load();
  }

  String _fmtDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

final aftersalesListProvider =
    StateNotifierProvider<AftersalesListNotifier, AftersalesListState>((ref) {
  final notifier = AftersalesListNotifier(ref);
  ref.listen<ComplaintFilter>(complaintFilterProvider, (_, _) {
    notifier.load(refresh: true);
  });
  notifier.load();
  return notifier;
});

// ============================================================================
// After-Sales Registration Detail — GET /aftersales/registrations/{complaint_no}
// ============================================================================

final aftersalesRegistrationDetailProvider =
    FutureProvider.family<AftersalesRegistrationDetail, String>(
  (ref, complaintNo) async {
    final dio = ref.watch(dioProvider);
    try {
      final response = await dio.get(
        ApiEndpoints.afterSalesRegistrationDetail(complaintNo),
      );
      return AftersalesRegistrationDetail.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  },
);

// ============================================================================
// Mock seed data
// ============================================================================

List<Complaint> _mockComplaints() {
  final now = DateTime.now();
  return [
    Complaint(
      localId: 'mock-1',
      serverId: 1001,
      complaintNo: 'AF-2026-0001',
      consumerName: 'John Kamau',
      consumerPhone: '+254712345678',
      consumerRegion: 'Nairobi',
      consumerArea: 'Westlands',
      consumerAddress: '14 Waiyaki Way',
      productCode: 'MK-WM-001',
      productName: 'Washing Machine 7KG',
      productBrand: 'Mika',
      productModelNo: 'WM-7000',
      serialNumber: 'SN20240001',
      dateOfPurchase: now.subtract(const Duration(days: 120)),
      warrantyStatus: WarrantyStatus.inWarranty,
      description: 'Machine stops mid-cycle and displays error E5.',
      complaintTypeId: 1,
      complaintTypeName: 'Product Not Working',
      status: ComplaintStatus.inProgress,
      progressLines: [
        ComplaintProgressLine(
          date: now.subtract(const Duration(days: 5)),
          status: 'Open',
          statusSub: 'Complaint registered',
          updatedBy: 'System',
        ),
        ComplaintProgressLine(
          date: now.subtract(const Duration(days: 3)),
          status: 'In Progress',
          statusSub: 'Assigned to technician',
          updatedBy: 'Admin',
        ),
      ],
      movementLines: [],
      createdAt: now.subtract(const Duration(days: 5)),
      updatedAt: now.subtract(const Duration(days: 3)),
    ),
    Complaint(
      localId: 'mock-2',
      serverId: 1002,
      complaintNo: 'AF-2026-0002',
      consumerName: 'Alice Uwase',
      consumerPhone: '+250788123456',
      consumerRegion: 'Kigali',
      consumerArea: 'Kimironko',
      consumerAddress: 'KG 11 Ave',
      productCode: 'MK-RF-002',
      productName: 'Refrigerator 200L',
      productBrand: 'Mika',
      productModelNo: 'RF-200',
      serialNumber: 'SN20240055',
      dateOfPurchase: now.subtract(const Duration(days: 400)),
      warrantyStatus: WarrantyStatus.outOfWarranty,
      description: 'Fridge not cooling, motor running continuously.',
      complaintTypeId: 1,
      complaintTypeName: 'Product Not Working',
      status: ComplaintStatus.open,
      progressLines: [
        ComplaintProgressLine(
          date: now.subtract(const Duration(days: 1)),
          status: 'Open',
          statusSub: 'Complaint registered',
          updatedBy: 'System',
        ),
      ],
      movementLines: [],
      createdAt: now.subtract(const Duration(days: 1)),
      updatedAt: now.subtract(const Duration(days: 1)),
    ),
  ];
}
