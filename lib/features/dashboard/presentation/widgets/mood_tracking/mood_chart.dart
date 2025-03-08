import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart' as charts;
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/features/dashboard/domain/entities/mood_data.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/dashboard_controller.dart';

class MoodChart extends StatelessWidget {
  const MoodChart({super.key, required this.moods});

  final List<MoodData> moods;

  @override
  Widget build(BuildContext context) {
    return SizedBox();

      // charts.SfCartesianChart(
      //   primaryXAxis: charts.CategoryAxis(
      //     labelStyle: TextStyle(
      //       color: AppColors.darkGreen,
      //       fontSize: 14, // Set the desired color for the x-axis labels
      //       fontWeight: FontWeight.bold, // Optional: Adjust font weight
      //     ),
      //   ),
      //   legend: const charts.Legend(isVisible: true),
      //   // Enable tooltip
      //   tooltipBehavior: charts.TooltipBehavior(enable: true),
      //   series: <charts.ChartSeries>[
      //     charts.ColumnSeries<MoodData, String>(
      //       dataSource: moods,
      //       xValueMapper: (MoodData mood, _) => "${mood.name}",
      //       yValueMapper: (MoodData mood, _) => mood.total,
      //       name: AppStrings.moodsTitle,
      //       pointColorMapper: (_, index) => _generateRandomColor(),
      //       isVisibleInLegend: false,
      //     )
      //   ]);
  }
}

/// Function to generate a random color
Color _generateRandomColor() {
  final Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
    1, // Opacity
  );
}

// List<MoodData> _getMoodData() {
//   return [
//     MoodData('Sad', '☹️', 340),
//     MoodData('Happy', '😄', 330),
//     MoodData('Anger', '😠', 554),
//     MoodData('Joy', '😂', 233),
//     MoodData('Shock', '😮', 13),
//     MoodData('Fear', '😰', 53),
//     MoodData('Calm', '😌', 180),
//     MoodData('Tired', '😪', 460),
//     MoodData('Awkward', '😬', 256),
//   ];
// }

// class MoodData {
//   final String name;
//   final String mood;
//   final int total;
//
//   MoodData(this.name, this.mood, this.total);
// }
