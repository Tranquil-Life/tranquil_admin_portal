import 'package:tranquil_admin_portal/features/applications/data/models/license_model.dart';

class ApplicationModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String profession;
  final String submittedDate;
  String status;
  final List<LicenseModel> licenses;

  ApplicationModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profession,
    required this.submittedDate,
    required this.status,
    required this.licenses,
  });
}
