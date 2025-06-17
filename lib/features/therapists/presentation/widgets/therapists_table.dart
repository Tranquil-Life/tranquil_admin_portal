import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/svg_paths.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_form_field.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/extensions/date_time_extension.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/therapists/domain/entities/therapist.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/controllers/therapists_controller.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/widgets/therapist_item.dart';

class TherapistsTable extends StatefulWidget {
  const TherapistsTable({super.key});

  @override
  State<TherapistsTable> createState() => _TherapistsTableState();
}

class _TherapistsTableState extends State<TherapistsTable> {
  TherapistsController therapistsController = Get.put(TherapistsController());

  var columnsArray = [
    "", // Header for checkbox
    "s/n",
    "PROFILE ",
    "CONTACT",
    "CATEGORY",
    "EARNINGS",
    'DATE JOINED',
    'LAST ACTIVE',
    'ACTIONS'
  ];

  void toggleSelection(int id, List<Therapist> therapists) {
    setState(() {
      final therapist = therapists.firstWhere((element) => element.id == id);
      // therapist['selected'] = !therapist['selected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: AppColors.grey[300]!.withOpacity(.1),
              blurRadius: 12)
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 24),
          Row(
            children: [
              Wrap(
                direction: Axis.vertical,
                spacing: 4,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  CustomText(text: AppStrings.therapistsTitle, size: 18),
                  CustomText(
                      text: AppStrings.therapistsTableMsg,
                      size: 12,
                      color: AppColors.grey[300]),
                ],
              ),
              SizedBox(width: 60),
              SizedBox(
                width: 400,
                height: 42,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CustomFormField(
                    verticalPadding: 12,
                    fillColor: Color(0xffF2F2F2),
                    prefix: Container(
                        margin: EdgeInsets.only(
                            top: 9, left: 16, bottom: 8, right: 16),
                        child: SvgPicture.asset(
                          SvgPaths.searchIcon,
                          color: AppColors.grey[300],
                          // width: 24,
                          // height: 24,
                        )),
                    hint: AppStrings.therapistSearchHintMsg,
                  ),
                ),
              ),
              Spacer(),
              SvgPicture.asset(SvgPaths.filterIcon),
              SizedBox(width: 6),
              CustomText(text: AppStrings.filterTitle, color: AppColors.green),
              SizedBox(width: 24),
              Container(
                width: 0.5,
                height: 20,
                margin: EdgeInsets.symmetric(horizontal: 17),
                color: AppColors.grey[300],
              ),
              SizedBox(width: 24),
              SizedBox(width: 6),
              CustomText(text: AppStrings.sortByTitle, color: AppColors.green),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 11.5),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey[300]!.withOpacity(.3))),
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(30), // Checkbox column
                1: FixedColumnWidth(50), // S/N column
                2: FlexColumnWidth(), // PROFILE column
                3: FlexColumnWidth(), // CONTACT column
                4: FlexColumnWidth(), // TYPE column
                5: FlexColumnWidth(), // EARNINGS column
                6: FlexColumnWidth(), // DATE JOINED column
                7: FlexColumnWidth(), // LAST ACTIVE column
                8: FixedColumnWidth(80), // ACTIONS column
              },
              children: [
                TableRow(
                    children: columnsArray
                        .map(
                          (e) => CustomText(
                            text: e.toUpperCase(),
                            size: 12,
                            weight: FontWeight.bold,
                          ),
                        )
                        .toList())
              ],
            ),
          ),
          SizedBox(height: 11.5),
          FutureBuilder(
              future: therapistsController.getAllTherapists(),
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

                var therapists = snapshot.data as List<Therapist>;

                return Column(
                  children: therapists.map((e) {
                    return TherapistItem(
                      item: e,
                      therapistsController: therapistsController,
                      onCheckboxChanged: (int i) {},
                    );
                  }).toList(),
                );
              }),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}


