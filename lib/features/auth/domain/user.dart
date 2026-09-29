import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserRole with _$UserRole {
  const factory UserRole({
    required int id,
    required String name,
    required String slug,
  }) = _UserRole;

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$UserRoleFromJson(json);
}

@freezed
abstract class User with _$User {
  const User._();

  const factory User({
    required int id,
    required String email,
    @JsonKey(name: 'full_name') required String fullName,
    String? phone,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_verified') required bool isVerified,
    @JsonKey(name: 'must_change_password')
    @Default(false)
    bool mustChangePassword,
    @JsonKey(name: 'last_login_at') DateTime? lastLoginAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @Default([]) List<UserRole> roles,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Get primary role name
  String get primaryRole => roles.isNotEmpty ? roles.first.name : 'User';

  /// Get all role slugs
  List<String> get roleSlugs => roles.map((r) => r.slug).toList();

  /// Check if user has a specific role
  bool hasRole(String roleSlug) => roles.any((r) => r.slug == roleSlug);
}
