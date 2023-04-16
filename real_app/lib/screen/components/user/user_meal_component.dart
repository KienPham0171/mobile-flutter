import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/number_util.dart';

class UserMealBody extends StatelessWidget {
  const UserMealBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(

          children:[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0,8,2),
              child: Card(
                color:Colors.white,
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
                          TextSpan(text: '\nSlot: '),
                          TextSpan(
                              text: "1",
                              style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
                          TextSpan(text: '\nPrice: '),
                          TextSpan(
                              text: NumberUtils.currencyFormat(50000) + "đ",
                              style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
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
                          TextSpan(text: '\nSlot: '),
                          TextSpan(
                              text: "2",
                              style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
                          TextSpan(text: '\nPrice: '),
                          TextSpan(
                              text: NumberUtils.currencyFormat(456000) + "đ",
                              style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
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
