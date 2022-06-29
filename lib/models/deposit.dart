import 'package:json_annotation/json_annotation.dart';
part 'deposit.g.dart';

@JsonSerializable()
class Deposit {
  double amount;
  String date = DateTime.now().toString().split(".").first;
  Deposit({required this.amount});
}
