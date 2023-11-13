import 'package:fetal_femur_ultrasound/utils/app_pages.dart';
import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:fetal_femur_ultrasound/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';

void main() {
  usePathUrlStrategy();
  // Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
       theme: ThemeData(
         fontFamily: 'Outfit',
        useMaterial3: true,
      ),
      initialRoute:
          Utils.isAndroidPlatform() ? RoutesName.login : RoutesName.loginWeb,
      // onGenerateRoute: Routes.generateRoute,
      getPages: AppPages.routes,
    );
  }
}
