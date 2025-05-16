part of 'subscription.dart';

_$SubscriptionToJson(Subscription instance) => <String, dynamic>{
  'id': instance.id,
  'client_id': instance.clientId,
  'consultant_id': instance.consultantId,
  'status': instance.status,
  'frequency': instance.frequency,
  // 'amount': instance.amount,
  // 'next_billing_at': instance.nextBillingAt.toIso8601String(),
  // 'created_at': instance.createdAt.toIso8601String(),
  // 'updated_at': instance.updatedAt.toIso8601String(),
  // 'type': instance.type.toJson(),
};