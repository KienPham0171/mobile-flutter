import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/number_util.dart';

class UserGroupBody extends StatelessWidget {
  
  const UserGroupBody ({Key? key}) : super(key: key);

  List<ListTile> createListViewItem(BuildContext context){
    List<ListTile> result = [];
    result.add(ListTile(
      title: Text("Group 1"),
      subtitle: Text(NumberUtils.currencyFormat(300000)),
      trailing: Icon(CupertinoIcons.arrow_2_circlepath_circle),
    ));
    return result;
  }
  @override
  Widget build(BuildContext context) {
    print('here');
    return Container(
      child: ListView(

        children:[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,8,8,2),
            child: Card(
              color:Colors.white,
              child: ListTile(
                title:  Row(
                  children: [
                    const Icon(
                      CupertinoIcons.group_solid,
                      size: 16,
                      weight: 100,
                      color: Colors.red,
                    ),
                    Text(
                      "\tGroup 1",
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
                        TextSpan(text: 'Members: '),
                        TextSpan(
                            text: "7",
                            style: TextStyle(fontWeight: FontWeight.bold, )),
                        TextSpan(text: '\nAvailable Money: '),
                        TextSpan(
                            text: NumberUtils.currencyFormat(234000) + "đ",
                            style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
                        TextSpan(text: '\nPhone: '),
                        TextSpan(
                            text: "mem.memberPhone",
                            style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,0,8,2),
            child: Card(
              color:Colors.white,
              child: ListTile(
                title:  Row(
                  children: [
                    const Icon(
                      CupertinoIcons.group_solid,
                      size: 16,
                      weight: 100,
                      color: Colors.red,
                    ),
                    Text(
                      "\tGroup 2",
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
                        TextSpan(text: 'Members: '),
                        TextSpan(
                            text: "10",
                            style: TextStyle(fontWeight: FontWeight.bold, )),
                        TextSpan(text: '\nAvailable Money: '),
                        TextSpan(
                            text: NumberUtils.currencyFormat(789000) + "đ",
                            style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
                        TextSpan(text: '\nPhone: '),
                        TextSpan(
                            text: "46438438",
                            style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,0,8,2),
            child: Card(
              color:Colors.white,
              child: ListTile(
                title:  Row(
                  children: [
                    const Icon(
                      CupertinoIcons.group_solid,
                      size: 16,
                      weight: 100,
                      color: Colors.red,
                    ),
                    Text(
                      "\tGroup 3",
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
                        TextSpan(text: 'Members: '),
                        TextSpan(
                            text: "11",
                            style: TextStyle(fontWeight: FontWeight.bold, )),
                        TextSpan(text: '\nAvailable Money: '),
                        TextSpan(
                            text: NumberUtils.currencyFormat(345000) + "đ",
                            style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
                        TextSpan(text: '\nPhone: '),
                        TextSpan(
                            text: "235592848",
                            style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
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
        ]
      ),
    );
  }
}
