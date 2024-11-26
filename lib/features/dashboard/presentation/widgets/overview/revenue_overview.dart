import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/svg_paths.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/functions.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/overview/revenue_overview_chart.dart';

class RevenueOverview extends StatefulWidget {
  const RevenueOverview({super.key});

  @override
  State<RevenueOverview> createState() => _RevenueOverviewState();
}

class _RevenueOverviewState extends State<RevenueOverview> {
  int total = 100000;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CustomText(
                    text: AppStrings.revenueTitle,
                    size: 16,
                  ),
                  CustomText(
                    text: " - \$${formatWithCommas(total.toString())}",
                    weight: FontWeight.bold,
                    size: 18,
                  ),
                  SvgPicture.asset(SvgPaths.infoIcon)
                ],
              ),
              Flexible(child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CustomText(text: AppStrings.lastYearTitle, size: 12),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ))
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RevenueOverviewChart(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Total revenue', size: 20),
                  CustomText(text: '\$100,000', size: 12),
                  SizedBox(height: 20),

                  //SESSION PAYMENTS
                  Row(
                    children: [
                      Container(
                        color: Color(0xff0680BB),
                        height: 8,
                        width: 8,
                      ),

                      SizedBox(width: 7.5,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Session payments'),
                          CustomText(text: '55% (\$55,000)'),
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 20),

                  //SUBS REVENUE
                  Row(
                    children: [
                      Container(
                        color: Color(0xff03405E),
                        height: 8,
                        width: 8,
                      ),

                      SizedBox(width: 7.5,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Subscriptions'),
                          CustomText(text: '45% (\$45,000)'),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
