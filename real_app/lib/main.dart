import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:real_app/constant/path_constant.dart';
import 'package:real_app/redux/action.dart';
import 'package:real_app/redux/state.dart';
import 'package:real_app/screen/home_screen.dart';
import 'package:real_app/screen/login_screen.dart';
import 'package:real_app/screen/sub-app/admin_app/meal_screen.dart';

import 'model/user_info.dart';

void main() {
  runApp(StoreProvider<AppState>(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      theme: ThemeData.light(),
      // home: const MyHomePage(),
     routes: {
        PathConstant.INITIAL_ROUTE: (context) => const MyHomePage(),
        PathConstant.LOGIN: (context) => const MyHomePage(),
        PathConstant.MEAL_ROUTE: (context) => const MealScreen(),

      },
       initialRoute: PathConstant.INITIAL_ROUTE,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Widget createLoginScreen(BuildContext context,UserInfo user){
  return LoginScreen(user: user);
}
/*Widget genRealApp(BuildContext context, UserInfo user){

  return Scaffold(
    body: Center(
      child: Column(
        children: [
          Text("Hello : ${user.userName}"),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("This is my app"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              store.dispatch(UserLogoutAction());
            }, child: const Text("Logout"),),
          ),
        ],
      ),
    ),
  );
}*/

Widget genRealApp(BuildContext context, UserInfo user){
  return HomePage(user: user);
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState,UserInfo>(
        converter: (store) => store.state.userInfo,
        builder: (context,userInfo){
          return Scaffold(
            body: userInfo.isLogin == false? createLoginScreen(context,userInfo):genRealApp(context, userInfo)
          );
        },
      ),
    );
  }
}



