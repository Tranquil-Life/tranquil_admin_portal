import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as charts;
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/growth_model.dart';
import 'package:tranquil_admin_portal/features/dashboard/domain/entities/subscription.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/overview_controller.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/overview/subscription_overview_chart.dart';

class SubscriptionOverview extends StatelessWidget {
  final String? filterType;
  final OverviewController overviewController;

  const SubscriptionOverview(
      {super.key, this.filterType, required this.overviewController});

  @override
  Widget build(BuildContext context) {
    var increased = true;

    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: AppColors.grey.withOpacity(.1),
              blurRadius: 12)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder(
                      future: overviewController.subsPercentChange(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                              child: Wrap(
                                direction: Axis.horizontal,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const CustomText(
                                    text: AppStrings.userSubscriptions,
                                    size: 16,
                                  ),
                                  CustomText(
                                    text: " - ",
                                    weight: FontWeight.bold,
                                    size: 18,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    height: 20,
                                    width: 20,
                                    child: const CircularProgressIndicator(
                                      color: AppColors.green,
                                    ),
                                  )
                                ],
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

                        return Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const CustomText(
                              text: AppStrings.userSubscriptions,
                              size: 16,
                            ),
                            CustomText(
                              text: " - ${snapshot.data}",
                              weight: FontWeight.bold,
                              size: 18,
                            ),
                            Icon(
                                increased
                                    ? Icons.trending_up
                                    : Icons.trending_down,
                                color:
                                    increased ? AppColors.green : AppColors.red)
                          ],
                        );
                      }),
                  Flexible(
                      child: Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CustomText(text: AppStrings.lastYearTitle, size: 12),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ))
                ],
              )),
          Expanded(
            child: SubscriptionOverviewChart(
                overviewController: overviewController),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: [
                  const CustomText(text: AppStrings.weeklyTitle),
                  Container(
                    color: AppColors.blue,
                    height: 8,
                    width: 8,
                  )
                ],
              ),
              Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: [
                  const CustomText(text: AppStrings.monthlyTitle),
                  Container(
                    color: AppColors.darkGreen,
                    height: 8,
                    width: 8,
                  )
                ],
              ),
              Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: [
                  const CustomText(text: AppStrings.yearlyTitle),
                  Container(
                    color: AppColors.yellow,
                    height: 8,
                    width: 8,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
