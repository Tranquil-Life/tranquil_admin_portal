import 'package:tranquil_admin_portal/core/domain/query_params.dart';
import 'package:tranquil_admin_portal/features/dashboard/domain/entities/subscription_type.dart';

part 'subscription.g.dart';

class Subscription extends QueryParams {
  final int? id;
  final int? clientId;
  final int? consultantId;
  final String? status;
  final String? frequency;
  final double? amount;
  final DateTime? nextBillingAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final SubscriptionType? type;

  Subscription({
    this.id,
    this.clientId,
    this.consultantId,
    this.status,
    this.frequency,
    this.amount,
    this.nextBillingAt,
    this.createdAt,
    this.updatedAt,
    this.type,
  });

  @override
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

  factory Subscription.empty() {
    return Subscription(createdAt: DateTime.now(), amount: 0.0);
  }
}
