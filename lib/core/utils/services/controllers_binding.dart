import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/features/auth/presentation/controllers/auth_controller.dart';
// import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/dashboard_controller.dart';

class AllControllerBinding extends Bindings{
  @override
  void dependencies() {
    //TODO: Remember to Uncomment
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => MenuController());
    //TODO: Remember to Uncomment
    // Get.lazyPut(() => DashboardController());
  }
}

