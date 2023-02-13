import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../config/navigator_config.dart';
import '../../../redux/action.dart';
import '../../../redux/state.dart';
import '../../components/user/user_navigator.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("User"),
            ElevatedButton(onPressed: (){
              store.dispatch(UserLogoutAction());
            }, child: const Text("Logout"),)
          ],
        ),
      ),
      bottomNavigationBar: UserNavigator(
        navigatorList: Configuration.USER_NAVIGATOR_lIST,
      ),
    );
  }
}
