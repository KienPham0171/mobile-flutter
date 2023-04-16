import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/constant/path_constant.dart';
import 'package:real_app/model/group.dart';
import 'package:real_app/screen/components/admin/add_group_component.dart';
import 'package:rive/rive.dart';

class GroupBody extends StatefulWidget {

  GroupBody({Key? key}) : super(key: key);

  @override
  State<GroupBody> createState() => _GroupBodyState();
}

class _GroupBodyState extends State<GroupBody> {
  final List<Group> groupData = [
    Group(1, "AKS", "AKS Company"),
    Group(2, "ASG", "ASG Corporation"),
    Group(1, "SSS", "SSs Group"),
    Group(2, "KIG", "AKS Company"),
    Group(1, "KUS", "AKS Company"),
    Group(2, "KMG", "SSs Group"),
    Group(1, "GSC", "AKS Company"),
    Group(2, "SDG", "AKS Company"),
  ];

  openGroupDetail(BuildContext context,int groupId){
    Navigator.of(context).pushNamed(PathConstant.GROUP_DETAILS,arguments: groupId);
  }

  void showAddGroupDialog() async{
    await showDialog(context: context, builder: (context){
      return Dialog(child: AddGroupDialog(),);
    });
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
      reverse: true,
      child: Stack(
        children:
        [
          Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              // ElevatedButton(onPressed: () {}, child: const Text("Add Group")),
              Container(
                  width: 200,
                  height: 200,
                  child: RiveAnimation.asset('assets/group.riv',
                    animations: ['curves'],
                    controllers: [SimpleAnimation('idle')],
                    fit: BoxFit.cover,
                  )),
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
          Positioned(
              bottom: 20,
              right: 0,
              child: ElevatedButton(
                onPressed: (){
                    showAddGroupDialog();
                },
                child: Icon(Icons.group_add_outlined),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                ),
              ),
          ),
        ]
      ),
    );
  }
}
