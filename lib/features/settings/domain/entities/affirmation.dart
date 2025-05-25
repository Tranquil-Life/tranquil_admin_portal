import 'package:dio/dio.dart';
import 'package:tranquil_admin_portal/core/domain/query_params.dart';

part 'affirmation.g.dart';

class Affirmation extends QueryParams {
  final int? id;
  final String title;
  final String description;
  final String? icon;
  final MultipartFile? svgFile;
  final String? color;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Affirmation(
      {this.id,
      required this.title,
      required this.description,
      this.icon,
        this.svgFile,
        this.color,
      this.createdAt,
      this.updatedAt});

  @override
  Map<String, dynamic> toJson() => _$AffirmationToJson(this);
}
