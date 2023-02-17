// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealParticipant _$MealParticipantFromJson(Map<String, dynamic> json) =>
    MealParticipant(
      GroupMember.fromJson(json['member'] as Map<String, dynamic>),
      (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$MealParticipantToJson(MealParticipant instance) =>
    <String, dynamic>{
      'member': instance.member,
      'amount': instance.amount,
    };
