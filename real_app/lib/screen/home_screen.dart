import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/model/user_info.dart';
import 'package:real_app/screen/sub-app/admin_app/admin_home.dart';
import 'package:real_app/screen/sub-app/user_app/user_home.dart';

class HomePage extends StatelessWidget {
  final UserInfo user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:user.role.toLowerCase() == "user"?  const UserHomePage() : const AdminHomePage(),

    );
  }
}
