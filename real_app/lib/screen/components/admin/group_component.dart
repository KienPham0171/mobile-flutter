import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/constant/path_constant.dart';
import 'package:real_app/model/group.dart';

class GroupBody extends StatefulWidget {

  GroupBody({Key? key}) : super(key: key);

  @override
  State<GroupBody> createState() => _GroupBodyState();
}

class _GroupBodyState extends State<GroupBody> {
  final List<Group> groupData = [
    Group(1, "KSS", "KS Securities"),
    Group(2, "KSG", "KS Group"),
    Group(1, "KSS", "KS Securities"),
    Group(2, "KSG", "KS Group"),
    Group(1, "KSS", "KS Securities"),
    Group(2, "KSG", "KS Group"),
    Group(1, "KSS", "KS Securities"),
    Group(2, "KSG", "KS Group"),
  ];

  openGroupDetail(BuildContext context,int groupId){
    Navigator.of(context).pushNamed(PathConstant.GROUP_DETAILS,arguments: groupId);
  }

  List<ExpansionPanel> buildListItem(BuildContext context) {
    List<ExpansionPanel> result = [];
    groupData.forEach((element) {
      result.add(ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                element.groupName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          },
          body: Padding(padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: [
                  Text(
                    element.groupDesc,
                    style: const TextStyle(
                        fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  ElevatedButton(onPressed: (){
                    openGroupDetail(context, element.id);
                  }, child:const Text("Open Group Detail")),
                ],
            ),
          ),),
        isExpanded: element.isExpanded,
        canTapOnHeader: true,
      )
      );
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Add Group")),
              ExpansionPanelList(
                children: buildListItem(context),
                expansionCallback: (index,isExpanded){
                  setState(() {
                    groupData[index].isExpanded = !isExpanded;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
