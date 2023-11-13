import 'package:fetal_femur_ultrasound/res/AppConst.dart';
import 'package:fetal_femur_ultrasound/res/components/single_side_menu.dart';
import 'package:fetal_femur_ultrasound/utils/app_const.dart';
import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebDashboardSideMenu extends StatefulWidget {
  const WebDashboardSideMenu({Key? key}) : super(key: key);

  @override
  _WebDashboardSideMenuState createState() => _WebDashboardSideMenuState();
}

class _WebDashboardSideMenuState extends State<WebDashboardSideMenu> {
  String selectedMenuItem = 'Patient'; // Initialize with the default selected menu item

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.screenBackgroundBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 30, left: 25),
            child: SizedBox(
              height: 60,
              child: Image.asset('lib/images/logo.png'),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SingleSideMenu(
                      menuTitle: 'Patient',
                      onPress: () {
                        setState(() {
                          selectedMenuItem = 'Patient';
                        });
                        Get.toNamed(
                          RoutesName.patients,
                          id: INNER_ROUTER_ID,
                          preventDuplicates: false,
                        );
                      },
                      menuImage: Image.asset('lib/images/clinic.png'),
                      isSelected: selectedMenuItem == 'Patient',
                    ),
                    SingleSideMenu(
                      menuTitle: 'Appointment',
                      onPress: () {
                        setState(() {
                          selectedMenuItem = 'Appointment';
                        });
                        Get.toNamed(
                          RoutesName.formScreen,
                          id: INNER_ROUTER_ID,
                          preventDuplicates: false,
                        );
                      },
                      menuImage: Image.asset('lib/images/appointment.png'),
                      isSelected: selectedMenuItem == 'Appointment',
                    ),
                    SingleSideMenu(
                      menuTitle: 'Records',
                      onPress: () {
                        setState(() {
                          selectedMenuItem = 'Records';
                        });
                        Get.toNamed(
                          RoutesName.listScreen,
                          id: INNER_ROUTER_ID,
                          preventDuplicates: false,
                        );
                      },
                      menuImage: Image.asset('lib/images/records.png'),
                      isSelected: selectedMenuItem == 'Records',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      SingleSideMenu(
                        menuTitle: 'Profile',
                        onPress: () {
                          setState(() {
                            selectedMenuItem = 'Profile';
                          });
                          Get.toNamed(
                            RoutesName.patients,
                            id: INNER_ROUTER_ID,
                            preventDuplicates: false,
                          );
                        },
                        menuImage: Image.asset('lib/images/profile.png'),
                        isSelected: selectedMenuItem == 'Profile',
                      ),
                      SingleSideMenu(
                        menuTitle: 'Logout',
                        onPress: () {
                          setState(() {
                            selectedMenuItem = 'Logout';
                          });
                          Get.toNamed(
                            RoutesName.formScreen,
                            id: INNER_ROUTER_ID,
                            preventDuplicates: false,
                          );
                        },
                        menuImage: Image.asset('lib/images/logout.png'),
                        isSelected: selectedMenuItem == 'Logout',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
