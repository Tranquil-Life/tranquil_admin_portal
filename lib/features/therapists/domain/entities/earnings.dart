import 'package:tranquil_admin_portal/core/domain/query_params.dart';

part 'earnings.g.dart';

abstract class Earnings extends QueryParams {
  final int id;
  final double netIncome;
  final int userId;
  final double withdrawn;
  final double availableForWithdrawal;
  final double? pendingClearance; // Nullable field
  final DateTime createdAt;
  final DateTime updatedAt;

  Earnings({
    required this.id,
    required this.netIncome,
    required this.userId,
    required this.withdrawn,
    required this.availableForWithdrawal,
    this.pendingClearance, // Optional
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Map<String, dynamic> toJson() => _$EarningsToJson(this);
}
