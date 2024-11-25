import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/svg_paths.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/info/info_card_item.dart';

class InfoCardsLargeScreen extends StatelessWidget {
  const InfoCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InfoCard(
          title: "Completed sessions",
          value: 567,
          iconPath: SvgPaths.clockIcon,
          difference: 447,
          trendIcon: Icons.trending_up,
          trendIconColor: AppColors.green,
          onTap: () {},
        ),
        SizedBox(width: 24),
        InfoCard(
          title: "Active accounts",
          value: 44667,
          iconPath: SvgPaths.peopleIcon,
          difference: 44554,
          trendIcon: Icons.trending_down,
          trendIconColor: AppColors.red,
          onTap: () {},
        ),
        SizedBox(width: 24),

        InfoCard(
          title: "Therapists",
          value: 67,
          iconPath: SvgPaths.personBlueIcon,
          difference: 42,
          trendIcon: Icons.trending_up,
          trendIconColor: AppColors.green,
          onTap: () {},
        ),
        SizedBox(width: 24),

        InfoCard(
          title: "Businesses",
          value: 24,
          iconPath: SvgPaths.personBlueIcon,
          difference: 42,
          trendIcon: Icons.trending_up,
          trendIconColor: AppColors.green,
          onTap: () {},
        ),
        SizedBox(width: 24),

        InfoCard(
          title: "Registered Users",
          value: 4667,
          iconPath: SvgPaths.personBlueIcon,
          difference: 4667,
          trendIcon: Icons.arrow_right_alt,
          trendIconColor: AppColors.grey,
          onTap: () {},
        ),
      ],
    );
  }
}
