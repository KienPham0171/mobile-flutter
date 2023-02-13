import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/navigator_info.dart';

class UserNavigator extends StatelessWidget {
  final List<NavigatorInfo> navigatorList;
  const UserNavigator({Key? key, required this.navigatorList}) : super(key: key);

  List<BottomNavigationBarItem> createNavigator(BuildContext context){
     return navigatorList.map((item) =>
      BottomNavigationBarItem(
          icon: Icon(item.iconData),
          label: item.label,
          tooltip: item.tooltip,
        backgroundColor: Colors.black,
      ),


    ).toList();
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: createNavigator(context),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: Colors.red,
      // backgroundColor: Colors.black,
      // fixedColor: Colors.black,
    );
  }
}
