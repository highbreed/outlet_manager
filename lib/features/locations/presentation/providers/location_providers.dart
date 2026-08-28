import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../data/location_region.dart';
import '../../data/location_town.dart';
import '../../data/location_zone.dart';

/// GET /locations/regions
final locationRegionsProvider = FutureProvider<List<LocationRegion>>((ref) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get(ApiEndpoints.locationRegions);
    final list = response.data as List<dynamic>? ?? [];
    return list
        .map((e) => LocationRegion.fromJson(e as Map<String, dynamic>))
        .where((r) => r.isActive)
        .toList();
  } on DioException catch (e) {
    throw NetworkException.fromDioException(e);
  }
});

/// GET /locations/regions/{regionId}/zones
final locationZonesProvider =
    FutureProvider.family<List<LocationZone>, int>((ref, regionId) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get(ApiEndpoints.locationZones(regionId));
    final list = response.data as List<dynamic>? ?? [];
    return list
        .map((e) => LocationZone.fromJson(e as Map<String, dynamic>))
        .where((z) => z.isActive)
        .toList();
  } on DioException catch (e) {
    throw NetworkException.fromDioException(e);
  }
});

/// GET /locations/zones/{zoneId}/towns
final locationTownsProvider =
    FutureProvider.family<List<LocationTown>, int>((ref, zoneId) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get(ApiEndpoints.locationTowns(zoneId));
    final list = response.data as List<dynamic>? ?? [];
    return list
        .map((e) => LocationTown.fromJson(e as Map<String, dynamic>))
        .where((t) => t.isActive)
        .toList();
  } on DioException catch (e) {
    throw NetworkException.fromDioException(e);
  }
});
