import '../model/user_info.dart';

class Action{

}

class UserAction extends Action{}
class UserLoginAction extends UserAction{
  final UserInfo userInfo;

  UserLoginAction(this.userInfo);
}
class UserLogoutAction extends Action{

}