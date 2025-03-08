import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart' as charts;
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/utils/extensions/date_time_extension.dart';
import 'package:tranquil_admin_portal/features/dashboard/domain/entities/subscription.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/overview_controller.dart';

class SubscriptionOverviewChart extends StatelessWidget {
  const SubscriptionOverviewChart({super.key, required this.overviewController});

  final OverviewController overviewController;

  @override
  Widget build(BuildContext context) {
    return SizedBox();


      // FutureBuilder<List<Subscription>>(
      //   future: overviewController.subscriptionStats(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //           child: Container(
      //             margin: const EdgeInsets.only(left: 8),
      //             height: 20,
      //             width: 20,
      //             child: const CircularProgressIndicator(
      //               color: AppColors.green,
      //             ),
      //           ));
      //     }
      //
      //     if (snapshot.hasError) {
      //       return Center(
      //         child: Text(
      //           'Error: ${snapshot.error}',
      //           style: const TextStyle(color: Colors.red),
      //         ),
      //       );
      //     }
      //
      //     final List<Subscription> subscriptions = snapshot.data!;
      //
      //     if (subscriptions.isEmpty) {
      //       // Render a placeholder chart with no actual data
      //       return charts.SfCartesianChart(
      //         primaryXAxis: charts.CategoryAxis(),
      //         primaryYAxis: charts.NumericAxis(
      //           title: charts.AxisTitle(text: 'Revenue amount'),
      //           labelFormat: '{value}\$',
      //           isVisible: true,
      //         ),
      //         series: <charts.ChartSeries>[
      //           charts.SplineSeries<Subscription, String>(
      //             dataSource: [Subscription.empty()],
      //             xValueMapper: (Subscription data, _) => "No Data",
      //             yValueMapper: (Subscription data, _) => 0.0,
      //             name: "No Data",
      //             color: Colors.grey,
      //             markerSettings: charts.MarkerSettings(
      //               isVisible: true,
      //               color: Colors.grey,
      //               shape: charts.DataMarkerType.circle,
      //               width: 6,
      //               height: 6,
      //             ),
      //           ),
      //         ],
      //       );
      //     }
      //
      //     return charts.SfCartesianChart(
      //       primaryXAxis: charts.CategoryAxis(),
      //       primaryYAxis: charts.NumericAxis(
      //         title: charts.AxisTitle(text: 'Revenue amount'),
      //         labelFormat: '{value}\$',
      //         isVisible: true,
      //       ),
      //       series: <charts.ChartSeries>[
      //         charts.SplineSeries<Subscription, String>(
      //             dataSource: subscriptions,
      //             xValueMapper: (Subscription data, _) => data.createdAt?.formatMonth,
      //             yValueMapper: (Subscription data, _) => data.amount,
      //             name: AppStrings.weeklyTitle,
      //             color: AppColors.yellow,
      //             markerSettings: charts.MarkerSettings(
      //               isVisible: true,
      //               color: AppColors.yellow,
      //               shape: charts.DataMarkerType.circle,
      //               width: 6,
      //               height: 6,
      //             )),
      //         charts.SplineSeries<Subscription, String>(
      //             dataSource: subscriptions,
      //             xValueMapper: (Subscription data, _) => data.createdAt?.formatMonth,
      //             yValueMapper: (Subscription data, _) => data.amount,
      //             name: 'Revenue 2',
      //             color: AppColors.darkGreen,
      //             markerSettings: charts.MarkerSettings(
      //               isVisible: true,
      //               color: AppColors.darkGreen,
      //               shape: charts.DataMarkerType.circle,
      //               width: 6,
      //               height: 6,
      //             )),
      //         charts.SplineSeries<Subscription, String>(
      //             dataSource: subscriptions,
      //             xValueMapper: (Subscription data, _) => data.createdAt?.formatMonth,
      //             yValueMapper: (Subscription data, _) => data.amount,
      //             name: 'Revenue 3',
      //             color: AppColors.blue,
      //             markerSettings: charts.MarkerSettings(
      //               isVisible: true,
      //               color: AppColors.blue,
      //               shape: charts.DataMarkerType.circle,
      //               width: 6,
      //               height: 6,
      //             )),
      //       ],
      //     );
      //   });


  }
}