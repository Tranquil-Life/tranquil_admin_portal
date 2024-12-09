import 'package:dartz/dartz.dart';
import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';

abstract class DashboardRepo<T, F extends QueryParams> extends ApiService {
  DashboardRepo();

  Future<Either<ApiError, dynamic>> countRegisteredUsers({int lastQuarter = 0});

  Future<Either<ApiError, dynamic>> countActiveAccounts();

  Future<Either<ApiError, dynamic>> countSessions(
      {int lastQuarter = 0, String status = "ended"});

  Future<Either<ApiError, dynamic>> countBusinesses();

  Future<Either<ApiError, dynamic>> getTotalRevenue(
      {int lastQuarter = 0,
      int lastMonth = 0,
      int lastYear = 0,
      int today = 0});

  Future<Either<ApiError, dynamic>> getSubscriptionStats();

  Future<Either<ApiError, dynamic>> getSubsPercentChange();

  Future<Either<ApiError, dynamic>> getMoodTrackingStats();

  Future<Either<ApiError, dynamic>> countJournalEntries();

  Future<Either<ApiError, dynamic>> countSharedEntries();

  Future<Either<ApiError, dynamic>> getAffirmationStats();

  Future<Either<ApiError, dynamic>> getTopTopicsWithMira();
}
