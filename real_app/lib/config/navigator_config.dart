import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/screen/components/admin/group_component.dart';
import 'package:real_app/screen/components/admin/home_component.dart';
import 'package:real_app/screen/components/admin/meal_component.dart';
import 'package:real_app/screen/components/admin/money_component.dart';

import '../model/navigator_info.dart';

class Configuration{
  static List<NavigatorInfo> USER_NAVIGATOR_lIST = [
    NavigatorInfo(iconData: Icons.home,label: "Home",route: "/user-home",tooltip: "Home",isActive: true),
    NavigatorInfo(iconData: Icons.history,label: "History",route: "/user-history",tooltip: "History"),
    NavigatorInfo(iconData: Icons.fastfood_outlined,label: "Food",route: "/user-food",tooltip: "Food"),
    NavigatorInfo(iconData: CupertinoIcons.bell,label: "Notifications",route: "/user-notifications",tooltip: "Notifications"),
  ];

  static List<NavigatorInfo> ADMIN_NAVIGATOR_lIST = [
    NavigatorInfo(iconData: Icons.home,label: "Home",route: "/admin-home",tooltip: "Home",isActive: true,bodyComponent: const HomeBody()),
    NavigatorInfo(iconData: Icons.groups,label: "Groups",route: "/admin-groups",tooltip: "Groups", bodyComponent: GroupBody()),
    NavigatorInfo(iconData: Icons.fastfood_outlined,label: "Meals",route: "/admin-meal",tooltip: "Meals", bodyComponent: const MealBody()),
    NavigatorInfo(iconData: CupertinoIcons.chat_bubble_2,label: "Chat",route: "/admin-chat",tooltip: "Chat"),
    // NavigatorInfo(iconData: CupertinoIcons.money_dollar_circle,label: "Money",route: "/admin-money",tooltip: "Money", bodyComponent: const MoneyBody()),
    // NavigatorInfo(iconData: CupertinoIcons.settings,label: "Setting",route: "/admin-setting",tooltip: "Setting",),
  ];
}