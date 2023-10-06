import 'package:get/get.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/app_installs_model.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/growth_model.dart';


class DashboardController extends GetxController{
  static DashboardController instance = Get.find();

  List<GrowthData> growthData = [
    GrowthData('Apr', 32),
    GrowthData('May', 60),
    GrowthData('Jun', 30),
    GrowthData('Jul', 28),
    GrowthData('Aug', 70),
    GrowthData('Sep', 80)
  ];

  List<AppInstalls> installsData = [
    AppInstalls('IOS', 69621),
    AppInstalls('Android', 92446),
  ];
}