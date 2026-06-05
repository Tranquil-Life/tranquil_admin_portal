import 'package:dartz/dartz.dart';
import 'package:tranquil_admin_portal/core/constants/endpoints.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';
import 'package:tranquil_admin_portal/features/applications/domain/repos/applications_repo.dart';

class ApplicationsRepoImpl extends ApplicationsRepo {
  @override
  Future<Either<ApiError, dynamic>> getAllApplications({int page = 1}) async {
    return await catchSocketException(
            () => getReq(ApplicationEndpoints.getApplications(page: page)))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> approveApplication(
      {required int applicationId}) async {
    return await catchSocketException(() => postReq(
            ApplicationEndpoints.approveApplication(
                applicationId: applicationId)))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getApplicationDetails(
      {required int applicationId}) {
    // TODO: implement getApplicationDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, dynamic>> markApplicationNeedsReview(
      {required int applicationId, String? reason}) {
    // TODO: implement markApplicationNeedsReview
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, dynamic>> rejectApplication(
      {required int applicationId, String? reason}) async {
    return await catchSocketException(() => postReq(
            ApplicationEndpoints.rejectApplication(
                applicationId: applicationId)))
        .then((value) => handleResponse(value));
  }
}
