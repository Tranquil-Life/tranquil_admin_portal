import 'package:tranquil_admin_portal/core/domain/query_params.dart';

part 'subscription_type.g.dart';

class SubscriptionType extends QueryParams{
  final int id;
  final String name;

  SubscriptionType({
    required this.id,
    required this.name,
  });

  @override
  Map<String, dynamic> toJson() => _$SubscriptionTypeToJson(this);

  factory SubscriptionType.fromJson(Map<String, dynamic> json) {
    return SubscriptionType(
      id: json['id'],
      name: json['name'],
    );
  }
}