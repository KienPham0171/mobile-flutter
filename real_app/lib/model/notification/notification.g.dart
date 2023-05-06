// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationObj _$NotificationFromJson(Map<String, dynamic> json) => NotificationObj(
      json['groupName'] as String,
      json['type'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$NotificationToJson(NotificationObj instance) =>
    <String, dynamic>{
      'groupName': instance.groupName,
      'type': instance.type,
      'message': instance.message,
    };
