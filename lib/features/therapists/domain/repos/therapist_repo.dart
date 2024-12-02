import 'package:dartz/dartz.dart';
import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';

abstract class TherapistRepo<T, F extends QueryParams> extends ApiService {
  TherapistRepo();

  Future<Either<ApiError, dynamic>> getAllTherapists();

  Future<Either<ApiError, dynamic>> countAllConsultants({int? lastQuarter});

  Future<Either<ApiError, dynamic>> countSoloTherapists({int? lastQuarter});

  Future<Either<ApiError, dynamic>> countAgencyTherapists({int? lastQuarter});

  Future<Either<ApiError, dynamic>> countTherapistsInSessions({int? lastQuarter});

  Future<Either<ApiError, dynamic>> exportTherapistsTable();

  Future<Either<ApiError, dynamic>> approveTherapist({required int therapistId});

  Future<Either<ApiError, dynamic>> blockAndUnblockTherapist({required int therapistId});

  Future<Either<ApiError, dynamic>> getPayoutDetails({required int therapistId});
}
