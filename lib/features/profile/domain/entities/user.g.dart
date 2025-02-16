part of 'user.dart';


Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'role_id': instance.roleId,
  'enable_two_factor': instance.enableTwoFactor ? 1 : 0,
  'two_factor_code': instance.twoFactorCode,
  'two_factor_expires_at': instance.twoFactorExpiresAt?.toIso8601String(),
  'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
  'auth_token': instance.authToken,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'admin_role': instance.adminRole.toJson(),
};