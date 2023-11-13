import 'package:fetal_femur_ultrasound/res/components/dashboard_header.dart';
import 'package:fetal_femur_ultrasound/res/components/dashboard_side_menu.dart';
import 'package:fetal_femur_ultrasound/res/components/inner_navigator.dart';
import 'package:fetal_femur_ultrasound/utils/app_const.dart';
import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/AppConst.dart';

class MasterLayout extends StatefulWidget {
  MasterLayout({Key? key}) : super(key: key);

  @override
  State<MasterLayout> createState() => _MasterLayoutState();
}

class _MasterLayoutState extends State<MasterLayout> {
  @override
  Widget build(BuildContext context) {
    // print('User type is '+user.type.toString());
    return Scaffold(
      body: Row(
        children: [
          const Expanded(flex: 1, child: WebDashboardSideMenu()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                const DashboardHeader(),
                Expanded(
                  child: Container(
                    decoration:
                        const BoxDecoration(color: AppColors.headingsPurpleColor),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 1,top: 1),
                        child: InnerNavigator(
                          initialRoute: getRoute(Get.currentRoute),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String getRoute(String currentRoute) {
    print('current route is ' + currentRoute);
    if ( Get.currentRoute == RoutesName.masterLayout) {
      return RoutesName.patients;
    }
    return currentRoute;
  }
}
