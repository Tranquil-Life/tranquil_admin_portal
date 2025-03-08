import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/utils/services/controllers_binding.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.authenticationPageRoute,
      unknownRoute: AppPages.pages[0],
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      //TODO: Remember to Uncomment
      // getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      initialBinding: AllControllerBinding(),
    );
  }
}
