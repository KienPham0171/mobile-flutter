import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:real_app/model/group.dart';
part 'group_member.g.dart';
@JsonSerializable()
class GroupMember extends Equatable{
  @JsonKey(name: "id")
  int memberId;
  String groupId;
  @JsonKey(name: "userName")
  String memberName;
  @JsonKey(name: "userEmail")
  String memberEmail;
  @JsonKey(name: "phone")
  String? memberPhone;
  @JsonKey(name: "totalMoney")
  double money;


  GroupMember(this.memberId, this.groupId, this.memberName,this.memberEmail,this.memberPhone, this.money);

  @override
  // TODO: implement props
  List<Object?> get props => [memberId,groupId,memberName,memberEmail,memberPhone,money];

  factory GroupMember.fromJson(Map<String,dynamic> json) => _$GroupMemberFromJson(json);
  Map<String,dynamic> toJson() => _$GroupMemberToJson(this);

}