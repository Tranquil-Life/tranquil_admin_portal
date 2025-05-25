import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_snackbar.dart';
import 'package:tranquil_admin_portal/features/therapists/data/models/therapist_model.dart';
import 'package:tranquil_admin_portal/features/therapists/data/repos/therapist_repo.dart';
import 'package:tranquil_admin_portal/features/therapists/domain/entities/therapist.dart';

class TherapistsController extends GetxController {
  static TherapistsController instance = Get.find();

  TherapistRepoImpl therapistRepo = TherapistRepoImpl();

  Future<List<Therapist>> getAllTherapists() async {
    var therapists = <Therapist>[];
    Either either = await therapistRepo.getAllTherapists();
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      var data = r['data'];

      if (data != null) {
        var list = List<Map<String, dynamic>>.from(data);
        therapists = list.map((e) => TherapistModel.fromJson(e)).toList();
      }
    });

    return therapists;
  }

  Future approveTherapist(int therapistId) async {
    Either either =
        await therapistRepo.approveTherapist(therapistId: therapistId);
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      var data = r['data'];
      Therapist therapist = TherapistModel.fromJson(data);
      CustomSnackBar.showSnackBar(
          context: Get.context!,
          title: "Success",
          message: "Approved ${therapist.fName} ${therapist.lName}",
          backgroundColor: AppColors.green);
    });
  }

  Future blockAndUnblock(int therapistId) async {
    Either either =
        await therapistRepo.blockAndUnblockTherapist(therapistId: therapistId);
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      var message = r['message'];
      CustomSnackBar.showSnackBar(
          context: Get.context!,
          title: message,
          message: "$message successfully",
          backgroundColor: AppColors.green);
    });
  }

  Future<int> countAllTherapists() async {
    int total = 0;
    Either either = await therapistRepo.countAllConsultants();
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total-1;
  }

  Future<int> countSoloTherapists() async {
    int total = 0;
    Either either = await therapistRepo.countSoloTherapists();
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total-1;
  }

  Future<int> countAgencyTherapists() async {
    int total = 0;
    Either either = await therapistRepo.countAgencyTherapists();
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total;
  }

  Future<int> countTherapistsInSessions() async {
    int total = 0;
    Either either = await therapistRepo.countTherapistsInSessions();
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total;
  }
}
