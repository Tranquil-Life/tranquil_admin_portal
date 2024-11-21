import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/responsiveness.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/app_installs/app_installs_card.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/info/info_cards_large.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/info/info_cards_medium.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/info/info_cards_small.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/overview/overview_card.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menuController.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final menuController = Get.put(MenController());
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          //Current page title
          Container(
              margin: const EdgeInsets.only(
                  top: 80, bottom: 20),
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: menuController.activeItem.value,
                size: 24,
                weight: FontWeight.w600,
              )),

          Expanded(
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

                Expanded(
                  child: Row(
                    children: [
                      //To view data for Overview, revenue, mood tracking, journal data and affirmations
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: dashboardController.overviewTypes.map((e)=>Padding(padding: EdgeInsets.only(right: 45), child: CustomText(
                                  text: e,
                                  size: 20,
                                  weight: dashboardController.overviewIndex.value == dashboardController.overviewTypes.indexOf(e) ? FontWeight.w600 : FontWeight.normal,
                                  color: AppColors.black,
                                ))).toList()
                              ),
                            ),
                            OverviewCard(
                              growth: 0,
                              data: dashboardController.growthData,
                              filterType: "Last quarter",
                              increased: false,
                            )
                          ],
                        ),
                      ),

                      SizedBox(width: 28),

                      //To view data for App Installs, and consultation activities
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "App install data",
                              size: 20,
                              weight: FontWeight.w600,
                              color: AppColors.black,
                            ),

                            SizedBox(height: 8),

                            AppInstallsCard(
                              data: dashboardController.installsData,
                              controller: dashboardController,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
