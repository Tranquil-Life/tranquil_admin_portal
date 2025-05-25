import 'package:tranquil_admin_portal/features/settings/domain/entities/affirmation.dart';

part 'affirmation_model.g.dart';

class AffirmationModel extends Affirmation{
  AffirmationModel({
    required super.id,
    required super.title,
    super.color,
    super.icon,
    required super.description,
    required super.createdAt,
    required super.updatedAt
  });

factory AffirmationModel.fromJson(Map<String, dynamic> json) =>
    _$AffirmationModelFromJson(json);

}