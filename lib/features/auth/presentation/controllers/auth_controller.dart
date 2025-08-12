import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/endpoints.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store.dart';
import 'package:tranquil_admin_portal/core/global/custom_snackbar.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';
import 'package:tranquil_admin_portal/core/utils/services/api_service.dart';
import 'package:tranquil_admin_portal/features/auth/data/repos/auth_repo.dart';
import 'package:tranquil_admin_portal/features/auth/domain/entities/login_data.dart';
import 'package:tranquil_admin_portal/features/profile/data/models/user_model.dart';
import 'package:tranquil_admin_portal/features/profile/data/repos/user_data_store.dart';
import 'package:tranquil_admin_portal/features/profile/domain/entities/user.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/pages/site_layout.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  UserDataStore userDataStore = UserDataStore();

  TextEditingController emailTEC =
      TextEditingController(); //super-admin@tranquillife.app
  TextEditingController passwordTEC = TextEditingController();

  RxBool isPasswordVisible = false.obs;

  AuthRepoIml authRepo = AuthRepoIml();

  Future login() async {
    var params = LoginData(email: emailTEC.text, password: passwordTEC.text);

    Either either = await authRepo.login(params: params);
    either.fold((l) {
      return CustomSnackBar.showSnackBar(
          context: Get.context!,
          title: "Error",
          message: l.message!,
          backgroundColor: AppColors.red);
    }, (r) {
      var data = r['data'];
      if (data != null) {
        User user = UserModel.fromJson(data);
        userDataStore.user = user.toJson();

        Get.to(SiteLayout());
        getStore.set('isLoggedIn', true);

        emailTEC.clear();
        passwordTEC.clear();
      }
    });
  }

  Future<bool> signOut() async {
    bool signOut = false;

    var response = await ApiService().dio.post(
      "$baseUrl/api/admin/logOut",
      data: null,
      options: Options(headers: ApiService().getHeaders()),
    );

    if(response.statusCode == 200){
      signOut = true;
    }else{
      Get.offAllNamed(Routes.authenticationPageRoute);
      getStore.clearAllData();
      signOut = false;
    }

    return signOut;
  }
}
