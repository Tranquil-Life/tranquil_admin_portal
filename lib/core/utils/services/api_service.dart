import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:get/get.dart' as getx;
import 'package:tranquil_admin_portal/core/constants/endpoints.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store_keys.dart';
import 'package:tranquil_admin_portal/core/utils/functions.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';
import 'package:tranquil_admin_portal/features/profile/data/models/user_model.dart';
import 'package:tranquil_admin_portal/features/profile/data/repos/user_data_store.dart';
import 'package:tranquil_admin_portal/features/profile/domain/entities/user.dart';
//TODO: Remember to Uncomment
// import 'package:tranquil_admin_portal/features/profile/data/models/user_model.dart';
// import 'package:tranquil_admin_portal/features/profile/data/repos/user_data_store.dart';

abstract class ErrorCause {
  const ErrorCause();
}

class ApiError {
  const ApiError({this.message, this.cause});

  final ErrorCause? cause;
  final String? message;
}

class ApiData {
  final int? statusCode;
  final dynamic data;

  const ApiData(this.data, this.statusCode);
}

class ApiService {
  static const certVerifyFailed = "CERTIFICATE_VERIFY_FAILED";

  final Dio dio = Dio();

  ApiService() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseHeader: kDebugMode,
        responseBody: kDebugMode,
        error: true,
        showCUrl: true,
        canShowLog: true,
        logPrint: (logs) async {
          log(logs);

          if (kReleaseMode) {
            if (logs.contains("==onRequest==") &&
                getStore.getStringList(GetStoreKeys.prettyDioLogsKey).length >
                    500) {
              getStore.getStringList(GetStoreKeys.prettyDioLogsKey).clear();
            }
            await getStore.addStringToList(GetStoreKeys.prettyDioLogsKey, logs);
          }
        },
      ),
    );
  }

  Map<String, String> getHeaders() {
    var authToken = '';
    //TODO: Remember to Uncomment
    if (userDataStore.user.isNotEmpty &&
        UserModel.fromJson(userDataStore.user).authToken.isNotEmpty) {
      authToken = UserModel.fromJson(userDataStore.user).authToken;
    }

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken',
    };
  }

  Future<Either<ApiError, dynamic>> handleResponse(
      Either<ApiError, dynamic> eitherResponse) async {
    return eitherResponse.fold(
          (apiError) => Left(apiError),
          (data) {
        return Right(data);
      },
    );
  }

  Future<Either<ApiError, dynamic>> catchSocketException(
      Function function) async {
    try {
      return await function();
    } on DioException catch (e) {
      if (e.response != null) {
        if(e.response!.toString().isEmpty){
          return Left(ApiError(message: "Unexpected error occurred: $e"));
        }else{
          return Left(ApiError(
              message: displayErrorMessages(e.response!.data)));
        }

      } else {
        return Left(ApiError(message: e.message));
      }
    } catch (e) {
      return Left(ApiError(message: "Unexpected error occurred: $e"));
    }
  }

  Future<Either<ApiError, dynamic>> getReq(String url) async {
    final headers = getHeaders();
    Response? response;

    response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(response.data);
    } else if(response.statusCode == 204){
      return Right("no record");
    }else {
      return Left(ApiError(message: response.data['message']));
    }
  }
  //
  //
  // Future<Either<ApiError, dynamic>> postReq(String url, {dynamic body}) async {
  //   final headers = _getHeaders();
  //
  //   Response response = await dio.post(url, data: body, options: Options(headers: headers));
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return Right(response.data);
  //   } else {
  //     return Left(ApiError(message: response.data['message']));
  //   }
  // }

  Future<Either<ApiError, dynamic>> postReq(String url,
      {dynamic body}) async {
    final headers = getHeaders();
    Response<dynamic> response;

    bool hasMultipartFile = containsMultipartFile(body);


    if (hasMultipartFile) {
      FormData form = FormData.fromMap(body);

      response = await dio.post(
        url,
        data: form,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
            'Authorization':
            'Bearer ${UserModel.fromJson(userDataStore.user).authToken}',
          },
        ),
      );
    } else {
      response = await dio.post(
        url,
        data: body,
        options: Options(headers: headers),
      );

      print(response.data);
    }


    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      return Right(response.data);
    } else {
      return Left(
          ApiError(message: response.data['message'] ?? "Unknown error"));
    }
  }

  bool containsMultipartFile(Map<String, dynamic> data) {
    for (var value in data.values) {
      if (value is MultipartFile || value is List<MultipartFile>) {
        return true; // Found a MultipartFile
      }
    }
    return false; // No MultipartFile found
  }

  String displayErrorMessages(Map<String, dynamic> jsonResponse) {
    // Check if the response contains the "errors" key
    if (jsonResponse.containsKey('errors') && jsonResponse['errors'] != null) {
      List<String> allErrorMessages = [];
      Map<String, dynamic> errors = {};

      if(jsonResponse['errors'] is Map<String, dynamic>){
        errors = jsonResponse['errors'];
      }else if(jsonResponse['errors'] is List){
        allErrorMessages = List<String>.from(jsonResponse['errors']);
      }

      // Flatten the error messages into a single list
      errors.forEach((field, messages) {
        for (var message in messages) {
          allErrorMessages.add(message);
        }
      });

      // Join all error messages into a single string
      String errorString = allErrorMessages.join(", ");

      return errorString;
    } else {
      return jsonResponse['message'].toString();
    }
  }


}
