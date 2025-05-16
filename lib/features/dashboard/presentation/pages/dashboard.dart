import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/responsiveness.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/profile/data/models/user_model.dart';
import 'package:tranquil_admin_portal/features/profile/data/repos/user_data_store.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menu_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final menuController = Get.put(MenController());
  // final overviewController = Get.put(OverviewController());
  // final dashboardController = Get.put(DashboardController());
  // final appInstallsController = Get.put(AppInstallController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        children: [
          //Current page title
          Container(
              margin: const EdgeInsets.only(top: 80, bottom: 20),
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: menuController.returnRouteName(),
                size: 24,
                weight: FontWeight.w600,
              )),

          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                // if (ResponsiveWidget.isLargeScreen(context) ||
                //     ResponsiveWidget.isMediumScreen(context))
                //   if (ResponsiveWidget.isCustomScreen(context))
                //     InfoCardsMediumScreen()
                //   else
                //     InfoCardsLargeScreen(dashboardController: dashboardController)
                // else
                //   InfoCardsSmallScreen(),
                // const SizedBox(height: 24),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Obx(() => Container(
                //                 margin: const EdgeInsets.only(bottom: 8),
                //                 alignment: Alignment.centerLeft,
                //                 child: Wrap(
                //                     direction: Axis.horizontal,
                //                     children: overviewController.overviewTypes
                //                         .map((e) {
                //                       var index = overviewController
                //                           .overviewTypes
                //                           .indexOf(e);
                //                       return Padding(
                //                           padding:
                //                               const EdgeInsets.only(right: 45),
                //                           child: GestureDetector(
                //                             child: CustomText(
                //                               text: e,
                //                               size: 20,
                //                               weight: overviewController
                //                                           .overviewIndex
                //                                           .value ==
                //                                       index
                //                                   ? FontWeight.w600
                //                                   : FontWeight.normal,
                //                               color: AppColors.black,
                //                             ),
                //                             onTap: () {
                //                               overviewController
                //                                   .selectOverviewType(index);
                //                             },
                //                           ));
                //                     }).toList()),
                //               )),
                //         Obx(()=>  SizedBox(
                //             width: displayWidth(context),
                //             child: overviewController.overviewIndex.value == 0
                //                 ? SubscriptionOverview(
                //               overviewController: overviewController,
                //               filterType: AppStrings.lastQuarterTitle,
                //             )
                //                 : RevenueOverview()),),
                //           SizedBox(height: 34),
                //           TopicsCard(dashboardController: dashboardController)
                //         ],
                //       ),
                //     ),
                //
                //     const SizedBox(width: 24),
                //
                //     //To view data for App Installs, and consultation activities
                //     Expanded(
                //         child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         //Features Statistics
                //         CustomText(
                //           text: AppStrings.featureStatsTitle,
                //           size: 20,
                //           weight: FontWeight.w600,
                //           color: AppColors.black,
                //         ),
                //         SizedBox(height: 8),
                //
                //         //Mood Tracking Data
                //         MoodTrackingCard(),
                //         SizedBox(height: 24),
                //
                //         //Journal Entries Data
                //         JournalEntriesCard(),
                //         SizedBox(height: 24),
                //
                //         //Affirmations Data
                //         AffirmationsCard(),
                //         SizedBox(height: 40),
                //
                //         //App Installs Data
                //         CustomText(
                //           text: AppStrings.appInstallDataTitle,
                //           size: 20,
                //           weight: FontWeight.w600,
                //           color: AppColors.black,
                //         ),
                //         SizedBox(height: 8),
                //         AppInstallsCard(
                //           data: appInstallsController.installsData,
                //           controller: appInstallsController,
                //         ),
                //
                //         SizedBox(height: 50),
                //       ],
                //     ))
                //   ],
                // ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
