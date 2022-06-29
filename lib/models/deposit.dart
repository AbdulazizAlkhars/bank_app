import 'package:json_annotation/json_annotation.dart';
part 'deposit.g.dart';

@JsonSerializable()
class Deposit {
  int amount;
  
  Deposit({required this.amount});
  
  factory Deposit.fromJson(Map<String, dynamic> json) =>
      _$DepositFromJson(json);
  Map<String, dynamic> toJson() => _$DepositToJson(this);
}

