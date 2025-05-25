import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';

class AffirmationsCard extends StatelessWidget {
  const AffirmationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: AppColors.grey[300]!,
              blurRadius: 12
          )
        ],),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(text: AppStrings.affirmationsTitle, weight: FontWeight.w600,),
              GestureDetector(
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CustomText(text: AppStrings.todayTitle),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              )
            ],
          ),

          SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: AppStrings.affirmsSharedTitle, size: 12,),
                  CustomText(text: '0', weight: FontWeight.bold, size: 18),
                ],
              ),

              Container(
                width: 1,
                height: 25,
                margin: EdgeInsets.symmetric(horizontal: 17),
                color: AppColors.grey[300],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: AppStrings.affirmsReadTitle, size: 12,),
                  CustomText(text: '0', weight: FontWeight.bold, size: 18,),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}