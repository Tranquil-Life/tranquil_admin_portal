import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/svg_paths.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/info/info_card_item.dart';

class TherapistsInfoCardsLarge extends StatelessWidget {
  const TherapistsInfoCardsLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InfoCard(
          title: AppStrings.allTherapistsTitle,
          value: 567,
          iconPath: SvgPaths.categoriesIcon,
          onTap: () {},
        ),

        SizedBox(width: 24),

        InfoCard(
          title: AppStrings.agencyBasedTherapistsTitle,
          value: 567,
          iconPath: SvgPaths.peopleIcon,
          onTap: () {},
        ),

        SizedBox(width: 24),

        InfoCard(
          title: AppStrings.soloTherapistsTitle,
          value: 567,
          iconPath: SvgPaths.personBlueIcon,
          onTap: () {},
        ),

        SizedBox(width: 24),

        InfoCard(
          title: AppStrings.therapistsInSessionTitle,
          value: 567,
          iconPath: SvgPaths.sessionIcon,
          onTap: () {},
        ),
      ],
    );
  }
}
