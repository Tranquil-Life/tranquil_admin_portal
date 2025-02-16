import 'package:tranquil_admin_portal/features/therapists/domain/entities/earnings.dart';

part 'earnings_model.g.dart';

class EarningsModel extends Earnings {
  EarningsModel(
      {required super.id,
      required super.netIncome,
      required super.userId,
      required super.withdrawn,
      required super.availableForWithdrawal,
        super.pendingClearance,
      required super.createdAt,
      required super.updatedAt});

  factory EarningsModel.fromJson(Map<String, dynamic> json)=> _$EarningsFromJson(json);

}
