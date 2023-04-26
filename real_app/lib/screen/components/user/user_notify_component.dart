import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/number_util.dart';
import '../admin/add_group_component.dart';

class UserNotificationBody extends StatelessWidget {
  const UserNotificationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("notification");
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(

          children:[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0,8,2),
              child: Card(
                color:Colors.grey.shade200,
                child: ListTile(
                  onTap: () async {
                    await showDialog(context: context, builder: (context){
                      return Dialog(child: ConfirmDialog(),);
                    });
                    //
                    // await showCupertinoDialog(context: context, builder: (context){
                    //   return Dialog(child: Row(
                    //     children: [
                    //       ElevatedButton(onPressed: (){}, child: Text("Approve")),
                    //       ElevatedButton(onPressed: (){}, child: Text("Reject")),
                    //     ]
                    //   ));
                    // });
                  },
                  title:  Row(
                    children: [
                      const Icon(
                        Icons.emoji_food_beverage_outlined,
                        size: 16,
                        weight: 100,
                        color: Colors.red,
                      ),
                      Text(
                        "\tMời tham bữa ăn",
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
                          TextSpan(text: '\nBạn có lời mời: BÚN BÒ cùng nhau!'),
                          // TextSpan(
                          //     text: "Cơm rang",
                          //     style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
                          // TextSpan(text: '\nSlot: '),
                          // TextSpan(
                          //     text: "1",
                          //     style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
                          // TextSpan(text: '\nPrice: '),
                          // TextSpan(
                          //     text: NumberUtils.currencyFormat(50000) + "đ",
                          //     style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
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
                color:Colors.grey.shade200,
                child: ListTile(
                  onTap: () async {
                    await showDialog(context: context, builder: (context){
                      return Dialog(child: ConfirmDialog(),);
                    });
                    //
                    // await showCupertinoDialog(context: context, builder: (context){
                    //   return Dialog(child: Row(
                    //     children: [
                    //       ElevatedButton(onPressed: (){}, child: Text("Approve")),
                    //       ElevatedButton(onPressed: (){}, child: Text("Reject")),
                    //     ]
                    //   ));
                    // });
                  },
                  title:  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.person_add,
                        size: 16,
                        weight: 100,
                        color: Colors.red,
                      ),
                      Text(
                        "\tMời tham gia nhóm",
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
                          TextSpan(text: '\nBạn có lời mời join nhóm!'),
                          // TextSpan(
                          //     text: "Cơm rang",
                          //     style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
                          // TextSpan(text: '\nSlot: '),
                          // TextSpan(
                          //     text: "1",
                          //     style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black)),
                          // TextSpan(text: '\nPrice: '),
                          // TextSpan(
                          //     text: NumberUtils.currencyFormat(50000) + "đ",
                          //     style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
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
                color:Colors.grey.shade200,
                child: ListTile(
                  title:  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.money_dollar_circle_fill,
                        size: 16,
                        weight: 100,
                        color: Colors.red,
                      ),
                      Text(
                        "\tThanh toán",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Bạn vừa tham gia bữa ăn: '),
                          TextSpan(
                              text: "Cơm rang.",
                              style: TextStyle(fontWeight: FontWeight.bold, )),
                          TextSpan(
                              text: " Số tiền phải thanh toán là ",
                              // style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)
                          ),

                          TextSpan(
                              text: NumberUtils.currencyFormat(45000) + "đ",
                              style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red)),
                        ],
                      ),
                    ),
                  ),
                  // trailing: Icon(CupertinoIcons.arrow_2_circlepath_circle),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("Approved")),
          ElevatedButton(onPressed: (){}, child: Text("Reject")),
        ],
      )
    );
  }
}

