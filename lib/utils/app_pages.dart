import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:fetal_femur_ultrasound/view/web/login_screen_web.dart';
import 'package:fetal_femur_ultrasound/view/web/master_layout.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesName.masterLayout,
      page: () => MasterLayout(),
    ),
    GetPage(
      name: RoutesName.loginWeb,
      page: () => const LoginScreenWeb(),
    ),
  ];
}
