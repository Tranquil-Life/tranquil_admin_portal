part of 'earnings_model.dart';

EarningsModel _$EarningsFromJson(Map<String, dynamic> json) =>
    EarningsModel(
      id: json['id'],
      netIncome: json['net_income'],
      userId: json['user_id'],
      withdrawn: json['withdrawn'],
      availableForWithdrawal: json['available_for_withdrawal'],
      pendingClearance:  json['pending_clearance'] == null ? 0.0 : double.parse(json['pending_clearance'].toString()),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );