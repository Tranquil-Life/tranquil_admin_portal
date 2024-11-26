import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/responsiveness.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/app_install_controller.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/overview_controller.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/affirmations/affirmations_card.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/app_installs/app_installs_card.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/info/info_cards_large.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/info/info_cards_medium.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/info/info_cards_small.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/journal_entries/journal_entries_card.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/mood_tracking/mood_tracking_card.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/overview/revenue_overview.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/overview/subscription_overview.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/topics/topics_card.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menu_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final menuController = Get.put(MenController());
  final overviewController = Get.put(OverviewController());
  final appInstallsController = Get.put(AppInstallController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 24),
      child: Column(
        children: [
          //Current page title
          Container(
              margin: const EdgeInsets.only(top: 80, bottom: 20),
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: menuController.activeItem.value,
                size: 24,
                weight: FontWeight.w600,
              )),

          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                if (ResponsiveWidget.isLargeScreen(context) ||
                    ResponsiveWidget.isMediumScreen(context))
                  if (ResponsiveWidget.isCustomScreen(context))
                    InfoCardsMediumScreen()
                  else
                    InfoCardsLargeScreen()
                else
                  InfoCardsSmallScreen(),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                    direction: Axis.horizontal,
                                    children: overviewController.overviewTypes
                                        .map((e) {
                                      var index = overviewController
                                          .overviewTypes
                                          .indexOf(e);
                                      return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 45),
                                          child: GestureDetector(
                                            child: CustomText(
                                              text: e,
                                              size: 20,
                                              weight: overviewController
                                                          .overviewIndex
                                                          .value ==
                                                      index
                                                  ? FontWeight.w600
                                                  : FontWeight.normal,
                                              color: AppColors.black,
                                            ),
                                            onTap: () {
                                              overviewController
                                                  .selectOverviewType(index);
                                            },
                                          ));
                                    }).toList()),
                              )),
                        Obx(()=>  SizedBox(
                            width: displayWidth(context),
                            child: overviewController.overviewIndex.value == 0
                                ? SubscriptionOverview(
                              growth: 0,
                              data: overviewController.growthData,
                              filterType: AppStrings.lastQuarterTitle,
                              increased: false,
                            )
                                : RevenueOverview()),),
                          SizedBox(height: 34),
                          TopicsCard()
                        ],
                      ),
                    ),

                    const SizedBox(width: 24),

                    //To view data for App Installs, and consultation activities
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Features Statistics
                        CustomText(
                          text: AppStrings.featureStatsTitle,
                          size: 20,
                          weight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                        SizedBox(height: 8),

                        //Mood Tracking Data
                        MoodTrackingCard(),
                        SizedBox(height: 24),

                        //Journal Entries Data
                        JournalEntriesCard(),
                        SizedBox(height: 24),

                        //Affirmations Data
                        AffirmationsCard(),
                        SizedBox(height: 40),

                        //App Installs Data
                        CustomText(
                          text: AppStrings.appInstallDataTitle,
                          size: 20,
                          weight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                        SizedBox(height: 8),
                        AppInstallsCard(
                          data: appInstallsController.installsData,
                          controller: appInstallsController,
                        ),

                        SizedBox(height: 50),
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
