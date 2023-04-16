import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
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
        groupMems.add(GroupMember(1, "1", "Pham Kien", "kienpham@gmail.com","0968730400", 125000));
        groupMems.add(GroupMember(2, "1", "Kien abc", "kienpham1@gmail.com","0968730400", 300000));
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: groupMems.length,
        itemBuilder: (context, index) {
          var mem = groupMems[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    // spreadRadius: 5,
                    blurRadius: 4,
                    offset: Offset(4,8), // changes position of shadow
                  ),
                ],
              ),
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
                subtitle: RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: '\t \tTotal Money: '),
                      TextSpan(
                          text: NumberUtils.currencyFormat(mem.money) + "đ",
                          style: TextStyle(fontWeight: FontWeight.bold, color:Colors.red)),
                      TextSpan(text: '\n\t \tEmail: '),
                      TextSpan(
                          text: mem.memberEmail,
                          style: TextStyle(fontWeight: FontWeight.bold,)),
                      TextSpan(text: '\n\t \tPhone: '),
                      TextSpan(
                          text: mem.memberPhone,
                          style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
                    ],
                  ),
                  // child: Text(
                  //     "\tTotal Money: ${NumberUtils.currencyFormat(mem.money)}\n\tEmail: ${mem.memberEmail.toString()}"),
                ),
                trailing: Icon(CupertinoIcons.arrow_2_circlepath_circle),
                onTap: (){
                  print("tap index: ${index}");
                },
              ),
            ),
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    int groupId = ModalRoute.of(context)?.settings.arguments as int ?? -99;
    if(isLoading){
      return const ShimmerLoader();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Group Details",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      // body: Text("Group details with id: ${groupId}"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: linearGradient(150, [ '#1f005c', '#6c0060', '#a40059', '#cf2b4c', '#ea623b', '#f7972e', '#f4cb36', '#e2ff61'])
          /*LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color.fromRGBO(131,58,180,1),
                Color.fromRGBO(123,29,253,0.7),
                Color.fromRGBO(123,29,253,0.5337710084033614),
                Color.fromRGBO(131,58,180,0.3),
                // Colors.red,
                // Colors.indigo,
                // Colors.teal,
              ],
            )*/
        ),
        child: Center(
          child: buildBody(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          invitePopup(context);
        },
        child: const Icon(Icons.person_add_outlined),
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

