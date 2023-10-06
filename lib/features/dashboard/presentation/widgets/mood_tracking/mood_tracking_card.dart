import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/app/presentation/theme/app_colors.dart';

class MoodTrackingCard extends StatelessWidget {
  const MoodTrackingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: AppColors.grey.withOpacity(.1),
              blurRadius: 12
          )
        ],),
    );
  }
}
