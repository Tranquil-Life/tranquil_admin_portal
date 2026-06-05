import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tranquil_admin_portal/core/constants/theme/app_colors.dart';
import 'package:tranquil_admin_portal/features/applications/data/models/application_model.dart';

import 'package:tranquil_admin_portal/features/applications/data/models/license_model.dart';

class ApplicationsController extends GetxController {
  static ApplicationsController get instance => Get.find();

  RxInt totalApplications = 0.obs;
  RxInt pendingApplications = 0.obs;
  RxInt needsReview = 0.obs;
  RxInt approvedApplications = 0.obs;
  RxInt rejectedApplications = 0.obs;

  RxString selectedStatus = 'All'.obs;
  RxString searchQuery = ''.obs;

  RxList<ApplicationModel> applications = <ApplicationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadApplications();
  }

  void loadApplications() {
    applications.assignAll([
      ApplicationModel(
        id: 'APP-2026-001',
        name: 'Sarah Johnson',
        email: 'sarah@email.com',
        phone: '+1 555 222 1111',
        profession: 'Licensed Professional Counselor',
        submittedDate: '04-Jun-2026',
        status: 'Pending',
        licenses: [
          LicenseModel(
            state: 'Texas',
            licenseType: 'LPC',
            licenseNumber: '12345',
          ),
          LicenseModel(
            state: 'California',
            licenseType: 'LPCC',
            licenseNumber: '98765',
          ),
        ],
      ),
      ApplicationModel(
        id: 'APP-2026-002',
        name: 'Michael Brown',
        email: 'michael@email.com',
        phone: '+1 555 333 2222',
        profession: 'Licensed Clinical Social Worker',
        submittedDate: '03-Jun-2026',
        status: 'Approved',
        licenses: [
          LicenseModel(
            state: 'Texas',
            licenseType: 'LCSW',
            licenseNumber: '55421',
          ),
        ],
      ),
      ApplicationModel(
        id: 'APP-2026-003',
        name: 'Amanda Clark',
        email: 'amanda@email.com',
        phone: '+1 555 444 3333',
        profession: 'Licensed Marriage & Family Therapist',
        submittedDate: '02-Jun-2026',
        status: 'Needs Review',
        licenses: [
          LicenseModel(
            state: 'Florida',
            licenseType: 'LMFT',
            licenseNumber: '77890',
          ),
          LicenseModel(
            state: 'Georgia',
            licenseType: 'LMFT',
            licenseNumber: '88901',
          ),
          LicenseModel(
            state: 'New York',
            licenseType: 'LMFT',
            licenseNumber: '99012',
          ),
        ],
      ),
      ApplicationModel(
        id: 'APP-2026-004',
        name: 'David Wilson',
        email: 'david@email.com',
        phone: '+1 555 555 4444',
        profession: 'Psychologist',
        submittedDate: '01-Jun-2026',
        status: 'Rejected',
        licenses: [
          LicenseModel(
            state: 'New York',
            licenseType: 'Psychologist',
            licenseNumber: '44556',
          ),
        ],
      ),
    ]);

    updateMetrics();
  }

  void updateMetrics() {
    totalApplications.value = applications.length;

    pendingApplications.value =
        applications.where((app) => app.status == 'Pending').length;

    needsReview.value =
        applications.where((app) => app.status == 'Needs Review').length;

    approvedApplications.value =
        applications.where((app) => app.status == 'Approved').length;

    rejectedApplications.value =
        applications.where((app) => app.status == 'Rejected').length;
  }

  List<ApplicationModel> get filteredApplications {
    return applications.where((app) {
      final matchesStatus =
          selectedStatus.value == 'All' || app.status == selectedStatus.value;

      final query = searchQuery.value.toLowerCase();

      final matchesSearch = query.isEmpty ||
          app.name.toLowerCase().contains(query) ||
          app.email.toLowerCase().contains(query) ||
          app.id.toLowerCase().contains(query) ||
          app.profession.toLowerCase().contains(query);

      return matchesStatus && matchesSearch;
    }).toList();
  }

  void updateSearch(String value) {
    searchQuery.value = value;
  }

  void updateStatusFilter(String value) {
    selectedStatus.value = value;
  }

  void approveApplication(ApplicationModel application) {
    application.status = 'Approved';
    applications.refresh();
    updateMetrics();
  }

  void rejectApplication(ApplicationModel application) {
    application.status = 'Rejected';
    applications.refresh();
    updateMetrics();
  }

  void markNeedsReview(ApplicationModel application) {
    application.status = 'Needs Review';
    applications.refresh();
    updateMetrics();
  }

  String licenseDisplay(ApplicationModel application) {
    if (application.licenses.isEmpty) return '-';

    final primary = application.licenses.first;
    final extraCount = application.licenses.length - 1;

    if (extraCount <= 0) {
      return primary.licenseType;
    }

    return '${primary.licenseType} +$extraCount';
  }

  void showLicenses(ApplicationModel application) {
    Get.defaultDialog(
      title: 'License Records',
      backgroundColor: AppColors.white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: application.licenses.map((license) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              '${license.state}\n${license.licenseType} - ${license.licenseNumber}',
            ),
          );
        }).toList(),
      ),
    );
  }
}