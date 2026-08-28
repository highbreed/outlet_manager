import 'package:fpdart/fpdart.dart';
import '../network/failures.dart';

/// Result type for all fallible operations
/// Right = Success, Left = Failure
typedef Result<T> = Either<Failure, T>;

/// Async result type
typedef AsyncResult<T> = Future<Result<T>>;

/// Extensions for Result handling
extension ResultExtensions<T> on Result<T> {
  /// Returns true if this is a success
  bool get isSuccess => isRight();

  /// Returns true if this is a failure
  bool get isFailure => isLeft();

  /// Get the success value or null
  T? get successOrNull => fold((_) => null, (r) => r);

  /// Get the failure or null
  Failure? get failureOrNull => fold((l) => l, (_) => null);

  /// Transform success value, pass through failure
  Result<R> mapSuccess<R>(R Function(T) transform) {
    return map(transform);
  }

  /// Handle both cases with callbacks
  void handle({
    required void Function(T) onSuccess,
    required void Function(Failure) onFailure,
  }) {
    fold(onFailure, onSuccess);
  }
}

/// Extensions for AsyncResult handling
extension AsyncResultExtensions<T> on AsyncResult<T> {
  /// Map success value asynchronously
  AsyncResult<R> mapSuccess<R>(R Function(T) transform) async {
    final result = await this;
    return result.map(transform);
  }

  /// FlatMap success value asynchronously
  AsyncResult<R> flatMapSuccess<R>(AsyncResult<R> Function(T) transform) async {
    final result = await this;
    return result.fold(
      (failure) async => Left(failure),
      (value) => transform(value),
    );
  }
}
