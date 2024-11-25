import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/app_installs_model.dart';

class InstallsChart extends StatelessWidget {
  final List<AppInstalls>? data;

  const InstallsChart({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        legend: const Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<AppInstalls, String>>[
          StackedBarSeries<AppInstalls, String>(
              dataSource: data!,
              xValueMapper: (AppInstalls installs, _) => installs.os,
              yValueMapper: (AppInstalls installs, _) => installs.installs,
              name: 'Installs',
              onCreateRenderer: (ChartSeries<AppInstalls, String> series) =>
                  _CustomColumnSeriesRenderer(),
        isVisibleInLegend: false,
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]);
  }
}

class _CustomColumnSeriesRenderer extends StackedBarSeriesRenderer {
  _CustomColumnSeriesRenderer();

  @override
  StackedBarSegment createSegment() {
    return _ColumnCustomPainter();
  }
}

class _ColumnCustomPainter extends StackedBarSegment {
  final colorList = [
    Colors.brown,
    Color(0xff00649F),
  ];

  @override
  Paint getFillPaint() {
    final Paint customerFillPaint = Paint();
    customerFillPaint.isAntiAlias = false;
    customerFillPaint.color = colorList[currentSegmentIndex!];
    customerFillPaint.style = PaintingStyle.fill;
    return customerFillPaint;
  }
}