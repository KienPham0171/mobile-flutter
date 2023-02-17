import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:real_app/model/group_member.dart';
part 'meal_participant.g.dart';
@JsonSerializable()
class MealParticipant extends Equatable{
  GroupMember member;
  double amount;

  MealParticipant(this.member, this.amount);

  @override
  // TODO: implement props
  List<Object?> get props => [member,amount];
  factory MealParticipant.fromJson(Map<String,dynamic> json) => _$MealParticipantFromJson(json);
  Map<String,dynamic> toJson() => _$MealParticipantToJson(this);
}