import 'package:equatable/equatable.dart';
import 'package:real_app/model/group_member.dart';

class MealParticipant extends Equatable{
  GroupMember member;
  double amount;

  MealParticipant(this.member, this.amount);

  @override
  // TODO: implement props
  List<Object?> get props => [member,amount];
}