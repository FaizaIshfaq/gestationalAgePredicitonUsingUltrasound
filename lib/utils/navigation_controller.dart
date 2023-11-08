import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instane = Get.find();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  Future<dynamic>? navigateTo(String routeName,[dynamic arguments]) {
    try {

      if(navigationKey.currentState!=null) {
        return navigationKey.currentState!.pushNamed(routeName, arguments:  arguments);
      }
    } catch (e, s) {
      print(e);
      print(s);
      throw e;
    }
  }

  goBack() => navigationKey.currentState!.pop();
}
