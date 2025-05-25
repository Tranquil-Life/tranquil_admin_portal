import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/features/settings/domain/entities/affirmation.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/controllers/affirmation_controller.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/widgets/affirmation_pref_widget.dart';
import 'package:tranquil_admin_portal/features/settings/presentation/widgets/preference_input_dialog.dart';

class AffirmationGrid extends StatelessWidget {
  const AffirmationGrid(
      {super.key,
      required this.preferences,
      required this.affirmationController});

  final List<Affirmation> preferences;
  final AffirmationController affirmationController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      padding: const EdgeInsets.all(24),
      // controller: controller.scrollController,
      itemCount: preferences.length,
      itemBuilder: (context, index) => AffirmationPrefWidget(
        preference: preferences[index],
        onTap: () {
          showPrefInputDialog(
              context: context,
              affirmationController: affirmationController,
              preference: preferences[index]);
        },
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 1,
        crossAxisSpacing: 14,
        mainAxisSpacing: 16,
      ),
    );
  }
}
