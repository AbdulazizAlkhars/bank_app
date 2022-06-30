import 'package:json_annotation/json_annotation.dart';
part 'trans.g.dart';

@JsonSerializable()
class Trans {
  int senderId;
  int receiverId;
  int amount;
  String type;
  Trans(
      {required this.senderId,
      required this.receiverId,
      required this.amount,
      required this.type});

  factory Trans.fromJson(Map<String, dynamic> json) => _$TransFromJson(json);
  Map<String, dynamic> toJson() => _$TransToJson(this);
}
