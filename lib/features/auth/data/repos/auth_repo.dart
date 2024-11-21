import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tranquil_admin_portal/core/constants/endpoints.dart';
import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';
import 'package:tranquil_admin_portal/features/auth/domain/repos/auth_repo.dart';

class AuthRepoIml extends AuthRepo {
  @override
  Future<Either<ApiError, dynamic>>  login({required QueryParams params}) async {
    return await catchSocketException(
            () => postReq(AuthEndpoints.login, body: params.toJson()))
        .then((value) => handleResponse(value));
  }
}
