import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/navigator_info.dart';

class UserNavigator extends StatefulWidget {
  final List<NavigatorInfo> navigatorList;
  final ValueChanged<int> changeBody;
  const UserNavigator({Key? key, required this.navigatorList, required this.changeBody}) : super(key: key);

  @override
  State<UserNavigator> createState() => _UserNavigatorState();
}

class _UserNavigatorState extends State<UserNavigator> {
  int currentIndex = 0;
  List<BottomNavigationBarItem> createNavigator(BuildContext context){
     return widget.navigatorList.map((item) =>
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
      elevation: 0.0,
        items: createNavigator(context),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: Colors.red,
      onTap: (index){
        widget.changeBody(index);
        setState(() {
          currentIndex = index;
        });
        // Navigator.of(context).pushNamed(navigatorList[index].route);
      },
      currentIndex: currentIndex,
      // backgroundColor: Colors.black,
      // fixedColor: Colors.black,
    );
  }
}
