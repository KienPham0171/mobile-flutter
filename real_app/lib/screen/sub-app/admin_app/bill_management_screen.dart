import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_like_css/gradient_like_css.dart';

import '../../../constant/path_constant.dart';
import '../../../util/number_util.dart';

class BillManagementScreen extends StatefulWidget {
  const BillManagementScreen({Key? key}) : super(key: key);

  @override
  _BillManagementScreenState createState() => _BillManagementScreenState();
}

class _BillManagementScreenState extends State<BillManagementScreen> {


  Widget buildBody(BuildContext context){
    return Container(
      child: ListView(

          children:[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0,8,2),
              child: Card(
                color:Colors.white,
                child: InkWell(
                  onTap: (){
                    print("tap here");
                    Navigator.of(context).pushNamed(PathConstant.BILL_CONFIRM,arguments: "something");
                  },
                  child: ListTile(
                    title:  Row(
                      children: [
                        const Icon(
                          CupertinoIcons.calendar_badge_minus,
                          size: 16,
                          weight: 100,
                          color: Colors.red,
                        ),
                        Text(
                          "\t22/02/2023",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Group: '),
                            TextSpan(
                                text: "Group I",
                                style: TextStyle(fontWeight: FontWeight.bold, )),
                            TextSpan(text: '\nFood Name: '),
                            TextSpan(
                                text: "Cơm rang",
                                style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
                            /*TextSpan(text: '\nSlot: '),
                            TextSpan(
                                text: "1",
                                style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
                            TextSpan(text: '\nPrice: '),
                            TextSpan(
                                text: NumberUtils.currencyFormat(50000) + "đ",
                                style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),*/
                          ],
                        ),
                        // child: Text(
                        //     "\tTotal Money: ${NumberUtils.currencyFormat(mem.money)}\n\tEmail: ${mem.memberEmail.toString()}"),
                      ),
                    ),
                    trailing: Icon(CupertinoIcons.arrow_2_circlepath_circle),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0,8,2),
              child: Card(
                color:Colors.white,
                child: InkWell(
                  onTap: (){
                    print("tap here");
                    Navigator.of(context).pushNamed(PathConstant.BILL_CONFIRM,arguments: "something");
                  },
                  child: ListTile(
                    title:  Row(
                      children: [
                        const Icon(
                          CupertinoIcons.calendar_badge_minus,
                          size: 16,
                          weight: 100,
                          color: Colors.red,
                        ),
                        Text(
                          "\t21/02/2023",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Group: '),
                            TextSpan(
                                text: "Group V",
                                style: TextStyle(fontWeight: FontWeight.bold, )),
                            TextSpan(text: '\nFood Name: '),
                            TextSpan(
                                text: "Lẩu thái",
                                style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
                            /*TextSpan(text: '\nSlot: '),
                            TextSpan(
                                text: "2",
                                style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
                            TextSpan(text: '\nPrice: '),
                            TextSpan(
                                text: NumberUtils.currencyFormat(456000) + "đ",
                                style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),*/
                          ],
                        ),
                        // child: Text(
                        //     "\tTotal Money: ${NumberUtils.currencyFormat(mem.money)}\n\tEmail: ${mem.memberEmail.toString()}"),
                      ),
                    ),
                    trailing: Icon(CupertinoIcons.arrow_2_circlepath_circle),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bill Management",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
        child: buildBody(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.home_outlined),
      ),
    );
  }
}
