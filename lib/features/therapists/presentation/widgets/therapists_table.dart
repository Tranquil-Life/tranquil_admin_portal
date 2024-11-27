import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/svg_paths.dart';
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
    "", // Header for checkbox
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
    {
      'id': 1,
      'name': 'Elyse Lindell, MD',
      'contact': {
        'email': 'elyselindell@gmail.com',
        'phone': '+44 20 8763 1129',
        'location': 'UK'
      },
      'type': {'company_name': 'Private practice', 'type': 'Solo practitioner'},
      'earnings': {'amount_earned': '45094', 'completed_sessions': '33'},
      'date_joined': 'Sep 27, 2023',
      'last_active': 'ONLINE',
      'selected': false,

    },
    {
      'id': 2,
      'name': 'Sebastian Thoren, MD',
      'contact': {
        'email': 'sebastainthoren@harleypsych.com',
        'phone': '+1 555 555 1129',
        'location': 'USA'
      },
      'type': {
        'company_name': 'Agency-based therapy',
        'type': 'Harley Psychiatrists'
      },
      'earnings': {'amount_earned': '59405', 'completed_sessions': '29'},
      'date_joined': 'Today, 12:07pm',
      'last_active': 'ONLINE',
      'selected': false,

    },
  ];

  void toggleSelection(int id) {
    setState(() {
      final therapist = therapists.firstWhere((element) => element['id'] == id);
      therapist['selected'] = !therapist['selected'];
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
                  CustomText(
                      text: AppStrings.therapistsTableMsg,
                      size: 12,
                      color: AppColors.grey),
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
                          color: AppColors.grey,
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
                color: AppColors.grey,
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
                border: Border.all(color: AppColors.grey.withOpacity(.3))),
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(40), // Checkbox column
                1: FixedColumnWidth(50), // S/N column
                2: FlexColumnWidth(),   // PROFILE column
                3: FlexColumnWidth(),   // CONTACT column
                4: FlexColumnWidth(),   // TYPE column
                5: FlexColumnWidth(),   // EARNINGS column
                6: FlexColumnWidth(),   // DATE JOINED column
                7: FlexColumnWidth(),   // LAST ACTIVE column
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
          Column(
            children: therapists.map((e) {
              return TherapistItem(
                item: e,
                onCheckboxChanged: toggleSelection,
              );
            }).toList(),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}

class TherapistItem extends StatelessWidget {
  const TherapistItem({super.key, required this.item, required this.onCheckboxChanged});

  final Map<String, dynamic> item;
  final ValueChanged<int> onCheckboxChanged;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FixedColumnWidth(40), // Checkbox column
            1: FixedColumnWidth(50), // S/N column
            2: FlexColumnWidth(),   // PROFILE column
            3: FlexColumnWidth(),   // CONTACT column
            4: FlexColumnWidth(),   // TYPE column
            5: FlexColumnWidth(),   // EARNINGS column
            6: FlexColumnWidth(),   // DATE JOINED column
            7: FlexColumnWidth(),   // LAST ACTIVE column
            8: FixedColumnWidth(80), // ACTIONS column
          },
          children: [
            TableRow(children: [
              Checkbox(
                value: item['selected'],
                onChanged: (_) => onCheckboxChanged(item['id']),
              ),
              CustomText(
                text: item['id'].toString().toUpperCase(),
                size: 12,
              ),
              CustomText(
                text: item['name'],
                size: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 4,
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset(SvgPaths.emailIcon),
                      CustomText(
                        text: item['contact']['email'],
                        size: 12,
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Wrap(
                    spacing: 4,
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset(SvgPaths.phoneIcon),
                      CustomText(
                        text: item['contact']['phone'],
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Placeholder(),
                    maxRadius: 16,
                  ),
                  SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: item['type']['type'],
                        size: 12,
                      ),
                      CustomText(
                        text: item['type']['company_name'],
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: '\$${item['earnings']['amount_earned']}',
                    size: 12,
                    weight: FontWeight.bold,
                  ),
                  CustomText(
                    text: '${item['earnings']['completed_sessions']} sessions',
                    size: 12,
                  ),
                ],
              ),
              CustomText(
                text: item['date_joined'],
                size: 12,
              ),
              CustomText(
                text: item['last_active'],
                size: 12,
              ),
              SvgPicture.asset(SvgPaths.moreIcon)
            ])
          ],
        ),
        Divider()
      ],
    );
  }
}
