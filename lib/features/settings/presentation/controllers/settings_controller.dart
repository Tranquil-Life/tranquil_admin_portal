import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/svg_paths.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/settings_routes.dart';

class SettingsController extends GetxController {
  static SettingsController instance = Get.find();

  var activeItem = SettingsRoutes.affirmationsDisplayName.obs;
  final GlobalKey<NavigatorState> settingsNavigatorKey = GlobalKey();

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case SettingsRoutes.generalDisplayName:
        return _customIcon(SvgPaths.generalIcon, itemName);
      case SettingsRoutes.securityDisplayName:
        return _customIcon(SvgPaths.securityIcon, itemName);
      case SettingsRoutes.affirmationsDisplayName:
        return _customIcon(SvgPaths.activitiesIcon, itemName);
      default:
        return _customIcon(SvgPaths.generalIcon, itemName);
    }
  }

  Widget _customIcon(String icon, String itemName) {
    if (itemName == activeItem.value) {
      return SvgPicture.asset(icon,
          height: 22, width: 22, color: AppColors.green);
    }

    return SvgPicture.asset(icon,
        color: isHovering(itemName) ? AppColors.green : AppColors.grey[300]);
  }

  Future<dynamic> navigateTo(String routeName) {
    return settingsNavigatorKey.currentState!.pushNamed(routeName);
  }

  goBack() => settingsNavigatorKey.currentState!.pop();
}
