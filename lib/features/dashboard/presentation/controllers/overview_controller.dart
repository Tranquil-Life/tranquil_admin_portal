import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/growth_model.dart';

class OverviewController extends GetxController{
  static OverviewController instance = Get.find();

  var overviewIndex = 0.obs;
  var selectedFilter = ''.obs;

  List<String> filters = [];

  List<GrowthData> growthData = [
    GrowthData("Jan", 0, 'Weekly'),
    GrowthData("Jan", 24, 'Monthly'),
    GrowthData("Feb", 10, 'Weekly'),
    GrowthData("Feb", 50, 'Monthly'),
    GrowthData("Mar", 23, 'Weekly'),
    GrowthData("Mar", 3, 'Monthly'),
  ];

  List<String> overviewTypes = [
    AppStrings.subscriptionOverviewTitle,
    AppStrings.revenueOverviewTitle,
  ];

  selectOverviewType(int index){
    overviewIndex.value = index;
  }
}