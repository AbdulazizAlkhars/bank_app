import 'package:json_annotation/json_annotation.dart';
part 'withdrawal.g.dart';

@JsonSerializable()
class Withdrawal {
  double amount;
  String date = DateTime.now().toString().split(".").first;
  Withdrawal({required this.amount});

  factory Withdrawal.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalFromJson(json);
  Map<String, dynamic> toJson() => _$WithdrawalToJson(this);
}
