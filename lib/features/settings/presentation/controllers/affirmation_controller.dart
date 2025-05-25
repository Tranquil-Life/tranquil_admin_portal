import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store.dart';
import 'package:tranquil_admin_portal/core/global/custom_snackbar.dart';
import 'package:tranquil_admin_portal/core/utils/functions.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';
import 'package:tranquil_admin_portal/features/settings/data/models/affirmation_model.dart';
import 'package:tranquil_admin_portal/features/settings/data/repos/affirmation_repo.dart';
import 'package:tranquil_admin_portal/features/settings/domain/entities/affirmation.dart';
import 'package:dio/dio.dart' as dio;

class AffirmationController extends GetxController {
  static AffirmationController instance = Get.find();

  AffirmationRepoImpl affirmationRepo = AffirmationRepoImpl();

  final Rx<Future<List<Affirmation>>> preferencesFuture = Rx(Future.value([]));

  var errorText = "".obs;

  var loading = false.obs;

  // The controller for the ListView
  // late ScrollController scrollController;

  @override
  void onInit() {
    loadPreferences();

    super.onInit();
  }

  void loadPreferences() {
    preferencesFuture.value = getPreferences();
  }

  Future addPreference(
      {required String title,
      required String description,
      PlatformFile? svgFile,
      required String color}) async {
    loading.value = true;

    dio.MultipartFile file = dio.MultipartFile.fromBytes(svgFile!.bytes!,
        filename: svgFile.name, contentType: MediaType("image", "svg+xml"));

    Affirmation affirmation = Affirmation(
        title: title, description: description, svgFile: file, color: color);

    Either either = await affirmationRepo.addPreference(params: affirmation);
    either.fold(
        (l) => CustomSnackBar.showSnackBar(
            context: Get.context!,
            title: "Error",
            message: l.message!,
            backgroundColor: AppColors.red), (r) {
      var data = r['data'];
      if (data != null) {
        // Refresh preferences after upload
        loadPreferences();
      }
    });

    loading.value = false;
  }

  editPreference(
      {
        required int id,
        required String title,
      required String description,
      PlatformFile? svgFile,
      required String color}) async {
    loading.value = true;
    dio.MultipartFile? file;
    if(svgFile != null){
      file = dio.MultipartFile.fromBytes(svgFile.bytes!,
          filename: svgFile.name, contentType: MediaType("image", "svg+xml"));
    }

    Affirmation affirmation = Affirmation(id: id,
        title: title, description: description, svgFile: file, color: color);


    Either either = await affirmationRepo.editPreference(params: affirmation);
    either.fold(
        (l) => CustomSnackBar.showSnackBar(
            context: Get.context!,
            title: "Error",
            message: l.message!,
            backgroundColor: AppColors.red),
        (r) {
      var data = r['data'];
      if (data != null) {
        // Refresh preferences after upload
        loadPreferences();
      }
    });

    loading.value = false;
  }

  Future<List<Affirmation>> getPreferences() async {
    var preferences = <Affirmation>[];

    Either either = await affirmationRepo.getPreferences();
    either.fold((l) {
      errorText.value = l.message!;
    }, (r) {
      var data = r['data'];

      if (data != null) {
        var list = List<Map<String, dynamic>>.from(data);
        preferences = list.map((e) => AffirmationModel.fromJson(e)).toList();
      }
    });

    return preferences;
  }
}
