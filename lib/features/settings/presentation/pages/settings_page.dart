import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/local_navigator.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/controllers/settings_controller.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/widgets/settings_side_menu.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menu_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final menuController = Get.put(MenController());
  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Current page title
            Obx(() => Container(
                margin: const EdgeInsets.only(top: 80, bottom: 20),
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: menuController.returnRouteName(),
                  size: 24,
                  weight: FontWeight.w600,
                ))),
            Divider(thickness: 0.5),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex:1, child: SettingsSideMenu()),
                SizedBox(width: 8),
                Expanded(flex: 5, child: settingsNavigator()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
