import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/constants/app_strings.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/size_helpers.dart';
import 'package:tranquil_admin_portal/features/dashboard/data/models/topic_model.dart';
import 'package:tranquil_admin_portal/features/dashboard/presentation/controllers/dashboard_controller.dart';

class TopicsCard extends StatefulWidget {
  const TopicsCard({super.key, required this.dashboardController});

  final DashboardController dashboardController;

  @override
  State<TopicsCard> createState() => _TopicsCardState();
}

class _TopicsCardState extends State<TopicsCard> {
  var columnsArray = ["s/n", "topics", "no. of requests", "users"];

  // var topics = <Map<String, dynamic>>[
  //   {'id': 1, 'topic': 'Anxiety', 'total_requests': '50', 'total_users': '24'},
  //   {'id': 2, 'topic': 'Career', 'total_requests': '34', 'total_users': '21'},
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: displayWidth(context),
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: AppColors.grey.withOpacity(.1),
                blurRadius: 12)
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppStrings.topicsWithMiraTitle,
                  weight: FontWeight.w600,
                  size: 18,
                ),
                GestureDetector(
                  child: Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CustomText(text: AppStrings.lastMonthTitle, size: 12),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 11.5),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey.withOpacity(.3))),
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(50), // Fixed width for the first column
                  1: FlexColumnWidth(), // Flexible width for the second column
                  2: FlexColumnWidth(), // Flexible width for the third column
                  3: FixedColumnWidth(50), // Fixed width for the last column
                },
                children: [
                  TableRow(
                      children: columnsArray
                          .map(
                            (e) => Center(
                              // Center the header text
                              child: CustomText(
                                text: e.toUpperCase(),
                                size: 12,
                              ),
                            ),
                          )
                          .toList())
                ],
              ),
            ),
            SizedBox(height: 11.5),
            FutureBuilder<List<TopicModel>>(
                future: widget.dashboardController.topTopicsWithMira(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          height: 20,
                          width: 20,
                          child: const CircularProgressIndicator(
                            color: AppColors.green,
                          ),
                        ));
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  final List<TopicModel> topics = snapshot.data!;

                  return Column(
                    children: topics.map((e) => TopicItem(item: e)).toList(),
                  );
                }),
            SizedBox(height: 20),
          ],
        ));
  }
}

class TopicItem extends StatelessWidget {
  const TopicItem({super.key, required this.item});

  final TopicModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          columnWidths: const {
            0: FixedColumnWidth(50), // Fixed width for the first column
            1: FlexColumnWidth(), // Flexible width for the second column
            2: FlexColumnWidth(), // Flexible width for the third column
            3: FixedColumnWidth(50), // Fixed width for the last column
          },
          children: [
            TableRow(children: [
              Center(
                // Center the header text
                child: CustomText(
                  text: item.id.toString().toUpperCase(),
                  size: 12,
                ),
              ),
              Center(
                // Center the header text
                child: CustomText(
                  text: item.topicName,
                  size: 12,
                ),
              ),
              Center(
                // Center the header text
                child: CustomText(
                  text: item.numberOfTopicRequests.toString(),
                  size: 12,
                ),
              ),
              Center(
                // Center the header text
                child: CustomText(
                  text: item.numberOfUsers.toString(),
                  size: 12,
                ),
              ),
            ])
          ],
        ),
        Divider()
      ],
    );
  }
}
