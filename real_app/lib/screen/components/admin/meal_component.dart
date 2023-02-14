import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/model/meal_participant.dart';

import '../../../model/group.dart';
import '../../../model/group_member.dart';

class MealBody extends StatefulWidget {
  const MealBody({Key? key}) : super(key: key);

  @override
  State<MealBody> createState() => _MealBodyState();
}

class _MealBodyState extends State<MealBody> {
  final List<Group> groupData = [
    Group(1, "KSS", "KS Securities"),
    Group(2, "KSF", "KS Group"),
    Group(1, "KST", "KS Securities"),
    Group(2, "KSV", "KS Group"),
    Group(1, "KBS", "KS Securities"),
    Group(2, "KBC", "KS Group"),
    Group(1, "KBD", "KS Securities"),
    Group(2, "KSG", "KS Group"),
  ];
  List<GroupMember> memberData = [
  ];


  Group? selectedGroup;
  List<MealParticipant> participantList = [];
  final TextEditingController textEditingController = TextEditingController();

  Widget loadMemberData(BuildContext context){

    return Container();
  }
  void addParticipant(GroupMember member){
    setState(() {
      participantList.add(MealParticipant(member, 1));
    });
  }

  Widget selectGroup(BuildContext context){

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Text(
          'Select a group...',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: groupData
            .map((group) => DropdownMenuItem<Group>(
          value: group,
          child: Text(
            group.groupName,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ))
            .toList(),
        value: selectedGroup,
        onChanged: (value) {
          print(value);
          setState(() {
            selectedGroup = value as Group;
            memberData.add(
              GroupMember(1, 1, "Kien Pham", DateTime(1998), 127000),
            );
          });
        },
        buttonHeight: 40,
        buttonWidth: 200,
        itemHeight: 40,
        dropdownMaxHeight: 200,
        searchController: textEditingController,
        searchInnerWidget: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          child: TextFormField(
            autofocus: true,
            controller: textEditingController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              hintText: 'Search for an item...',
              hintStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        searchMatchFn: (item, searchValue) {
          Group grp = item.value as Group ;
          return grp.groupName.toLowerCase().contains(searchValue.toLowerCase());
        },
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
  Widget selectMember(BuildContext context){
    if(memberData.isEmpty) return const Text("Please select a group");
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Text(
          'Select a group...',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: memberData
            .map((member) => DropdownMenuItem<GroupMember>(
          value: member,
          child: Text(
            member.memberName,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ))
            .toList(),
        value: null,
        onChanged: (value) {
          addParticipant(value as GroupMember);
        },
        buttonHeight: 40,
        buttonWidth: 200,
        itemHeight: 40,
        dropdownMaxHeight: 200,
        searchController: textEditingController,
        searchInnerWidget: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          child: TextFormField(
            autofocus: true,
            controller: textEditingController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              hintText: 'Select a participant...',
              hintStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        searchMatchFn: (item, searchValue) {
          GroupMember member = item.value as GroupMember ;
          return member.memberName.toLowerCase().contains(searchValue.toLowerCase());
        },
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
  Widget editableMember(BuildContext context){
    if(participantList.isEmpty) return const Text("");
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: participantList.length,
          itemBuilder: (context,index){
            MealParticipant participant = participantList[index];
            return Row(
              children: [
                Text("Name: ${participant.member.memberName}"),
                Text("Amount: ${participant.amount}")
              ],
            );
          }),
    );
  }
  @override
  Widget build(BuildContext context) {
    print("memberList leng: ${memberData.length}");
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Group"),
        selectGroup(context),
        Text("Members: "),
        selectMember(context),
        editableMember(context),
      ],
    ));
  }
}
