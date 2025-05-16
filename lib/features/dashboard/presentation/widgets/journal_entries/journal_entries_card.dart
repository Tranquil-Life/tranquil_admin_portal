import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/dashboard_controller.dart';

class JournalEntriesCard extends StatelessWidget {
  JournalEntriesCard({super.key});

  final dashboardController  = Get.put(DashboardController());

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
                  const CustomText(text: AppStrings.regularEntriesMsg, size: 12,),
                  FutureBuilder<int>(future: dashboardController.countJournalEntries(), builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            height: 20,
                            width: 20,
                            child: const CircularProgressIndicator(
                              color: AppColors.green,
                            ),
                          ));
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    return CustomText(text: snapshot.data.toString(), weight: FontWeight.bold, size: 18);
                  })
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
                  const CustomText(text: AppStrings.entriesUsedInSessionsMsg, size: 12,),
                  FutureBuilder<int>(future: dashboardController.countSharedEntries(), builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            height: 20,
                            width: 20,
                            child: const CircularProgressIndicator(
                              color: AppColors.green,
                            ),
                          ));
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    return CustomText(text: snapshot.data.toString(), weight: FontWeight.bold, size: 18);
                  })
                ],
              )
            ],
          ),

          SizedBox(height: 24),
          Obx(()=>CustomText(text: "${AppStrings.totalEntriesMsg} ${dashboardController.totalEntries.value}")),
          SizedBox(height: 12)
        ],
      ),
    );
  }
}
