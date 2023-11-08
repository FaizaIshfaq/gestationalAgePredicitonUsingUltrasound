import 'package:fetal_femur_ultrasound/res/components/single_side_menu.dart';
import 'package:fetal_femur_ultrasound/utils/app_const.dart';
import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebDashboardSideMenu extends StatelessWidget {
  const WebDashboardSideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 70,),
          SingleSideMenu(menuTitle: 'Home', onPress: () {
            Get.toNamed(RoutesName.dashboard,
                id: INNER_ROUTER_ID,preventDuplicates: false);
          }),
          SingleSideMenu(menuTitle: 'Form', onPress: () {
            Get.toNamed(RoutesName.formScreen,
                id: INNER_ROUTER_ID,preventDuplicates: false);
          }),
          SingleSideMenu(menuTitle: 'List', onPress: () {
            Get.toNamed(RoutesName.listScreen,
                id: INNER_ROUTER_ID,preventDuplicates: false);
          }),
        ],
      ),
    );
  }
}
