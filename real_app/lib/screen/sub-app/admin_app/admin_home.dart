import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import 'package:real_app/config/navigator_config.dart';
import 'package:real_app/screen/components/admin/admin_navigator.dart';

import '../../../model/navigator_info.dart';
import '../../../redux/action.dart';
import '../../../redux/state.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late List<NavigatorInfo> adminController;
  Widget createBodyWidget (BuildContext context,List<NavigatorInfo> navigatorList){
    return navigatorList.firstWhere((element) => element.isActive == true).bodyComponent;
  }

  @override
  void initState() {
    // TODO: implement initState
    adminController = Configuration.ADMIN_NAVIGATOR_lIST;
  }
  void changeBodyContent(int index){
    print("index: ${index}");
    setState(() {
      for(int i = 0, ii = adminController.length; i< ii ; i++){
        adminController[i].isActive =false;
        if(i == index){
          adminController[i].isActive = true;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rice-Service",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        /*decoration: BoxDecoration(
            gradient: linearGradient(150, [ '#1f005c', '#6c0060', '#a40059', '#cf2b4c', '#ea623b', '#f7972e', '#f4cb36', '#e2ff61'])
            *//*LinearGradient(
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
            )*//*
        ),*/
        decoration: const BoxDecoration(
          // color: Colors.red.withOpacity(0.1),
            image: DecorationImage(
                image: NetworkImage(
                  // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShp2T_UoR8vXNZXfMhtxXPFvmDWmkUbVv3A40TYjcunag0pHFS_NMblOClDVvKLox4Atw&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7IBkCtYd6ulSfLfDL-aSF3rv6UfmWYxbSE823q36sPiQNVFFLatTFdGeUSnmJ4tUzlo&usqp=CAU'),
                fit: BoxFit.cover,
                opacity: 0.3)),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              createBodyWidget(context, adminController),
              // ElevatedButton(onPressed: (){
              //   store.dispatch(UserLogoutAction());
              // }, child: const Text("Logout"),)
            ],
          ),
        ),
      ),
      bottomNavigationBar: AdminNavigator(
        navigatorList: adminController,
        changeBody: changeBodyContent,
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
