part of 'affirmation_model.dart';

AffirmationModel _$AffirmationModelFromJson(Map<String, dynamic> json) =>
    AffirmationModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        icon: json['icon'],
        color: json['color'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']));
