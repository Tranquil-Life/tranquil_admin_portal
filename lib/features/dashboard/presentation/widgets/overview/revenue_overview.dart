import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/svg_paths.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/functions.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/overview_controller.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/overview/revenue_overview_chart.dart';

class RevenueOverview extends StatefulWidget {
  const RevenueOverview({super.key});

  @override
  State<RevenueOverview> createState() => _RevenueOverviewState();
}

class _RevenueOverviewState extends State<RevenueOverview> {
  final overviewController = Get.put(OverviewController());
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 6),
                color: AppColors.grey[300]!.withOpacity(.1),
                blurRadius: 12)
          ],
        ),
        child: FutureBuilder(
            future: overviewController.totalRevenue(),
            builder: (context, snapshot) {
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

              Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;

              // if(data.isEmpty){
              //
              // }
              // return Text(data.toString());

              return Column(
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
                          if (data['total'] == null || data.isEmpty)
                            CustomText(
                              text:
                                  " - \$${formatWithCommas(total.toString())} ",
                              weight: FontWeight.bold,
                              size: 18,
                            )
                          else
                            CustomText(
                              text:
                                  " - \$${formatWithCommas(data['total'].toString())} ",
                              weight: FontWeight.bold,
                              size: 18,
                            ),
                          SvgPicture.asset(SvgPaths.infoIcon)
                        ],
                      ),
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //ROverview chart
                      RevenueOverviewChart(data: data),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Total revenue', size: 20),
                          CustomText(text:data.isEmpty ? "\$0" : '\$${data['total']}', size: 12),
                          SizedBox(height: 20),

                          //SESSION PAYMENTS
                          Row(
                            children: [
                              Container(
                                color: Color(0xff0680BB),
                                height: 8,
                                width: 8,
                              ),
                              SizedBox(
                                width: 7.5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(text: 'Session payments'),
                                  CustomText(text: data.isEmpty ? "0% (\$0)" : '${data['session_payments']/100}% (\$${data['session_payments']})'),
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
                              SizedBox(
                                width: 7.5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(text: 'Subscriptions'),
                                  CustomText(text: data.isEmpty ? "0% (\$0)" : '${data['subscriptions']/100}% (\$${data['subscriptions']})'),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              );
            }));
  }
}
