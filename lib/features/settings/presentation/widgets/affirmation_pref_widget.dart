import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/features/settings/domain/entities/affirmation.dart';

class AffirmationPrefWidget extends StatelessWidget {
  const AffirmationPrefWidget(
      {super.key, required this.preference, this.onTap});

  final Affirmation preference;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              // offset: Offset(0, 1),
              // offset: Offset(0, 6),
              color: AppColors.grey[100]!,
              blurRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: preference.color != null
                        ? Color(int.parse(preference.color!))
                        : AppColors.grey,
                    height: 8,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: CustomText(
                          text: preference.title,
                          size: 14,
                          color: AppColors.black,
                          weight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.string('''${preference.icon}''', height: 50, width: 50),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomText(
                    text: preference.description,
                    size: 12,
                    color: AppColors.grey[300],
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
