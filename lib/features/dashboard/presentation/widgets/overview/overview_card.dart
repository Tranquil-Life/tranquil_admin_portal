import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:tranquil_admin_portal/app/presentation/theme/app_colors.dart';
import 'package:tranquil_admin_portal/app/presentation/widgets/custom_text.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/growth_model.dart';

class OverviewCard extends StatelessWidget {
  final int? growth;
  final List<GrowthData>? data;
  final String? filterType;

  const OverviewCard({super.key, this.growth, this.data, this.filterType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: AppColors.grey.withOpacity(.1),
              blurRadius: 12
          )
        ],),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              CustomText(
                text: "Project growth - $growth%",
              ),

              //..
            ],
          ),

          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: '$filterType growth analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<GrowthData, String>>[
                SplineAreaSeries<GrowthData, String>(
                    dataSource: data!,
                    xValueMapper: (GrowthData growth, _) => growth.year,
                    yValueMapper: (GrowthData growth, _) => growth.growth,
                    name: 'Growth',
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.green.withOpacity(.48),
                          AppColors.white
                        ]
                    ),
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),

        ],
      ),
    );
  }
}