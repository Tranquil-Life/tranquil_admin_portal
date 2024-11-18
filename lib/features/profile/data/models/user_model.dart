import 'package:tranquil_admin_portal/features/profile/domain/entities/user.dart';

part 'user_model.g.dart';

class UserModel extends User {
  UserModel(
      {super.id,
      super.adminLevel,
      super.authToken,
      super.createdAt,
      super.email,
      super.name,
      super.updatedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
