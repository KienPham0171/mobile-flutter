import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/constant/path_constant.dart';

import '../../../model/navigator_info.dart';

class AdminNavigator extends StatefulWidget {
  final List<NavigatorInfo> navigatorList;
  final ValueChanged<int> changeBody;
  const AdminNavigator({Key? key, required this.navigatorList, required this.changeBody}) : super(key: key);

  @override
  State<AdminNavigator> createState() => _AdminNavigatorState();
}

class _AdminNavigatorState extends State<AdminNavigator> {
  int currentIndex = 0;


  List<BottomNavigationBarItem> createNavigator(BuildContext context){
    return widget.navigatorList.map((item) =>
        BottomNavigationBarItem(
            icon: Icon(item.iconData),
            label: item.label,
            tooltip: item.tooltip,
            backgroundColor: Colors.black
        ),

    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white,width: 1.0)
        )
      ),
      child: BottomNavigationBar(
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
      ),
    );
  }
}