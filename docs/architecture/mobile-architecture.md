# Sales Agent Mobile Architecture

## Core Architecture Layers

```
┌─────────────────────────────────────────────────────┐
│                 PRESENTATION                        │
│   Screens → Widgets → ViewModels (Riverpod)        │
├─────────────────────────────────────────────────────┤
│                 APPLICATION                         │
│   Use Cases → Services → State Controllers          │
├─────────────────────────────────────────────────────┤
│                   DOMAIN                            │
│   Entities → Repositories (interfaces) → Failures   │
├─────────────────────────────────────────────────────┤
│                INFRASTRUCTURE                       │
│   API Client → Local DB → Secure Storage → Location │
└─────────────────────────────────────────────────────┘
```

---

## State Management: Riverpod + Freezed

**Why Riverpod**: Compile-safe, testable, supports async/stream, no context needed for DI.

```dart
// Auth state - single source of truth
@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() => const AuthState.unauthenticated();
  
  Future<void> login(Credentials creds) async { ... }
  Future<void> logout({bool forced = false}) async { ... }
}

// Connectivity-aware data fetching
@riverpod
Future<List<Customer>> customers(CustomersRef ref) async {
  final connectivity = ref.watch(connectivityProvider);
  final repo = ref.watch(customerRepositoryProvider);
  
  return connectivity.isOnline 
    ? repo.fetchAndCache() 
    : repo.getCached();
}
```

---

## Authentication & Session Lifecycle

### Token Model

```dart
@freezed
class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    required String accessToken,
    required String refreshToken,
    required DateTime accessExpiresAt,
    required DateTime refreshExpiresAt,
  }) = _AuthTokens;
  
  bool get isAccessExpired => DateTime.now().isAfter(accessExpiresAt);
  bool get isRefreshExpired => DateTime.now().isAfter(refreshExpiresAt);
  bool get shouldProactiveRefresh => 
    DateTime.now().isAfter(accessExpiresAt.subtract(const Duration(minutes: 1)));
}
```

### Session State Machine

```
┌──────────────┐
│ Unauthed     │◄─────────────────────────────────────┐
└──────┬───────┘                                      │
       │ login()                                      │
       ▼                                              │
┌──────────────┐  refresh failed    ┌─────────────┐  │
│ Authenticated│─────────────────► │ LoggingOut   │──┘
└──────┬───────┘                    └─────────────┘
       │                                   ▲
       │ token expiring                    │
       ▼                                   │
┌──────────────┐  refresh failed           │
│ Refreshing   │───────────────────────────┘
└──────┬───────┘
       │ refresh success
       ▼
┌──────────────┐
│ Authenticated│
└──────────────┘
```

### Auth State Definition

```dart
@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticating() = _Authenticating;
  const factory AuthState.authenticated({
    required User user,
    required AuthTokens tokens,
  }) = _Authenticated;
  const factory AuthState.refreshing({
    required User user,
    required AuthTokens tokens,
  }) = _Refreshing;
  const factory AuthState.loggingOut({String? reason}) = _LoggingOut;
  const factory AuthState.authError(AuthFailure failure) = _AuthError;
}
```

### Auth Controller

```dart
@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    // Attempt to restore session on app start
    _restoreSession();
    return const AuthState.unauthenticated();
  }

  Future<void> _restoreSession() async {
    final storage = ref.read(tokenStorageProvider);
    final tokens = await storage.getTokens();
    
    if (tokens == null || tokens.isRefreshExpired) {
      await storage.clearAll();
      return;
    }
    
    if (tokens.isAccessExpired) {
      await _refreshTokens(tokens);
    } else {
      final user = _decodeUserFromToken(tokens.accessToken);
      state = AuthState.authenticated(user: user, tokens: tokens);
    }
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.authenticating();
    
    final result = await ref.read(authRepositoryProvider).login(
      email: email,
      password: password,
    );
    
    result.fold(
      (failure) => state = AuthState.authError(failure),
      (response) async {
        await ref.read(tokenStorageProvider).saveTokens(response.tokens);
        state = AuthState.authenticated(
          user: response.user,
          tokens: response.tokens,
        );
      },
    );
  }

  Future<void> logout({bool forced = false, String? reason}) async {
    state = AuthState.loggingOut(reason: reason);
    
    // Best-effort server logout (don't block on failure)
    if (!forced) {
      await ref.read(authRepositoryProvider).logout().timeout(
        const Duration(seconds: 3),
        onTimeout: () => const Right(unit),
      );
    }
    
    await ref.read(tokenStorageProvider).clearAll();
    state = const AuthState.unauthenticated();
  }

  Future<bool> refreshTokens() async {
    final currentState = state;
    if (currentState is! _Authenticated) return false;
    
    state = AuthState.refreshing(
      user: currentState.user,
      tokens: currentState.tokens,
    );
    
    return _refreshTokens(currentState.tokens);
  }

  Future<bool> _refreshTokens(AuthTokens tokens) async {
    final result = await ref.read(authRepositoryProvider).refresh(
      refreshToken: tokens.refreshToken,
    );
    
    return result.fold(
      (failure) {
        logout(forced: true, reason: 'Session expired');
        return false;
      },
      (newTokens) async {
        await ref.read(tokenStorageProvider).saveTokens(newTokens);
        final user = _decodeUserFromToken(newTokens.accessToken);
        state = AuthState.authenticated(user: user, tokens: newTokens);
        return true;
      },
    );
  }
  
  User _decodeUserFromToken(String token) {
    final payload = JwtDecoder.decode(token);
    return User.fromJwtPayload(payload);
  }
}
```

---

## Token Storage & Renewal Strategy

### Secure Token Storage

```dart
class SecureTokenStorage implements TokenStorage {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _accessExpiryKey = 'access_expiry';
  static const _refreshExpiryKey = 'refresh_expiry';
  
  final FlutterSecureStorage _storage;
  
  // In-memory cache to avoid async reads on hot path
  AuthTokens? _cachedTokens;
  
  SecureTokenStorage() : _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: 'secure_auth_prefs',
      preferencesKeyPrefix: 'auth_',
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      accountName: 'com.company.outletmanager.auth',
    ),
  );
  
  @override
  Future<AuthTokens?> getTokens() async {
    if (_cachedTokens != null) return _cachedTokens;
    
    final access = await _storage.read(key: _accessTokenKey);
    final refresh = await _storage.read(key: _refreshTokenKey);
    final accessExpiry = await _storage.read(key: _accessExpiryKey);
    final refreshExpiry = await _storage.read(key: _refreshExpiryKey);
    
    if (access == null || refresh == null) return null;
    
    _cachedTokens = AuthTokens(
      accessToken: access,
      refreshToken: refresh,
      accessExpiresAt: DateTime.parse(accessExpiry!),
      refreshExpiresAt: DateTime.parse(refreshExpiry!),
    );
    
    return _cachedTokens;
  }
  
  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    _cachedTokens = tokens;
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: tokens.accessToken),
      _storage.write(key: _refreshTokenKey, value: tokens.refreshToken),
      _storage.write(key: _accessExpiryKey, value: tokens.accessExpiresAt.toIso8601String()),
      _storage.write(key: _refreshExpiryKey, value: tokens.refreshExpiresAt.toIso8601String()),
    ]);
  }
  
  @override
  Future<void> clearAll() async {
    _cachedTokens = null;
    await _storage.deleteAll();
  }
}
```

### Single-Flight Token Refresh Interceptor

```dart
class AuthInterceptor extends QueuedInterceptor {
  final TokenStorage _tokenStorage;
  final Ref _ref;
  final Dio _refreshDio; // Separate Dio instance for refresh calls
  
  bool _isRefreshing = false;
  final _pendingRequests = <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth header for public endpoints
    if (options.extra['skipAuth'] == true) {
      return handler.next(options);
    }
    
    final tokens = await _tokenStorage.getTokens();
    
    if (tokens == null) {
      return handler.next(options);
    }
    
    // Proactive refresh if token expires within 1 minute
    if (tokens.shouldProactiveRefresh && !_isRefreshing) {
      await _performRefresh();
      final newTokens = await _tokenStorage.getTokens();
      options.headers['Authorization'] = 'Bearer ${newTokens?.accessToken}';
    } else {
      options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
    }
    
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }
    
    // Skip if this was already a refresh request
    if (err.requestOptions.path.contains('/auth/refresh')) {
      return handler.next(err);
    }
    
    // Queue this request while refreshing
    if (_isRefreshing) {
      _pendingRequests.add((options: err.requestOptions, handler: handler));
      return;
    }
    
    _isRefreshing = true;
    
    final refreshSuccess = await _performRefresh();
    
    _isRefreshing = false;
    
    if (refreshSuccess) {
      // Retry original request
      final response = await _retryRequest(err.requestOptions);
      handler.resolve(response);
      
      // Retry queued requests
      _retryPendingRequests();
    } else {
      // Force logout
      _ref.read(authControllerProvider.notifier).logout(
        forced: true,
        reason: 'Session expired. Please log in again.',
      );
      
      // Reject all pending requests
      _rejectPendingRequests(err);
      handler.next(err);
    }
  }

  Future<bool> _performRefresh() async {
    try {
      final refreshToken = await _tokenStorage.getRefreshToken();
      if (refreshToken == null) return false;
      
      final response = await _refreshDio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );
      
      final newTokens = AuthTokens.fromJson(response.data);
      await _tokenStorage.saveTokens(newTokens);
      
      return true;
    } on DioException catch (e) {
      // 401/403 on refresh = refresh token invalid
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        return false;
      }
      // Network error during refresh - don't logout, let request fail
      rethrow;
    }
  }

  void _retryPendingRequests() {
    for (final pending in _pendingRequests) {
      _retryRequest(pending.options).then(
        (response) => pending.handler.resolve(response),
        onError: (e) => pending.handler.reject(e as DioException),
      );
    }
    _pendingRequests.clear();
  }

  void _rejectPendingRequests(DioException error) {
    for (final pending in _pendingRequests) {
      pending.handler.reject(error);
    }
    _pendingRequests.clear();
  }
}
```

### Forced Logout Scenarios

| Trigger | Detection Point | Action |
|---------|-----------------|--------|
| Refresh token expired | AuthInterceptor 401 on refresh | Clear tokens, navigate to login |
| Refresh token revoked | Backend returns 403 on refresh | Clear tokens, show "logged out remotely" |
| Account disabled | Any API returns 403 + specific code | Clear tokens, show account disabled message |
| Password changed | Backend revokes all refresh tokens | Next refresh fails, force logout |
| Concurrent session limit | Backend returns 409 on refresh | Clear tokens, show "logged in elsewhere" |

---

## Network Layer Architecture

### Global API Client

```dart
/// Single Dio instance for all API calls - injected via Riverpod
@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(BaseOptions(
    baseUrl: AppConfig.apiBaseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Client-Version': AppConfig.appVersion,
      'X-Platform': Platform.isIOS ? 'ios' : 'android',
    },
  ));
  
  // Order matters: executed top-to-bottom on request, bottom-to-top on response
  dio.interceptors.addAll([
    RequestIdInterceptor(),           // Add correlation ID to all requests
    ConnectivityInterceptor(ref),     // Check network before sending
    AuthInterceptor(ref),             // Attach token, handle 401 refresh
    RetryInterceptor(ref),            // Retry transient failures
    ErrorMappingInterceptor(),        // Map DioException → typed Failure
    LoggingInterceptor(),             // Structured logging (last)
  ]);
  
  // Certificate pinning for production
  if (!kDebugMode) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () => HttpClient(context: SecurityContext()
        ..setTrustedCertificatesBytes(AppConfig.pinnedCertificate))
        ..badCertificateCallback = (_, __, ___) => false,
    );
  }
  
  return dio;
}
```

### Interceptor Pipeline

```
Request Flow:
┌─────────────────┐
│  Repository     │
└────────┬────────┘
         ▼
┌─────────────────┐  Generate UUID, attach to headers
│  RequestId      │  X-Request-ID: uuid
└────────┬────────┘
         ▼
┌─────────────────┐  Check connectivity state
│  Connectivity   │  Fail fast if offline (unless queued)
└────────┬────────┘
         ▼
┌─────────────────┐  Attach Bearer token
│  Auth           │  Proactive refresh if expiring
└────────┬────────┘
         ▼
┌─────────────────┐  (Response phase only)
│  Retry          │  Retry on 5xx, timeout, network error
└────────┬────────┘
         ▼
┌─────────────────┐  Map DioException → Failure
│  ErrorMapping   │  Parse backend error envelope
└────────┬────────┘
         ▼
┌─────────────────┐  Log request/response (sanitized)
│  Logging        │  Strip auth headers
└────────┬────────┘
         ▼
      Network
```

### Request ID Interceptor

```dart
class RequestIdInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestId = const Uuid().v4();
    options.headers['X-Request-ID'] = requestId;
    options.extra['requestId'] = requestId; // For logging/crash reports
    handler.next(options);
  }
}
```

### Connectivity Interceptor

```dart
class ConnectivityInterceptor extends Interceptor {
  final Ref _ref;
  
  ConnectivityInterceptor(this._ref);
  
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Allow offline-capable requests to proceed (will be queued)
    if (options.extra['allowOffline'] == true) {
      return handler.next(options);
    }
    
    final connectivity = _ref.read(connectivityProvider);
    
    if (!connectivity.isOnline) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: const NetworkFailure.offline(),
        ),
      );
    }
    
    handler.next(options);
  }
}
```

### Logging Interceptor

```dart
class LoggingInterceptor extends Interceptor {
  static const _sensitiveHeaders = {'authorization', 'cookie', 'x-api-key'};
  static const _sensitiveFields = {'password', 'token', 'secret', 'credit_card'};
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final sanitizedHeaders = _sanitizeHeaders(options.headers);
    final sanitizedBody = _sanitizeBody(options.data);
    
    log.d('API Request', extra: {
      'requestId': options.extra['requestId'],
      'method': options.method,
      'path': options.path,
      'headers': sanitizedHeaders,
      'body': sanitizedBody,
    });
    
    handler.next(options);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.d('API Response', extra: {
      'requestId': response.requestOptions.extra['requestId'],
      'statusCode': response.statusCode,
      'duration': response.extra['duration'],
    });
    handler.next(response);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.e('API Error', extra: {
      'requestId': err.requestOptions.extra['requestId'],
      'statusCode': err.response?.statusCode,
      'error': err.message,
      'type': err.type.name,
    });
    handler.next(err);
  }
  
  Map<String, dynamic> _sanitizeHeaders(Map<String, dynamic> headers) {
    return headers.map((key, value) => MapEntry(
      key,
      _sensitiveHeaders.contains(key.toLowerCase()) ? '[REDACTED]' : value,
    ));
  }
  
  dynamic _sanitizeBody(dynamic body) {
    if (body is Map) {
      return body.map((key, value) => MapEntry(
        key,
        _sensitiveFields.contains(key.toString().toLowerCase()) 
          ? '[REDACTED]' 
          : _sanitizeBody(value),
      ));
    }
    return body;
  }
}
```

---

## Error Model & Failure Types

### Backend Error Envelope

Expected backend error response format:

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": {
      "fields": {
        "email": ["Invalid email format"],
        "quantity": ["Must be greater than 0"]
      }
    },
    "retry_after": 30,
    "request_id": "uuid-from-header"
  }
}
```

### Typed Failure Hierarchy

```dart
/// Base failure type - all API errors map to a subtype
sealed class Failure {
  String get message;
  String? get requestId;
  bool get isRetryable;
  
  /// User-friendly message for UI display
  String get displayMessage;
}

/// 401 - Authentication failed or token invalid
@freezed
class AuthFailure extends Failure with _$AuthFailure {
  const factory AuthFailure.invalidCredentials() = _InvalidCredentials;
  const factory AuthFailure.tokenExpired() = _TokenExpired;
  const factory AuthFailure.sessionRevoked({String? reason}) = _SessionRevoked;
  const factory AuthFailure.biometricFailed() = _BiometricFailed;
  
  @override
  bool get isRetryable => false; // Never auto-retry auth failures
}

/// 403 - Authenticated but not authorized
@freezed
class ForbiddenFailure extends Failure with _$ForbiddenFailure {
  const factory ForbiddenFailure.insufficientPermissions({
    required String requiredPermission,
  }) = _InsufficientPermissions;
  const factory ForbiddenFailure.accountDisabled() = _AccountDisabled;
  const factory ForbiddenFailure.resourceForbidden() = _ResourceForbidden;
  
  @override
  bool get isRetryable => false;
}

/// 422 - Validation errors with field-level details
@freezed
class ValidationFailure extends Failure with _$ValidationFailure {
  const factory ValidationFailure({
    required String message,
    required Map<String, List<String>> fieldErrors,
    String? requestId,
  }) = _ValidationFailure;
  
  @override
  bool get isRetryable => false; // User must fix input
}

/// 404 - Resource not found
@freezed
class NotFoundFailure extends Failure with _$NotFoundFailure {
  const factory NotFoundFailure({
    required String resourceType,
    required String resourceId,
    String? requestId,
  }) = _NotFoundFailure;
  
  @override
  bool get isRetryable => false;
}

/// 409 - Conflict (optimistic locking, duplicate, etc.)
@freezed
class ConflictFailure extends Failure with _$ConflictFailure {
  const factory ConflictFailure.versionMismatch({
    required int serverVersion,
  }) = _VersionMismatch;
  const factory ConflictFailure.duplicateEntry({
    required String field,
  }) = _DuplicateEntry;
  const factory ConflictFailure.concurrentSession() = _ConcurrentSession;
  
  @override
  bool get isRetryable => false; // Requires user decision
}

/// 429 - Rate limited
@freezed
class RateLimitFailure extends Failure with _$RateLimitFailure {
  const factory RateLimitFailure({
    required Duration retryAfter,
    String? requestId,
  }) = _RateLimitFailure;
  
  @override
  bool get isRetryable => true; // Retry after delay
}

/// 5xx - Server errors
@freezed
class ServerFailure extends Failure with _$ServerFailure {
  const factory ServerFailure.internalError({String? requestId}) = _InternalError;
  const factory ServerFailure.serviceUnavailable({Duration? retryAfter}) = _ServiceUnavailable;
  const factory ServerFailure.badGateway() = _BadGateway;
  
  @override
  bool get isRetryable => true; // Transient, can retry
}

/// Network-level failures (no HTTP response)
@freezed
class NetworkFailure extends Failure with _$NetworkFailure {
  const factory NetworkFailure.offline() = _Offline;
  const factory NetworkFailure.timeout() = _Timeout;
  const factory NetworkFailure.connectionError({String? details}) = _ConnectionError;
  const factory NetworkFailure.sslError() = _SslError;
  
  @override
  bool get isRetryable => this is! _SslError; // SSL = likely MITM, don't retry
}

/// Unknown/unexpected failures
@freezed
class UnknownFailure extends Failure with _$UnknownFailure {
  const factory UnknownFailure({
    required String message,
    Object? originalError,
    String? requestId,
  }) = _UnknownFailure;
  
  @override
  bool get isRetryable => false;
}
```

### Error Mapping Interceptor

```dart
class ErrorMappingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = _mapToFailure(err);
    
    // Wrap failure in DioException for downstream handling
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      error: failure,
      type: err.type,
    ));
  }
  
  Failure _mapToFailure(DioException err) {
    final requestId = err.requestOptions.extra['requestId'] as String?;
    
    // Network-level failures (no response)
    if (err.response == null) {
      return switch (err.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout => NetworkFailure.timeout(),
        DioExceptionType.connectionError => const NetworkFailure.connectionError(),
        DioExceptionType.badCertificate => const NetworkFailure.sslError(),
        _ => UnknownFailure(message: err.message ?? 'Unknown error', requestId: requestId),
      };
    }
    
    final statusCode = err.response!.statusCode ?? 0;
    final body = err.response!.data;
    
    // Parse backend error envelope
    final errorEnvelope = _parseErrorEnvelope(body);
    
    return switch (statusCode) {
      401 => _mapAuthFailure(errorEnvelope),
      403 => _mapForbiddenFailure(errorEnvelope),
      404 => _mapNotFoundFailure(errorEnvelope, requestId),
      409 => _mapConflictFailure(errorEnvelope),
      422 => _mapValidationFailure(errorEnvelope, requestId),
      429 => _mapRateLimitFailure(errorEnvelope, err.response!.headers, requestId),
      >= 500 => _mapServerFailure(statusCode, errorEnvelope, requestId),
      _ => UnknownFailure(
          message: errorEnvelope?.message ?? 'Unexpected error',
          requestId: requestId,
        ),
    };
  }
  
  ErrorEnvelope? _parseErrorEnvelope(dynamic body) {
    if (body is! Map<String, dynamic>) return null;
    final error = body['error'];
    if (error is! Map<String, dynamic>) return null;
    return ErrorEnvelope.fromJson(error);
  }
  
  AuthFailure _mapAuthFailure(ErrorEnvelope? envelope) {
    return switch (envelope?.code) {
      'TOKEN_EXPIRED' => const AuthFailure.tokenExpired(),
      'SESSION_REVOKED' => AuthFailure.sessionRevoked(reason: envelope?.message),
      _ => const AuthFailure.invalidCredentials(),
    };
  }
  
  ForbiddenFailure _mapForbiddenFailure(ErrorEnvelope? envelope) {
    return switch (envelope?.code) {
      'ACCOUNT_DISABLED' => const ForbiddenFailure.accountDisabled(),
      'INSUFFICIENT_PERMISSIONS' => ForbiddenFailure.insufficientPermissions(
          requiredPermission: envelope?.details?['required_permission'] ?? 'unknown',
        ),
      _ => const ForbiddenFailure.resourceForbidden(),
    };
  }
  
  ValidationFailure _mapValidationFailure(ErrorEnvelope? envelope, String? requestId) {
    final fields = <String, List<String>>{};
    final fieldErrors = envelope?.details?['fields'];
    if (fieldErrors is Map) {
      fieldErrors.forEach((key, value) {
        if (value is List) {
          fields[key.toString()] = value.cast<String>();
        }
      });
    }
    return ValidationFailure(
      message: envelope?.message ?? 'Validation failed',
      fieldErrors: fields,
      requestId: requestId,
    );
  }
  
  RateLimitFailure _mapRateLimitFailure(
    ErrorEnvelope? envelope,
    Headers headers,
    String? requestId,
  ) {
    final retryAfter = envelope?.retryAfter ?? 
      int.tryParse(headers.value('retry-after') ?? '') ?? 
      60;
    return RateLimitFailure(
      retryAfter: Duration(seconds: retryAfter),
      requestId: requestId,
    );
  }
  
  ServerFailure _mapServerFailure(int status, ErrorEnvelope? envelope, String? requestId) {
    return switch (status) {
      502 => const ServerFailure.badGateway(),
      503 => ServerFailure.serviceUnavailable(
          retryAfter: envelope?.retryAfter != null 
            ? Duration(seconds: envelope!.retryAfter!) 
            : null,
        ),
      _ => ServerFailure.internalError(requestId: requestId),
    };
  }
  
  NotFoundFailure _mapNotFoundFailure(ErrorEnvelope? envelope, String? requestId) {
    return NotFoundFailure(
      resourceType: envelope?.details?['resource_type'] ?? 'resource',
      resourceId: envelope?.details?['resource_id'] ?? 'unknown',
      requestId: requestId,
    );
  }
  
  ConflictFailure _mapConflictFailure(ErrorEnvelope? envelope) {
    return switch (envelope?.code) {
      'VERSION_MISMATCH' => ConflictFailure.versionMismatch(
          serverVersion: envelope?.details?['server_version'] ?? 0,
        ),
      'DUPLICATE_ENTRY' => ConflictFailure.duplicateEntry(
          field: envelope?.details?['field'] ?? 'unknown',
        ),
      'CONCURRENT_SESSION' => const ConflictFailure.concurrentSession(),
      _ => const ConflictFailure.duplicateEntry(field: 'unknown'),
    };
  }
}

/// Parsed backend error envelope
@freezed
class ErrorEnvelope with _$ErrorEnvelope {
  const factory ErrorEnvelope({
    required String code,
    required String message,
    Map<String, dynamic>? details,
    int? retryAfter,
    String? requestId,
  }) = _ErrorEnvelope;
  
  factory ErrorEnvelope.fromJson(Map<String, dynamic> json) =>
      _$ErrorEnvelopeFromJson(json);
}
```

---

## Global Error Handling Strategy

### Error Reaction Matrix

| Failure Type | Auto Action | UI Feedback | Retry Behavior |
|-------------|-------------|-------------|----------------|
| `AuthFailure.tokenExpired` | Refresh token | None (silent) | Retry original after refresh |
| `AuthFailure.sessionRevoked` | Force logout | Toast + redirect | No retry |
| `ForbiddenFailure` | None | Permission denied dialog | No retry |
| `ValidationFailure` | None | Show field errors | No retry |
| `NotFoundFailure` | None | Not found message | No retry |
| `ConflictFailure.versionMismatch` | None | Conflict resolution UI | User decides |
| `RateLimitFailure` | Wait + retry | Show "slow down" if user-initiated | Auto-retry after delay |
| `ServerFailure` | Retry (3x) | Show error on final failure | Exponential backoff |
| `NetworkFailure.offline` | Queue (if write) | Offline banner | Retry on reconnect |
| `NetworkFailure.timeout` | Retry (3x) | Show timeout message | Exponential backoff |
| `NetworkFailure.sslError` | None | Security warning | Never retry |

### Global Error Handler

```dart
@riverpod
class GlobalErrorHandler extends _$GlobalErrorHandler {
  @override
  void build() {
    // Listen to error stream from network layer
    ref.listen(apiErrorStreamProvider, (_, failure) {
      if (failure != null) _handleFailure(failure);
    });
  }
  
  void _handleFailure(Failure failure) {
    switch (failure) {
      // Auth failures - may need forced logout
      case AuthFailure(:final sessionRevoked?):
        _forceLogout(sessionRevoked.reason ?? 'Session expired');
        
      case ForbiddenFailure.accountDisabled():
        _forceLogout('Your account has been disabled');
        
      case ConflictFailure.concurrentSession():
        _forceLogout('Logged in on another device');
        
      // Network failures - show connectivity state
      case NetworkFailure.offline():
        ref.read(connectivityBannerProvider.notifier).showOffline();
        
      case NetworkFailure.sslError():
        _showSecurityWarning();
        
      // Rate limiting
      case RateLimitFailure(:final retryAfter):
        _showRateLimitWarning(retryAfter);
        
      // Server errors - only show if retries exhausted
      case ServerFailure() when failure.extra['retriesExhausted'] == true:
        _showServerError(failure);
        
      // Validation handled by form layer, not global handler
      case ValidationFailure():
        break;
        
      // Unknown errors
      case UnknownFailure(:final requestId):
        _showUnexpectedError(requestId);
    }
  }
  
  void _forceLogout(String reason) {
    ref.read(authControllerProvider.notifier).logout(forced: true, reason: reason);
    ref.read(routerProvider).go('/login');
    ref.read(toastProvider.notifier).show(
      message: reason,
      type: ToastType.warning,
    );
  }
  
  void _showSecurityWarning() {
    ref.read(dialogProvider.notifier).show(
      title: 'Security Warning',
      message: 'Connection security could not be verified. Please ensure you are on a trusted network.',
      actions: [DialogAction.ok],
    );
  }
  
  void _showRateLimitWarning(Duration retryAfter) {
    ref.read(toastProvider.notifier).show(
      message: 'Too many requests. Please wait ${retryAfter.inSeconds}s.',
      type: ToastType.warning,
    );
  }
  
  void _showServerError(Failure failure) {
    ref.read(toastProvider.notifier).show(
      message: 'Server error. Please try again later.',
      type: ToastType.error,
      action: ToastAction(
        label: 'Report',
        onPressed: () => _reportError(failure),
      ),
    );
  }
  
  void _showUnexpectedError(String? requestId) {
    ref.read(toastProvider.notifier).show(
      message: 'Something went wrong. Reference: ${requestId ?? 'N/A'}',
      type: ToastType.error,
    );
  }
  
  void _reportError(Failure failure) {
    // Send to crash reporting with context
    CrashReporting.recordError(
      error: failure,
      context: {
        'requestId': failure.requestId,
        'userId': ref.read(currentUserProvider)?.id,
      },
    );
  }
}
```

### Repository-Level Error Handling

```dart
abstract class BaseRepository {
  final Dio _dio;
  
  /// Execute API call with standard error handling
  Future<Result<T>> safeCall<T>(
    Future<Response<dynamic>> Function() apiCall,
    T Function(dynamic data) mapper,
  ) async {
    try {
      final response = await apiCall();
      return Right(mapper(response.data));
    } on DioException catch (e) {
      // Error already mapped to Failure by interceptor
      if (e.error is Failure) {
        return Left(e.error as Failure);
      }
      return Left(UnknownFailure(
        message: e.message ?? 'Unknown error',
        originalError: e,
      ));
    }
  }
}

// Usage in repository
class OrderRepository extends BaseRepository {
  Future<Result<Order>> createOrder(CreateOrderRequest request) {
    return safeCall(
      () => _dio.post('/orders', data: request.toJson()),
      (data) => Order.fromJson(data),
    );
  }
}

// Usage in controller/use case
Future<void> submitOrder(CreateOrderRequest request) async {
  state = const OrderState.submitting();
  
  final result = await _repository.createOrder(request);
  
  state = result.fold(
    (failure) => OrderState.error(failure),
    (order) => OrderState.success(order),
  );
}
```

---

## Retry & Idempotency Rules

### Retry Interceptor

```dart
class RetryInterceptor extends Interceptor {
  final Ref _ref;
  
  static const _maxRetries = 3;
  static const _baseDelay = Duration(milliseconds: 500);
  static const _maxDelay = Duration(seconds: 30);
  
  RetryInterceptor(this._ref);
  
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final retryCount = options.extra['retryCount'] ?? 0;
    
    // Check if we should retry
    if (!_shouldRetry(err, retryCount)) {
      // Mark retries exhausted for global handler
      if (retryCount > 0) {
        options.extra['retriesExhausted'] = true;
      }
      return handler.next(err);
    }
    
    // Calculate delay with exponential backoff + jitter
    final delay = _calculateDelay(err, retryCount);
    
    log.d('Retrying request', extra: {
      'requestId': options.extra['requestId'],
      'attempt': retryCount + 1,
      'maxRetries': _maxRetries,
      'delay': delay.inMilliseconds,
    });
    
    await Future.delayed(delay);
    
    // Increment retry count
    options.extra['retryCount'] = retryCount + 1;
    
    // Retry the request
    try {
      final response = await _ref.read(dioProvider).fetch(options);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.reject(e);
    }
  }
  
  bool _shouldRetry(DioException err, int retryCount) {
    if (retryCount >= _maxRetries) return false;
    
    // Never retry non-idempotent methods without idempotency key
    final method = err.requestOptions.method.toUpperCase();
    final hasIdempotencyKey = err.requestOptions.headers.containsKey('Idempotency-Key');
    
    if (['POST', 'PATCH', 'DELETE'].contains(method) && !hasIdempotencyKey) {
      return false;
    }
    
    // Check if error is retryable
    final failure = err.error;
    if (failure is Failure && !failure.isRetryable) {
      return false;
    }
    
    // Retry on specific conditions
    return switch (err.type) {
      DioExceptionType.connectionTimeout => true,
      DioExceptionType.sendTimeout => true,
      DioExceptionType.receiveTimeout => true,
      DioExceptionType.connectionError => true,
      DioExceptionType.badResponse => _isRetryableStatus(err.response?.statusCode),
      _ => false,
    };
  }
  
  bool _isRetryableStatus(int? status) {
    if (status == null) return false;
    return status == 429 || status >= 500;
  }
  
  Duration _calculateDelay(DioException err, int retryCount) {
    // Respect Retry-After header if present
    final retryAfter = err.response?.headers.value('retry-after');
    if (retryAfter != null) {
      final seconds = int.tryParse(retryAfter);
      if (seconds != null) {
        return Duration(seconds: seconds);
      }
    }
    
    // Exponential backoff: 500ms, 1s, 2s, 4s...
    final exponentialDelay = _baseDelay * pow(2, retryCount);
    
    // Add jitter (±25%)
    final jitter = exponentialDelay.inMilliseconds * 0.25;
    final randomJitter = (Random().nextDouble() * 2 - 1) * jitter;
    
    final finalDelay = Duration(
      milliseconds: (exponentialDelay.inMilliseconds + randomJitter).round(),
    );
    
    // Cap at max delay
    return finalDelay > _maxDelay ? _maxDelay : finalDelay;
  }
}
```

### Idempotency Key Strategy

```dart
/// Mixin for repositories that need idempotent write operations
mixin IdempotentOperations {
  /// Generate idempotency key for a request
  /// Format: {operation}:{resource}:{unique_data_hash}:{timestamp}
  String generateIdempotencyKey({
    required String operation,
    required String resource,
    required Map<String, dynamic> data,
  }) {
    final dataHash = _hashData(data);
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return '$operation:$resource:$dataHash:$timestamp';
  }
  
  String _hashData(Map<String, dynamic> data) {
    final jsonString = jsonEncode(data);
    final bytes = utf8.encode(jsonString);
    return sha256.convert(bytes).toString().substring(0, 16);
  }
}

/// Extension to add idempotency header to requests
extension IdempotentRequest on RequestOptions {
  RequestOptions withIdempotencyKey(String key) {
    headers['Idempotency-Key'] = key;
    return this;
  }
}

// Usage in repository
class OrderRepository extends BaseRepository with IdempotentOperations {
  Future<Result<Order>> createOrder(CreateOrderRequest request) {
    final idempotencyKey = generateIdempotencyKey(
      operation: 'create',
      resource: 'order',
      data: request.toJson(),
    );
    
    return safeCall(
      () => _dio.post(
        '/orders',
        data: request.toJson(),
        options: Options(headers: {'Idempotency-Key': idempotencyKey}),
      ),
      (data) => Order.fromJson(data),
    );
  }
}
```

### Idempotency Key Storage for Offline Queue

```dart
/// For offline operations, store idempotency key with the queued item
/// to ensure retry safety when sync eventually happens

@DataClassName('QueuedOperation')
class QueuedOperations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get operationType => text()();
  TextColumn get resourceType => text()();
  TextColumn get payload => text().map(const JsonConverter())();
  TextColumn get idempotencyKey => text().unique()(); // Must be unique
  IntColumn get syncStatus => intEnum<SyncStatus>()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastAttempt => dateTime().nullable()();
}

class OfflineQueueRepository {
  /// Queue an operation with guaranteed unique idempotency key
  Future<void> enqueue({
    required String operationType,
    required String resourceType,
    required Map<String, dynamic> payload,
  }) async {
    final idempotencyKey = _generateKey(operationType, resourceType, payload);
    
    // Check for duplicate (same operation already queued)
    final existing = await _db.getByIdempotencyKey(idempotencyKey);
    if (existing != null) {
      log.w('Duplicate operation ignored', extra: {'key': idempotencyKey});
      return;
    }
    
    await _db.insert(QueuedOperation(
      operationType: operationType,
      resourceType: resourceType,
      payload: payload,
      idempotencyKey: idempotencyKey,
      syncStatus: SyncStatus.pending,
      createdAt: DateTime.now(),
    ));
  }
  
  String _generateKey(String op, String resource, Map<String, dynamic> data) {
    // Include local timestamp to allow same data to be submitted again intentionally
    final localId = data['local_id'] ?? const Uuid().v4();
    return '$op:$resource:$localId';
  }
}
```

### Retry Decision Flowchart

```
Request Failed
      │
      ▼
┌─────────────────┐     No
│ Is Retryable?   │────────► Return Error
│ (check failure │
│  + method)     │
└────────┬────────┘
         │ Yes
         ▼
┌─────────────────┐     No
│ Has Idempotency │────────► Is Method Safe?
│ Key?            │          (GET, HEAD, OPTIONS)
└────────┬────────┘               │
         │ Yes                    │ No → Return Error
         ▼                        │ Yes
┌─────────────────┐               │
│ Retries < Max?  │◄──────────────┘
└────────┬────────┘
         │ Yes          No
         │         ─────────► Mark Exhausted → Return Error
         ▼
┌─────────────────┐
│ Calculate Delay │
│ (exponential +  │
│  jitter)        │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Wait & Retry    │
└─────────────────┘
```

---

## Offline-First Sync Architecture

**Local DB**: Drift (SQLite) — typed, reactive, migration support.

```dart
// Sync status on every syncable entity
enum SyncStatus { pending, syncing, synced, failed }

@DataClassName('Order')
class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get data => text().map(const JsonConverter())();
  IntColumn get syncStatus => intEnum<SyncStatus>()();
  TextColumn get idempotencyKey => text()(); // for safe retries
  DateTimeColumn get lastAttempt => dateTime().nullable()();
}

// Offline queue processor
class SyncEngine {
  Future<void> processQueue() async {
    final pending = await _db.getPendingItems();
    for (final item in pending) {
      await _db.markSyncing(item.id);
      final result = await _api.sync(item, idempotencyKey: item.idempotencyKey);
      result.fold(
        (failure) => _db.markFailed(item.id, failure),
        (_) => _db.markSynced(item.id),
      );
    }
  }
}
```

**Conflict Resolution**: Last-write-wins with server timestamp, surfaced to user for business-critical conflicts.

---

## Location Tracking

```dart
class LocationService {
  // Foreground: high accuracy, 30s intervals
  // Background: balanced, 5min intervals, batched
  
  Stream<Position> trackForeground() => Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 50, // meters
    ),
  );
  
  // Background via workmanager + geolocator
  Future<void> scheduleBackgroundTracking() => Workmanager().registerPeriodicTask(
    'location-sync',
    'uploadLocations',
    frequency: const Duration(minutes: 15),
    constraints: Constraints(networkType: NetworkType.connected),
  );
}
```

**Batching**: Store locally, upload in batches when connected. Encrypt at rest.

---

## RBAC & Permission Handling

### Permission Model from JWT

```dart
// JWT payload structure expected:
// {
//   "sub": "user_123",
//   "email": "agent@company.com",
//   "role": "field_agent",
//   "permissions": ["orders:create", "orders:read", "customers:read", "visits:create"],
//   "region_id": "region_456",
//   "exp": 1704825600
// }

enum Role { admin, manager, fieldAgent, viewer }

enum Permission {
  // Orders
  ordersCreate('orders:create'),
  ordersRead('orders:read'),
  ordersUpdate('orders:update'),
  ordersDelete('orders:delete'),
  ordersApprove('orders:approve'),
  
  // Customers
  customersCreate('customers:create'),
  customersRead('customers:read'),
  customersUpdate('customers:update'),
  customersDelete('customers:delete'),
  
  // Visits
  visitsCreate('visits:create'),
  visitsRead('visits:read'),
  
  // Reports
  reportsView('reports:view'),
  reportsExport('reports:export'),
  
  // Admin
  usersManage('users:manage'),
  settingsManage('settings:manage');
  
  final String value;
  const Permission(this.value);
  
  static Permission? fromString(String value) {
    return Permission.values.cast<Permission?>().firstWhere(
      (p) => p?.value == value,
      orElse: () => null,
    );
  }
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    required Role role,
    required Set<Permission> permissions,
    String? regionId,
  }) = _User;
  
  factory User.fromJwtPayload(Map<String, dynamic> payload) {
    final permStrings = (payload['permissions'] as List).cast<String>();
    final permissions = permStrings
        .map(Permission.fromString)
        .whereNotNull()
        .toSet();
    
    return User(
      id: payload['sub'],
      email: payload['email'],
      name: payload['name'],
      role: Role.values.byName(payload['role']),
      permissions: permissions,
      regionId: payload['region_id'],
    );
  }
}
```

### Permission Providers

```dart
@riverpod
User? currentUser(CurrentUserRef ref) {
  final authState = ref.watch(authControllerProvider);
  return authState.mapOrNull(
    authenticated: (s) => s.user,
    refreshing: (s) => s.user,
  );
}

@riverpod
Set<Permission> userPermissions(UserPermissionsRef ref) {
  return ref.watch(currentUserProvider)?.permissions ?? {};
}

@riverpod
bool hasPermission(HasPermissionRef ref, Permission permission) {
  return ref.watch(userPermissionsProvider).contains(permission);
}

@riverpod
bool hasAnyPermission(HasAnyPermissionRef ref, Set<Permission> permissions) {
  final userPerms = ref.watch(userPermissionsProvider);
  return permissions.any(userPerms.contains);
}
```

### Permission-Driven UI Rendering

```dart
/// Hides child if user lacks permission
class PermissionGate extends ConsumerWidget {
  final Permission permission;
  final Widget child;
  final Widget? fallback;
  
  const PermissionGate({
    required this.permission,
    required this.child,
    this.fallback,
    super.key,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasPermission = ref.watch(hasPermissionProvider(permission));
    
    if (hasPermission) return child;
    return fallback ?? const SizedBox.shrink();
  }
}

/// Hides if user lacks ANY of the permissions
class AnyPermissionGate extends ConsumerWidget {
  final Set<Permission> permissions;
  final Widget child;
  final Widget? fallback;
  
  const AnyPermissionGate({
    required this.permissions,
    required this.child,
    this.fallback,
    super.key,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasAny = ref.watch(hasAnyPermissionProvider(permissions));
    
    if (hasAny) return child;
    return fallback ?? const SizedBox.shrink();
  }
}

// Usage example
class OrdersScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: const OrdersList(),
      floatingActionButton: PermissionGate(
        permission: Permission.ordersCreate,
        child: FloatingActionButton(
          onPressed: () => context.push('/orders/new'),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
```

### Route Guards with GoRouter

```dart
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);
  
  return GoRouter(
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authControllerProvider.notifier).stream,
    ),
    redirect: (context, state) {
      final isAuthenticated = authState is _Authenticated || authState is _Refreshing;
      final isAuthRoute = state.matchedLocation == '/login' || 
                          state.matchedLocation == '/forgot-password';
      
      // Not authenticated and not on auth route → go to login
      if (!isAuthenticated && !isAuthRoute) {
        return '/login?redirect=${state.uri}';
      }
      
      // Authenticated and on auth route → go to dashboard
      if (isAuthenticated && isAuthRoute) {
        return '/dashboard';
      }
      
      // Permission-based redirects
      if (isAuthenticated) {
        final permissions = (authState as dynamic).user.permissions as Set<Permission>;
        final requiredPermission = _routePermissions[state.matchedLocation];
        if (requiredPermission != null && !permissions.contains(requiredPermission)) {
          return '/unauthorized';
        }
      }
      
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      ShellRoute(
        builder: (_, __, child) => AppShell(child: child),
        routes: [
          GoRoute(path: '/dashboard', builder: (_, __) => const DashboardScreen()),
          GoRoute(path: '/orders', builder: (_, __) => const OrdersScreen()),
          GoRoute(path: '/customers', builder: (_, __) => const CustomersScreen()),
          GoRoute(path: '/admin/users', builder: (_, __) => const AdminUsersScreen()),
          GoRoute(path: '/unauthorized', builder: (_, __) => const UnauthorizedScreen()),
        ],
      ),
    ],
  );
});

// Route → required permission mapping
const _routePermissions = <String, Permission>{
  '/orders': Permission.ordersRead,
  '/orders/new': Permission.ordersCreate,
  '/customers': Permission.customersRead,
  '/reports': Permission.reportsView,
  '/admin/users': Permission.usersManage,
};
```

---

## Mobile Security Considerations

### Token Security

| Concern | Mitigation |
|---------|------------|
| Token theft from storage | iOS Keychain / Android EncryptedSharedPreferences |
| Token in memory | Clear on logout, avoid logging |
| Token in transit | HTTPS only, certificate pinning |
| Token leakage via logs | Strip auth headers from logged requests |

### Certificate Pinning

```dart
class CertificatePinning {
  static HttpClient createPinnedClient() {
    final context = SecurityContext(withTrustedRoots: false);
    context.setTrustedCertificatesBytes(_pinnedCertificate);
    return HttpClient(context: context)
      ..badCertificateCallback = (cert, host, port) => kDebugMode;
  }
}

// Apply to Dio
final dio = Dio()
  ..httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: CertificatePinning.createPinnedClient,
  );
```

### Biometric Re-authentication

```dart
class BiometricAuthService {
  final LocalAuthentication _localAuth;
  
  Future<bool> authenticateForSensitiveAction({required String reason}) async {
    try {
      return await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false, // Allow PIN fallback
        ),
      );
    } on PlatformException {
      return false;
    }
  }
}

// Usage: require biometric for sensitive operations
Future<void> approveHighValueOrder(String orderId) async {
  final authenticated = await ref.read(biometricAuthProvider)
    .authenticateForSensitiveAction(reason: 'Authenticate to approve order');
  
  if (!authenticated) throw const AuthFailure.biometricFailed();
  await _repository.approveOrder(orderId);
}
```

### App Background Security

```dart
class AppLifecycleHandler extends WidgetsBindingObserver {
  DateTime? _backgroundedAt;
  
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        _backgroundedAt = DateTime.now();
        _ref.read(secureOverlayProvider.notifier).show(); // Obscure content
        break;
        
      case AppLifecycleState.resumed:
        _ref.read(secureOverlayProvider.notifier).hide();
        // Force re-auth if backgrounded > 15 min
        if (_backgroundedAt != null) {
          final duration = DateTime.now().difference(_backgroundedAt!);
          if (duration > const Duration(minutes: 15)) {
            _ref.read(authControllerProvider.notifier).logout(
              forced: true, reason: 'Session timeout',
            );
          }
        }
        break;
      default: break;
    }
  }
}
```

### Security Checklist

- [ ] Tokens stored in platform secure storage only
- [ ] No tokens in logs, crash reports, or analytics
- [ ] Certificate pinning enabled for production
- [ ] Biometric option for sensitive operations
- [ ] Secure overlay when app backgrounded
- [ ] Background timeout forces re-authentication
- [ ] Root/jailbreak detection with graceful handling
- [ ] ProGuard/R8 obfuscation for Android release
- [ ] No sensitive data in SharedPreferences
- [ ] HTTP traffic blocked (HTTPS only)

---

## Mobile HA Strategy

### Multi-Region Backend Awareness

```dart
/// Configuration for multi-region failover
class ApiConfig {
  static const regions = [
    ApiRegion(
      id: 'us-east',
      baseUrl: 'https://api-us-east.outletmanager.com',
      priority: 1,
    ),
    ApiRegion(
      id: 'us-west',
      baseUrl: 'https://api-us-west.outletmanager.com',
      priority: 2,
    ),
    ApiRegion(
      id: 'eu-west',
      baseUrl: 'https://api-eu-west.outletmanager.com',
      priority: 3,
    ),
  ];
  
  /// Health check endpoint (lightweight, no auth required)
  static const healthPath = '/health';
  
  /// Region assignment endpoint (returns optimal region for client)
  static const regionAssignmentPath = '/v1/region-assignment';
}

@freezed
class ApiRegion with _$ApiRegion {
  const factory ApiRegion({
    required String id,
    required String baseUrl,
    required int priority,
    @Default(true) bool isHealthy,
    DateTime? lastHealthCheck,
    @Default(0) int consecutiveFailures,
  }) = _ApiRegion;
}
```

### Region Manager

```dart
@riverpod
class RegionManager extends _$RegionManager {
  static const _healthCheckInterval = Duration(minutes: 5);
  static const _failureThreshold = 3;
  
  @override
  RegionState build() {
    // Load persisted region preference
    _loadPersistedRegion();
    // Start background health monitoring
    _startHealthMonitor();
    return RegionState.initial(regions: ApiConfig.regions);
  }
  
  /// Get current active region (best healthy region)
  ApiRegion get activeRegion {
    final healthy = state.regions.where((r) => r.isHealthy).toList();
    if (healthy.isEmpty) {
      // All regions unhealthy - use primary as last resort
      return state.regions.first;
    }
    // Return highest priority healthy region
    return healthy.reduce((a, b) => a.priority < b.priority ? a : b);
  }
  
  /// Called when a request to a region fails
  Future<void> reportFailure(String regionId) async {
    state = state.copyWith(
      regions: state.regions.map((r) {
        if (r.id != regionId) return r;
        
        final failures = r.consecutiveFailures + 1;
        return r.copyWith(
          consecutiveFailures: failures,
          isHealthy: failures < _failureThreshold,
        );
      }).toList(),
    );
    
    // If active region is now unhealthy, trigger immediate failover check
    if (!activeRegion.isHealthy) {
      await _checkAllRegions();
    }
  }
  
  /// Called when a request to a region succeeds
  void reportSuccess(String regionId) {
    state = state.copyWith(
      regions: state.regions.map((r) {
        if (r.id != regionId) return r;
        return r.copyWith(
          consecutiveFailures: 0,
          isHealthy: true,
          lastHealthCheck: DateTime.now(),
        );
      }).toList(),
    );
  }
  
  /// Periodic health check of all regions
  Future<void> _checkAllRegions() async {
    final results = await Future.wait(
      state.regions.map((r) => _checkRegionHealth(r)),
    );
    
    state = state.copyWith(regions: results);
    
    // Persist healthy region preference
    final active = activeRegion;
    await ref.read(preferencesProvider).setString('active_region', active.id);
  }
  
  Future<ApiRegion> _checkRegionHealth(ApiRegion region) async {
    try {
      final dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ));
      
      final response = await dio.get('${region.baseUrl}${ApiConfig.healthPath}');
      
      return region.copyWith(
        isHealthy: response.statusCode == 200,
        lastHealthCheck: DateTime.now(),
        consecutiveFailures: 0,
      );
    } catch (_) {
      return region.copyWith(
        isHealthy: false,
        lastHealthCheck: DateTime.now(),
        consecutiveFailures: region.consecutiveFailures + 1,
      );
    }
  }
  
  void _startHealthMonitor() {
    // Check immediately on start
    _checkAllRegions();
    
    // Then periodically
    Timer.periodic(_healthCheckInterval, (_) => _checkAllRegions());
  }
  
  Future<void> _loadPersistedRegion() async {
    final savedId = await ref.read(preferencesProvider).getString('active_region');
    if (savedId != null) {
      // Prioritize saved region by checking it first
      final saved = state.regions.firstWhereOrNull((r) => r.id == savedId);
      if (saved != null) {
        final health = await _checkRegionHealth(saved);
        if (health.isHealthy) {
          state = state.copyWith(
            regions: state.regions.map((r) => r.id == savedId ? health : r).toList(),
          );
        }
      }
    }
  }
}
```

### Region-Aware Request Interceptor

```dart
class RegionInterceptor extends Interceptor {
  final Ref _ref;
  
  RegionInterceptor(this._ref);
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final regionManager = _ref.read(regionManagerProvider.notifier);
    final activeRegion = regionManager.activeRegion;
    
    // Rewrite base URL to active region
    options.baseUrl = activeRegion.baseUrl;
    options.extra['regionId'] = activeRegion.id;
    
    handler.next(options);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final regionId = response.requestOptions.extra['regionId'] as String?;
    if (regionId != null) {
      _ref.read(regionManagerProvider.notifier).reportSuccess(regionId);
    }
    handler.next(response);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final regionId = err.requestOptions.extra['regionId'] as String?;
    
    // Only report region failure for network/server errors, not client errors
    if (regionId != null && _isRegionFailure(err)) {
      _ref.read(regionManagerProvider.notifier).reportFailure(regionId);
    }
    
    handler.next(err);
  }
  
  bool _isRegionFailure(DioException err) {
    // Region failure = can't reach server or server is broken
    return err.type == DioExceptionType.connectionTimeout ||
           err.type == DioExceptionType.connectionError ||
           (err.response?.statusCode ?? 0) >= 500;
  }
}
```

### Client-Side Circuit Breaker

```dart
enum CircuitState { closed, open, halfOpen }

class CircuitBreaker {
  final String name;
  final int failureThreshold;
  final Duration resetTimeout;
  final Duration halfOpenTimeout;
  
  CircuitState _state = CircuitState.closed;
  int _failureCount = 0;
  DateTime? _lastFailure;
  DateTime? _openedAt;
  
  CircuitBreaker({
    required this.name,
    this.failureThreshold = 5,
    this.resetTimeout = const Duration(seconds: 30),
    this.halfOpenTimeout = const Duration(seconds: 10),
  });
  
  CircuitState get state {
    if (_state == CircuitState.open) {
      // Check if we should transition to half-open
      if (_openedAt != null && 
          DateTime.now().difference(_openedAt!) > resetTimeout) {
        _state = CircuitState.halfOpen;
      }
    }
    return _state;
  }
  
  /// Check if request should be allowed
  bool get allowRequest {
    switch (state) {
      case CircuitState.closed:
        return true;
      case CircuitState.open:
        return false;
      case CircuitState.halfOpen:
        // Allow limited requests in half-open state
        return true;
    }
  }
  
  /// Record a successful call
  void recordSuccess() {
    _failureCount = 0;
    _state = CircuitState.closed;
    log.d('Circuit $name: closed (success)');
  }
  
  /// Record a failed call
  void recordFailure() {
    _failureCount++;
    _lastFailure = DateTime.now();
    
    if (_failureCount >= failureThreshold) {
      _state = CircuitState.open;
      _openedAt = DateTime.now();
      log.w('Circuit $name: opened after $failureThreshold failures');
    }
    
    // If we were half-open and failed, go back to open
    if (_state == CircuitState.halfOpen) {
      _state = CircuitState.open;
      _openedAt = DateTime.now();
      log.w('Circuit $name: re-opened from half-open');
    }
  }
  
  /// Execute function with circuit breaker protection
  Future<Result<T>> execute<T>(Future<Result<T>> Function() fn) async {
    if (!allowRequest) {
      return Left(ServerFailure.serviceUnavailable(
        retryAfter: resetTimeout - DateTime.now().difference(_openedAt!),
      ));
    }
    
    final result = await fn();
    
    result.fold(
      (failure) {
        if (failure.isRetryable) recordFailure();
      },
      (_) => recordSuccess(),
    );
    
    return result;
  }
}

/// Circuit breakers per service/endpoint group
@riverpod
class CircuitBreakerRegistry extends _$CircuitBreakerRegistry {
  final _breakers = <String, CircuitBreaker>{};
  
  @override
  void build() {}
  
  CircuitBreaker forService(String service) {
    return _breakers.putIfAbsent(
      service,
      () => CircuitBreaker(name: service),
    );
  }
  
  CircuitBreaker get orders => forService('orders');
  CircuitBreaker get customers => forService('customers');
  CircuitBreaker get sync => forService('sync');
  CircuitBreaker get auth => forService('auth');
}

// Usage in repository
class OrderRepository {
  Future<Result<List<Order>>> getOrders() async {
    final circuit = _ref.read(circuitBreakerRegistryProvider.notifier).orders;
    
    return circuit.execute(() => _apiCall());
  }
}
```

---

## Failure Scenarios & Recovery

### Failure Classification

| Failure Type | Detection | Immediate Action | Recovery Strategy |
|-------------|-----------|------------------|-------------------|
| **Total Backend Outage** | All regions fail health check | Switch to offline mode | Poll health endpoints, auto-recover |
| **Single Region Down** | 3+ consecutive failures | Failover to next region | Background health checks |
| **Network Unavailable** | Connectivity provider | Queue writes, serve cache | Auto-sync on reconnect |
| **Degraded Performance** | High latency (>5s) | Increase timeouts, show indicator | Circuit breaker, retry with backoff |
| **Auth Service Down** | Token refresh fails with 5xx | Extend token grace period | Retry refresh with backoff |
| **Partial Service Outage** | Specific endpoints 5xx | Circuit breaker per service | Graceful feature degradation |

### Backend Outage Handler

```dart
@riverpod
class OutageHandler extends _$OutageHandler {
  static const _graceTokenExtension = Duration(hours: 2);
  
  @override
  OutageState build() {
    // Listen to region health changes
    ref.listen(regionManagerProvider, (_, state) {
      _evaluateOutageState(state);
    });
    return const OutageState.operational();
  }
  
  void _evaluateOutageState(RegionState regionState) {
    final healthyCount = regionState.regions.where((r) => r.isHealthy).length;
    final totalCount = regionState.regions.length;
    
    if (healthyCount == 0) {
      _handleTotalOutage();
    } else if (healthyCount < totalCount) {
      _handlePartialOutage(healthyCount, totalCount);
    } else {
      _handleRecovery();
    }
  }
  
  void _handleTotalOutage() {
    state = const OutageState.totalOutage();
    
    // Extend token expiry to allow continued offline use
    _extendTokenGracePeriod();
    
    // Enable full offline mode
    ref.read(offlineModeProvider.notifier).enable(forced: true);
    
    // Show persistent banner
    ref.read(systemBannerProvider.notifier).show(
      SystemBanner.outage(
        message: 'Service temporarily unavailable. Working offline.',
        dismissible: false,
      ),
    );
    
    // Start aggressive health polling
    _startRecoveryPolling();
  }
  
  void _handlePartialOutage(int healthy, int total) {
    state = OutageState.degraded(healthyRegions: healthy, totalRegions: total);
    
    // Show warning banner
    ref.read(systemBannerProvider.notifier).show(
      SystemBanner.warning(
        message: 'Some services may be slow. Data will sync automatically.',
        dismissible: true,
      ),
    );
  }
  
  void _handleRecovery() {
    final wasInOutage = state is! _Operational;
    state = const OutageState.operational();
    
    if (wasInOutage) {
      // Clear banners
      ref.read(systemBannerProvider.notifier).clear();
      
      // Trigger sync of queued operations
      ref.read(syncEngineProvider.notifier).syncNow();
      
      // Refresh stale data
      ref.invalidate(customersProvider);
      ref.invalidate(ordersProvider);
      
      // Show recovery toast
      ref.read(toastProvider.notifier).show(
        message: 'Connection restored. Syncing data...',
        type: ToastType.success,
      );
    }
  }
  
  void _extendTokenGracePeriod() async {
    final storage = ref.read(tokenStorageProvider);
    final tokens = await storage.getTokens();
    
    if (tokens != null) {
      // Allow access token to be used past expiry during outage
      await storage.saveTokens(tokens.copyWith(
        accessExpiresAt: tokens.accessExpiresAt.add(_graceTokenExtension),
      ));
    }
  }
  
  Timer? _recoveryTimer;
  
  void _startRecoveryPolling() {
    _recoveryTimer?.cancel();
    _recoveryTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => ref.read(regionManagerProvider.notifier)._checkAllRegions(),
    );
  }
}
```

### Request Timeout Escalation

```dart
class AdaptiveTimeoutInterceptor extends Interceptor {
  final Ref _ref;
  
  // Track recent request latencies
  final _latencies = <int>[];
  static const _sampleSize = 20;
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final baseTimeout = options.connectTimeout ?? const Duration(seconds: 30);
    
    // If we're in degraded mode, increase timeouts
    final outageState = _ref.read(outageHandlerProvider);
    if (outageState is _Degraded) {
      options.connectTimeout = baseTimeout * 2;
      options.receiveTimeout = (options.receiveTimeout ?? baseTimeout) * 2;
    }
    
    // Track start time for latency measurement
    options.extra['requestStart'] = DateTime.now().millisecondsSinceEpoch;
    
    handler.next(options);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _recordLatency(response.requestOptions);
    handler.next(response);
  }
  
  void _recordLatency(RequestOptions options) {
    final start = options.extra['requestStart'] as int?;
    if (start != null) {
      final latency = DateTime.now().millisecondsSinceEpoch - start;
      _latencies.add(latency);
      if (_latencies.length > _sampleSize) {
        _latencies.removeAt(0);
      }
      
      // Report if latency is degraded
      final avgLatency = _latencies.reduce((a, b) => a + b) / _latencies.length;
      if (avgLatency > 5000) { // 5 seconds
        _ref.read(outageHandlerProvider.notifier)._handlePartialOutage(
          _ref.read(regionManagerProvider).regions.where((r) => r.isHealthy).length,
          _ref.read(regionManagerProvider).regions.length,
        );
      }
    }
  }
}
```

---

## Graceful Degradation

### Feature Availability Matrix

```dart
enum FeatureFlag {
  ordersCreate,
  ordersView,
  ordersEdit,
  customersView,
  customersEdit,
  locationTracking,
  reportsView,
  sync,
}

@riverpod
class FeatureAvailability extends _$FeatureAvailability {
  @override
  Map<FeatureFlag, bool> build() {
    final connectivity = ref.watch(connectivityProvider);
    final outage = ref.watch(outageHandlerProvider);
    final circuits = ref.watch(circuitBreakerRegistryProvider);
    
    return _calculateAvailability(connectivity, outage, circuits);
  }
  
  Map<FeatureFlag, bool> _calculateAvailability(
    ConnectivityState connectivity,
    OutageState outage,
    CircuitBreakerRegistry circuits,
  ) {
    // Full online mode
    if (connectivity.isOnline && outage is _Operational) {
      return {for (final f in FeatureFlag.values) f: true};
    }
    
    // Total outage or offline
    if (!connectivity.isOnline || outage is _TotalOutage) {
      return {
        // Read-only from cache
        FeatureFlag.ordersView: true,
        FeatureFlag.customersView: true,
        // Writes queued for later
        FeatureFlag.ordersCreate: true, // Will be queued
        FeatureFlag.ordersEdit: true,   // Will be queued
        FeatureFlag.customersEdit: true, // Will be queued
        // Disabled
        FeatureFlag.reportsView: false, // Requires live data
        FeatureFlag.sync: false,
        // Location continues locally
        FeatureFlag.locationTracking: true,
      };
    }
    
    // Degraded - check per-service circuit breakers
    return {
      FeatureFlag.ordersCreate: circuits.orders.allowRequest,
      FeatureFlag.ordersView: true, // Can serve from cache
      FeatureFlag.ordersEdit: circuits.orders.allowRequest,
      FeatureFlag.customersView: true,
      FeatureFlag.customersEdit: circuits.customers.allowRequest,
      FeatureFlag.reportsView: circuits.forService('reports').allowRequest,
      FeatureFlag.sync: circuits.sync.allowRequest,
      FeatureFlag.locationTracking: true,
    };
  }
  
  bool isAvailable(FeatureFlag feature) => state[feature] ?? false;
}

/// Widget that shows degraded UI when feature unavailable
class DegradedFeatureGate extends ConsumerWidget {
  final FeatureFlag feature;
  final Widget child;
  final Widget? degradedChild;
  final String? degradedMessage;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final available = ref.watch(
      featureAvailabilityProvider.select((s) => s[feature] ?? false),
    );
    
    if (available) return child;
    
    return degradedChild ?? _DefaultDegradedView(
      message: degradedMessage ?? 'This feature is temporarily unavailable',
    );
  }
}
```

### Offline-Capable Operations

```dart
/// Mixin for repositories that support offline operation
mixin OfflineCapable<T> {
  LocalDatabase get db;
  
  /// Fetch with offline fallback
  Future<Result<List<T>>> fetchWithFallback({
    required Future<Result<List<T>>> Function() remoteCall,
    required Future<List<T>> Function() localCall,
    required Future<void> Function(List<T>) cacheResults,
  }) async {
    final connectivity = ref.read(connectivityProvider);
    
    if (!connectivity.isOnline) {
      // Offline: return cached data
      final cached = await localCall();
      return Right(cached);
    }
    
    // Online: try remote, fallback to cache on failure
    final result = await remoteCall();
    
    return result.fold(
      (failure) async {
        if (failure is NetworkFailure || failure is ServerFailure) {
          // Serve stale cache
          final cached = await localCall();
          return Right(cached);
        }
        return Left(failure);
      },
      (data) async {
        // Cache fresh data
        await cacheResults(data);
        return Right(data);
      },
    );
  }
  
  /// Write with offline queue
  Future<Result<T>> writeWithQueue({
    required Future<Result<T>> Function() remoteCall,
    required Future<T> Function() createLocal,
    required Future<void> Function(T, String idempotencyKey) queueForSync,
  }) async {
    final connectivity = ref.read(connectivityProvider);
    final idempotencyKey = const Uuid().v4();
    
    if (!connectivity.isOnline) {
      // Create local optimistic record
      final local = await createLocal();
      await queueForSync(local, idempotencyKey);
      return Right(local);
    }
    
    // Online: try remote
    final result = await remoteCall();
    
    return result.fold(
      (failure) async {
        if (failure is NetworkFailure || failure is ServerFailure) {
          // Queue for later sync
          final local = await createLocal();
          await queueForSync(local, idempotencyKey);
          return Right(local);
        }
        return Left(failure);
      },
      (data) => Right(data),
    );
  }
}
```

### Stale Data Indicators

```dart
/// Shows data freshness to user
class DataFreshnessIndicator extends StatelessWidget {
  final DateTime? lastUpdated;
  final Duration staleThreshold;
  
  const DataFreshnessIndicator({
    required this.lastUpdated,
    this.staleThreshold = const Duration(minutes: 15),
  });
  
  @override
  Widget build(BuildContext context) {
    if (lastUpdated == null) {
      return const _OfflineIndicator();
    }
    
    final age = DateTime.now().difference(lastUpdated!);
    
    if (age < staleThreshold) {
      return const SizedBox.shrink(); // Fresh, no indicator needed
    }
    
    if (age < const Duration(hours: 1)) {
      return _StaleIndicator(message: 'Updated ${age.inMinutes}m ago');
    }
    
    if (age < const Duration(hours: 24)) {
      return _StaleIndicator(message: 'Updated ${age.inHours}h ago');
    }
    
    return _StaleIndicator(
      message: 'Updated ${age.inDays}d ago',
      severity: StaleSeverity.warning,
    );
  }
}

/// Pull-to-refresh with offline awareness
class OfflineAwareRefreshIndicator extends ConsumerWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = ref.watch(connectivityProvider).isOnline;
    
    return RefreshIndicator(
      onRefresh: isOnline 
        ? onRefresh 
        : () async {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cannot refresh while offline')),
            );
          },
      child: child,
    );
  }
}
```

---

## Observability & Operations

### Structured Logging

```dart
enum LogLevel { debug, info, warning, error, fatal }

class AppLogger {
  static final _instance = AppLogger._();
  factory AppLogger() => _instance;
  AppLogger._();
  
  final _buffer = <LogEntry>[];
  static const _maxBufferSize = 1000;
  
  void log(
    LogLevel level,
    String message, {
    Map<String, dynamic>? extra,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final entry = LogEntry(
      timestamp: DateTime.now(),
      level: level,
      message: message,
      extra: {
        ...?extra,
        'sessionId': _sessionId,
        'userId': _userId,
        'appVersion': AppConfig.appVersion,
        'platform': Platform.isIOS ? 'ios' : 'android',
        'osVersion': Platform.operatingSystemVersion,
      },
      error: error?.toString(),
      stackTrace: stackTrace?.toString(),
    );
    
    // Buffer for batch upload
    _buffer.add(entry);
    if (_buffer.length > _maxBufferSize) {
      _buffer.removeAt(0);
    }
    
    // Console output in debug
    if (kDebugMode) {
      _printToConsole(entry);
    }
    
    // Immediate upload for errors
    if (level == LogLevel.error || level == LogLevel.fatal) {
      _uploadImmediate(entry);
    }
  }
  
  // Convenience methods
  void d(String msg, {Map<String, dynamic>? extra}) => 
    log(LogLevel.debug, msg, extra: extra);
  void i(String msg, {Map<String, dynamic>? extra}) => 
    log(LogLevel.info, msg, extra: extra);
  void w(String msg, {Map<String, dynamic>? extra}) => 
    log(LogLevel.warning, msg, extra: extra);
  void e(String msg, {Map<String, dynamic>? extra, Object? error, StackTrace? stack}) => 
    log(LogLevel.error, msg, extra: extra, error: error, stackTrace: stack);
  
  /// Flush buffered logs (call on app background/terminate)
  Future<void> flush() async {
    if (_buffer.isEmpty) return;
    
    final batch = List<LogEntry>.from(_buffer);
    _buffer.clear();
    
    try {
      await _uploadBatch(batch);
    } catch (e) {
      // Re-add to buffer if upload fails
      _buffer.insertAll(0, batch);
    }
  }
  
  String? _sessionId;
  String? _userId;
  
  void setSession(String sessionId) => _sessionId = sessionId;
  void setUser(String? userId) => _userId = userId;
}

final log = AppLogger();

@freezed
class LogEntry with _$LogEntry {
  const factory LogEntry({
    required DateTime timestamp,
    required LogLevel level,
    required String message,
    Map<String, dynamic>? extra,
    String? error,
    String? stackTrace,
  }) = _LogEntry;
}
```

### Crash Reporting Integration

```dart
class CrashReporting {
  static late final FirebaseCrashlytics _crashlytics;
  
  static Future<void> initialize() async {
    _crashlytics = FirebaseCrashlytics.instance;
    
    // Capture Flutter errors
    FlutterError.onError = (details) {
      _crashlytics.recordFlutterFatalError(details);
    };
    
    // Capture async errors
    PlatformDispatcher.instance.onError = (error, stack) {
      _crashlytics.recordError(error, stack, fatal: true);
      return true;
    };
  }
  
  static void setUser(String userId) {
    _crashlytics.setUserIdentifier(userId);
  }
  
  static void clearUser() {
    _crashlytics.setUserIdentifier('');
  }
  
  static void setCustomKey(String key, dynamic value) {
    _crashlytics.setCustomKey(key, value.toString());
  }
  
  static void recordError(
    Object error, {
    StackTrace? stackTrace,
    Map<String, dynamic>? context,
    bool fatal = false,
  }) {
    // Add context as custom keys
    context?.forEach((key, value) {
      _crashlytics.setCustomKey(key, value.toString());
    });
    
    _crashlytics.recordError(
      error,
      stackTrace ?? StackTrace.current,
      fatal: fatal,
      reason: context?['reason']?.toString(),
    );
  }
  
  /// Record non-fatal issue with context
  static void recordIssue(
    String message, {
    Map<String, dynamic>? context,
  }) {
    _crashlytics.log(message);
    context?.forEach((key, value) {
      _crashlytics.setCustomKey(key, value.toString());
    });
  }
}
```

### Request ID Propagation

```dart
/// Request context for full traceability
class RequestContext {
  final String requestId;      // Unique per request
  final String sessionId;      // Unique per app session
  final String? correlationId; // Shared across related operations
  
  RequestContext({
    String? requestId,
    required this.sessionId,
    this.correlationId,
  }) : requestId = requestId ?? const Uuid().v4();
  
  Map<String, String> toHeaders() => {
    'X-Request-ID': requestId,
    'X-Session-ID': sessionId,
    if (correlationId != null) 'X-Correlation-ID': correlationId!,
  };
}

/// Interceptor that adds tracing headers
class TracingInterceptor extends Interceptor {
  final Ref _ref;
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final context = RequestContext(
      sessionId: _ref.read(sessionIdProvider),
      correlationId: options.extra['correlationId'] as String?,
    );
    
    options.headers.addAll(context.toHeaders());
    options.extra['requestContext'] = context;
    
    handler.next(options);
  }
}

/// Error display with support reference
class ErrorDisplay extends StatelessWidget {
  final Failure failure;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(failure.displayMessage),
        if (failure.requestId != null)
          Text(
            'Reference: ${failure.requestId}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ElevatedButton(
          onPressed: () => _copyToClipboard(failure.requestId!),
          child: const Text('Copy Reference'),
        ),
      ],
    );
  }
}
```

### Performance Monitoring

```dart
class PerformanceMonitor {
  static final _traces = <String, DateTime>{};
  
  /// Start a trace
  static void startTrace(String name) {
    _traces[name] = DateTime.now();
    FirebasePerformance.instance.newTrace(name).start();
  }
  
  /// End a trace and record metrics
  static void endTrace(String name, {Map<String, int>? metrics}) {
    final start = _traces.remove(name);
    if (start != null) {
      final duration = DateTime.now().difference(start);
      
      log.d('Trace: $name', extra: {
        'duration_ms': duration.inMilliseconds,
        ...?metrics,
      });
    }
  }
  
  /// Monitor API call performance
  static Future<T> monitorApiCall<T>(
    String endpoint,
    Future<T> Function() call,
  ) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await call();
      stopwatch.stop();
      
      _recordApiMetric(endpoint, stopwatch.elapsedMilliseconds, success: true);
      return result;
    } catch (e) {
      stopwatch.stop();
      _recordApiMetric(endpoint, stopwatch.elapsedMilliseconds, success: false);
      rethrow;
    }
  }
  
  static void _recordApiMetric(String endpoint, int durationMs, {required bool success}) {
    log.i('API Call', extra: {
      'endpoint': endpoint,
      'duration_ms': durationMs,
      'success': success,
    });
    
    // Alert on slow requests
    if (durationMs > 5000) {
      log.w('Slow API call', extra: {
        'endpoint': endpoint,
        'duration_ms': durationMs,
      });
    }
  }
}
```

### Environment Configuration

```dart
enum Environment { dev, staging, prod }

class AppConfig {
  static late Environment environment;
  static late String apiBaseUrl;
  static late String appVersion;
  static late Uint8List? pinnedCertificate;
  
  static Future<void> initialize(Environment env) async {
    environment = env;
    
    switch (env) {
      case Environment.dev:
        apiBaseUrl = 'https://api-dev.outletmanager.com';
        pinnedCertificate = null; // No pinning in dev
        break;
      case Environment.staging:
        apiBaseUrl = 'https://api-staging.outletmanager.com';
        pinnedCertificate = await _loadCert('staging');
        break;
      case Environment.prod:
        apiBaseUrl = 'https://api.outletmanager.com';
        pinnedCertificate = await _loadCert('prod');
        break;
    }
    
    appVersion = (await PackageInfo.fromPlatform()).version;
    
    // Configure crash reporting
    CrashReporting.setCustomKey('environment', env.name);
    CrashReporting.setCustomKey('app_version', appVersion);
  }
  
  static bool get isDev => environment == Environment.dev;
  static bool get isProd => environment == Environment.prod;
  
  static Future<Uint8List> _loadCert(String env) async {
    final data = await rootBundle.load('assets/certs/$env.pem');
    return data.buffer.asUint8List();
  }
}

// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Determine environment from build config
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');
  await AppConfig.initialize(Environment.values.byName(env));
  
  await CrashReporting.initialize();
  
  // Generate session ID
  final sessionId = const Uuid().v4();
  log.setSession(sessionId);
  
  runApp(
    ProviderScope(
      overrides: [
        sessionIdProvider.overrideWithValue(sessionId),
      ],
      child: const MyApp(),
    ),
  );
}
```

### Health Dashboard Widget (Debug)

```dart
/// Debug overlay showing system health (dev/staging only)
class HealthDashboard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (AppConfig.isProd) return const SizedBox.shrink();
    
    final connectivity = ref.watch(connectivityProvider);
    final regions = ref.watch(regionManagerProvider);
    final outage = ref.watch(outageHandlerProvider);
    final circuits = ref.watch(circuitBreakerRegistryProvider);
    
    return Positioned(
      bottom: 100,
      right: 10,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _StatusRow('Network', connectivity.isOnline ? '✅' : '❌'),
              _StatusRow('Region', regions.activeRegion.id),
              _StatusRow('Status', outage.map(
                operational: (_) => '✅ Operational',
                degraded: (d) => '⚠️ Degraded (${d.healthyRegions}/${d.totalRegions})',
                totalOutage: (_) => '❌ Outage',
              )),
              const Divider(),
              Text('Circuit Breakers', style: TextStyle(fontWeight: FontWeight.bold)),
              _CircuitRow('Orders', circuits.orders.state),
              _CircuitRow('Customers', circuits.customers.state),
              _CircuitRow('Sync', circuits.sync.state),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## Resilience Patterns

```
lib/
├── core/
│   ├── network/          # Dio client, interceptors, failures
│   ├── storage/          # Secure storage, preferences
│   └── utils/            # Extensions, constants
├── features/
│   ├── auth/
│   │   ├── data/         # Repositories impl, DTOs
│   │   ├── domain/       # Entities, repo interfaces
│   │   └── presentation/ # Screens, widgets, controllers
│   ├── customers/
│   ├── orders/
│   └── visits/
├── shared/
│   ├── widgets/          # PermissionGate, ErrorView, etc.
│   └── services/         # Location, sync engine, connectivity
└── main.dart
```

---

## Key Dependencies

```yaml
dependencies:
  flutter_riverpod: ^2.5.0   # State management
  dio: ^5.4.0                # HTTP client
  drift: ^2.15.0             # Local SQLite
  flutter_secure_storage: ^9.0.0
  go_router: ^13.0.0         # Navigation
  freezed_annotation: ^2.4.0 # Immutable models
  geolocator: ^11.0.0        # Location
  workmanager: ^0.5.2        # Background tasks
  connectivity_plus: ^6.0.0
  
dev_dependencies:
  riverpod_generator: ^2.4.0
  freezed: ^2.4.0
  drift_dev: ^2.15.0
  mocktail: ^1.0.0           # Testing
```

---

## Architecture Summary

```
┌────────────────────────────────────────────────────────────────────┐
│                         MOBILE CLIENT                              │
├────────────────────────────────────────────────────────────────────┤
│  UI Layer          │ Screens, Widgets, PermissionGate, ErrorView  │
│  State (Riverpod)  │ AuthController, SyncEngine, Connectivity     │
│  Domain            │ Entities, Repositories (interfaces), Failures│
│  Infrastructure    │ Dio + Interceptors, Drift DB, SecureStorage  │
├────────────────────────────────────────────────────────────────────┤
│                      CROSS-CUTTING CONCERNS                        │
│  Auth: JWT + single-flight refresh │ RBAC: Permission providers   │
│  Offline: Queue + sync engine      │ HA: Circuit breakers, regions│
│  Observability: Logs, crashes, IDs │ Location: Foreground + BG    │
└────────────────────────────────────────────────────────────────────┘
         │                    │                    │
         ▼                    ▼                    ▼
┌─────────────┐      ┌─────────────┐      ┌─────────────┐
│  Region 1   │      │  Region 2   │      │  Region 3   │
│  (Primary)  │      │  (Failover) │      │  (Failover) │
└─────────────┘      └─────────────┘      └─────────────┘
```

**Data Flow**: UI → Controller → Repository → (Online: API | Offline: LocalDB + Queue) → Sync Engine → API

**Key Patterns**:
- `Result<T>` (Either) for all fallible operations
- Interceptor chain: RequestId → Connectivity → Auth → Region → Retry → ErrorMapping → Logging
- Offline writes queue with idempotency keys; sync on reconnect
- Circuit breakers per service; region failover on consecutive failures

---

## Implementation Roadmap

### Phase 1: Core Infrastructure (Weeks 1-3)

| Component | Deliverable | Acceptance Criteria |
|-----------|-------------|---------------------|
| Project Setup | Feature-based folder structure | Compiles, lints pass |
| Network Layer | Dio + all interceptors | Request/response logging works |
| Error Handling | Typed Failure hierarchy | All HTTP codes map correctly |
| Auth | Login, logout, token refresh | Silent refresh works, force logout on invalid |
| Secure Storage | Token persistence | Survives app restart, encrypted |
| Connectivity | Online/offline detection | Banner shows on disconnect |

**Exit Criteria**: User can login, make authenticated API calls, handle 401 refresh, see offline banner.

### Phase 2: Offline & Sync (Weeks 4-6)

| Component | Deliverable | Acceptance Criteria |
|-----------|-------------|---------------------|
| Local Database | Drift setup + migrations | Schema versioning works |
| Offline Queue | Enqueue + dequeue with idempotency | No duplicate submissions |
| Sync Engine | Background sync on reconnect | Queued items sync automatically |
| Conflict Handling | Version mismatch detection | User prompted on conflict |
| Data Caching | Read-through cache for lists | Offline browse works |

**Exit Criteria**: User can create orders offline, see them queued, and sync succeeds on reconnect.

### Phase 3: Features & Hardening (Weeks 7-10)

| Component | Deliverable | Acceptance Criteria |
|-----------|-------------|---------------------|
| RBAC | Permission gates + route guards | Unauthorized routes redirect |
| Orders | Full CRUD with offline support | Create, edit, view offline |
| Customers | List + detail with caching | Browse offline, edit queues |
| Location | Foreground + background tracking | Batched upload, battery efficient |
| Circuit Breakers | Per-service breakers | Feature degrades on breaker open |
| Observability | Crashlytics + structured logs | Errors traceable by request ID |
| Multi-Region | Health checks + failover | Auto-switch on region failure |

**Exit Criteria**: Production-ready app with full offline capability, location tracking, and resilience.

---

## Mobile Risks & Mitigations

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| **Token refresh race condition** | Duplicate requests, 401 loops | High | Single-flight refresh with request queuing |
| **Offline queue data loss** | Lost orders, customer distrust | High | Persist queue in SQLite, not memory; verify on sync |
| **Background sync battery drain** | App uninstalls, bad reviews | Medium | WorkManager constraints, adaptive intervals |
| **Stale cache served as fresh** | Wrong data displayed | Medium | Freshness indicators, pull-to-refresh, TTL |
| **Conflict overwrites user data** | Data loss on sync | Medium | Version vectors, user-facing conflict resolution |
| **Certificate pinning breaks** | App unusable after cert rotation | Medium | Pin backup certs, remote config for pin updates |
| **Large offline queue timeout** | Sync never completes | Low | Chunked sync, progress indicator, partial success |
| **Region failover flapping** | Unstable connections | Low | Hysteresis (require N successes to restore region) |
| **JWT decode fails** | Crash on malformed token | Low | Try-catch decode, force logout on failure |
| **Location permission denied** | Core feature unavailable | Medium | Graceful degradation, re-prompt rationale |

### Critical Path Items

1. **Auth interceptor correctness** — bugs here break everything
2. **Offline queue persistence** — data loss is unrecoverable  
3. **Sync idempotency** — duplicate orders cost money
4. **Error mapping completeness** — unhandled errors crash or confuse

### Testing Strategy

| Layer | Approach |
|-------|----------|
| Interceptors | Unit tests with mock Dio |
| Repositories | Integration tests with mock API |
| Sync Engine | Integration tests with real SQLite |
| UI/Permissions | Widget tests with mock providers |
| E2E Offline | Flutter integration tests with network simulation |

