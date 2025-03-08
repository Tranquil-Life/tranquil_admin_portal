// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menu_controller.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String? itemName;
  final Function()? onTap;

  HorizontalMenuItem({this.itemName, this.onTap, Key? key}) : super(key: key);

  final menuController = Get.put(MenController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap!,
        onHover: (value){
          value
              ? menuController.onHover(itemName!)
              : menuController.onHover("not hovering");
          },
        child: Obx(() =>
            Container(
            color: menuController.isHovering(itemName!)
                ? AppColors.grey.withOpacity(.1)
                : Colors.transparent,
            child: Row(
              children: [
                Visibility(
                    visible: menuController.isHovering(itemName!) || menuController.isActive(itemName!),
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    child: Container(
                      width: 6,
                      height: 40,
                      color: AppColors.black,
                    )
                ),

                SizedBox(width: displayWidth(context)/80),

                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: menuController.returnIconFor(itemName!),
                ),

                if(!menuController.isActive(itemName!))
                  Flexible(
                      child: CustomText(
                        text: itemName!,
                        color: menuController.isHovering(itemName!) ? AppColors.black : AppColors.grey,
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
            ))
        )

    );
  }
}