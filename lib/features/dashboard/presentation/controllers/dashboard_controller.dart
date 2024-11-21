import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/app_installs_model.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/growth_model.dart';


class DashboardController extends GetxController{
  static DashboardController instance = Get.find();

  List<GrowthData> growthData = [
    GrowthData("Jan", 0, 'Weekly'),
    GrowthData("Jan", 24, 'Monthly'),
    GrowthData("Feb", 10, 'Weekly'),
    GrowthData("Feb", 50, 'Monthly'),
    GrowthData("Mar", 23, 'Weekly'),
    GrowthData("Mar", 3, 'Monthly'),
  ];

  List<AppInstalls> installsData = [
    AppInstalls('IOS', 69621),
    AppInstalls('Android', 92446),
  ];

  List<String> overviewTypes = [
    AppStrings.subscriptionOverviewTitle,
    AppStrings.revenueOverviewTitle,
  ];

  var overviewIndex = 0.obs;

  selectOverviewType(int index){
    overviewIndex.value = index;
  }
}