
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
List<FilteringTextInputFormatter> NUMBER_WITHOUT_DECIMAL = [
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
];
class CustomTextInputFormatter {
  static List<TextInputFormatter> getIntFormatter({double? maxValue}) => [
    _IntTextInputFormatter(maxValue: maxValue),
    FilteringTextInputFormatter.allow(RegExp('[1234567890]'))
  ];
}

class _IntTextInputFormatter extends _BaseTextInputFormatter {
  double? maxValue;
  _IntTextInputFormatter({this.maxValue}) : super(maxValue: maxValue);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    var selection = newValue.selection;
    var finalText = checkMaxValue(newText);
    if (finalText.length != newText.length) {
      selection = _createTextSelection(selection, newText, finalText);
    }
    return new TextEditingValue(text: finalText, selection: selection);
  }
}
abstract class _BaseTextInputFormatter extends TextInputFormatter {
  double? maxValue;
  _BaseTextInputFormatter({this.maxValue});

  TextSelection _createTextSelection(
      TextSelection oldSelection, String oldText, String newText) {
    return TextSelection.collapsed(
        offset: oldSelection.baseOffset - (oldText.length - newText.length));
  }

  String getDisplayNumber(num? number) {
    if (number == null) return '0';
    String pattern = '###';

    List<String> arr = number.toString().split('\.');

    if (arr.length > 1) {
      if (arr[1].length >= 2) {
        if (arr[1] == '00') {
          pattern = "${pattern}0";
        } else {
          pattern = "${pattern}0.00";
        }
      } else {
        if (arr[1] == '0') {
          pattern = "${pattern}0";
        } else {
          pattern = "${pattern}0.0";
        }
      }
    } else {
      pattern = "${pattern}0";
    }

    return NumberFormat(pattern, "en_US").format(number);
  }

  String checkMaxValue(String value) {
    if (maxValue == null) {
      return value;
    }

    try {
      if (double.parse(value) > maxValue!) {
        return getDisplayNumber(maxValue);
      }
    } catch (e) {
      // print(e);
      // return value;
    }

    return value;
  }
}


const String DATE_FORMAT = 'dd MMMM, yyyy';
const String SERVER_DATE_FORMAT = 'yyyy-MM-dd';
class AppColors{
  static const Color blackColor=Color(0xffFF0000);
  static const Color inputBoxBlackColor=Color(0xff2A2533);
  static const Color signInSignUpIconsPurpleColor=Color(0xff9F92E8);
  static const Color grayTextColor=Color(0xffAAA8AE);
  static const Color whiteColor=Color(0xffFFFFFF);
  static const Color buttonColor=Color(0xff1246A3);
  static const Color screenBackgroundBlueColor=Color(0xff262429);
  static const Color headingsPurpleColor=Color(0xff9285D6);
  static const Color subParaGrayColor=Color(0xff989898);
  static const Color subHeadingPurpleColor=Color(0xff9F92E8);
  static const Color inputTextDarkGrayColor=Color(0xff716A7B);
  static const Color buttonOutlinePurpleColor=Color(0xff9F92E8);
  static const Color iconPurpleColor=Color(0xff9285D6);
  static const Color sidePanelTextGrayColor=Color(0xff6C717B);
  static const Color whiteHeadingColor=Color(0xffC9C7CE);
  static const Color whiteGraySubPara=Color(0xff686379);
  static const Color paginationOutlinePurpleColor=Color(0xff9285D6);
  static const Color paginationPurpleColor=Color(0xff9B8EE6);
  static const Color darkPurpleButtonColor=Color(0xffB95AAF);
  static const Color yellowCountColor=Color(0xffF8C000);
  static const Color profileTextColor=Color(0xff9A8DE4);
  static const Color hoverGrayColor=Color(0xff404040);
  static const Color magentaTextColor=Color(0xffBC56B1);
  static const Color inputFieldBackgroundColor=Color(0xff2A2533);
  static const Color inputTextColor=Color(0xffcccccc);
  static const Color greenOutlineColor=Color(0xff65BE5D);
  static const Color overlayPurpleColor=Color(0xff373240);
  static const Color profilePageTextWhiteColor=Color(0xffBFBDC3);
  static const Color skyBlueColor=Color(0xff357EC3);
  static const Color yellowColor=Color(0xffF8C000);
}