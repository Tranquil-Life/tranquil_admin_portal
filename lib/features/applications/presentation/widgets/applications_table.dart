import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/features/applications/presentation/controllers/applications_controller.dart';
import 'package:tranquil_admin_portal/features/applications/presentation/widgets/status_chip.dart';

Widget buildApplicationsTable(ApplicationsController applicationController) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          color: Colors.black.withOpacity(.05),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Applications',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 420,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search by name, email or application ID',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_alt_outlined),
              label: const Text('Filter'),
            ),
            const SizedBox(width: 10),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sort),
              label: const Text('Sort by'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: DataTable(
            dataRowMinHeight: 70,
            dataRowMaxHeight: 70,
            headingRowColor: WidgetStateProperty.all(
              Colors.grey.shade100,
            ),
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Applicant')),
              DataColumn(label: Text('Contact')),
              DataColumn(label: Text('Profession')),
              DataColumn(label: Text('Licenses')),
              DataColumn(label: Text('Submitted')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Actions')),
            ],
            rows: applicationController.applications
                .map(
                  (application) => DataRow(
                    cells: [
                      DataCell(
                        Text(application.id),
                      ),
                      DataCell(
                        Text(application.name),
                      ),
                      DataCell(
                        Text(application.email),
                      ),
                      DataCell(
                        Text(application.profession),
                      ),
                      DataCell(
                        InkWell(
                          onTap: () {
                            applicationController.showLicenses(application);
                          },
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 95,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    applicationController
                                        .licenseDisplay(application),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                if (application.licenses.length > 1) ...[
                                  const SizedBox(width: 2),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 16,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Text(application.submittedDate),
                      ),
                      DataCell(
                        statusChip(application.status),
                      ),
                      DataCell(
                        PopupMenuButton(
                          itemBuilder: (_) => [
                            const PopupMenuItem(
                              value: 'view',
                              child: Text('View'),
                            ),
                            const PopupMenuItem(
                              value: 'approve',
                              child: Text('Approve'),
                            ),
                            const PopupMenuItem(
                              value: 'reject',
                              child: Text('Reject'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ),
  );
}
