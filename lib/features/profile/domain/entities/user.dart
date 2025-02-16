import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/features/profile/domain/entities/admin_role.dart';

part 'user.g.dart';

class User extends QueryParams{
  final int id;
  final String name;
  final String email;
  final int roleId;
  final bool enableTwoFactor;
  final String? twoFactorCode;
  final DateTime? twoFactorExpiresAt;
  final DateTime? emailVerifiedAt;
  final String authToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final AdminRole adminRole;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.roleId,
    required this.enableTwoFactor,
    this.twoFactorCode,
    this.twoFactorExpiresAt,
    this.emailVerifiedAt,
    required this.authToken,
    required this.createdAt,
    required this.updatedAt,
    required this.adminRole,
  });

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
