import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_form_field.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';

class TherapistsTable extends StatefulWidget {
  const TherapistsTable({super.key});

  @override
  State<TherapistsTable> createState() => _TherapistsTableState();
}

class _TherapistsTableState extends State<TherapistsTable> {
  var columnsArray = [
    "s/n",
    "PROFILE ",
    "CONTACT",
    "TYPE",
    "EARNINGS",
    'DATE JOINED',
    'LAST ACTIVE',
    'ACTIONS'
  ];

  var therapists = <Map<String, dynamic>>[
    {'id': 1, 'name': 'Anxiety', 'phone': '50', 'total_users': '24'},
    {'id': 2, 'topic': 'Career', 'total_requests': '34', 'total_users': '21'},
  ];

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
              color: AppColors.grey.withOpacity(.1),
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
                  CustomText(text: AppStrings.therapistsTableMsg, size: 12),
                ],
              ),

              SizedBox(width: 60),

              SizedBox(
                width: 400,
                height: 42,
                child: CustomFormField(fillColor: Color(0xffF2F2F2)),
              )
            ],
          ),

          SizedBox(height: 24),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 11.5),
            decoration: BoxDecoration(
                border:
                Border.all(color: AppColors.grey.withOpacity(.3))),
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(
                    50), // Fixed width for the first column
                1: FlexColumnWidth(), // Flexible width for the second column
                2: FlexColumnWidth(), // Flexible width for the third column
                3: FlexColumnWidth(), // Flexible width for the third column
                4: FlexColumnWidth(), // Flexible width for the third column
                5: FlexColumnWidth(), // Flexible width for the third column
                6: FlexColumnWidth(), // Flexible width for the third column
                7: FixedColumnWidth(
                    80), // Fixed width for the last column
              },
              children: [
                TableRow(
                    children: columnsArray
                        .map(
                          (e) => Center(
                        // Center the header text
                        child: CustomText(
                          text: e.toUpperCase(),
                          size: 12,
                          weight: FontWeight.bold,
                        ),
                      ),
                    )
                        .toList())
              ],
            ),
          ),
          SizedBox(height: 11.5),
          Column(
            children: therapists.map((e) => TherapistItem(item: e)).toList(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TherapistItem extends StatelessWidget {
  const TherapistItem({super.key, required this.item});

  final Map<String, dynamic> item;


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
