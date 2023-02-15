import 'dart:collection';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_app/model/meal_participant.dart';
import 'package:real_app/screen/components/common/date_picker_component.dart';
import 'package:real_app/style/text_field_style.dart';
import 'package:real_app/util/date_time_util.dart';

import '../../../model/group.dart';
import '../../../model/group_member.dart';

class MealBody extends StatefulWidget {
  const MealBody({Key? key}) : super(key: key);

  @override
  State<MealBody> createState() => _MealBodyState();
}

class _MealBodyState extends State<MealBody> {

  final formKey = GlobalKey<FormState>();
  TextEditingController foodNameController = TextEditingController(text: "");
  TextEditingController billTotalController = TextEditingController(text: "");
  Map<MealParticipant,TextEditingController> participantControllers = HashMap();
  Group? selectedGroup;
  List<MealParticipant> participantList = [];
  final TextEditingController textEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();

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




  Widget loadMemberData(BuildContext context){

    return Container();
  }



  void addParticipant(GroupMember member){
    setState(() {
      memberData.remove(member);
      MealParticipant oneMember  = MealParticipant(member, 1);
      participantList.add(oneMember);
      participantControllers.putIfAbsent(oneMember, () => TextEditingController(text: "1"));
    });
  }


  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }
  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  /// This builds cupertion date picker in iOS
  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  Widget selectGroup(BuildContext context){

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          buttonDecoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
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
              memberData.add(
                GroupMember(2, 2, "Kien Pham 2", DateTime(1998), 127000),
              );
            });
          },
          // buttonHeight: 40,
          // buttonWidth: 200,
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
                  vertical: 15,
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
      ),
    );
  }
  Widget selectMember(BuildContext context){
    if(memberData.isEmpty) {
      return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8.0),
      child: Text("No group or member is available."),
    );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8.0),
      // padding: EdgeInsets.only(left: 25,right: 25,bottom: MediaQuery.of(context).viewInsets.bottom +550),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          // dropdownPadding: EdgeInsets.only(left: 25,right: 25,bottom: MediaQuery.of(context).viewInsets.bottom +550),
          buttonDecoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
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
          // buttonHeight: 40,
          // buttonWidth: 200,
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
                  vertical: 15,
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
      ),
    );
  }
  Widget editableMember(BuildContext context, Map<MealParticipant,TextEditingController> participantControllers){
    if(participantList.isEmpty) return const Text("");
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: GridView.builder(
          gridDelegate:
            const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
              mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              childAspectRatio: 3/2
            ),
          shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: participantList.length,
            itemBuilder: (context,index){
              MealParticipant participant = participantList[index];
              TextEditingController _controller = participantControllers[participant]?? TextEditingController(text: "-1");
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  child: TextFormField(
                    controller: _controller,
                    validator: (value){
                      if(value == null || value.isEmpty ){
                        return "Please an unit.";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: KienInputStyle.inputForcusBoder,
                      enabledBorder: KienInputStyle.enabledBorder,
                      errorBorder: KienInputStyle.errorBorder,
                      focusedErrorBorder: KienInputStyle.forcusErrorBorder,
                      border: KienInputStyle.inputBorder,
                      hintText: "1",
                      labelText: participant.member.memberName,
                      fillColor: Colors.white,
                      filled: true,
                    ),


                    onSaved: (value){
                    },
                    autofocus: true,
                  ),
                ),
              );

            }),
      ),
    );
  }


  Widget createFoodNameWidget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: TextFormField(
        // enableInteractiveSelection: false,
        // focusNode: AlwaysDisabledFocusNode(),
        // enabled: false,
        // onTap: (){
        //   print("tap");
        // },
        controller: foodNameController,
        validator: (value){
          if(value == null || value.isEmpty){
            return "Please enter food name.";
          }
        },
        decoration: InputDecoration(
          focusedBorder: KienInputStyle.inputForcusBoder,
          enabledBorder: KienInputStyle.enabledBorder,
          errorBorder: KienInputStyle.errorBorder,
          focusedErrorBorder: KienInputStyle.forcusErrorBorder,
          border: KienInputStyle.inputBorder,
          hintText: "Thit cho",
          labelText: "Food Name",
          fillColor: Colors.white,
          filled: true,
        ),
        onSaved: (value){
        },
        autofocus: true,
      ),
    );
  }
  Widget createBillTotalWidget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: TextFormField(
        controller: billTotalController,
        keyboardType: TextInputType.number,
        validator: (value){
          if(value == null || value.isEmpty){
            return "Please enter bill total.";
          }
        },
        decoration: InputDecoration(
          focusedBorder: KienInputStyle.inputForcusBoder,
          enabledBorder: KienInputStyle.enabledBorder,
          errorBorder: KienInputStyle.errorBorder,
          focusedErrorBorder: KienInputStyle.forcusErrorBorder,
          border: KienInputStyle.inputBorder,
          hintText: "1.000",
          labelText: "Bill Total",
          fillColor: Colors.white,
          filled: true,
        ),
        onSaved: (value){
        },
        autofocus: false,
      ),
    );
  }
  Widget createSubmitButton(){
    return ElevatedButton(
        onPressed: (){
          if(formKey.currentState?.validate() !=null
              && formKey.currentState?.validate()==true){
            print("line 261, okay save info");
          }
        },
        child: Text("Create Meal"));
  }
  Widget createSelectDate(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: TextFormField(
        enableInteractiveSelection: false,
        focusNode: AlwaysDisabledFocusNode(),
        // enabled: false,
        onTap: (){
          _selectDate(context);
        },
        controller: TextEditingController(text: DateTimeUtils.dateTimeToString(selectedDate)),
        validator: (value){
          if(value == null || value.isEmpty){
            return "Please select a date.";
          }
        },
        decoration: InputDecoration(
          focusedBorder: KienInputStyle.inputForcusBoder,
          enabledBorder: KienInputStyle.enabledBorder,
          errorBorder: KienInputStyle.errorBorder,
          focusedErrorBorder: KienInputStyle.forcusErrorBorder,
          border: KienInputStyle.inputBorder,
          hintText: DateTimeUtils.dateTimeToString(selectedDate),
          labelText: "Food Date",
          fillColor: Colors.white,
          filled: true,
          suffixIcon: Icon(CupertinoIcons.calendar),
        ),
        onSaved: (value){
        },
        autofocus: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> formWidgets = [];
    // formWidgets.add(Text("Food Name"));
    formWidgets.add(createFoodNameWidget());
    // formWidgets.add(Text("Bill Total"));
    formWidgets.add(createBillTotalWidget());
    formWidgets.add(createSelectDate(context));
    formWidgets.add(Text("Group"));
    formWidgets.add(selectGroup(context));
    formWidgets.add(Text("Members: "));
    formWidgets.add(selectMember(context));
    formWidgets.add(editableMember(context,participantControllers));
    formWidgets.add(createSubmitButton());




    return Container(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: formWidgets,
      ),
    ),
          ),
        ));
  }
}
