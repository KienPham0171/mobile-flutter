// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      json['id'] as int,
      json['groupName'] as String,
      json['groupDesc'] as String,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'groupName': instance.groupName,
      'groupDesc': instance.groupDesc,
    };
