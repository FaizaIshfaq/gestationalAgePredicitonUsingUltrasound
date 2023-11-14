import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AppConst.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.screenBackgroundBlueColor),
      child: Padding(
          padding: const EdgeInsets.only(top:20.0,bottom: 5),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: IntrinsicWidth(
                  child: InkWell(
                    child: const Column(
                      children: [
                        SizedBox(height: 30,),
                        Text('Dashboard',
                          style: TextStyle(
                            color: AppColors.profileTextColor, // Set your desired text color
                            fontSize: 25.0, // Set your desired font size
                          ),),
                        Text("Hi Doctor!",
                          style: TextStyle(
                            color: AppColors.grayTextColor, // Set your desired text color
                            fontSize: 12.0, // Set your desired font size
                          ),),
                      ],
                    ),
                    onTap: () async {
                      Get.offAllNamed(RoutesName.loginWeb);
                    },
                  ),
                ),
              ),
              InkWell(
                child: Column(
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: ClipOval(
                        child: Image.asset(
                          'lib/images/userprofile.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0), // Add some space between the image and text
                    const Text(
                      'Faiza Ishfaq',
                      style: TextStyle(
                        color: AppColors.profileTextColor, // Set your desired text color
                        fontSize: 14.0, // Set your desired font size
                      ),
                    ),
                  ],
                ),
                  onTap: () async {
                  // Get.offAllNamed(RoutesName.loginWeb);
                },
              )
            ],
          )),
    );
  }
}
