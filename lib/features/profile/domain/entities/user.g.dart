part of 'user.dart';


//TODO: Rename the keys
Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'auth_token': instance.authToken,
  'name': instance.name,
  'admin_level': instance.adminLevel,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};