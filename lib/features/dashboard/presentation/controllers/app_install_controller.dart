import 'package:get/get.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/app_installs_model.dart';

class AppInstallController extends GetxController{
  static AppInstallController instance = Get.find();

  List<AppInstalls> installsData = [
    AppInstalls('IOS', 0),
    AppInstalls('Android', 0),
  ];
}