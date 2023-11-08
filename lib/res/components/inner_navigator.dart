import 'package:fetal_femur_ultrasound/res/components/dashboard_header.dart';
import 'package:fetal_femur_ultrasound/utils/app_const.dart';
import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:fetal_femur_ultrasound/view/web/dashboard_screen.dart';
import 'package:fetal_femur_ultrasound/view/web/forbidden_screen.dart';
import 'package:fetal_femur_ultrasound/view/web/form_screen.dart';
import 'package:fetal_femur_ultrasound/view/web/list_screen.dart';
import 'package:fetal_femur_ultrasound/view/web/login_screen_web.dart';
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

    if (settings.name == RoutesName.dashboard) {
      return _getPageRoute(RoutesName.dashboard, const DashboardScreen(), settings);
    }
    if (settings.name == RoutesName.formScreen) {
      return _getPageRoute(RoutesName.formScreen, const FormScreen(), settings);
    }
    if (settings.name == RoutesName.listScreen) {
      return _getPageRoute(RoutesName.listScreen, const ListScreen(), settings);
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
