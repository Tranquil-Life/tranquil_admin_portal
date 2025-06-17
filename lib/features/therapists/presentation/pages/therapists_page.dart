import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/responsiveness.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/controllers/affirmation_controller.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menu_controller.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/controllers/therapists_controller.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/widgets/therapists_info_cards_large.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/widgets/therapists_info_cards_medium.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/widgets/therapists_info_cards_small.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/widgets/therapists_table.dart';

class TherapistsPage extends StatefulWidget {
  const TherapistsPage({super.key});

  @override
  State<TherapistsPage> createState() => _TherapistsPageState();
}

class _TherapistsPageState extends State<TherapistsPage> {
  final menuController = Get.put(MenController());
  final therapistController = Get.put(TherapistsController());
  final affirmationController = Get.put(AffirmationController());

  @override
  void initState() {
    therapistController.getAllTherapists();
    affirmationController.getPreferences();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        children: [
          //Current page title
          Obx(()=>Container(
              margin: const EdgeInsets.only(top: 80, bottom: 20),
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: menuController.returnRouteName(),
                size: 24,
                weight: FontWeight.w600,
              ))),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (ResponsiveWidget.isLargeScreen(context) ||
                      ResponsiveWidget.isMediumScreen(context))
                    if (ResponsiveWidget.isCustomScreen(context))
                      TherapistsInfoCardsMedium()
                    else
                      TherapistsInfoCardsLarge(therapistsController: therapistController)
                  else
                    TherapistsInfoCardsSmall(),

                  const SizedBox(height: 24),

                  TherapistsTable()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
