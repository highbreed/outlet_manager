import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/entities.dart' as domain;
import '../../domain/repositories/daily_sales_repository.dart';
import '../datasources/daily_sales_local_datasource.dart';
import '../datasources/daily_sales_remote_datasource.dart';
import '../models/mappers.dart';

/// Implementation of [DailySalesRepository].
///
/// `createSale`/`confirmSale`/`cancelSale` are atomic, connectivity-required
/// server operations by API design — there is no offline fallback for them,
/// only a local cache write on success. `getSale`/`listSales` prefer the
/// network (status may have changed server-side) and fall back to the local
/// cache only when the network is unreachable.
class DailySalesRepositoryImpl implements DailySalesRepository {
  final DailySalesLocalDataSource _localDataSource;
  final DailySalesRemoteDataSource _remoteDataSource;

  const DailySalesRepositoryImpl({
    required DailySalesLocalDataSource localDataSource,
    required DailySalesRemoteDataSource remoteDataSource,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, domain.DailySalesPage>> listSales({
    int page = 1,
    int size = 20,
    int? outletId,
    int? userId,
    domain.DailySaleStatus? status,
  }) async {
    try {
      final result = await _remoteDataSource.listSales(
        page: page,
        size: size,
        outletId: outletId,
        userId: userId,
        status: status?.apiValue,
      );

      if (result.items.isNotEmpty) {
        await _localDataSource.upsertSales(result.items);
      }

      return right(
        domain.DailySalesPage(
          items: result.items.map((m) => m.toEntity()).toList(),
          page: result.page,
          size: result.size,
          total: result.total,
          pages: result.pages,
          hasPrevious: result.hasPrevious,
          hasNext: result.hasNext,
        ),
      );
    } on NetworkException catch (e) {
      final cached = await _localDataSource.getCachedSales(
        outletId: outletId,
        status: status?.apiValue,
      );
      if (cached.isNotEmpty) {
        final items = cached.map((m) => m.toEntity()).toList();
        return right(
          domain.DailySalesPage(
            items: items,
            page: 1,
            size: items.length,
            total: items.length,
            pages: 1,
            hasPrevious: false,
            hasNext: false,
          ),
        );
      }
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.DailySale>> getSale(int saleId) async {
    try {
      final remote = await _remoteDataSource.getSale(saleId);
      await _localDataSource.upsertSale(remote);
      return right(remote.toEntity());
    } on NetworkException catch (e) {
      final cached = await _localDataSource.getCachedSale(saleId);
      if (cached != null) {
        return right(cached.toEntity());
      }
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.DailySale>> createSale({
    required String customerName,
    String? customerPhone,
    required List<DailySaleCartLine> items,
  }) async {
    try {
      final remote = await _remoteDataSource.createSale(
        customerName: customerName,
        customerPhone: customerPhone,
        items: items,
      );
      await _localDataSource.upsertSale(remote);
      return right(remote.toEntity());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.DailySale>> confirmSale({
    required int saleId,
    required List<DailySaleConfirmLine> items,
    required String otpCode,
    required File proofOfPurchase,
  }) async {
    try {
      final remote = await _remoteDataSource.confirmSale(
        saleId: saleId,
        items: items,
        otpCode: otpCode,
        proofOfPurchase: proofOfPurchase,
      );
      await _localDataSource.upsertSale(remote);
      return right(remote.toEntity());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.DailySale>> cancelSale(int saleId) async {
    try {
      final remote = await _remoteDataSource.cancelSale(saleId);
      await _localDataSource.upsertSale(remote);
      return right(remote.toEntity());
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.DailySaleOtpResult>> requestOtp(
    int saleId,
  ) async {
    try {
      final remote = await _remoteDataSource.requestOtp(saleId);
      return right(
        domain.DailySaleOtpResult(
          message: remote.message,
          expiresInMinutes: remote.expiresInMinutes,
        ),
      );
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, domain.DailySaleOtpResult>> verifyOtp({
    required int saleId,
    required String otpCode,
  }) async {
    try {
      final remote = await _remoteDataSource.verifyOtp(
        saleId: saleId,
        otpCode: otpCode,
      );
      return right(
        domain.DailySaleOtpResult(
          message: remote.message,
          expiresInMinutes: remote.expiresInMinutes,
        ),
      );
    } on NetworkException catch (e) {
      return left(e.toFailure());
    } catch (e) {
      return left(UnknownFailure(message: e.toString()));
    }
  }
}
