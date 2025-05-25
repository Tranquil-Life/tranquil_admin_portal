import 'package:dartz/dartz.dart';
import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';

abstract class AffirmationRepo<T, F extends QueryParams> extends ApiService {
  AffirmationRepo();

  Future<Either<ApiError, dynamic>> addPreference({required F params});
  Future<Either<ApiError, dynamic>> editPreference({required F params});
  Future<Either<ApiError, dynamic>> getPreferences();

}