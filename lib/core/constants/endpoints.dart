const baseUrl = 'https://tranquil-api-staging-205081a15c84.herokuapp.com';

//Auth related endpoints
abstract class AuthEndpoints {
  static const login = '$baseUrl/api/admin/login';
  static const requestPwdReset = '$baseUrl/api/admin/forgot-password';
  static const resendVerificationToken = '$baseUrl/api/email/resend';
  static const verifyPwdResetToken = '$baseUrl/api/admin/verify-password-reset-token';
  static const updatePassword = '$baseUrl/api/admin/reset-password';
  static const logOut = '$baseUrl/api/admin/logOut';
}

abstract class OtherEndpoints{
  static const addAdminUser = '$baseUrl/api/admin/addAdmin';
  static const deleteAdminUser = '$baseUrl/api/admin/deleteAdmin';
  static const listAdminUsers = '$baseUrl/api/admin/listAdmins';
  static const inviteAdminUser = '$baseUrl/api/admin/inviteAdmin';
  static countRegisteredUsers(int? lastQuarter) => '$baseUrl/api/admin/registeredUsers${lastQuarter != null ? '?lastQuarter=$lastQuarter' : ''}'; // come with sessions revenue, subscriptions revenue and total revenue
}

abstract class BusinessEndpoints{
  static const countBusiness = '$baseUrl/api/admin/businessCount';
}

abstract class Clients{
  //Client specific endpoints
}

abstract class ConsultantEndpoints{
  static const approveConsultant = '$baseUrl/api/admin/approveConsultant';
  static const createAiTherapist = '$baseUrl/api/admin/createAItherapist';
  static const editAiTherapist = '$baseUrl/api/admin/editAItherapist';
  static listTherapists(int? lastQuarter) => '$baseUrl/api/admin/listConsultants${lastQuarter != null ? '?lastQuarter=$lastQuarter' : ''}';
  static noOfTherapists(int? lastQuarter) => '$baseUrl/api/admin/therapists${lastQuarter != null ? '?lastQuarter=$lastQuarter' : ''}';
  static const noOfAgencyTherapists = '$baseUrl/api/admin/';
  static const noOfSoloTherapists = '$baseUrl/api/admin/';
  static const exportConsultantsFile = '$baseUrl/api/admin/';
  static const blockTherapist = '$baseUrl/api/admin/blockConsultant';
  static const callTherapist = '$baseUrl/api/admin/';
}

abstract class Meetings{
  static const getMeetings = '$baseUrl/api/admin/meetings';
  static countCompletedMeetings(int? lastQuarter) => '$baseUrl/api/admin/sessions${lastQuarter != null ? '?lastQuarter=$lastQuarter' : ''}';
}

abstract class Transactions{
  static const totalRevenue = '$baseUrl/api/admin/totalRevenue'; // come with sessions revenue, subscriptions revenue and total revenue
  static const transactions = '$baseUrl/api/admin/transactions'; // come with sessions revenue, subscriptions revenue and total revenue
}

abstract class Topic{
  static add(String topic) => '$baseUrl/api/admin/addTopic?name=$topic';
  static edit(int id, String topic) => '$baseUrl/api/admin/editTopic/$id?name=$topic';
  static const list = '$baseUrl/api/admin/getTopics';
  static show(int id) => '$baseUrl/api/admin/showTopic/$id';
}

abstract class Suggestion{
  static add(String topic) => '$baseUrl/api/admin/addSuggestion';
  static const list = '$baseUrl/api/admin/getSuggestions';
  static edit(int id) => '$baseUrl/api/admin/editSuggestion/$id';
}

abstract class Subscription{
  static const addType = '$baseUrl/api/admin/addSubscriptionType';
  static editType(int id) => '$baseUrl/api/admin/editSubscriptionType/$id';
}

abstract class Permissions{
  static const attachToRole = '$baseUrl/api/admin/roles/permissions/attach';
  static const detachFromRole = '$baseUrl/api/admin/roles/permissions/detach';
  static listRolePermissions(int roleId) => '$baseUrl/api/admin/roles/permissions/$roleId/all';
}