import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/controllers/settings_controller.dart';

class SettingsHorizontalMenuItem extends StatelessWidget {
  final String? itemName;
  final Function()? onTap;

  SettingsHorizontalMenuItem({this.itemName, this.onTap, Key? key})
      : super(key: key);

  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap!,
        onHover: (value) {
          value
              ? settingsController.onHover(itemName!)
              : settingsController.onHover("not hovering");
        },
        child: Obx(() => Container(
            color: settingsController.isHovering(itemName!)
                ? AppColors.grey[300]!.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                    visible: settingsController.isHovering(itemName!) ||
                        settingsController.isActive(itemName!),
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    child: Container(
                      width: 6,
                      height: 40,
                      color: AppColors.black,
                    )),
                SizedBox(width: displayWidth(context) / 80),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: settingsController.returnIconFor(itemName!),
                ),
                if (!settingsController.isActive(itemName!))
                  Flexible(
                      child: CustomText(
                    text: itemName!,
                    color: settingsController.isHovering(itemName!)
                        ? AppColors.black
                        : AppColors.grey[300],
                    weight: FontWeight.normal,
                    size: 16,
                  ))
                else
                  Flexible(
                      child: CustomText(
                    text: itemName!,
                    color: AppColors.black,
                    size: 18,
                    weight: FontWeight.bold,
                  ))
              ],
            ))));
  }
}
