import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static void fieldFocusChange(BuildContext context,
      FocusNode current, FocusNode nextFocus){
      FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
  static void flushBarErrorMessages(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 3),
          message: message,
          backgroundColor: Colors.green,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(Icons.error, size: 28,color: Colors.white,),
        )..show(context)
    );
  }
  static snakBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
          content: Text(message),
      )
    );
  }
  static bool isAndroidPlatform() {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        //running on android or ios device
        return true;
      }
    } catch (e) {
      if (kIsWeb) {
        return false;
        //running on web
      }
    }
    return false;
  }
}