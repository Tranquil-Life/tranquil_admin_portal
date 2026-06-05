import 'package:dartz/dartz.dart';
import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';

abstract class ApplicationsRepo<T, F extends QueryParams> extends ApiService {
  ApplicationsRepo();

  Future<Either<ApiError, dynamic>> getAllApplications({int page = 1});

  Future<Either<ApiError, dynamic>> getApplicationDetails({
    required int applicationId,
  });

  Future<Either<ApiError, dynamic>> approveApplication({
    required int applicationId,
  });

  Future<Either<ApiError, dynamic>> rejectApplication({
    required int applicationId,
    String? reason,
  });

  Future<Either<ApiError, dynamic>> markApplicationNeedsReview({
    required int applicationId,
    String? reason,
  });
}
