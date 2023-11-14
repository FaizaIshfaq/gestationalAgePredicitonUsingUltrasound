import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../AppConst.dart';

class DatePicker {
  Function(DateTime)? onSelectDate;
  Function(String)? onFormatDate;
  Function(String)? onServerFormatDate;

  Future<void> selectDate(
      BuildContext context,
      {Function(DateTime)? onSelectDate,
        Function(String)? onFormatDate,Function(String)? onServerDateFormat}
      ) async {
    this.onSelectDate = onSelectDate;
    this.onFormatDate = onFormatDate;
    this.onServerFormatDate=onServerDateFormat;
    final DateTime? picked = await showDatePicker(
        builder: (BuildContext? context, Widget? widget){
          return Theme(
            data: Theme.of(context!).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.blue, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.red, // button text color
                ),
              ),
            ),
            child: widget!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null /*&& picked != selectedDate*/) {
      if(onSelectDate!=null) {
        onSelectDate(picked);
      }
    }
    if (picked != null /*&& picked != selectedDate*/) {
      if(onFormatDate!=null) {
        onFormatDate(DateFormat(DATE_FORMAT).format(picked));
      }
    }
    if (picked != null /*&& picked != selectedDate*/) {
      if(onServerFormatDate!=null) {
        onServerFormatDate!(DateFormat(SERVER_DATE_FORMAT).format(picked));
      }
    }
  }
}
