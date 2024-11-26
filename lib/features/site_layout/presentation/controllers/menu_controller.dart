import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';

class MenController extends GetxController{
  static MenController instance = Get.find();
  var activeItem = Routes.therapistsDisplayName.obs;
  var hoverItem = "".obs;

  RxInt selectedIndex = 0.obs;


  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
    print(activeItem.value);

  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName){
    switch(itemName){
      case Routes.dashboardDisplayName:
        return _customIcon(Icons.dashboard, itemName);
      case Routes.therapistsDisplayName:
        return _customIcon(Icons.group, itemName);
      case Routes.authenticationPageDisplayName:
        return _customIcon(Icons.logout, itemName);
      default:
        return _customIcon(Icons.logout, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName){
    if(isActive(itemName)) return Icon(icon, size: 22, color: AppColors.green);

    return Icon(icon, color: isHovering(itemName)
        ? AppColors.green
        : AppColors.grey);
  }

}