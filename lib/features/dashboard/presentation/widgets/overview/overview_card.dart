import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/growth_model.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/overview/subscription_revenue_chart.dart';

class OverviewCard extends StatelessWidget {
  final int? growth;
  final List<GrowthData>? data;
  final String? filterType;
  final bool? increased;

  const OverviewCard(
      {super.key, this.growth, this.data, this.filterType, this.increased});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: AppColors.grey.withOpacity(.1),
              blurRadius: 12)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const CustomText(
                        text: AppStrings.userSubscriptions,
                        size: 16,
                      ),
                      CustomText(
                        text: " - $growth%",
                        weight: FontWeight.bold,
                        size: 18,
                      ),
                      Icon(increased! ? Icons.trending_up : Icons.trending_down,
                          color: increased! ? AppColors.green : AppColors.red)
                    ],
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CustomText(
                        text: AppStrings.lastYearTitle,
                      ),
                    ],
                  )
                ],
              )),
          Expanded(
            child: SubscriptionRevChart(),
          )
        ],
      ),
    );
  }
}
