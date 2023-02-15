import 'package:flutter/material.dart';

import '../date/date_picker_common.dart';

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



Widget createFoodNameWidget(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
    child: TextFormField(
      enableInteractiveSelection: false,
      focusNode: AlwaysDisabledFocusNode(),
      // enabled: false,
      onTap: (){
        print("tap");
      },
      controller: TextEditingController(),
      validator: (value){
        if(value == null || value.isEmpty){
          return "Please enter food name.";
        }
      },
      decoration: InputDecoration(
        focusedBorder: KienInputStyle.inputForcusBoder,
        enabledBorder: KienInputStyle.enabledBorder,
        errorBorder: KienInputStyle.errorBorder,
        focusedErrorBorder: KienInputStyle.forcusErrorBorder,
        border: KienInputStyle.inputBorder,
        hintText: "Thit cho",
        labelText: "Food Name",
        fillColor: Colors.white,
        filled: true,
      ),
      onSaved: (value){
      },
      autofocus: true,
    ),
  );
}
