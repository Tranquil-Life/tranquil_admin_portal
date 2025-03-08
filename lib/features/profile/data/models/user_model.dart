import 'package:tranquil_admin_portal/features/profile/domain/entities/admin_role.dart';
import 'package:tranquil_admin_portal/features/profile/domain/entities/user.dart';

part 'user_model.g.dart';

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.roleId,
      required super.enableTwoFactor,
      super.twoFactorCode,
      super.twoFactorExpiresAt,
      super.emailVerifiedAt,
      required super.authToken,
      required super.createdAt,
      required super.updatedAt,
      required super.adminRole});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
