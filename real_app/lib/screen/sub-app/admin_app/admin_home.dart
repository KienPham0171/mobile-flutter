import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: const Text("Rice-Service"),
        elevation: 0.0,
      ),
      body:  Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
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
            )
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(
              children: [
                createBodyWidget(context, adminController),
                ElevatedButton(onPressed: (){
                  store.dispatch(UserLogoutAction());
                }, child: const Text("Logout"),)
              ],
            ),
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
