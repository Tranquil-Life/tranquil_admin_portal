import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/data/local/get_store.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';

class MenController extends GetxController{
  static MenController instance = Get.find();
  // var activeItem = Routes.dashboardDisplayName.obs;
  var activePageRoute = getStore.get("activePageRoute").toString().obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName, String route) {
    // activeItem.value = itemName;
    activePageRoute.value = route;
    getStore.set("activePageRoute", route);
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => returnRouteName() == itemName;

  Widget returnIconFor(String itemName){
    switch(itemName){
      case Routes.dashboardDisplayName:
        return _customIcon(Icons.dashboard, itemName);
      case Routes.therapistsDisplayName:
        return _customIcon(Icons.group, itemName);
      case Routes.settingsDisplayName:
        return _customIcon(Icons.settings, itemName);
      case Routes.authenticationPageDisplayName:
        return _customIcon(Icons.logout, itemName);
      default:
        return _customIcon(Icons.logout, itemName);
    }
  }

  String returnRouteName(){
    switch(activePageRoute.value){
      case Routes.dashboardRoute:
        return Routes.dashboardDisplayName;
      case Routes.therapistsPageRoute:
        return Routes.therapistsDisplayName;
      case Routes.settingsPageRoute:
        return Routes.settingsDisplayName;
      case Routes.authenticationPageRoute:
        return Routes.authenticationPageDisplayName;
      default:
        return Routes.dashboardDisplayName;
    }
  }

  Widget _customIcon(IconData icon, String itemName){
    if(itemName == returnRouteName()) return Icon(icon, size: 22, color: AppColors.green);

    return Icon(icon, color: isHovering(itemName)
        ? AppColors.green
        : AppColors.grey[300]);
  }

}