import 'package:flutter/material.dart';

class MyAlertDialog {
  static void showAlertDialog(BuildContext context, WidgetBuilder builder,
      [bool? dismissible]) {
    showDialog(
        context: context,
        builder: builder,
        barrierDismissible: dismissible == null ? false : dismissible);
  }
}
