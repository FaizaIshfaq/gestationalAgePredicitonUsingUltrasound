import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:fetal_femur_ultrasound/view/mobile/home_screen.dart';
import 'package:fetal_femur_ultrasound/view/mobile/login_screen.dart';
import 'package:fetal_femur_ultrasound/view/web/login_screen_web.dart';
import 'package:flutter/material.dart';

import '../../view/web/master_layout.dart';
import '../../view/web/profile_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>const HomeScreen());
      case RoutesName.loginWeb:
        return MaterialPageRoute(builder: (BuildContext context)=>const LoginScreenWeb());
      case RoutesName.masterLayout:
        return MaterialPageRoute(builder: (BuildContext context)=>  MasterLayout());
      case RoutesName.profilePage:
        return MaterialPageRoute(builder: (BuildContext context)=>  profileScreenWeb());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>const LoginView());
        default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}