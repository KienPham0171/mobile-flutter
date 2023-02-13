
import 'package:flutter/cupertino.dart';

class MealBody extends StatelessWidget {
  const MealBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("meal Body"),
          ],
        )
    );
  }
}
