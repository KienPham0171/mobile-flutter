import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../redux/action.dart';
import '../../../redux/state.dart';

class UserHomeBody extends StatelessWidget {
  const UserHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("User Home Body"),
            ElevatedButton(onPressed: (){
              store.dispatch(UserLogoutAction());
            }, child: const Text("Logout"),)
          ],
        )
    );
  }
}
