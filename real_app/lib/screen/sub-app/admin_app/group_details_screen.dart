import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/screen/components/loading/shimmer_loading.dart';
import 'package:real_app/util/number_util.dart';
import 'dart:io';

import '../../../model/group_member.dart';

class GroupDetailScreen extends StatefulWidget {
  const GroupDetailScreen({Key? key}) : super(key: key);

  @override
  State<GroupDetailScreen> createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen> {
  bool isLoading = true;
  List<GroupMember> groupMems = [];


  getData() async {
    await Future.delayed(const Duration(seconds: 2)).then((value){
      setState(() {
        // groupMems.add(GroupMember(2, 1, "Pham Kien", DateTime(1998), 127000));
        // groupMems.add(GroupMember(1, 1, "Kien Pham", DateTime(2019), 125000));
        isLoading =false;
      });
    });
  }
  @override
  void initState() {
    getData();
    isLoading = true;
  }

  Future<void> invitePopup(BuildContext context) async {
    await showDialog(context: context, builder: (context){
      return Dialog(child: MemberInviteDialog(),);
    });
  }

  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: groupMems.length,
      itemBuilder: (context, index) {
        var mem = groupMems[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Row(
              children: [
                const Icon(
                  CupertinoIcons.person,
                  size: 16,
                  weight: 100,
                  color: Colors.red,
                ),
                Text(
                  mem.memberName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            subtitle: Text(
                "\tTotal Money: ${NumberUtils.currencyFormat(mem.money)}\n\tJoin Date: ${mem.memberEmail.toString()}"),
            trailing: Icon(CupertinoIcons.arrow_2_circlepath_circle),
            onTap: (){
              print("tap index: ${index}");
            },
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    int groupId = ModalRoute.of(context)?.settings.arguments as int ?? -99;
    if(isLoading){
      return const ShimmerLoader();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Group Details"),
        ),
        // body: Text("Group details with id: ${groupId}"),
        body: Center(
          child: buildBody(context),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            invitePopup(context);
          },
          child: const Icon(Icons.person_add_outlined),
        ),
      ),
    );
  }
}

class MemberInviteDialog extends StatefulWidget {
  const MemberInviteDialog({Key? key}) : super(key: key);

  @override
  State<MemberInviteDialog> createState() => _MemberInviteDialogState();
}

class _MemberInviteDialogState extends State<MemberInviteDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(

            children:  [
              Icon(CupertinoIcons.mail),
              Container(
                width: 100,
                child: TextField(),
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: Text("Invite")),
            ],
          )
        ],
      ),
    );
  }
}

