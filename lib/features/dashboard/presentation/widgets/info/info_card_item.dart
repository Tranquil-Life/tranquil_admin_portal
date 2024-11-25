import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';

class InfoCard extends StatelessWidget {
  final String? title;
  final String? iconPath;
  final int? value;
  final int? difference;
  final Color? topColor;
  final bool? isActive;
  final IconData? trendIcon;
  final Color? trendIconColor;
  final Function()? onTap;

  const InfoCard({Key? key,  this.title, this.value, this.isActive = false, this.onTap, this.topColor, this.iconPath, this.difference, this.trendIcon, this.trendIconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 6),
                  color: AppColors.grey.withOpacity(.1),
                  blurRadius: 12
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
                        color: topColor ?? AppColors.green,
                        height: 4,
                      )),
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
                        Flexible(child: CustomText(
                          text: "$title",
                          size: 16,
                          color: AppColors.grey,
                        ),),

                        SvgPicture.asset("$iconPath")
                      ],
                    ),

                    SizedBox(height: 12),

                    CustomText(
                      text: "$value",
                      size: 32,
                      weight: FontWeight.bold,
                      color: AppColors.black,
                    ),

                    SizedBox(height: 12),

                    Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const CustomText(
                          text: "Last quarter",
                          size: 14,
                          color: AppColors.grey,
                        ),

                        Icon(trendIcon, color: trendIconColor, size: 20),

                        CustomText(
                          text: "$difference",
                          size: 14,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
