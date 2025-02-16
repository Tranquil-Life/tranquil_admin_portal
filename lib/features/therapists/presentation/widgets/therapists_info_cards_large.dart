import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/svg_paths.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/widgets/info/info_card_item.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/controllers/therapists_controller.dart';

class TherapistsInfoCardsLarge extends StatelessWidget {
  const TherapistsInfoCardsLarge(
      {super.key, required this.therapistsController});

  final TherapistsController therapistsController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Load all number of all human therapists
        FutureBuilder(
            future: therapistsController.countAllTherapists(),
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
                title: AppStrings.allTherapistsTitle,
                value: total,
                iconPath: SvgPaths.categoriesIcon,
                onTap: () {},
              );
            }),

        SizedBox(width: 24),

        //Load number of all agency therapists
        FutureBuilder(
            future: therapistsController.countAgencyTherapists(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: SizedBox(
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
                title: AppStrings.agencyBasedTherapistsTitle,
                value: total,
                iconPath: SvgPaths.peopleIcon,
                onTap: () {},
              );
            }),

        SizedBox(width: 24),

        //Load number of all solo therapists
        FutureBuilder(
            future: therapistsController.countSoloTherapists(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: SizedBox(
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
                title: AppStrings.soloTherapistsTitle,
                value: total,
                iconPath: SvgPaths.personBlueIcon,
                onTap: () {},
              );
            }),

        SizedBox(width: 24),

        FutureBuilder(
            future: therapistsController.countTherapistsInSessions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: SizedBox(
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
                title: AppStrings.therapistsInSessionTitle,
                value: total,
                iconPath: SvgPaths.sessionIcon,
                onTap: () {},
              );
            }),
      ],
    );
  }
}
