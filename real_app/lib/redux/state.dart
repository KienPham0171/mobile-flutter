
import 'package:equatable/equatable.dart';
import 'package:real_app/redux/action.dart';
import 'package:real_app/redux/reducer/user_reducer.dart';
import 'package:redux/redux.dart';

import '../model/user_info.dart';

// https://github.com/fluttercommunity/redux.dart/blob/master/doc/combine_reducers.md

final store = Store<AppState>(appStateReducer, initialState: AppState(UserInfo()));
AppState appStateReducer(AppState state,action) =>
    AppState(userInfoReducer(state.userInfo, action));


class AppState extends Equatable{
  final UserInfo userInfo;


  AppState(this.userInfo);

  @override
  // TODO: implement props
  List<Object?> get props => [this.userInfo];

}


// Reducer<List<String>> itemsReducer = combineReducers(reducers);
// Reducer<UserInfo> userReducer =

