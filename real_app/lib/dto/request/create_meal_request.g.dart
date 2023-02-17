// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_meal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMealRequest _$CreateMealRequestFromJson(Map<String, dynamic> json) =>
    CreateMealRequest(
      json['foodName'] as String,
      json['billTotal'] as String,
      DateTime.parse(json['foodDate'] as String),
      json['groupId'] as int,
      json['userList'] as String,
    );

Map<String, dynamic> _$CreateMealRequestToJson(CreateMealRequest instance) =>
    <String, dynamic>{
      'foodName': instance.foodName,
      'billTotal': instance.billTotal,
      'foodDate': instance.foodDate.toIso8601String(),
      'groupId': instance.groupId,
      'userList': instance.userList,
    };
