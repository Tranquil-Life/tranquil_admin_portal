import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/global/custom_snackbar.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/growth_model.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/subscription_model.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/repos/dashboard_repo.dart';
import 'package:tranquil_admin_portal/features/dashboard/domain/entities/subscription.dart';

class OverviewController extends GetxController {
  static OverviewController instance = Get.find();

  DashboardRepoImpl dashboardRepo = DashboardRepoImpl();

  var overviewIndex = 1.obs;
  var selectedFilter = ''.obs;

  List<String> filters = [];

  List<String> overviewTypes = [
    AppStrings.subscriptionOverviewTitle,
    AppStrings.revenueOverviewTitle,
  ];

  selectOverviewType(int index) {
    overviewIndex.value = index;
  }

  Future<List<Subscription>> subscriptionStats() async {
    List<Subscription> statistics = <Subscription>[];

    Either either = await dashboardRepo.getSubscriptionStats();
    either.fold(
        (l) => CustomSnackBar.errorSnackBar("Subscription stats: ${l.message}"),
        (r) {
      if (r != "no record") {
        var data = r['data'];
        if (data != null) {
          statistics =
              (data as List).map((e) => SubscriptionModel.fromJson(e)).toList();
        }
      }
    });

    return statistics;
  }

  Future subsPercentChange() async {
    String change = "0%";

    Either either = await dashboardRepo.getSubsPercentChange();
    either.fold(
        (l) =>
            CustomSnackBar.errorSnackBar("Subscription % change: ${l.message}"),
        (r) {
      if (r != "no record") {
        change = r['data'];
      }
    });

    return change;
  }

  Future<Map<String, dynamic>> totalRevenue() async {
    var revenue = <String, dynamic>{};
    Either either = await dashboardRepo.getTotalRevenue();
    either.fold(
        (l) => CustomSnackBar.errorSnackBar("Revenue data: ${l.message}"),
        (r) {
          var data = r['data'];
          revenue = data;
        });

    return revenue;
  }
}
