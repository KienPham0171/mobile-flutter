
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/model/group.dart';

class GroupBody extends StatelessWidget {
  final List<Group> groupData = [
      Group(1,"KSS","KS Securities"),
      Group(2,"KSG","KS Group"),
  ];
  GroupBody({Key? key}) : super(key: key);

  List<ExpansionPanel> buildListItem(BuildContext context){
    return null;
  }

  @override
  Widget build(BuildContext context) {




    return SingleChildScrollView(
      child: Container(
          child: Text("Group Body"),
      ),
    );
  }
}
