import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/navigation_controller.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/responsiveness.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/auth/presentation/controllers/auth_controller.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menu_controller.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  final menController = Get.put(MenController());
  final navigationController = Get.put(NavigationController());
  final authController = Get.put(AuthController());

  SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          if(ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: displayWidth(context) / 48),
                    Image.asset("assets/images/tranquil_life_logo.png", height: 70, width: 70),
                    Flexible(
                      child: CustomText(
                        text: "Tranquil Life",
                        size: 20,
                        weight: FontWeight.bold,
                        color: AppColors.green,
                      ),
                    ),
                    SizedBox(width: displayWidth(context) / 48),
                  ],
                ),
              ],
            ),

          if(ResponsiveWidget.isSmallScreen(context))
            Divider(color: AppColors.grey[300]!),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes
                .map((item) => SideMenuItem(
                itemName: item.name,
                onTap: () async{
                  if(item.route == Routes.authenticationPageRoute){
                   bool signOut = await authController.signOut();
                   menController.changeActiveItemTo(item.name, item.route);

                   if(signOut){
                     Get.offAllNamed(Routes.authenticationPageRoute);
                     getStore.clearAllData();
                   }
                  }

                  if (!menController.isActive(item.name)) {
                    menController.changeActiveItemTo(item.name, item.route);
                    if(ResponsiveWidget.isSmallScreen(context)) {
                      Get.back();
                    }
                    navigationController.navigateTo(item.route);
                  }
                })).toList(),
          )
        ],
      ),
    );
  }
}
