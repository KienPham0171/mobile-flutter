import 'package:json_annotation/json_annotation.dart';
part 'user_info.g.dart';
@JsonSerializable()
class UserInfo{
  final bool isLogin;
  final String userName;
  final String age;
  final String role;

  const UserInfo({this.isLogin = false,this.userName="Guest", this.age = "-999",this.role = "guest"});
  factory UserInfo.fromJson(Map<String,dynamic> json) => _$UserInfoFromJson(json);
  Map<String,dynamic> toJson() => _$UserInfoToJson(this);
}