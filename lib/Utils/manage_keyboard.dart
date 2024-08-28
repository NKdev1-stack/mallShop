import 'package:flutter/material.dart';

class KeyboardUtil{
  static void hidekeyboard(BuildContext context, ){
    FocusScopeNode currentfocus = FocusScope.of(context);
   // If system keyboard is showing on screen htne unfocus it mean turn it off
    if(!currentfocus.hasPrimaryFocus){
      currentfocus.unfocus();
    } 
    else{

    }
  }

}