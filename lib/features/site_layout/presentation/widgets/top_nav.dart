// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/responsiveness.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key, String username) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ?
      Row(
        children: [
          Expanded(
              flex: 1,
              child: Image.asset(
                "assets/images/tranquil_life_logo.png",
              ))
        ],
      )
          :
      IconButton(
        icon: Icon(Icons.menu, color: AppColors.green),
        onPressed: (){
          key.currentState!.openDrawer();
        },
      ),
      title: Row(
        children: [
          CustomText(text: AppStrings.appName,),
          Expanded(child: Container()),

          Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.notifications_none, color: AppColors.black.withOpacity(.7)),
                  onPressed: (){
                    //On pressed the notification icon
                  }),
              Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    width: 12,
                    height: 12,
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.white, width: 2)
                    ),
                  ))
            ],
          ),

          Container(
            width: 1,
            height: 22,
            color: AppColors.grey[300],
          ),

          SizedBox(
            width: 24,
          ),

          CustomText(
              text: username,
              size: 14,
              color: AppColors.black,
              weight: FontWeight.normal),

          SizedBox(
            width: 16,
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                child: Icon(Icons.person_outline, color: AppColors.green),
              ),
            ),
          )

        ],),

      iconTheme: IconThemeData(color: AppColors.green),
      backgroundColor: AppColors.white,

    );