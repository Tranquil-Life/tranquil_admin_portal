part of 'earnings.dart';

Map<String, dynamic> _$EarningsToJson(Earnings instance)=><String, dynamic>{
  'id': instance.id,
  'net_income': instance.netIncome,
  'user_id': instance.userId,
  'withdrawn': instance.withdrawn,
  'available_for_withdrawal': instance.availableForWithdrawal,
  'pending_clearance': instance.pendingClearance,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};