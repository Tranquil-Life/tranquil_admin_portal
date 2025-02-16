const baseUrl = 'https://tranquil-api-staging-205081a15c84.herokuapp.com';

//Auth related endpoints
abstract class AuthEndpoints {
  static const login = '$baseUrl/api/admin/login';
  static const requestPwdReset = '$baseUrl/api/admin/forgot-password';
  static const resendVerificationToken = '$baseUrl/api/email/resend';
  static const verifyPwdResetToken =
      '$baseUrl/api/admin/verify-password-reset-token';
  static const updatePassword = '$baseUrl/api/admin/reset-password';
  static const logOut = '$baseUrl/api/admin/logOut';
}

abstract class UserEndpoints {
  static const addAdminUser = '$baseUrl/api/admin/addAdmin';
  static const deleteAdminUser = '$baseUrl/api/admin/deleteAdmin';
  static const listAdminUsers = '$baseUrl/api/admin/listAdmins';
  static const inviteAdminUser = '$baseUrl/api/admin/inviteAdmin';

  static countRegisteredUsers({int lastQuarter = 0}) =>
      '$baseUrl/api/admin/registeredUsers?last_quarter=$lastQuarter';

  static countActiveAccounts() =>
      '$baseUrl/api/admin/activeAccountsCount';
}

abstract class BusinessEndpoints {
  static const countBusinesses = '$baseUrl/api/admin/businessCount';
}

abstract class ConsultantEndpoints {
  static const approveConsultant = '$baseUrl/api/admin/approveConsultant';
  static const createAiTherapist = '$baseUrl/api/admin/createAItherapist';
  static const editAiTherapist = '$baseUrl/api/admin/editAItherapist';

  static listTherapists({int lastQuarter = 0}) =>
      '$baseUrl/api/admin/listConsultants?last_quarter=$lastQuarter';

  static noOfTherapists({int lastQuarter = 0}) =>
      '$baseUrl/api/admin/countTherapists?last_quarter=$lastQuarter';
  static const noOfAgencyTherapists =
      '$baseUrl/api/admin/countAgencyConsultants';
  static const noOfSoloTherapists = '$baseUrl/api/admin/countSoloConsultants';
  static const noOfTherapistsInSessions =
      '$baseUrl/api/admin/countConsultantsInSessions';
  static const exportConsultantsFile = '$baseUrl/api/admin/exportConsultants';
  static const blockAndUnblockTherapist = '$baseUrl/api/admin/blockConsultant';
  static const callTherapist = '$baseUrl/api/admin/callConsultant';
}

abstract class MeetingsEndpoints {
  static const getMeetings = '$baseUrl/api/admin/meetings';

  static countMeetings({int lastQuarter = 0, String status = "ended"}) =>
      '$baseUrl/api/admin/sessionsCount?status=$status&last_quarter=$lastQuarter';
}

abstract class TransactionsEndpoints {
  // static String totalRevenue(
  //         {int lastQuarter = 0,
  //         int lastMonth = 0,
  //         int lastYear = 0,
  //         int today = 0}) =>
  //     '$baseUrl/api/admin/totalRevenue?last_quarter=$lastQuarter&one_month_ago=$lastMonth&last_year=$lastYear&today=$today';
  static const totalRevenue = '$baseUrl/api/admin/totalRevenue';
  static const transactions = '$baseUrl/api/admin/transactions';
}

abstract class TopicEndpoints {
  static add(String topic) => '$baseUrl/api/admin/addTopic?name=$topic';

  static edit(int id, String topic) =>
      '$baseUrl/api/admin/editTopic/$id?name=$topic';
  static const list = '$baseUrl/api/admin/getTopics';

  static show(int id) => '$baseUrl/api/admin/showTopic/$id';
}

abstract class SuggestionEndpoints {
  static add(String topic) => '$baseUrl/api/admin/addSuggestion';
  static const list = '$baseUrl/api/admin/getSuggestions';

  static edit(int id) => '$baseUrl/api/admin/editSuggestion/$id';
}

abstract class SubscriptionEndpoints {
  static const addType = '$baseUrl/api/admin/addSubscriptionType';
  static const subscriptions = '$baseUrl/api/admin/subscriptions';
  static const subsPercentChange = '$baseUrl/api/admin/subscriptionPercentChange';

  static editType(int id) => '$baseUrl/api/admin/editSubscriptionType/$id';
}

abstract class Permissions {
  static const attachToRole = '$baseUrl/api/admin/roles/permissions/attach';
  static const detachFromRole = '$baseUrl/api/admin/roles/permissions/detach';

  static listRolePermissions(int roleId) =>
      '$baseUrl/api/admin/roles/permissions/$roleId/all';
}

abstract class MoodsAndJournal{
  static const mostTrackedMoods ='$baseUrl/api/admin/moodsTracked';
  static const countJournalEntries ='$baseUrl/api/admin/countEntries';
  static const countSharedEntries ='$baseUrl/api/admin/countSharedEntries';
}
