import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';

class JournalEntriesCard extends StatelessWidget {
  const JournalEntriesCard({super.key});

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
              color: AppColors.grey.withOpacity(.1),
              blurRadius: 12
          )
        ],),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: AppStrings.journalDataTitle, weight: FontWeight.w600),
              GestureDetector(
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CustomText(text: AppStrings.todayTitle, size: 12),
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
                  CustomText(text: AppStrings.regularEntriesMsg, size: 12,),
                  CustomText(text: '0', weight: FontWeight.bold, size: 18,),
                ],
              ),

              Container(
                width: 1,
                height: 25,
                margin: EdgeInsets.symmetric(horizontal: 17),
                color: AppColors.grey,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: AppStrings.entriesUsedInSessionsMsg, size: 12,),
                  CustomText(text: '0', weight: FontWeight.bold, size: 18,),
                ],
              )
            ],
          ),

          SizedBox(height: 24),
          CustomText(text: "${AppStrings.totalEntriesMsg} 0"),
          SizedBox(height: 12)
        ],
      ),
    );
  }
}
