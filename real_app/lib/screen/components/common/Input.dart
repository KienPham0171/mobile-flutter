import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputWithShadow extends StatelessWidget {
  final Widget child;
  const InputWithShadow({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: child,
    );
  }
}
