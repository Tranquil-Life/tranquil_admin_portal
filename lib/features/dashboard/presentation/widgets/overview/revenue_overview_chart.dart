import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RevenueOverviewChart extends StatefulWidget {
  const RevenueOverviewChart({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<RevenueOverviewChart> createState() => _RevenueOverviewChartState();
}

class _RevenueOverviewChartState extends State<RevenueOverviewChart> {
  late List<ChartData> data;
  late TooltipBehavior tooltip;

  @override
  void initState() {
    data = [
      ChartData('Session payments', double.parse(widget.data['session_payments'].toString())),
      ChartData('Subscriptions', double.parse(widget.data['subscriptions'].toString())),
    ];
    tooltip = TooltipBehavior(enable: true);

    super.initState();
  }

  var barColors = <Color>[const Color(0xff0680BB), const Color(0xff03405E)];

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        tooltipBehavior: tooltip,
        series: <CircularSeries<ChartData, String>>[
          DoughnutSeries<ChartData, String>(
              dataSource: data,
              pointColorMapper:  (_, index) => barColors[index],
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              name: 'Total revenue'
          )
        ]
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
