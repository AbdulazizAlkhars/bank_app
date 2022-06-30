// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trans _$TransFromJson(Map<String, dynamic> json) => Trans(
      senderId: json['senderId'] as int,
      receiverId: json['receiverId'] as int,
      amount: json['amount'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TransToJson(Trans instance) => <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'amount': instance.amount,
      'type': instance.type,
    };
