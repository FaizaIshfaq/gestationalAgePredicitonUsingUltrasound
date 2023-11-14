import 'package:fetal_femur_ultrasound/res/components/dashboard_header.dart';
import 'package:fetal_femur_ultrasound/utils/app_const.dart';
import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:fetal_femur_ultrasound/view/web/patients.dart';
import 'package:fetal_femur_ultrasound/view/web/forbidden_screen.dart';
import 'package:fetal_femur_ultrasound/view/web/appointments_screen.dart';
import 'package:fetal_femur_ultrasound/view/web/records_screen.dart';
import 'package:fetal_femur_ultrasound/view/web/login_screen_web.dart';
import 'package:fetal_femur_ultrasound/view/web/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InnerNavigator extends StatefulWidget {
  InnerNavigator({Key? key, required this.initialRoute}) : super(key: key);
  final String initialRoute;

  @override
  State<InnerNavigator> createState() => _InnerNavigatorState();
}

class _InnerNavigatorState extends State<InnerNavigator> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await didPopRoute();
      },
      child: Navigator(
        key: Get.nestedKey(INNER_ROUTER_ID),
        reportsRouteUpdateToEngine: true,
        initialRoute: widget.initialRoute,
        onGenerateRoute: generateRoute,
        // requestFocus: true,
        onUnknownRoute: generateUnknownRoute,
        restorationScopeId: "RestorationId",
      ),
    );
  }

  Route<dynamic> generateUnknownRoute(RouteSettings settings) {
    return _getUnknownPageRoute(
        RoutesName.forbiddenPage, ForbiddenScreen(), settings);
  }

  PageRoute _getUnknownPageRoute(
      String routeName, Widget child, RouteSettings settings) {
    return PageRouteBuilder(
        pageBuilder: (_, __, ___) => child,
        transitionDuration: const Duration(seconds: 0),
        settings: settings);
  }

  Future<bool> didPopRoute() async {
    final NavigatorState navigator =
        Get.nestedKey(INNER_ROUTER_ID)!.currentState!;
    assert(navigator != null);
    return await navigator.maybePop();
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    print('generate route called');
    if (settings.name != null) print('generate route ' + settings.name!);

    if (settings.name == RoutesName.patients) {
      return _getPageRoute(RoutesName.patients, const DashboardScreen(), settings);
    }
    if (settings.name == RoutesName.appointmentsScreen) {
      return _getPageRoute(RoutesName.appointmentsScreen, const AppointmentScreen(), settings);
    }
    if (settings.name == RoutesName.recordScreen) {
      return _getPageRoute(RoutesName.recordScreen, const RecordsScreen(), settings);
    }
    if (settings.name == RoutesName.profilePage) {
      return _getPageRoute(RoutesName.profilePage, const profileScreenWeb(), settings);
    }
    return _getPageRoute(RoutesName.forbiddenPage, const ForbiddenScreen(), settings);
  }

  PageRoute _getPageRoute(
      String routeName, Widget child, RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      transition: Transition.fadeIn,
      page: () {
        return child;
      },
    );
  }
}
