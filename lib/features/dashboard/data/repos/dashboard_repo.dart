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
        TransactionsEndpoints.totalRevenue)).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> countJournalEntries() async{
    return await catchSocketException(() => getReq(
        MoodsAndJournal.countJournalEntries)).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> countSharedEntries() async{
    return await catchSocketException(() => getReq(
        MoodsAndJournal.countSharedEntries)).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getMoodTrackingStats() async{
    return await catchSocketException(() => getReq(
        MoodsAndJournal.mostTrackedMoods)).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getSubscriptionStats() async{
    return await catchSocketException(() => getReq(
        SubscriptionEndpoints.subscriptions)).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getSubsPercentChange() async{
    return await catchSocketException(() => getReq(
        SubscriptionEndpoints.subsPercentChange)).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getTopTopicsWithMira() async{
    return await catchSocketException(() => getReq(
        TopicEndpoints.list)).then((value) => handleResponse(value));
  }

  @override
  Future<Either<ApiError, dynamic>> getAffirmationStats() {
    // TODO: implement getAffirmationStats
    throw UnimplementedError();
  }

}
