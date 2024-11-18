import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store_keys.dart';
import 'package:tranquil_admin_portal/features/profile/data/models/user_model.dart';
import 'package:tranquil_admin_portal/features/profile/data/repos/user_data_store.dart';

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

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${UserModel.fromJson(userDataStore.user).authToken}',
    };
  }

  Future<Either<ApiError, dynamic>> handleResponse(
      Either<ApiError, dynamic> eitherResponse) async {
    return eitherResponse.fold(
          (apiError) {

        return Left(apiError);
      },
          (data) {
        return Right(data);
      },
    );
  }

  Future<Either<ApiError, dynamic>> catchSocketException(
      Function function) async {
    try {
      return await function();
    } on DioException catch (error) {
      var message = error.response;
      if(!message?.data.containsKey("message")){
        return Left(ApiError(message: message?.data));
      }else{
        return Left(ApiError(message: message?.data['message']));
      }

    } catch (e) {
      return Left(ApiError(message: e.toString()));
    }
  }

  Future<Either<ApiError, dynamic>> getReq(String url) async {
    final headers = _getHeaders();
    Response? response;

    response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode == 200) {
      return Right(response.data);
    } else {
      return Left(ApiError(message: response.data['message']));
    }
  }

}


