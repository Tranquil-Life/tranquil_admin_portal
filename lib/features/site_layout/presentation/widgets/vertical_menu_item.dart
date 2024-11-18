// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menuController.dart';


class VerticalMenuItem extends StatelessWidget {
  final String? itemName;
  final Function()? onTap;

  VerticalMenuItem({Key? key, this.itemName, this.onTap})
      : super(key: key);

  final menuController = Get.put(MenController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap!,
        onHover: (value) {
          value
              ? menuController.onHover(itemName!)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
          color: menuController.isHovering(itemName!)
              ? AppColors.grey.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHovering(itemName!) ||
                    menuController.isActive(itemName!),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ///icon
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: menuController.returnIconFor(itemName!),
                      ),
                      if (!menuController.isActive(itemName!))
                        Flexible(
                            child: CustomText(
                              text: itemName!,
                              color: menuController.isHovering(itemName!)
                                  ? Colors.white
                                  : AppColors.grey,
                              size: 16,
                              weight: FontWeight.normal,
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
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}