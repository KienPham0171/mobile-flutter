import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/model/user_info.dart';

import '../auth/loginScreen.dart';
import '../redux/action.dart';
import '../redux/state.dart';

class LoginScreen extends StatelessWidget {
  final UserInfo user;

  const LoginScreen({Key? key, required this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return loginScreen();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user.userName),
            ),
            ElevatedButton(onPressed: (){
              store.dispatch(UserLoginAction(const UserInfo(isLogin: true,userName: "kienpham",age: "25",role: "Admin")));
            },
                child: const Text("Login Admin")),
            ElevatedButton(onPressed: (){
              store.dispatch(UserLoginAction(const UserInfo(isLogin: true,userName: "kienpham",age: "25",role: "User")));
            },
                child: const Text("Login User")),
          ],
        ),
      ),
    );
  }
}
