import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/global/custom_snackbar.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/repos/dashboard_repo.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/controllers/therapists_controller.dart';

class DashboardController extends GetxController {
  static DashboardController instance = Get.find();

  DashboardRepoImpl dashboardRepo = DashboardRepoImpl();

  var sessionStatus = AppStrings.completed.obs;

  Future<int> countSessions() async {
    int total = 0;

    if (sessionStatus.value == AppStrings.completed) {
      total = await countCompletedSessions();
    } else if (sessionStatus.value == AppStrings.pending) {
      total = await countPendingSessions();
    } else if (sessionStatus.value == AppStrings.inProgress) {
      total = await countSessionsInProgress();
    } else {
      total = await countCancelledSessions();
    }

    return total;
  }

  //Get number of completed sessions
  Future<int> countCompletedSessions({int lastQuarter = 1}) async {
    int total = 0;

    Either either = await dashboardRepo.countSessions(lastQuarter: lastQuarter);
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total;
  }


  //Get number of pending sessions
  Future<int> countPendingSessions({int lastQuarter = 1}) async {
    int total = 0;

    Either either = await dashboardRepo.countSessions(
        lastQuarter: lastQuarter, status: AppStrings.pending);
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of sessions in progress
  Future<int> countSessionsInProgress({int lastQuarter = 1}) async {
    int total = 0;

    Either either = await dashboardRepo.countSessions(
        lastQuarter: lastQuarter, status: AppStrings.inProgress);
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of cancelled sessions
  Future<int> countCancelledSessions({int lastQuarter = 1}) async {
    int total = 0;

    Either either = await dashboardRepo.countSessions(
        lastQuarter: lastQuarter, status: AppStrings.cancelled);
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of therapists
  Future<int> countActiveAccounts() async {
    int total = 0;

    Either either = await dashboardRepo.countActiveAccounts();
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of therapists
  Future<int> countTherapists() async {
    TherapistsController therapistsController = TherapistsController();
    var total = await therapistsController.countAllTherapists();
    return total;
  }

  //Get number of businesses
  Future<int> countBusinesses() async {
    int total = 0;

    Either either = await dashboardRepo.countBusinesses();
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total;
  }

  //Get number of registered users (includes admin, clients and therapists)
  Future<int> countRegisteredUsers({int lastQuarter = 1}) async {
    int total = 0;

    Either either =
        await dashboardRepo.countRegisteredUsers(lastQuarter: lastQuarter);
    either.fold((l) => CustomSnackBar.errorSnackBar(l.message!), (r) {
      total = r['data'];
    });

    return total;
  }
}
