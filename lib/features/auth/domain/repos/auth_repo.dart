import 'package:dartz/dartz.dart';
import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';

abstract class AuthRepo<T, F extends QueryParams> extends ApiService {
  AuthRepo();

  Future<Either<ApiError, dynamic>> login({required F params});
}
