import 'package:dartz/dartz.dart';
import 'package:tranquil_admin_portal/core/constants/endpoints.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';
import 'package:tranquil_admin_portal/features/dashboard/domain/repos/dashboard_repo.dart';

class DashboardRepoImpl extends DashboardRepo {
  @override
  Future<Either<ApiError, dynamic>> countActiveAccounts() async {
    return await catchSocketException(
            () => getReq(UserEndpoints.countActiveAccounts()))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> countBusinesses() async {
    return await catchSocketException(
            () => getReq(BusinessEndpoints.countBusinesses))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> countRegisteredUsers(
      {int lastQuarter = 0}) async {
    return await catchSocketException(() => getReq(
            UserEndpoints.countRegisteredUsers(lastQuarter: lastQuarter)))
        .then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> countSessions(
      {int lastQuarter = 0, String status = "ended"}) async {
    return await catchSocketException(() => getReq(
        MeetingsEndpoints.countMeetings(
            lastQuarter: lastQuarter,
            status: status))).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getTotalRevenue(
      {int lastQuarter = 0,
        int lastMonth = 0,
        int lastYear = 0,
        int today = 0}) async {
    return await catchSocketException(() => getReq(
        TransactionsEndpoints.totalRevenue(
            lastQuarter: lastQuarter,
            lastMonth: lastMonth,
            lastYear: lastYear,
            today: today))).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getAffirmationStats() {
    // TODO: implement getAffirmationStats
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, dynamic>> getJournalStats() {
    // TODO: implement getJournalStats
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, dynamic>> getMoodTrackingStats() {
    // TODO: implement getMoodTrackingStats
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, dynamic>> getSubscriptionStats() {
    // TODO: implement getSubscriptionStats
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiError, dynamic>> getTopTopicsWithMira() {
    // TODO: implement getTopTopicsWithMira
    throw UnimplementedError();
  }
}
