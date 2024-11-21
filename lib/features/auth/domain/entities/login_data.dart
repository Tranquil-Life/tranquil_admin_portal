import 'package:tranquil_admin_portal/core/domain/query_params.dart';

class LoginData extends QueryParams{
  final String email;
  final String password;

  LoginData({required this.email, required this.password});

  @override
  Map<String, dynamic> toJson()=><String, dynamic>{
    'email': email,
    'password': password,
  };


}