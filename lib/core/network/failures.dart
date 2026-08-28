import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base failure type - all API errors map to a subtype
abstract class Failure {
  String get message;
  String? get requestId;
  bool get isRetryable;

  /// User-friendly message for UI display
  String get displayMessage;
}

/// 401 - Authentication failed or token invalid
@freezed
abstract class AuthFailure with _$AuthFailure implements Failure {
  const AuthFailure._();

  const factory AuthFailure.invalidCredentials({
    @Default('Invalid email or password') String message,
    String? requestId,
  }) = InvalidCredentials;

  const factory AuthFailure.tokenExpired({
    @Default('Session expired') String message,
    String? requestId,
  }) = TokenExpired;

  const factory AuthFailure.sessionRevoked({
    String? reason,
    @Default('Session ended') String message,
    String? requestId,
  }) = SessionRevoked;

  const factory AuthFailure.biometricFailed({
    @Default('Biometric authentication failed') String message,
    String? requestId,
  }) = BiometricFailed;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// 403 - Authenticated but not authorized
@freezed
abstract class ForbiddenFailure with _$ForbiddenFailure implements Failure {
  const ForbiddenFailure._();

  const factory ForbiddenFailure.insufficientPermissions({
    required String requiredPermission,
    @Default('You do not have permission to perform this action')
    String message,
    String? requestId,
  }) = InsufficientPermissions;

  const factory ForbiddenFailure.accountDisabled({
    @Default('Your account has been disabled') String message,
    String? requestId,
  }) = AccountDisabled;

  const factory ForbiddenFailure.resourceForbidden({
    @Default('Access denied') String message,
    String? requestId,
  }) = ResourceForbidden;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// 422 - Validation errors with field-level details
@freezed
abstract class ValidationFailure with _$ValidationFailure implements Failure {
  const ValidationFailure._();

  const factory ValidationFailure({
    required String message,
    required Map<String, List<String>> fieldErrors,
    String? requestId,
  }) = _ValidationFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// 404 - Resource not found
@freezed
abstract class NotFoundFailure with _$NotFoundFailure implements Failure {
  const NotFoundFailure._();

  const factory NotFoundFailure({
    required String resourceType,
    required String resourceId,
    @Default('Resource not found') String message,
    String? requestId,
  }) = _NotFoundFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => '$resourceType not found';
}

/// 409 - Conflict (optimistic locking, duplicate, etc.)
@freezed
abstract class ConflictFailure with _$ConflictFailure implements Failure {
  const ConflictFailure._();

  const factory ConflictFailure.versionMismatch({
    required int serverVersion,
    @Default('Data was modified by another user') String message,
    String? requestId,
  }) = VersionMismatch;

  const factory ConflictFailure.duplicateEntry({
    required String field,
    @Default('This entry already exists') String message,
    String? requestId,
  }) = DuplicateEntry;

  const factory ConflictFailure.concurrentSession({
    @Default('Logged in on another device') String message,
    String? requestId,
  }) = ConcurrentSession;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// 429 - Rate limited
@freezed
abstract class RateLimitFailure with _$RateLimitFailure implements Failure {
  const RateLimitFailure._();

  const factory RateLimitFailure({
    required Duration retryAfter,
    @Default('Too many requests. Please wait.') String message,
    String? requestId,
  }) = _RateLimitFailure;

  @override
  bool get isRetryable => true;

  @override
  String get displayMessage =>
      'Too many requests. Please wait ${retryAfter.inSeconds}s.';
}

/// 5xx - Server errors
@freezed
abstract class ServerFailure with _$ServerFailure implements Failure {
  const ServerFailure._();

  const factory ServerFailure.internalError({
    @Default('Server error. Please try again later.') String message,
    String? requestId,
  }) = InternalError;

  const factory ServerFailure.serviceUnavailable({
    Duration? retryAfter,
    @Default('Service temporarily unavailable') String message,
    String? requestId,
  }) = ServiceUnavailable;

  const factory ServerFailure.badGateway({
    @Default('Unable to reach server') String message,
    String? requestId,
  }) = BadGateway;

  @override
  bool get isRetryable => true;

  @override
  String get displayMessage => message;
}

/// Network-level failures (no HTTP response)
@freezed
abstract class NetworkFailure with _$NetworkFailure implements Failure {
  const NetworkFailure._();

  const factory NetworkFailure.offline({
    @Default('No internet connection') String message,
    String? requestId,
  }) = Offline;

  const factory NetworkFailure.timeout({
    @Default('Request timed out') String message,
    String? requestId,
  }) = Timeout;

  const factory NetworkFailure.connectionError({
    String? details,
    @Default('Connection error') String message,
    String? requestId,
  }) = ConnectionError;

  const factory NetworkFailure.sslError({
    @Default('Security error') String message,
    String? requestId,
  }) = SslError;

  @override
  bool get isRetryable => this is! SslError;

  @override
  String get displayMessage => message;
}

/// Unknown/unexpected failures
@freezed
abstract class UnknownFailure with _$UnknownFailure implements Failure {
  const UnknownFailure._();

  const factory UnknownFailure({
    required String message,
    Object? originalError,
    String? requestId,
  }) = _UnknownFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => 'Something went wrong. Please try again.';
}

// ============================================================================
// Domain-Specific Failures (Daily Route & Visits)
// ============================================================================

/// Route blocked by unclosed previous route
@freezed
abstract class RouteBlockedFailure
    with _$RouteBlockedFailure
    implements Failure {
  const RouteBlockedFailure._();

  const factory RouteBlockedFailure({
    required String blockedRouteId,
    required DateTime blockedRouteDate,
    required String blockedRouteStatus,
    @Default(true) bool requiresSupervisorOverride,
    @Default('You have an unclosed route from a previous day') String message,
    String? requestId,
  }) = _RouteBlockedFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => message;
}

/// Geofence validation failed
@freezed
abstract class GeofenceViolationFailure
    with _$GeofenceViolationFailure
    implements Failure {
  const GeofenceViolationFailure._();

  const factory GeofenceViolationFailure({
    required double userLatitude,
    required double userLongitude,
    required double outletLatitude,
    required double outletLongitude,
    required double distanceMeters,
    required double requiredRadiusMeters,
    @Default(true) bool canRequestOverride,
    String? requestId,
  }) = _GeofenceViolationFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage =>
      'You are ${distanceMeters.round()}m from the outlet. Maximum allowed: ${requiredRadiusMeters.round()}m';

  @override
  String get message => displayMessage;
}

/// GPS accuracy is too poor
@freezed
abstract class GpsAccuracyFailure with _$GpsAccuracyFailure implements Failure {
  const GpsAccuracyFailure._();

  const factory GpsAccuracyFailure({
    required double currentAccuracy,
    @Default(200.0) double requiredAccuracy,
    String? requestId,
  }) = _GpsAccuracyFailure;

  @override
  bool get isRetryable => true; // User can wait for better GPS signal

  @override
  String get displayMessage =>
      'GPS accuracy (${currentAccuracy.round()}m) is too low. Please wait for better signal.';

  @override
  String get message => displayMessage;
}

/// Another visit is already in progress
@freezed
abstract class VisitInProgressFailure
    with _$VisitInProgressFailure
    implements Failure {
  const VisitInProgressFailure._();

  const factory VisitInProgressFailure({
    required String activeVisitLocalId,
    required String activeOutletName,
    String? requestId,
  }) = _VisitInProgressFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage =>
      'You are already clocked in at $activeOutletName';

  @override
  String get message => displayMessage;
}

/// Visit is in invalid state for the requested operation
@freezed
abstract class InvalidVisitStateFailure
    with _$InvalidVisitStateFailure
    implements Failure {
  const InvalidVisitStateFailure._();

  const factory InvalidVisitStateFailure({
    required String currentStatus,
    required String operation,
    String? requestId,
  }) = _InvalidVisitStateFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => 'Cannot $operation: visit is $currentStatus';

  @override
  String get message => displayMessage;
}

/// Route is in invalid state for the requested operation
@freezed
abstract class InvalidRouteStateFailure
    with _$InvalidRouteStateFailure
    implements Failure {
  const InvalidRouteStateFailure._();

  const factory InvalidRouteStateFailure({
    required String currentStatus,
    required String operation,
    String? requestId,
  }) = _InvalidRouteStateFailure;

  @override
  bool get isRetryable => false;

  @override
  String get displayMessage => 'Cannot $operation: route is $currentStatus';

  @override
  String get message => displayMessage;
}
