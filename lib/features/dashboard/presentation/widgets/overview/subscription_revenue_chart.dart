import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';

class SubscriptionRevChart extends StatelessWidget {
  const SubscriptionRevChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Revenue amount'),
        labelFormat: '{value}\$',
        isVisible: true,
      ),
      series: <ChartSeries>[
        SplineSeries<ChartData, String>(
            dataSource: _getChartData(),
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.revenue1,
            name: AppStrings.weeklyTitle,
            color: AppColors.yellow,
            markerSettings: MarkerSettings(
              isVisible: true,
              color: AppColors.yellow,
              shape: DataMarkerType.circle,
              width: 6,
              height: 6,
            )),
        SplineSeries<ChartData, String>(
            dataSource: _getChartData(),
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.revenue2,
            name: 'Revenue 2',
            color: AppColors.darkGreen,
            markerSettings: MarkerSettings(
              isVisible: true,
              color: AppColors.darkGreen,
              shape: DataMarkerType.circle,
              width: 6,
              height: 6,
            )),
        SplineSeries<ChartData, String>(
            dataSource: _getChartData(),
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.revenue3,
            name: 'Revenue 3',
            color: AppColors.blue,
            markerSettings: MarkerSettings(
              isVisible: true,
              color: AppColors.blue,
              shape: DataMarkerType.circle,
              width: 6,
              height: 6,
            )),
      ],
    );
  }

  List<ChartData> _getChartData() {
    return [
      ChartData('Sep', 2000, 1400, 3000),
      ChartData('Oct', 1500, 2500, 3500),
      ChartData('Nov', 2000, 3000, 4000),
      ChartData('Dec', 2500, 3500, 1400),
      ChartData('Jan', 4000, 3000, 5000),
      ChartData('Feb', 3500, 4500, 5500),
      ChartData('Mar', 4000, 5000, 6000),
      ChartData('Apr', 4500, 5500, 6500),
      ChartData('May', 8000, 3000, 7000),
      ChartData('Jun', 5500, 6500, 7500),
      ChartData('Jul', 6000, 7000, 8000),
      ChartData('Aug', 6500, 7500, 8500),
    ];
  }
}

class ChartData {
  ChartData(this.month, this.revenue1, this.revenue2, this.revenue3);

  final String month;
  final double revenue1;
  final double revenue2;
  final double revenue3;
}
