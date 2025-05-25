import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/responsiveness.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/controllers/settings_controller.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/widgets/settings_side_menu_item.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/settings_routes.dart';

class SettingsSideMenu extends StatelessWidget {
  SettingsSideMenu({super.key});

  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: SettingsRoutes.sideMenuItemRoutes
            .map(
              (item) => SettingsSideMenuItem(
              itemName: item.name,
              onTap: () {
                if (!settingsController.isActive(item.name)) {
                  settingsController
                      .changeActiveItemTo(item.name);
                  if (ResponsiveWidget.isSmallScreen(context)) {
                    Get.back();
                  }

                  settingsController.navigateTo(item.route);
                }
              }),
        )
            .toList());
  }
}
