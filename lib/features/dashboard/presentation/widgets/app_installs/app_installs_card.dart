import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/app_installs_model.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/app_install_controller.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/app_installs/installs_chart.dart';

class AppInstallsCard extends StatelessWidget {
  final List<AppInstalls>? data;
  final AppInstallController controller;

  const AppInstallsCard({Key? key, this.data, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: AppColors.grey.withOpacity(.1),
              blurRadius: 12
          )
        ],),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Padding(padding: EdgeInsets.only(left: 72), child: CustomText(
            text: "A break down of the installation data of the \nTranquil Life app",
            color: AppColors.grey,
          )),
          SizedBox(height: 12),

          Padding(padding: EdgeInsets.only(right: 24), child: InstallsChart(data: data,)),

          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                CustomText(
                    text: "Total app installs: ${
                        controller.installsData[0].installs +
                            controller.installsData[1].installs}",
                    size: 12,
                    color: AppColors.grey
                ),

                Wrap(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      color: const Color(0xff00649F),
                    ),
                    SizedBox(width: 8),
                    Column(
                      children: [
                        CustomText(
                            text: "Android",
                            size: 10,
                            color: AppColors.grey
                        ),
                        CustomText(
                            text: controller.installsData[1].installs.toString(),
                            size: 10,
                            color: AppColors.grey
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}

