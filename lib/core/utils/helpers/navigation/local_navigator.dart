import 'package:flutter/material.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/app_routes.dart';
import 'package:tranquil_admin_portal/core/utils/helpers/navigation/navigation_controller.dart';

NavigationController navigationController = NavigationController.instance;

Navigator localNavigator() => Navigator(
  key: navigationController.navigatorKey,
  //TODO: Remember to Uncomment
  // onGenerateRoute: generateRoute,
  initialRoute: Routes.dashboardRoute,
);