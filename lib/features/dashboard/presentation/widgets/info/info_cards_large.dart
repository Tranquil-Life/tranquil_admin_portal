import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/svg_paths.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/info/info_card_item.dart';

class InfoCardsLargeScreen extends StatelessWidget {
  const InfoCardsLargeScreen({Key? key, required this.dashboardController})
      : super(key: key);

  final DashboardController dashboardController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Count sessions based the status type
        FutureBuilder(
            future: dashboardController.countSessions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Container(
                  margin: EdgeInsets.only(left: 8),
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
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

              var total = snapshot.data;

              return InfoCard(
                title: AppStrings.completedSessionsTitle,
                value: total,
                iconPath: SvgPaths.clockIcon,
                difference: 0,
                trendIcon: Icons.trending_up,
                trendIconColor: AppColors.green,
                onTap: () {},
              );
            }),

        SizedBox(width: 24),

        //COUNT ACTIVE ACCOUNTS
        FutureBuilder(
            future: dashboardController.countActiveAccounts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Container(
                  margin: EdgeInsets.only(left: 8),
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
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

              var total = snapshot.data;

              return InfoCard(
                title: AppStrings.activeAccountsTitle,
                value: total,
                iconPath: SvgPaths.peopleIcon,
                difference: 0,
                trendIcon: Icons.trending_down,
                trendIconColor: AppColors.red,
                onTap: () {},
              );
            }),

        SizedBox(width: 24),

        //COUNT THERAPISTS
        FutureBuilder(
            future: dashboardController.countTherapists(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Container(
                  margin: EdgeInsets.only(left: 8),
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
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

              var total = snapshot.data;

              return InfoCard(
                title: AppStrings.therapistsTitle,
                value: total,
                iconPath: SvgPaths.personBlueIcon,
                difference: 0,
                trendIcon: Icons.trending_up,
                trendIconColor: AppColors.green,
                onTap: () {},
              );
            }),
        SizedBox(width: 24),

        //COUNT BUSINESSES
        FutureBuilder(
            future: dashboardController.countBusinesses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Container(
                  margin: EdgeInsets.only(left: 8),
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
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

              var total = snapshot.data;

              return InfoCard(
                title: AppStrings.businessesTitle,
                value: total,
                iconPath: SvgPaths.personBlueIcon,
                difference: 0,
                trendIcon: Icons.trending_up,
                trendIconColor: AppColors.green,
                onTap: () {},
              );
            }),

        SizedBox(width: 24),

        //COUNT REGISTERED USERS
        FutureBuilder(
            future: dashboardController.countRegisteredUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Container(
                  margin: EdgeInsets.only(left: 8),
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
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

              var total = snapshot.data;

              return InfoCard(
                title: AppStrings.registeredUsersTitle,
                value: total,
                iconPath: SvgPaths.personBlueIcon,
                difference: 0,
                trendIcon: Icons.arrow_right_alt,
                trendIconColor: AppColors.grey[300],
                onTap: () {},
              );
            }),
      ],
    );
  }
}
