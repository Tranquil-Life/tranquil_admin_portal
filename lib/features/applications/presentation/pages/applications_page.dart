import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/global/custom_text.dart';
import 'package:tranquil_admin_portal/features/applications/presentation/controllers/applications_controller.dart';
import 'package:tranquil_admin_portal/features/applications/presentation/widgets/applications_table.dart';
import 'package:tranquil_admin_portal/features/applications/presentation/widgets/metric_card.dart';
import 'package:tranquil_admin_portal/features/site_layout/presentation/controllers/menu_controller.dart';

class ApplicationsPage extends StatefulWidget {
  const ApplicationsPage({super.key});

  @override
  State<ApplicationsPage> createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  final applicationController = Get.put(ApplicationsController());
  final menController = Get.put(MenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => SingleChildScrollView(
        padding: const EdgeInsets.only(top: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: menController.returnRouteName(),
                  size: 24,
                  weight: FontWeight.w600,
                )),


            const SizedBox(height: 4),

            Text(
              'Review and manage therapist onboarding applications',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 24),

            buildMetrics(),

            const SizedBox(height: 28),

            buildApplicationsTable(applicationController),
          ],
        ),
      ),
    );
  }

  Widget buildMetrics() {
    return Row(
      children: [
        Expanded(
          child: metricCard(
            title: 'All Applications',
            value: applicationController.totalApplications.value.toString(),
            icon: Icons.assignment_outlined,
            color: Colors.green,
          ),
        ),

        const SizedBox(width: 20),

        Expanded(
          child: metricCard(
            title: 'Pending',
            value: applicationController.pendingApplications.value.toString(),
            icon: Icons.access_time,
            color: Colors.orange,
          ),
        ),

        const SizedBox(width: 20),

        Expanded(
          child: metricCard(
            title: 'Needs Review',
            value: applicationController.needsReview.value.toString(),
            icon: Icons.visibility_outlined,
            color: Colors.blue,
          ),
        ),

        const SizedBox(width: 20),

        Expanded(
          child: metricCard(
            title: 'Approved',
            value: applicationController.approvedApplications.value.toString(),
            icon: Icons.check_circle_outline,
            color: Colors.green,
          ),
        ),

        const SizedBox(width: 20),

        Expanded(
          child: metricCard(
            title: 'Rejected',
            value: applicationController.rejectedApplications.value.toString(),
            icon: Icons.cancel_outlined,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
