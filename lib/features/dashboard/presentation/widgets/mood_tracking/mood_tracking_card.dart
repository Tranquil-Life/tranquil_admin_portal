import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/mood_tracking/mood_chart.dart';

class MoodTrackingCard extends StatelessWidget {
  const MoodTrackingCard({Key? key}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: AppStrings.moodTrackingTitle, weight: FontWeight.w600,),
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

          SizedBox(height: 16),

          MoodChart(),

          Align(
            alignment: Alignment.center,
            child: CustomText(
              text: AppStrings.userTrackingMoodMsg+" 0",
              color: AppColors.grey,
              weight: FontWeight.w600,
            ),
          )

        ],
      )
    );
  }
}
