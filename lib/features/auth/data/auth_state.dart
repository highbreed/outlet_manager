import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.authenticating() = Authenticating;
  const factory AuthState.authenticated({
    required User user,
  }) = Authenticated;
  const factory AuthState.loggingOut({String? reason}) = LoggingOut;
  const factory AuthState.error({
    required String message,
  }) = AuthError;
}
