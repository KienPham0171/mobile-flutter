import 'package:redux/redux.dart';

import '../../model/user_info.dart';
import '../action.dart';

Reducer<UserInfo> userInfoReducer = combineReducers<UserInfo>([
  TypedReducer<UserInfo,UserLoginAction>(userLoginReducer),
  TypedReducer<UserInfo,UserLogoutAction>(userLogoutReducer),
]);

UserInfo userLoginReducer(UserInfo state,UserLoginAction action){
  return action.userInfo;
}
UserInfo userLogoutReducer(UserInfo state,UserLogoutAction action){
  return const UserInfo();
}