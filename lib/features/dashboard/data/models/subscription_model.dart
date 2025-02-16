import 'package:tranquil_admin_portal/features/dashboard/domain/entities/subscription.dart';
import 'package:tranquil_admin_portal/features/dashboard/domain/entities/subscription_type.dart';

part 'subscription_model.g.dart';

class SubscriptionModel extends Subscription {
  SubscriptionModel(
      {required super.id,
      required super.clientId,
      required super.status,
      required super.frequency,
      required super.amount,
      required super.nextBillingAt,
      required super.createdAt,
      required super.updatedAt,
      required super.type
      });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
}
