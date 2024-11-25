import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';

class MoodChart extends StatelessWidget {
  const MoodChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(
            color: AppColors.darkGreen,
            fontSize: 14,// Set the desired color for the x-axis labels
            fontWeight: FontWeight.bold, // Optional: Adjust font weight
          ),
        ),        legend: const Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          ColumnSeries<MoodData, String>(
            dataSource: _getMoodData(),
            xValueMapper: (MoodData mood, _) => "${mood.name}\n${mood.mood}",
            yValueMapper: (MoodData mood, _) => mood.total,
            name: AppStrings.moodsTitle,
            pointColorMapper: (_, index) => _generateRandomColor(),
            isVisibleInLegend: false,
          )
        ]);
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

List<MoodData> _getMoodData() {
  return [
    MoodData('Sad', '☹️', 340),
    MoodData('Happy', '😄', 330),
    MoodData('Anger', '😠', 554),
    MoodData('Joy', '😂', 233),
    MoodData('Shock', '😮', 13),
    MoodData('Fear', '😰', 53),
    MoodData('Calm', '😌', 180),
    MoodData('Tired', '😪', 460),
    MoodData('Awkward', '😬', 256),
  ];
}

class MoodData {
  final String name;
  final String mood;
  final int total;

  MoodData(this.name, this.mood, this.total);
}
