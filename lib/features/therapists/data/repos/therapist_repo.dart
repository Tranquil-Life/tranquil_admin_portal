import 'package:dartz/dartz.dart';
import 'package:tranquil_admin_portal/core/constants/endpoints.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';
import 'package:tranquil_admin_portal/features/therapists/domain/repos/therapist_repo.dart';

class TherapistRepoImpl extends TherapistRepo {
  @override
  Future<Either<ApiError, dynamic>> approveTherapist(
      {required int therapistId}) async {
    return await catchSocketException(() => postReq(
        ConsultantEndpoints.approveConsultant,
        body: {'id': therapistId})).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> blockAndUnblockTherapist(
      {required int therapistId}) async {
    return await catchSocketException(() => postReq(
        ConsultantEndpoints.blockAndUnblockTherapist,
        body: {'id': therapistId})).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getAllTherapists() async {
    return await catchSocketException(
            () => getReq(ConsultantEndpoints.listTherapists()))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getPayoutDetails(
      {required int therapistId}) {
    // TODO: implement getPayoutDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, dynamic>> countAgencyTherapists({int? lastQuarter}) async{
    return await catchSocketException(
            () => getReq(ConsultantEndpoints.noOfAgencyTherapists))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> countAllConsultants({int? lastQuarter}) async{
    return await catchSocketException(
            () => getReq(ConsultantEndpoints.noOfTherapists()))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> countSoloTherapists({int? lastQuarter}) async{
    return await catchSocketException(
            () => getReq(ConsultantEndpoints.noOfSoloTherapists))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> exportTherapistsTable() async{
    return await catchSocketException(
            () => postReq(ConsultantEndpoints.exportConsultantsFile))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> countTherapistsInSessions({int? lastQuarter}) async{
    return await catchSocketException(
            () => getReq(ConsultantEndpoints.noOfTherapistsInSessions))
        .then((value) => handleResponse(value));
  }

}
