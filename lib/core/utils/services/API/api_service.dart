import 'package:get/get.dart';

class ApiData {
  final int? statusCode;
  final dynamic data;

  const ApiData(this.data, this.statusCode);
}

class ApiService extends GetConnect {
  Future getReq(
    String subPath, {
    Map<String, dynamic>? parameters,
  }) async {
    // User client = UserModel.fromJson(userDataStore.user);
    // print(client.authToken);
    //
    // final headers = {
    // 'Content-Type': 'application/json',
    // 'Accept': 'application/json',
    // 'Authorization': 'Bearer ${client.authToken}',
  //};
  //   var result = await httpClient.get(subPath, query: parameters, headers: headers);
  //   return result;
  }

  Future postReq(String subPath, {dynamic body}) async {
    // User client = UserModel.fromJson(userDataStore.user);
    // print(client.authToken);

    // final headers = {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer ${client.authToken}',
    // };
    // var result = await httpClient.post(subPath, body: body, headers: headers);

    // return result;
  }

  Future deleteReq(String subPath, {dynamic body}) async {
    var result = await httpClient.delete(subPath);

    return result;
  }

}


