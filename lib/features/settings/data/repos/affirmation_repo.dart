import 'package:dartz/dartz.dart';
import 'package:tranquil_admin_portal/core/constants/endpoints.dart';
import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';
import 'package:tranquil_admin_portal/features/settings/domain/entities/affirmation.dart';
import 'package:tranquil_admin_portal/features/settings/domain/repos/affirmation_repo.dart';

class AffirmationRepoImpl extends AffirmationRepo {
  @override
  Future<Either<ApiError, dynamic>> addPreference(
      {required QueryParams params}) async {
    return await catchSocketException(() =>
            postReq(AffirmationEndpoints.addPreference, body: params.toJson()))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getPreferences() async {
    return await catchSocketException(
            () => getReq(AffirmationEndpoints.getPreferences))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> editPreference({required QueryParams params}) async{
    return await catchSocketException(
            () => postReq(AffirmationEndpoints.editPreference, body: params.toJson()))
        .then((value) => handleResponse(value));
  }


}
