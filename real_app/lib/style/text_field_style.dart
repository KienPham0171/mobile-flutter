import 'package:flutter/material.dart';

class KienInputStyle{
  static final OutlineInputBorder inputForcusBoder =
  OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.lightBlue, width: 1.0),
      borderRadius: BorderRadius.circular(10));
  static final OutlineInputBorder enabledBorder =
  OutlineInputBorder(
      // borderSide: BorderSide(width: 1.0,color: Colors.white),
      borderSide: const BorderSide(
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(10));

  static final OutlineInputBorder errorBorder =
  OutlineInputBorder(
  borderSide: BorderSide(
  color:Colors.red, width: 1.0),
  borderRadius: BorderRadius.circular(10)
  );
  static final OutlineInputBorder forcusErrorBorder =
  OutlineInputBorder(
  borderSide: BorderSide(
  color:Colors.lightBlue, width: 1.0),
  borderRadius: BorderRadius.circular(10)
  );

  static final InputBorder inputBorder =
  UnderlineInputBorder(
  borderSide: BorderSide(color: Color(0xff13367A)),
  borderRadius: BorderRadius.circular(10)
  );
}