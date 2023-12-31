import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:fetal_femur_ultrasound/view/home_screen.dart';
import 'package:fetal_femur_ultrasound/view/login_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>const HomeScreen());
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