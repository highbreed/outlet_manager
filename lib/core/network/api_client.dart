import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/app_config.dart';
import '../storage/token_storage.dart';
import 'interceptors/interceptors.dart';

part 'api_client.g.dart';

@riverpod
TokenStorage tokenStorage(Ref ref) {
  return TokenStorage();
}

@riverpod
Dio dio(Ref ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);

  final dio = Dio(BaseOptions(
    baseUrl: AppConfig.apiBaseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Client-Version': AppConfig.appVersion,
      'X-Platform': AppConfig.platform,
    },
  ));

  // Order matters: executed top-to-bottom on request, bottom-to-top on response
  dio.interceptors.addAll([
    RequestIdInterceptor(),
    ConnectivityInterceptor(ref),
    AuthInterceptor(
      ref: ref,
      tokenStorage: tokenStorage,
      baseUrl: AppConfig.apiBaseUrl,
    ),
    PasswordChangeGateInterceptor(ref),
    RetryInterceptor(),
    ErrorMappingInterceptor(),
    LoggingInterceptor(),
  ]);

  // Certificate pinning for production
  if (!kDebugMode && AppConfig.pinnedCertificate != null) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final context = SecurityContext(withTrustedRoots: false);
        context.setTrustedCertificatesBytes(AppConfig.pinnedCertificate!);
        return HttpClient(context: context)
          ..badCertificateCallback = (cert, host, port) => false;
      },
    );
  }

  return dio;
}
