// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Withdrawal _$WithdrawalFromJson(Map<String, dynamic> json) => Withdrawal(
      amount: (json['amount'] as num).toDouble(),
    )..date = json['date'] as String;

Map<String, dynamic> _$WithdrawalToJson(Withdrawal instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'date': instance.date,
    };
