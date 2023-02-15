import 'package:flutter/cupertino.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
 TextField(
enableInteractiveSelection: false, // will disable paste operation
focusNode:  AlwaysDisabledFocusNode(),
)

// https://stackoverflow.com/questions/44490622/disable-a-text-edit-field-in-flutter