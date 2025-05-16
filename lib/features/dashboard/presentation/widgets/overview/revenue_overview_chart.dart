import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart' as charts;

class RevenueOverviewChart extends StatefulWidget {
  const RevenueOverviewChart({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<RevenueOverviewChart> createState() => _RevenueOverviewChartState();
}

class _RevenueOverviewChartState extends State<RevenueOverviewChart> {
  late List<PieChartSectionData> data;

  // late charts.TooltipBehavior tooltip;

  @override
  void initState() {
    data = getSections(widget.data);
    // tooltip = charts.TooltipBehavior(enable: true);

    super.initState();
  }

  var barColors = <Color>[const Color(0xff0680BB), const Color(0xff03405E)];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300, // Set a fixed width
        height: 300, // Set a fixed height
        child: Transform(
            alignment: Alignment.center, // Center the rotation pivot
            transform: Matrix4.rotationZ(1.24),
            child: PieChart(
              PieChartData(
                sections: data,
                borderData: FlBorderData(show: true),
                centerSpaceRadius: 40, // Adjust the center space
                sectionsSpace: 2, // Space between sections
                pieTouchData: PieTouchData(
                  enabled: true,
                )
              ),
              swapAnimationDuration: const Duration(seconds: 2),
              swapAnimationCurve: Curves.bounceOut,
            )));
  }
}

List<PieChartSectionData> getSections(Map<String, dynamic> data) {
  return [
    PieChartSectionData(
      color: const Color(0xff0680BB),
      value: data['session_payments'],
      radius: 100,
      showTitle: false,
      titleStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    PieChartSectionData(
      color: const Color(0xff03405E),
      value: data['subscriptions'],
      radius: 100,
      showTitle: false,
      titleStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  ];
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
