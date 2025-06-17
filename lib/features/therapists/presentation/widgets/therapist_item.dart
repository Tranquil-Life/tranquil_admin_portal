import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/svg_paths.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/extensions/date_time_extension.dart';
import 'package:tranquil_admin_portal/features/therapists/domain/entities/therapist.dart';
import 'package:tranquil_admin_portal/features/therapists/presentation/controllers/therapists_controller.dart';

class TherapistItem extends StatelessWidget {
  const TherapistItem(
      {super.key,
      required this.item,
      required this.onCheckboxChanged,
      required this.therapistsController});

  final Therapist item;
  final TherapistsController therapistsController;
  final ValueChanged<int> onCheckboxChanged;

  @override
  Widget build(BuildContext context) {
    final GlobalKey actionKey = GlobalKey();

    return Column(
      children: [
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FixedColumnWidth(40), // Checkbox column
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
            TableRow(children: [
              Checkbox(
                value: false,
                onChanged: (_) {},
              ),
              CustomText(
                text: item.id.toString().toUpperCase(),
                size: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${item.fName} ${item.lName}",
                    size: 12,
                    weight: FontWeight.w600,
                  ),
                  CustomText(
                    text: "${item.specialties!.join(', ').length > 50 ? "${item.specialties?.join(', ').substring(0, 47)}..." :  item.specialties?.join(', ')}",
                    size: 12,
                    color: AppColors.grey[800],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 2, right: 4),
                          child: SvgPicture.asset(SvgPaths.emailIcon)),
                      SizedBox(
                        width: 120,
                        child: CustomText(
                          text: item.email,
                          size: 12,
                        ),
                      )
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
                        text: item.phone,
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
                    maxRadius: 16,
                    child: item.avatarUrl == null
                        ? Placeholder()
                        : Image.network(item.avatarUrl!),
                  ),
                  SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "null",
                        size: 12,
                      ),
                      CustomText(
                        text: "null",
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
                    text: "\$${item.earnings?.netIncome}",
                    size: 12,
                    weight: FontWeight.bold,
                  ),
                  CustomText(
                    text: '${item.completedSessions} sessions',
                    size: 12,
                  ),
                ],
              ),
              CustomText(
                text: item.createdAt?.toLocal().formatDateTime,
                size: 12,
              ),

              //last active
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (DateTimeExtension.lastActive(item.updatedAt!) ==
                          AppStrings.online ||
                      DateTimeExtension.lastActive(item.updatedAt!) ==
                          AppStrings.inSession)
                    Container(
                      height: 8,
                      width: 8,
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.green),
                    ),
                  CustomText(
                    text: DateTimeExtension.lastActive(item.updatedAt!).toUpperCase(),
                    color: DateTimeExtension.lastActive(item.updatedAt!) ==
                            AppStrings.online
                        ? AppColors.green
                        : AppColors.black,
                    size: 12,
                  ),
                ],
              ),
              GestureDetector(
                key: actionKey, // Assign the key here
                onTap: () => displayActionPopUp(
                    context, therapistsController, actionKey, item.id!),
                child: SvgPicture.asset(SvgPaths.moreIcon),
              )
            ])
          ],
        ),
        Divider()
      ],
    );
  }

  displayActionPopUp(
      BuildContext context,
      TherapistsController therapistsController,
      GlobalKey key,
      int therapistId) {
    // Get the RenderBox and its position
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    // Show the menu at the calculated position
    return showMenu(
      color: Colors.white, // Set your preferred color
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx, // X-coordinate of the GestureDetector
        offset.dy + size.height, // Y-coordinate + height of the item
        offset.dx + size.width, // Width of the GestureDetector
        0, // No margin at the bottom
      ),
      items: [
        PopupMenuItem(
          onTap: () async =>
              await therapistsController.approveTherapist(therapistId),
          value: 'approve',
          child: const Text('Approve'),
        ),
        const PopupMenuItem(
          value: 'block',
          child: Text('Block'),
        ),
        const PopupMenuItem(
          value: 'view',
          child: Text('View'),
        ),
        const PopupMenuItem(
          value: 'pay',
          child: Text('Pay'),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: Text('Delete'),
        ),
      ],
    );
  }
}
