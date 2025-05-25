import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_button.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/settings/data/repos/affirmation_repo.dart';
import 'package:tranquil_admin_portal/features/settings/domain/entities/affirmation.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/controllers/affirmation_controller.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/widgets/affirmation_grid.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/widgets/preference_input_dialog.dart';

class AffirmationsTab extends StatefulWidget {
  const AffirmationsTab({super.key});

  @override
  State<AffirmationsTab> createState() => _AffirmationsTabState();
}

class _AffirmationsTabState extends State<AffirmationsTab> {
  AffirmationController affirmationController =
      Get.put(AffirmationController());

  @override
  void initState() {
    affirmationController.getPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Affirmation Preference settings",
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                    CustomText(
                        text: "Manage affirmation preferences",
                        size: 12,
                        color: AppColors.grey[800]),
                  ],
                ),

                //Add preference button
                SizedBox(
                  width: 160,
                  child: CustomButton(
                    onPressed: () =>
                        showPrefInputDialog(context: context, affirmationController: affirmationController),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: "Add preference",
                            color: AppColors.white,
                            size: 12),
                        SizedBox(width: 8),
                        Icon(Icons.add, color: AppColors.white)
                      ],
                    ),
                  ),
                )
              ],
            )),
        Obx(() => affirmationController.loading.value
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Color(0xFF43A95D),
                ),
              )
            : SizedBox()),
        Obx(() {
          return FutureBuilder<List<Affirmation>>(
            future: affirmationController.preferencesFuture.value,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Color(0xFF43A95D),
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

              var preferences = snapshot.data ?? [];

              return AffirmationGrid(preferences: preferences, affirmationController: affirmationController);
            },
          );
        })
      ],
    ));
  }
}
