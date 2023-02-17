// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupMember _$GroupMemberFromJson(Map<String, dynamic> json) => GroupMember(
      json['id'] as int,
      json['groupId'] as String,
      json['userName'] as String,
      json['userEmail'] as String,
      json['phone'] as String?,
      (json['totalMoney'] as num).toDouble(),
    );

Map<String, dynamic> _$GroupMemberToJson(GroupMember instance) =>
    <String, dynamic>{
      'id': instance.memberId,
      'groupId': instance.groupId,
      'userName': instance.memberName,
      'userEmail': instance.memberEmail,
      'phone': instance.memberPhone,
      'totalMoney': instance.money,
    };
