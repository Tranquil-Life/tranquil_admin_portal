part of 'affirmation.dart';

_$AffirmationToJson(Affirmation instance) => <String, dynamic>{
  "id": instance.id,
  "title": instance.title,
  "description": instance.description,
  "icon": instance.svgFile,
  "color": instance.color
};
