import 'dart:collection';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

import '../../../constant/path_constant.dart';
import '../../../dto/request/create_meal_request.dart';
import '../../../model/group.dart';
import '../../../model/group_member.dart';
import '../../../model/meal_participant.dart';
import '../../../service/group_service.dart';
import '../../../service/meal_service.dart';
import '../../../service/user_service.dart';
import '../../../style/text_field_style.dart';
import '../../../util/date_time_util.dart';
import '../../components/common/Input.dart';
import '../../components/common/date_picker_component.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/common/loading_component.dart';

class BillConfirmScreen extends StatefulWidget {
  const BillConfirmScreen({Key? key}) : super(key: key);

  @override
  _BillConfirmScreenState createState() => _BillConfirmScreenState();
}

class _BillConfirmScreenState extends State<BillConfirmScreen> {



  bool isBusy = false;
  bool isOrder = true;

  final formKey = GlobalKey<FormState>();
  TextEditingController foodNameController = TextEditingController(text: "Cơm rang");
  TextEditingController billTotalController = TextEditingController(text: "");
  Map<MealParticipant,TextEditingController> participantControllers = HashMap();
  Group? selectedGroup ;
  List<MealParticipant> participantList = [
    // MealParticipant(GroupMember(1,"1","Kien Pham","mail",null, 2), 1)
  ];
  final TextEditingController textEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  final s = [GroupMember(1,"1","Kien Pham","mail",null, 2),
    GroupMember(2,"1","Pham Kien","mail",null, 2),
    GroupMember(3,"1","Kien Kien","mail",null, 2),];

  @override
  void initState() {
    loadGroupData();

    //hard
    // selectedGroup =  Group(1, "Group 1", "Description");
    addParticipant(GroupMember(1,"1","Kien Pham","mail",null, 2));
    addParticipant(GroupMember(1,"1","Nguyen Van A","mail",null, 2));
    addParticipant(GroupMember(1,"1","Pham Van B","mail",null, 2));
    addParticipant(GroupMember(1,"1","Tran Van C","mail",null, 2));
  }

  /*final List<Group> groupData = [
    Group(1, "KSS", "KS Securities"),
    Group(2, "KSF", "KS Group"),
    Group(1, "KST", "KS Securities"),
    Group(2, "KSV", "KS Group"),
    Group(1, "KBS", "KS Securities"),
    Group(2, "KBC", "KS Group"),
    Group(1, "KBD", "KS Securities"),
    Group(2, "KSG", "KS Group"),
  ];*/
  final List<Group> groupData = [];
  List<GroupMember> memberData = [
  ];




  Widget loadMemberData(BuildContext context){

    return Container();
  }
  loadGroupData(){
    Future<List<Group>> groups = GroupService.getGroup();
    setState(() {
      groups.then((value){
        setState(() {
          groupData.addAll(value);
        });
      });
    });
  }

  loadMemberByGroup(Group group){
    UserService.getUserByGroupId(group.id).then((value){
      setState(() {
        memberData.addAll(value);
      });
    });
  }
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  pushMeal(BuildContext context,CreateMealRequest requestBody) async {
    MealService.createMeal(requestBody)
        .then((value){
      setState(() {
        isBusy = false;
      });
      if(value.success){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Create Meal successfully")));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Create Meal failed")));
      }
    });
    // showLoaderDialog(context);

    // showLoaderDialog(context);
    // await Future.delayed(Duration(seconds: 5));

  }



  void addParticipant(GroupMember member){
    setState(() {
      memberData.remove(member);
      MealParticipant oneMember  = MealParticipant(member, 1);
      participantList.add(oneMember);
      participantControllers.putIfAbsent(oneMember, () => TextEditingController(text: "1"));
    });
  }
  void removeParticipant(MealParticipant mealParticipant){
    setState(() {
      memberData.add(mealParticipant.member);
      participantList.remove(mealParticipant);
      participantControllers.remove(mealParticipant);
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
        child: DropdownButtonHideUnderline(

          child: DropdownButton2(
            // iconSize: 0.0,
            buttonDecoration: BoxDecoration(
              // border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            isExpanded: true,
            hint: Text(
              'Group 1',
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
              Group newGroup = value as Group;
              // print(value);
              if(newGroup != selectedGroup){
                setState(() {
                  selectedGroup = newGroup;
                  // participantList.removeWhere((element) => true);
                  // memberData.removeWhere((element) => true);
                  loadMemberByGroup(selectedGroup!);

                });
              }

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
      ),
    );
  }
  Widget selectMember(BuildContext context){
    if(memberData.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8.0),
        child: Text("No group or member is available.", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8.0),
      // padding: EdgeInsets.only(left: 25,right: 25,bottom: MediaQuery.of(context).viewInsets.bottom +550),
      child: InputWithShadow(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            // dropdownPadding: EdgeInsets.only(left: 25,right: 25,bottom: MediaQuery.of(context).viewInsets.bottom +550),
            buttonDecoration: BoxDecoration(
              // border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            isExpanded: true,
            hint: Text(
              'Select a member...',
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
      ),
    );
  }
  Widget editableMember(BuildContext context, Map<MealParticipant,TextEditingController> participantControllers){
    if(participantList.isEmpty) return const Text("");
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                // mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 2),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: participantList.length,
            itemBuilder: (context, index) {
              MealParticipant participant = participantList[index];
              TextEditingController _controller =
                  participantControllers[participant]?? TextEditingController(text: "-1");
              // if(_controller == null) return Container();
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Stack(children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
                    onSaved: (value) {},
                    autofocus: true,
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: TextButton(
                        onPressed: () {
                          removeParticipant(participant);
                        },
                        child: Icon(Icons.remove_circle, size: 18),
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        // label: Text("TEXT BUTTON"),
                      ))
                ]),
              );
            }),
      ),
    );
  }

  Widget createFoodImage(){
    return Container(
        child: SvgPicture.asset(
          "assets/food.svg",
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          semanticsLabel: 'A red up arrow',
          width: 150,
          height: 150,
        )
    );
  }

  Widget createFoodNameWidget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
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
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: TextFormField(
            controller: foodNameController,
            validator: (value){
              if(value == null || value.isEmpty){
                return "Please enter food name.";
              }
            },
            decoration: InputDecoration(
              // focusedBorder: KienInputStyle.inputForcusBoder,
              // enabledBorder: KienInputStyle.enabledBorder,
              // errorBorder: KienInputStyle.errorBorder,
              // focusedErrorBorder: KienInputStyle.forcusErrorBorder,
              // border: KienInputStyle.inputBorder,
                border: InputBorder.none,
                hintText: "Thit cho",
                labelText: "Food Name",
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(10)
              // filled: true,
            ),
            onSaved: (value){
            },
            // autofocus: true,
          ),
        ),
      ),
    );
  }
  Widget createBillTotalWidget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              // spreadRadius: 5,
              blurRadius: 4,
              offset: Offset(4,8), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: TextFormField(
            controller: billTotalController,
            keyboardType: TextInputType.number,
            validator: (value){
              if(value == null || value.isEmpty){
                return "Please enter bill total.";
              }
            },
            decoration: InputDecoration(
              // focusedBorder: KienInputStyle.inputForcusBoder,
              // enabledBorder: KienInputStyle.enabledBorder,
              // errorBorder: KienInputStyle.errorBorder,
              // focusedErrorBorder: KienInputStyle.forcusErrorBorder,
              // border: KienInputStyle.inputBorder,
                border: InputBorder.none,
                hintText: "1.000",
                labelText: "Bill Total",
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(10)
              // filled: true,
            ),
            onSaved: (value){
            },
            // autofocus: false,
          ),
        ),
      ),
    );
  }
  Widget createSubmitButton(BuildContext context){
    return ElevatedButton(
        onPressed: (){
          if(formKey.currentState?.validate() !=null
              && formKey.currentState?.validate()==true){
            print("line 261, okay save info");
            String foodName = foodNameController.value.text;
            String billTotal = billTotalController.value.text;
            DateTime foodDate = selectedDate;
            int? groupId = selectedGroup?.id;

            String userList = participantList.map((mem) {
              String? amount = participantControllers[mem]?.value.text;
              if(amount != null){
                return "${mem.member.memberId}-${amount}";
              }
              return "${mem.member.memberId}-${mem.amount}";
            }).join(":");

            print("foodName: $foodName, billTotal: $billTotal, foodDate: $foodDate, userList: $userList");
            CreateMealRequest request = CreateMealRequest(foodName, billTotal, foodDate, groupId??-1, userList);
            pushMeal(context,request);
            setState(() {
              isBusy = !isBusy;
            });

          }
        },
        child: Text("Confirm"));
  }
  Widget createSelectDate(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(4,8), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
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
              // focusedBorder: KienInputStyle.inputForcusBoder,
              // enabledBorder: KienInputStyle.enabledBorder,
              // errorBorder: KienInputStyle.errorBorder,
              // focusedErrorBorder: KienInputStyle.forcusErrorBorder,
              // border: KienInputStyle.inputBorder,
              border: InputBorder.none,
              hintText: DateTimeUtils.dateTimeToString(selectedDate),
              labelText: "Food Date",
              fillColor: Colors.white,
              // filled: true,
              contentPadding: EdgeInsets.all(10),
              suffixIcon: Icon(CupertinoIcons.calendar),
            ),
            onSaved: (value){
            },
            autofocus: true,
          ),
        ),
      ),
    );
  }
  Widget createFormWidget(List<Widget> widgets){
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widgets,
          ),
        ),
      ),
    );
  }

  Widget createOption(BuildContext context){
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center ,//Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center,
        // scrollDirection: Axis.horizontal,
        children: [

          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(onPressed: (){
              print("Create Order");
            }, child: Text("Create Order",)),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(onPressed: (){
              setState(() {
                isOrder = false;
              });
              print("Add Bill");
            }, child: Text("Add Bill",)),
          ),



        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> formWidgets = [];
    formWidgets.add(createFoodImage());
    formWidgets.add(createFoodNameWidget());
    formWidgets.add(createBillTotalWidget());
    formWidgets.add(createSelectDate(context));
    formWidgets.add(Text("Group",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),));
    formWidgets.add(selectGroup(context));
    /*if(isOrder){
      formWidgets.add(createOption(context));
    }else{

      formWidgets.add(Text("Members: ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)));
      formWidgets.add(selectMember(context));
      formWidgets.add(editableMember(context,participantControllers));
      formWidgets.add(createSubmitButton(context));
    }*/
    formWidgets.add(Text("Members: ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)));
    formWidgets.add(selectMember(context));
    formWidgets.add(editableMember(context,participantControllers));
    formWidgets.add(createSubmitButton(context));


    List<Widget> children = isBusy? [createFormWidget(formWidgets),Loading(),]: [createFormWidget(formWidgets)];

    // return Container(
    //   child: optionParent(context),
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm your BILL",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      // body: Text("Group details with id: ${groupId}"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          // color: Colors.red.withOpacity(0.1),
            image: DecorationImage(
                image: NetworkImage(
                  // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShp2T_UoR8vXNZXfMhtxXPFvmDWmkUbVv3A40TYjcunag0pHFS_NMblOClDVvKLox4Atw&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7IBkCtYd6ulSfLfDL-aSF3rv6UfmWYxbSE823q36sPiQNVFFLatTFdGeUSnmJ4tUzlo&usqp=CAU'),
                fit: BoxFit.cover,
                opacity: 0.3)),
        child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: children,
            )
        ),
      ),
    );

    return Stack(
      alignment: Alignment.center,
      children: children,
    );


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
      ),
    );
  }


// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text("Group Details",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
//       elevation: 0.0,
//       backgroundColor: Colors.white,
//       foregroundColor: Colors.black,
//     ),
//     // body: Text("Group details with id: ${groupId}"),
//     body: Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       decoration: BoxDecoration(
//           gradient: linearGradient(150, [ '#1f005c', '#6c0060', '#a40059', '#cf2b4c', '#ea623b', '#f7972e', '#f4cb36', '#e2ff61'])
//         /*LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             stops: [
//               0.1,
//               0.4,
//               0.6,
//               0.9,
//             ],
//             colors: [
//               Color.fromRGBO(131,58,180,1),
//               Color.fromRGBO(123,29,253,0.7),
//               Color.fromRGBO(123,29,253,0.5337710084033614),
//               Color.fromRGBO(131,58,180,0.3),
//               // Colors.red,
//               // Colors.indigo,
//               // Colors.teal,
//             ],
//           )*/
//       ),
//       child: Center(
//         child: Container(),
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: () {
//
//       },
//       child: const Icon(Icons.person_add_outlined),
//     ),
//   );
// }
}



class PleaseWaitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Image.asset("assets/cupertino_activity_indicator_small.gif"),),
        color: Colors.grey.withOpacity(0.3)); }
}

