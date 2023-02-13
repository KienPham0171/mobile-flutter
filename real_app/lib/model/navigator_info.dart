import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/main.dart';

class NavigatorInfo{
   IconData iconData;
   String label;
   String tooltip;
   String route;
   bool isActive;
   Widget bodyComponent;

  NavigatorInfo({this.iconData = Icons.home, this.label = "Home",
    this.route = "/", this.tooltip = "home",
    this.isActive = false, this.bodyComponent = const Text("not available") });
}