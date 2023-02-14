import 'package:equatable/equatable.dart';
import 'package:real_app/model/group.dart';

class GroupMember extends Equatable{
  int memberId;
  int groupId;
  String memberName;
  DateTime joinDate;
  double money;


  GroupMember(this.memberId, this.groupId, this.memberName, this.joinDate,
      this.money);

  @override
  // TODO: implement props
  List<Object?> get props => [memberId,groupId,memberName,joinDate,money];

}