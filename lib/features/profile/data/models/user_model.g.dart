part of 'user_model.dart';

UserModel _$UserModelFromJson(Map<String, dynamic> json) =>
    UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        roleId: json['role_id'],
        enableTwoFactor: json['enable_two_factor'] == 1 ? true : false,
        twoFactorCode: json['two_factor_code'],
        twoFactorExpiresAt: json['two_factor_expires_at'] != null
            ? DateTime.parse(json['two_factor_expires_at'])
            : null,
        emailVerifiedAt: json['email_verified_at'] != null
            ? DateTime.parse(json['email_verified_at'])
            : null,
        authToken: json['auth_token'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        adminRole: AdminRole.fromJson(json['admin_role']),
    );
