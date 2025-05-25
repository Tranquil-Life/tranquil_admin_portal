import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/app_installs_model.dart';

class InstallsChart extends StatelessWidget {
  final List<AppInstalls>? data;

  const InstallsChart({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
      // charts.SfCartesianChart(
      //   primaryXAxis: charts.CategoryAxis(),
      //   legend: const charts.Legend(isVisible: true),
      //   // Enable tooltip
      //   tooltipBehavior: charts.TooltipBehavior(enable: true),
      //   series: <charts.ChartSeries<AppInstalls, String>>[
      //     charts.StackedBarSeries<AppInstalls, String>(
      //         dataSource: data!,
      //         xValueMapper: (AppInstalls installs, _) => installs.os,
      //         yValueMapper: (AppInstalls installs, _) => installs.installs,
      //         name: 'Installs',
      //         onCreateRenderer: (charts.ChartSeries<AppInstalls, String> series) =>
      //             _CustomColumnSeriesRenderer(),
      //   isVisibleInLegend: false,
      //         // Enable data label
      //         dataLabelSettings: charts.DataLabelSettings(isVisible: true))
      //   ]);
  }
}

// class _CustomColumnSeriesRenderer extends charts.StackedBarSeriesRenderer {
//   _CustomColumnSeriesRenderer();
//
//   @override
//   charts.StackedBarSegment createSegment() {
//     return _ColumnCustomPainter();
//   }
// }
//
// class _ColumnCustomPainter extends charts.StackedBarSegment {
//   final colorList = [
//     Colors.brown,
//     Color(0xff00649F),
//   ];
//
//   @override
//   Paint getFillPaint() {
//     final Paint customerFillPaint = Paint();
//     customerFillPaint.isAntiAlias = false;
//     customerFillPaint.color = colorList[currentSegmentIndex!];
//     customerFillPaint.style = PaintingStyle.fill;
//     return customerFillPaint;
//   }
// }