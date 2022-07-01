import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String username;
  String? password;
  String? image;
  int? balance;
  User(
      {this.id,
      required this.username,
      this.password,
      this.image,
      this.balance});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
