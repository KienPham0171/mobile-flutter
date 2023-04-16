import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_like_css/gradient_like_css.dart';
import '../../../config/navigator_config.dart';
import '../../../model/navigator_info.dart';
import '../../../redux/action.dart';
import '../../../redux/state.dart';
import '../../components/user/user_navigator.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {

  late List<NavigatorInfo> userController;

  @override
  void initState() {
    // TODO: implement initState
    userController = Configuration.USER_NAVIGATOR_lIST;
  }
  Widget createBodyWidget (BuildContext context,List<NavigatorInfo> navigatorList){

    return navigatorList.firstWhere((element) => element.isActive == true).bodyComponent;
  }

  void changeBodyContent(int index){
    print("user index: ${index}");
    setState(() {
      for(int i = 0, ii = userController.length; i< ii ; i++){
        userController[i].isActive =false;
        if(i == index){
          userController[i].isActive = true;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text("Rice-Service(User-App)",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body:  Container(
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
        child: Container(
          child: createBodyWidget(context, userController),
        ),
      ),
      bottomNavigationBar: UserNavigator(
        navigatorList: Configuration.USER_NAVIGATOR_lIST,
        changeBody: changeBodyContent,
      ),
    );
  }
}
