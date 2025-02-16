part of 'subscription_model.dart';

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    SubscriptionModel(
      id: json['id'],
      clientId: json['client_id'],
      status: json['status'],
      frequency: json['frequency'],
      amount: double.parse(json['amount'].toString()),
      nextBillingAt: DateTime.parse(json['next_billing_at']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      type: SubscriptionType.fromJson(json['type'])
    );